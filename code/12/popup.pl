#!/usr/bin/perl -w
use strict;
use Tk;
use Tk::ProgressBar;
my($t) = 0;
my ($top, $id);
my $main=MainWindow->new();
$main->Button(-text=>'Popup', -command=>\&popup)->pack;
$main->MainLoop;
1;
sub count {
	$t++;
	$t = 0 if $t>100;
}
sub cancel{
	$top->destroy;
}
sub popup{
	$top = $main->Toplevel;
	
	$id = $top->Button(-textvariable=>\$t,-command=>\&cancel)->pack()->repeat(100,\&count);
	my $progress = $top->ProgressBar(
		-width => 20,
		-length => 200,
		-anchor => 'w',
		-from => 0,
		-to => 100,
		-blocks => 10,
		-colors=> [0, 'green', 50, 'yellow', 80, 'red'],
		-variable => \$t
	)->pack;
	$progress->value(0);
	$top->focus;
}
