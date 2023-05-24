#!/usr/bin/perl -w
use strict;
use CompC;
use vars qw($a);

$a = CompC->new(0, 1);
my $b = CompC->new(0, -1);
my $c = $a->new();
my @l = map CompC->new(0, $_), 100..102;

sub internal {
	my $z;
	$z = CompC->new(10, 10);
	1;
}

internal();
undef @l;

1;
