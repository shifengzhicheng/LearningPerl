#!/usr/bin/perl -w
use strict;
use Tk;
my($c, $x, $y);
my $main=MainWindow->new();
foreach $c ([0,0], [20,20], [30,80]) {
	($x, $y) = @$c;
	$main->Button(-text=>"Button $x, $y")->place(-x=>$x, -y=>$y);
}
$main->MainLoop;
1;
