#!/usr/bin/perl -w
use strict;
use Test;
plan tests => 10;
sub s1 {
	my $j;
	$j += $_
	    foreach (1..$_[0]);
	$j;
}
sub s2 {
	$_[0] * ($_[0] + 1) / 2;
}
ok(0, s1 0);
ok(0, s2 0);
ok(1, s1 1);
ok(1, s2 1);
ok(3, s1 2);
ok(3, s2 2);
ok(55, s1 10);
ok(55, s2 10);
ok(5050, s1 100);
ok(5050, s2 100);
1;
