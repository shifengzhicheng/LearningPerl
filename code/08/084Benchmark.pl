#!/usr/bin/perl -w
use strict;

use Benchmark;
use Math::BigInt;

my($two);

$two = new Math::BigInt '2';
timethese(1000, {
	'normal30' => sub {map 2**30, 1..10000}, 
	'bigint30' => sub {map $two**30, 1},
	'normal300' => sub {map 2**300, 1..10000}, 
	'bigint300' => sub {map $two**300, 1},
});

1;
