#!/usr/bin/perl -w
use strict;
use lib '.';
use Comp;
use vars qw($a);

$a = Comp->new(0, 1);
my $b = Comp->new(0, -1);
my $c = $a->new();
my @l = map Comp->new(0, $_), 100..102;

sub internal {
	my $z;
	$z = Comp->new(10, 10);
	1;
}

internal();
undef @l;

1;
