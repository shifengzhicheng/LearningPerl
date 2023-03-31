#!/usr/bin/perl -w
use strict;

my($Ra, $Rh, $Rf, $Rs);

$Ra = [ 'A', 55, 1..6, 'oops' ];
$Rh = { 'dog'=>'bark', 'cat'=>'mew', };
$Rf = sub {my $x = shift; return 1/$x};
print "@$Ra\t$$Ra[7]\tDog=>$$Rh{dog}\n";
print &$Rf(5), "\t$Ra\t$Rh\t$Rf\n";

@$Rs= ( 'A', 55, 1..6, 'oops' );
print "@$Rs\n";

1;
