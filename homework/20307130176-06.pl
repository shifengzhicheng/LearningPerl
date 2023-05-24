#!/usr/bin/perl

# 科学地拟合函数，用到了内积
use strict;
use lib '.';
use Tk;
use inner;
use Data::Dumper;

our ( $n, $target );
eval { require "task.inc" }
  or die "Error on task.inc\n$@";

# 向量减
sub subtract {
    my ( $q, $v ) = @_;
    my @r;
    my $len = scalar @{$q} - 1;
    for my $i ( 0 .. $len ) {
        push @r, $q->[$i] - $v->[$i];
    }
    return \@r;
}

# 向量标量乘法
sub scale {
    my ( $scale, $v ) = @_;
    my @new;
    foreach ( @{$v} ) {
        push @new, $scale * $_;
    }
    return \@new;
}

# 产生正交基
sub gramschmidt {
    my $n = shift;
    my @v;    # 原始向量产生
    my @e;    # 存储正交向量
    for my $i ( 0 .. $n - 1 ) {
        $v[$i] = [ map { 0 } 0 .. $n - 1 ];
        $v[$i][$i] = 1;
        my $q = [ @{ $v[$i] } ];
        for my $j ( 0 .. $i - 1 ) {
            $q = subtract(
                $q,
                scale(
                    inner( poly( $v[$i] ), poly( $e[$j] ) ) /
                      inner( poly( $e[$j] ), poly( $e[$j] ) ),
                    $e[$j]
                )
            );
        }
        my $coeffs = sqrt( 1 / inner( poly($q), poly($q) ) );
        $q = scale( $coeffs, $q );
        push @e, $q;
    }
    return \@e;
}

sub project {

    # 向量投影
    my ( $target, $e ) = @_;
    my @coeffs;
    my $len = scalar( @{$e} ) - 1;
    for my $i ( 0 .. $len ) {
        my $inner        = inner( $target,          poly( $e->[$i] ) );
        my $norm_squared = inner( poly( $e->[$i] ), poly( $e->[$i] ) );
        my $scale        = $inner / $norm_squared;
        push @coeffs, $scale;
    }

    # 求出内积然后除以原向量的内积得到投影向量
    return \@coeffs;
}

sub transcoord {

    # 向量转换回原空间，提取投影的系数，把对应的向量的系数相加得到多项式系数
    my ( $coeffs, $e ) = @_;
    my $len        = scalar( @{$e} ) - 1;
    my @new_coeffs = ( map { 0 } $len );
    for my $i ( 0 .. $len ) {
        my $scaled_e = scale( $coeffs->[$i], $e->[$i] );

        # 产生一个按比例的原空间中的向量
        for my $j ( 0 .. $len ) {
            $new_coeffs[$j] += $scaled_e->[$j];

            # 原空间中的向量对应系数加到对应的维度上
        }
    }
    return \@new_coeffs;
}

print "Here! gramschmidt" . "\n";
my $e = gramschmidt($n);
foreach ( @{$e} ) {
    foreach ( @{$_} ) {
        printf( "%.4f\t", $_ );
    }
    print "\n";
}
print "Here! project" . "\n";
my $m = project( $target, $e );
for ( @{$m} ) {
    printf( "%.4f\t", $_ );
}
print "\n";
print "Here! transcoord" . "\n";
my $w = transcoord( $m, $e );
for ( @{$w} ) {
    printf( "%.4f\t", $_ );
}
print "\n";
my $err = norm( va( $target, kv( -1, poly($w) ) ) );
print "Here! norm of error_vector:" . "\n";
print $err, "\n";
plot( target => $target, poly => poly($w) );
1;
