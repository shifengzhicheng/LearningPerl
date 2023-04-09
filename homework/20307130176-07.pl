#!/usr/bin/perl -w

# 从< >读入数学表达式，单变量x，如log(sin(2*x))，+-
# */()指数**浮点数、函数sin cos log exp abs sqrt
# 用适当的方法过滤输入，发现非法输入则报错
# 用eval在区间[-10,10]求值表达式，步长0.01，并作图
# 无效区间不作图，如log(x)，在x<=0的区间没有曲线
# 如果函数在整个[-10,10]上都无效，则报错
# 递交学号-07.pl，结果文件存入学号-07.png

# 使用方式：在同文件夹下准备一个txt文件，在powershell中使用
# Get-Content .\function.txt | perl .\20307130176-07.pl

use strict;
use Chart::Plot;

use constant DATASTART => -10;
use constant DATAEND => 10;

my $expr = <>;
chomp $expr;

# 去除开头的非字符
$expr =~ s/^[^a-zA-Z0-9()]+//;
print '$expr is '.$expr."\n";
# 替换变量
$expr =~ s/(?<!\bexp)\bx\b/\$x/g;
# print $expr."\n";
# print "sub{my \$x = shift;$expr}"."\n";

# 子函数代码块引用的构建
my $func = eval "sub {my \$x = shift; $expr}";
# print \$expr."\n";

# 检查表达式是否合法
if(ref $func ne 'CODE'){
    print $@;
    die "Syntax error!\n";
}

# 定义自变量和绘图的区间范围
my @x_all = map $_/100, 100*DATASTART..100*DATAEND;
my @x = ();
my @y = ();
# 计算函数值

# 图定义
my $fig = Chart::Plot->new(1000,700);
my $valid = 0;
foreach my $x_val (@x_all) {
    # 通过eval选取有效区间
    eval{
        my $y_val = $func->($x_val);
        push @y, $y_val;
        push @x, $x_val;
        };
        # 在这里添加数据集，
        # 到结尾或者到非连续区间，就会考虑在这个时候
        # 中断并先更新作图的数据集
    if($@ or $x_val == DATAEND){
        # 数据集有效
        if (@x != 0){
            # 数据集有效标识
            $valid = 1;
            $fig->setData([@x], [@y],'Blue Dashedline NoPoints');
            # 清空数据集
            @x=();
            @y=();
        }
    }
}

# 如果没有有效值就报错
if(!$valid){
    die "NO Valid number!\n";
}

# 绘制函数图
$fig->setGraphOptions('title' => '20307130176-07',);
open F, '>20307130176-07.png' or die;
binmode F;
print F $fig->draw('png');
close F;
1;
