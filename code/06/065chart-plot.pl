#!/usr/bin/perl -w
use strict;
use Chart::Plot;
my $fig = Chart::Plot->new(1000, 700);
my @x = map $_/100, 100..314;
my @y = map $_**2/4-1, @x;
$fig->setData([@x], [@y], 'Red SolidLine NoPoints');
@x = map -$_/100, 100..314;
@y = map sin(2*$_), @x;
$fig->setData([@x], [@y], 'Blue Dashedline NoPoints');
@x = map $_/100, -200 .. 200;
@y = map $_**3/6-$_, @x;
$fig->setData([@x], [@y], 'Black Noline Points');
$fig->setGraphOptions('title' => 'Example',);
open F, '>Fig.png' or die;
binmode F;
print F $fig->draw('png');
close F;
1;
