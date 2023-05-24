#!/usr/bin/perl -w
$DB::profile = 0;
$DB::drop_zeros = 1;
%DB::packages = ('main' => 1);
use strict;

use Math::BigInt;

my $two = Math::BigInt->new('2');
my $p;

$DB::profile = 1;
foreach (1..100) {
	scalar $two ** 100;
}
foreach (1..46000) {
	scalar 2 ** 100;
}

1;
