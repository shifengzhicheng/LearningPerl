#!/usr/bin/perl -w
use strict;
use CompH;

my @l = map CompH->new(int rand 10, int rand 10), 1..10;
my @s = sort {$a->compare($b)} @l;

print "\@l is :", join(",", map $_->string, @l), "\n";
print "\@s is :", join(",", map $_->string, @s), "\n";
1;
