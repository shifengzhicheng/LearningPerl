#!/usr/bin/perl -w
use strict;
use Tk;
use Tk::FileSelect;
my $main = new MainWindow;
my $fs = $main->FileSelect(-directory=>'c:');
my $file = "";
$main->Label(-textvariable => \$file)->pack;
$main->Button(
		-text	=> 'Select File',
		-command=> sub{
			$file = $fs->Show;
		}
		)->pack;
$main->MainLoop;
1;
