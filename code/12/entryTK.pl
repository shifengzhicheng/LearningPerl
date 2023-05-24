#!/usr/bin/perl -w
use strict;
use Tk;
my ($name, $pin);
my $main = new MainWindow;
$name = $main->Entry;
$pin  = $main->Entry(-show => '*');
$name -> pack(); $pin -> pack();
$main -> Button(-text => 'Ok',
	-command => sub {
		print $name->get(), "\n";
		print $pin ->get(), "\n";
		exit;
		}
	)->pack();
$main->MainLoop;
1;
