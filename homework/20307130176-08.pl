#!/usr/bin/perl -w
use strict;
use Data::Dumper;
use GraphViz;
use Tk;
use Tk::GraphViz;

# 每次读入一个整数表达式(只包含加法、乘
# 法、括号和整数，可含空格，不考虑单目
# 加)。先将表达式转化成树，树用递归方式
# 表示，每个节点表示成[op, node1, node2,
# node3…]，op可以是+、*，node可以是整
# 数或另一个节点。用Data::Dumper打印树，
# 用GraphViz结合Tk::GraphViz弹出窗体画
# 出多叉树，最后历遍树求表达式的值。

# 55 + (6 + 7 + 8*99 + 10)*12 + 23
# 由于对K叉树不熟，这里选择都用二叉树来实现
# 这个函数获得下一个token并返回当前位置的下标
sub getNextToken {
    my ($expression, $start_index) = @_;
    my $i = $start_index;
	# 超出表达式长度直接返回未定义
    if ($i >= length($expression)) {
        return (undef, $i);
    }
	# 从位置$i开始读一个字符，如果是符号就返回
    my $char = substr($expression, $i, 1);
    if ($char =~ /[\+\*\(\)]/) {
        return ($char, $i + 1);
    }
	# 从位置$i开始读字符，如果是数字就把数字读完并返回数字
    my $num_start = $i;
    while ($i < length($expression) && substr($expression, $i, 1) =~ /\d/) {
        $i++;
    }
    my $num = substr($expression, $num_start, $i - $num_start);
    return ($num, $i);
}

sub parseExpression {
	# 表达式以及初始下标
    my ($expression, $start_index) = @_;
	# 下标初始化
    $start_index //= 0;

	# 建立一个栈
    my @stack;
	# 获取一个token
    my ($token, $next_index) = getNextToken($expression, $start_index);

	# token存在，分情况讨论
    while (defined($token)) {
        if ($token eq '(') {
			# 读到(，需要建立一个新的堆栈
            my ($sub_expression, $new_index) = parseExpression($expression, $next_index);
            push @stack, $sub_expression;
            $next_index = $new_index;
        } elsif ($token eq ')') {
			# 读到)，直接结束，这样就会回到(所在的地方结束堆栈
    		last;
        } elsif ($token =~ /[\+\*]/) {
			# 读到+*就将符号加入
            push @stack, $token;
        } else {
			# 读到数字也加入堆栈
            push @stack, $token;
        }
        ($token, $next_index) = getNextToken($expression, $next_index);
    }
	# 堆栈建立完成之后，就是从下到上整理堆栈，因为乘号优先级高，所以先整理堆栈中所有的乘号
    my $i = 0;
    while ($i < scalar(@stack)) {
        if ($stack[$i] eq '*') {
            $stack[$i - 1] = ['*', $stack[$i - 1], splice(@stack, $i + 1, 1)];
            splice(@stack, $i, 1);
        } else {
            $i++;
        }
    }

    $i = 0;
    while ($i < scalar(@stack)) {
        if ($stack[$i] eq '+') {
            $stack[$i - 1] = ['+', $stack[$i - 1], splice(@stack, $i + 1, 1)];
            splice(@stack, $i, 1);
        } else {
            $i++;
        }
    }

    return $stack[0], $next_index;
}

my $expression = "99*12+0  +123+3*99+ 1";
$expression =~ s/\s+//g;
my ($tree, $index) = parseExpression($expression);
my $symbol;

$symbol = 'A';	# give each node a unique name
print Dumper $tree;
sub evaluateNode {
    my ($node) = @_;
	# 如果节点是一个数组的引用，就可以得到数组内的东西
    if (ref $node eq 'ARRAY') {
        my ($op, @value) = @$node;
		# 计算左右节点的值
        if ($op eq '+') {
            my $sum = 0;
            foreach(@value){
                $sum = evaluateNode($_) + $sum;
            }
            return $sum;			
        } elsif ($op eq '*') {
            my $mul = 1;
            foreach(@value){
                $mul = evaluateNode($_) * $mul;
            }           
            return $mul; 
        }else {
			# 非法计算符
            die "Invalid operator: $op\n";
        }
    } else {
        return $node;
    }
}
print "\nFinal result=".evaluateNode($tree)."\n";

showTk(graph($tree));



sub showTk {
	my $g = shift;
	my $m = new MainWindow;
	my $gv = $m->GraphViz(-width => 600, -height => 600) -> pack;
	$gv->show($g, fit=>0);
	MainLoop();
}

sub walk;
sub graph {
	my $tree = shift;
	my $g = GraphViz->new(width=>8, height=>8);
	$symbol = 'A';
	walk($tree, $g);
	open F, ">expr.png";
	binmode F;
	print F $g->as_png;
	close F;
	print "See also 'expr.png'.\n";
	return $g;
}

sub walk {
	my ($tree, $g) = @_;
	my $type = ref $tree eq 'ARRAY' ? $tree->[0] : 'I';
	my $res = $symbol;
	if ($type eq 'I') {
		$g->add_node($symbol++, label=>$tree);
		return $res;
	}

	my @list = @$tree;
	$g->add_node($symbol++, label => shift @list);
	$g->add_edge($res => walk($_, $g)) foreach @list;
	return $res;
}


1;
