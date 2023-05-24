#!/usr/bin/perl -w
use strict;

foreach (90000..100000) {
	s1($_);
}

foreach (90000..100000) {
	s2($_);
}

sub s1 {
	my $j;
	$j += $_ foreach (1..$_[0]);
}

sub s2 {
	$_[0] * ($_[0] + 1) / 2;
}

1;
