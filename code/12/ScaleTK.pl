#!/usr/bin/perl -w
use strict;
use Tk;
my ($scale, $text, $value);
my $main = new MainWindow;
$scale = $main->Scale(-orient => 'horizontal', -from => 0, -to => 100,
	-tickinterval => 10,
	-label => 'Select Value:', -length => 400,
	-variable => \$value, -command =>\&show)->pack();
$main -> Label(-textvariable => \$text)->pack();
$main->MainLoop;
1;

sub show {
	$text = "Scale value = $value";
}
