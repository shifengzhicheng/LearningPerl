#!/usr/bin/perl -w
use strict;
use CompD;
use vars qw($a);

$a = CompD->new(0, 1);
my $b = CompD->new(0, -1);
my $c = $a->new();
my @l = map CompD->new(0, $_), 100..102;

sub internal {
	my $z;
	$z = CompD->new(10, 10);
	1;
}

internal();
undef @l;

1;
