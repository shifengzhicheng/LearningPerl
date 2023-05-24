#!/usr/bin/perl -w
use strict;
use lib '.';
use CompB;
use vars qw($a);

$a = CompB->new(0, 1);
my $b = CompB->new(0, -1);
my $c = $a->new();
my @l = map CompB->new(0, $_), 100..102;

sub internal {
	my $z;
	$z = CompB->new(10, 10);
	1;
}

internal();
undef @l;

1;
