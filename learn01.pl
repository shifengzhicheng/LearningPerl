use strict;
use lib '.';
use Tk;
use inner;
use Data::Dumper;

our ($n,$target);
eval {require "task.inc"} 
    or die "Error on task.inc\n$@";

sub subtract {
    my ($q,$v)=@_;
    my @r;
    my $len = scalar @{$q};
    for(my $i = 0; $i < $len; $i++){
        push @r,$q->[$i]-$v->[$i];
    }
    return \@r;
}

sub scale {
    my ($scale,$v)=@_;
    my @new;
    foreach (@{$v}){
        push @new,$scale*$_;
    }
    return \@new;
}

sub gramschmidt {
    my $n = shift;
    my @v;  # 原始向量产生
    my @e;  # 存储正交向量
    for my $i (0 .. $n-1) {
      $v[$i] = [map{0} 1..$n];
      $v[$i][$i] = 1;
        my $q = [@{$v[$i]}];
        for my $j (0 .. $i-1) {
            $q=subtract($q,scale(inner(poly($v[$i]),poly($v[$j]))/inner(poly($v[$j]),poly($v[$j])),$v[$j]));    
        }
        push @e, $q;
    }
    return \@e;
}
sub project {
    my ($target, $e) = @_;
    my @coeffs;
    my $len = scalar(@{$e}) - 1;
    for my $i (0 .. $len) {
        my $inner = inner($target, poly($e->[$i]));
        my $norm_squared = inner(poly($e->[$i]), poly($e->[$i]));
        my $scale = $inner / $norm_squared;
        push @coeffs, $scale;
    }
    # 求出内积然后除以原向量的内积得到投影向量
    return \@coeffs;
}
sub transcoord{
    my ($coeffs, $e) = @_;
    my $len = scalar(@{$e}) - 1;
    my @new_coeffs = (map {0} $len);    
    for my $i (0 .. $len) {
        my $scaled_e = scale($coeffs->[$i], $e->[$i]);
        # 产生一个按比例的原空间中的向量
        for my $j (0 .. scalar(@{$scaled_e})-1) {
            $new_coeffs[$j] += $scaled_e->[$j];
            # 原空间中的向量对应系数加到对应的维度上
        }
    }
    return \@new_coeffs;
}
my $e = gramschmidt($n);
print "Here! gramschmidt"."\n";
my $m = project($target, $e);
print "Here! project"."\n";
my $w = transcoord($m, $e);
print "Here! transcoord"."\n";
my $err = norm(va($target,kv(-1,poly($w))));
for (@{$w}){
        print $_."\n";
}
print "Here! norm of error_vector:"."\n";
print $err,"\n";
plot(target=>$target,poly=>poly($w));
1;