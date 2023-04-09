use strict;
use lib ".";
our ($n,$target);
eval {require "task.inc"} 
    or die "Error on task.inc\n$@";
# 计算向量的点积
sub dotproduct {
    my ($v1, $v2) = @_;
    my $result = 0;
    for (my $i = 0; $i < @{$v1}; $i++) {
        $result += $v1->[$i] * $v2->[$i];
    }
    return $result;
}

# 计算向量的差
sub vectorsubtract {
    my ($v1, $v2) = @_;
    my @result;
    for (my $i = 0; $i < @$v1; $i++) {
        push @result, $v1->[$i] - $v2->[$i];
    }
    return \@result;
}

# 对向量进行缩放
sub vectorscale {
    my ($c, $v) = @_;
    my @result;
    for (my $i = 0; $i < @$v; $i++) {
        push @result, $c * $v->[$i];
    }
    return \@result;
}

# 将向量归一化
sub vectornormalize {
    my ($v) = @_;
    my $length = sqrt(dotproduct($v, $v));
    my @result;
    for (my $i = 0; $i < @$v; $i++) {
        push @result, $v->[$i] / $length;
    }
    return \@result;
}
sub gramschmidt {
    my $n = shift;
    my @v;  # 存储原始向量
    my @e;  # 存储正交化后的向量
    for (my $i = 0; $i < $n; $i++) {
        $v[$i] = [map { rand } 1..$n];  # 生成一个随机向量
        my $u = [@{$v[$i]}];  # 将第i个向量复制一份
        for (my $j = 0; $j < $i; $j++) {
            my $c = dotproduct($v[$i], $v[$j]) / dotproduct($v[$j], $v[$j]);  # 计算投影系数
            $u = vectorsubtract($u, vectorscale($c, $v[$i]));  # 将投影向量从第i个向量中减去
        }
        push @e, vectornormalize($u);  # 将正交化后的向量加入到结果数组中
    }
    return \@e;  # 返回一个二维数组，其中每个向量用一个一维数组表示
}
my $e = gramschmidt($n);
foreach my $i (@{$e}){
    foreach my $j (@{$e}){
        print dotproduct($j,$i),"\n";
    }
    # my $sum;
    # foreach my $j (@{$i}){
    # $sum+=$j**2;
    # }
    # print $sum."\n";
}
sub project {
    my ($target, $e) = @_;
    my @m;  # 存储投影后的向量
    for (my $i = 0; $i < @$e; $i++) {
        my $c = dotproduct($target, $e->[$i]) / dotproduct($e->[$i], $e->[$i]);  # 计算投影系数
        push @m, $c;
    }
    return [map { $_ * $m[$_] } 0..$#$e];  # 返回投影后的向量
}
