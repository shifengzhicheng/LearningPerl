#!/usr/bin/perl -w
use strict;
use Tk;
my ($scale, $text, $b, $c, $scaleB, $scaleC);
my $main = new MainWindow;
$b = 0; $c = 0;
$main -> Label(-text => 'Solve: x^2 + b*x + c = 0')->pack();
$scaleB = $main->Scale(-orient => 'horizontal', -from => -100, -to => 100,
	-tickinterval => 50,
	-label => 'Select b:', -length => 200,
	-variable => \$b, -command =>\&solve)->pack();
$scaleC = $main->Scale(-orient => 'horizontal', -from => -100, -to => 100,
	-tickinterval => 50,
	-label => 'Select c:', -length => 200,
	-variable => \$c, -command =>\&solve)->pack();
$main -> Label(-textvariable => \$text)->pack();
$main->MainLoop;
1;

sub solve {
	my($d) = $b*$b-4*$c;
	$text = "D=$d. ";
	if ($d < 0) {
		$text .= "No real roots.";
	} elsif ($d == 0) {
		$text .= "One root: " . -$b/2;
	} else {
		$text .= "Two roots: " . (-$b + sqrt($d))/2 . ", " . (-$b - sqrt($d))/2;
	}
}
