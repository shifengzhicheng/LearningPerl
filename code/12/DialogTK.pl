#!/usr/bin/perl -w
use strict;
use Tk;
use Tk::Dialog;
my $main = new MainWindow;
my $dialog = $main->Dialog(
		-title	=> 'Are you sure?',
		-text	=> 'Quit?',
		-default_button => 'No',
		-buttons => ['No', 'Yes']
		);
$main->Button(
		-text	=> 'Quit program',
		-command=> sub{
			exit if $dialog->Show eq 'Yes';
		}
		)->pack;
$main->MainLoop;
1;
