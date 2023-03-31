#!/usr/bin/perl -w
use strict;

use Data::Dumper;
my(@ref3D, $r3D);
$ref3D[3][2][1]=5;
$ref3D[0][0][0]=1;
$r3D->[3][2][1]=5;
$r3D->[0][0][0]=1;
print Dumper(@ref3D);
print Dumper($r3D);

1;
