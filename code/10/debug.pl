#!/usr/bin/perl -wd
use strict;
my $j;
foreach my $i (1..10) {
	$j += $i;
	print "\$i is $i, \$j is $j\n";
}
1;
