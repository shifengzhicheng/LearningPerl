use strict;
use lib '.';
use Tk;
use inner;
use Data::Dumper;

our ($n,$target);
eval {require "task.inc"} 
    or die "Error on task.inc\n$@";


sub gramschmidt {
    my $n = shift;
    my @v;  # Store original vectors
    my @e;  # Store orthogonalized vectors
    for my $i (0..$n-1){
        $v[$i] = [map{0} 1..$n];
        $v[$i][$i] = 1;
    }
    for my $i (0 .. $n-1) {
        my $q = poly($v[$i]);
        for my $j (0 .. $i-1) {
            my $temp1=-inner(poly($v[$i]),poly($v[$j]))/inner(poly($v[$j]),poly($v[$j]));
            $q=va($q,kv($temp1,poly($v[$j])));    
        }
        push @e, $q;
    }
    return \@e;
}
sub project {
    my ($target, $e) = @_;
    my @coeffs;
    for my $i (0 .. scalar(@{$e})-1) {
        my $inner = inner($target, $e->[$i]);
        my $norm_squared = norm($e->[$i], $e->[$i]);
        my $scale = $inner / $norm_squared;
        push @coeffs, $scale;
    }
    return \@coeffs;
}
sub transcoord {
    my ($m, $e) = @_;
    my $w = [map{0} 1..scalar(@{$e})];
    for my $i (0 .. scalar(@{$m})-1) {
        $w->[$i] = $w->[$i] + $m->[$i]* $e->[$i];
    }
    return $w;
}

my $e = gramschmidt($n);
my $m = project($target, $e);
my $w = transcoord($m, $e);
my $err = norm(va($target,kv(-1,poly($w))));
print $err,"\n";
plot(target=>$target,poly=>poly($w));
1;