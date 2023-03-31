#!/usr/bin/perl -w
use strict;

print 'pack "C*", (65..90) ==> ';
print pack "C*", (65..90);
print "\n", 'pack "B32","01010000011001010111001001101100" ==> ';
print pack "B32","01010000011001010111001001101100";
print "\n", 'pack "H8","5065726c" ==> ';
print pack "H8","5065726c";

