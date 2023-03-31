#!/usr/bin/perl -w
use strict;
use Data::Dumper;

my($i, @arr, @AoA, @b);

for $i (0..2) {
	@arr = map int rand 100, 1..5;
	$AoA[$i] = @arr;
}
print Dumper(@AoA);

print "#"x50, "\n";

for $i (0..2) {
	@arr = map int rand 100, 1..5;
	$AoA[$i] = \@arr;
}
print Dumper(@AoA);

print "#"x50, "\n";

@AoA = ();
@b = ('A' .. 'E');
$AoA[0] = \@b;
for $i (0..2) {
	@arr = map int rand 100, 1..5;
	@{$AoA[$i]} = @arr;
}
print Dumper(@AoA);
print Dumper(@b);

print "#"x50, "\n";
@AoA = ();
@b = ('A' .. 'E');
$AoA[0] = \@b;
for $i (0..2) {
	@arr = map int rand 100, 1..5;
	$AoA[$i] = [@arr];
}
print Dumper(@AoA);
print Dumper(@b);

1;
