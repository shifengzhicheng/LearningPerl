#!/usr/bin/perl -w
use strict;
use Tie::Watch;

my @arr;
my $watch = new Tie::Watch(
	-variable => \@arr,
	-store => \&store,
	-fetch => \&fetch,
	-destroy => sub {print "Destroy.\n"},
	);
@arr = (3, 1, 4, 16);
print "@arr\n";

sub store {
	my ($tie, $k, $v) = @_;
	$tie->Store($k, $v);
	print "Store $v to index $k.\n";
}

sub fetch {
	my ($tie, $k) = @_;
	my ($v) = $tie->Fetch($k);
	print "Fetch index $k, value is $v.\n";
	$v;
}

1;
