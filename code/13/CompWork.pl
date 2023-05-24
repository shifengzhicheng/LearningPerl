#!/usr/bin/perl -w
use strict;
use CompWork;

my @l = map CompWork->new(int rand 10, int rand 10), 1..10;
my $s = CompWork->new();
$s += $_ foreach @l;
print "$s";

1;
