#!/usr/bin/perl -w
use strict;

use Data::Dumper;

my(@ref3D, $r3D);
$ref3D[3]->[2][1]=5; $ref3D[0][0][0]=1;	print Dumper(@ref3D);
# same as:
@ref3D = ([[1]], undef, undef,
 [undef, undef, [undef, 5]]);		print Dumper(@ref3D);
#############
$r3D->[3][2][1]=5; $r3D->[0][0][0]=1;	print Dumper($r3D);
#same as:
$r3D = [[[1]], undef, undef,
 [undef, undef, [undef, 5]]];		print Dumper($r3D);
#############
my $arr = [[1, 0, 0], [0, 1, 0]];
print $arr->[0][1];			print Dumper($arr);
push @$arr, [0, 0, 1];			print Dumper($arr);

1;
