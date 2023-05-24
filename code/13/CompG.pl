#!/usr/bin/perl -w
use strict;
use CompG;
use vars qw($a);

$a = CompG->new(0, 1);
my $b = CompG->new(0, -1);
my $c = $a->new();
my @l = map CompG->new(0, $_), 100..102;

$a->x(100);
$a->y(200);
print $a->x, "\t", $a->y, "\n";

sub internal {
	my $z;
	$z = CompG->new(10, 10);
	1;
}

internal();
undef @l;

1;
