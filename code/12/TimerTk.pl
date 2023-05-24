#!/usr/bin/perl -w
use strict;
use Tk;
my($t) = 0;
my $main=MainWindow->new();
my $id = $main->Button(-textvariable=>\$t,-command=>\&cancel)->pack()->repeat(1000,\&count);
$main->MainLoop;
1;
sub count {
	$t++;
}
sub cancel{
	$id->cancel;
}
