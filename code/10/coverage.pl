#!/usr/bin/perl -w
use strict;
sub ss {
	if ($_[0] <= 0) {
		print "Ignored\n";
		return;
	}
	print $_[0] * ($_[0] + 1) / 2;
	print "\n";
}
foreach (1..10) {
	ss($_);
}
1;
