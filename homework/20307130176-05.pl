#!/usr/bin/perl
use strict;
use Time::HiRes qw(gettimeofday tv_interval);

=pod
1. 级数展开sin+cos|x(|x|<p)
2. 编写子程序sub tri，参数是x,n,返回(sin+cos)(x)的值，
级数展开到多项式的n次项
3. 主程序调用tri(2,$n)，其中$n=(1..10)，运行结果如下:
=cut

# 实际上每次进入循环都是上一个计算的结果乘一个算子，没必要算多次次方
# 可以进行优化
my ( $sin1, $cos1, $sin2, $cos2 );
$sin1 = sub {
    my ( $x, $n ) = @_;
    my $factor = -1;
    my $sum    = 0;
    for ( my $i = 1 ; $i <= $n ; $i += 2 ) {
        my $bot = ( $i * ( $i - 1 ) );
        $factor = -$factor / ( $bot == 0 ? 1 : $bot );
        $sum += $factor * $x**$i;

        # 参考多项式展开公式进行生成结果
    }
    $sum;
};
$sin2 = sub {
    my ( $x, $n ) = @_;
    my $sum  = 0;
    my $temp = -1 / $x;

    # 设置临时变量$temp，每次迭代时只是在$temp的基础上乘一个因子
    for ( my $i = 1 ; $i <= $n ; $i += 2 ) {
        my $bot = ( $i * ( $i - 1 ) );
        $temp = -$temp * $x * $x / ( $bot == 0 ? 1 : $bot );
        $sum += $temp;
    }
    $sum;
};
$cos1 = sub {
    my ( $x, $n ) = @_;
    my $factor = -1;
    my $sum    = 0;
    for ( my $i = 0 ; $i <= $n ; $i += 2 ) {
        my $bot = ( $i * ( $i - 1 ) );
        $factor = -$factor / ( $bot == 0 ? 1 : $bot );
        $sum += $factor * $x**$i;
    }
    $sum;
};
$cos2 = sub {
    my ( $x, $n ) = @_;
    my $sum  = 0;
    my $temp = -1 / ( $x * $x );

    # 设置临时变量$temp，每次迭代时只是在$temp的基础上乘一个因子
    for ( my $i = 0 ; $i <= $n ; $i += 2 ) {
        my $bot = ( $i * ( $i - 1 ) );
        $temp = -$temp * $x * $x / ( $bot == 0 ? 1 : $bot );
        $sum += $temp;
    }
    $sum;
};

sub tri1 {
    my ( $x, $n ) = @_;
    foreach ( @{$n} ) {
        print "$_\t", $sin1->( $x, $_ ) + $cos1->( $x, $_ ), "\n";
    }
}

sub tri2 {
    my ( $x, $n ) = @_;
    foreach ( @{$n} ) {
        print "$_\t", $sin2->( $x, $_ ) + $cos2->( $x, $_ ), "\n";
    }
}

my $n = [ 0 .. 10 ];
my $x = 2;

# 未优化
print "未进行优化：" . "\n";

# 记录开始时间
my $start_time = [gettimeofday];

tri1( $x, $n );

# 记录结束时间
my $end_time = [gettimeofday];

# 计算代码运行时间
my $elapsed_time = tv_interval( $start_time, $end_time );

# 输出结果
print "代码运行时间为 $elapsed_time 秒\n";

print "进行了简单的优化：" . "\n";

# 进行了简单的优化
# 记录开始时间
my $start_time = [gettimeofday];

tri2( $x, $n );

# 记录结束时间
my $end_time = [gettimeofday];

# 计算代码运行时间
my $elapsed_time = tv_interval( $start_time, $end_time );

# 输出结果
print "代码运行时间为 $elapsed_time 秒\n";

# 实际检验发现并没有多少优化
1;
