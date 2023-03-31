use strict;
my @v;
my $n = 4;
for my $i (1 .. $n) {
    $v[$i] = [map{0} 1..$n];
    $v[$i][$i] = 1;
    my $q = [@{$v[$i]}];
    print $q->[$i],$v[$i]->[$i],"\n";
}
