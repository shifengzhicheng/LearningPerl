#!/usr/bin/perl -w
use strict;
use lib '.';
use TieRand;

my $r;
tie $r, "TieRand", -100, 100;
$r = 6;
print "$r\n" for 0..10;
1;
