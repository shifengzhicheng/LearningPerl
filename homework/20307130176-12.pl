#!/usr/bin/perl -w
use strict;
use warnings;
use lib '.';
use Complex_20307130176;



my $m = Complex->new(1, 2);
my $n = Complex->new(3, 4);
my $c = $m + $n;
my $d = $m - $n;
my $e = $m * $n;
my $f = $m / $n;
my $g = conj($m);
my $h = abs($m);

print "$m + $n = $c\n";
print "$m - $n = $d\n";
print "$m * $n = $e\n";
print "$m / $n = $f\n";
print "conj($m) = $g\n";
print "abs($m) = $h\n";

$m->r(5);
$m->i(6);
print "a = $m\n";

my $x = Complex->new(2, 3);
my $y = Complex->new(2, -4);

print "$x == $y is ", $x == $y ? "true\n" : "false\n";

my @comp_arr = ($m, $n, $c, $d, $e, $f, $g, $x, $y);
print join("\n", map { abs($_) } @comp_arr), "\n";
my @sorted_comp_arr = sort { abs($a) <=> abs($b) } @comp_arr;
print "sorted by abs:\n";
print join("\n", map { "$_" } @sorted_comp_arr), "\n";