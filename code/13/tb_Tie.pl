#!/usr/bin/perl -w
use strict;
use lib '.';
use TieTime;

my $time;
tie $time, 'TieTime';
sleep int rand 5;
print $time;

1;
