#!/usr/bin/perl -w
use strict;
use Tk;
my $pet = 0;
my $main = new MainWindow;
$main->Radiobutton(-text => 'Cat', -value => 1, -variable => \$pet)->pack();
$main->Radiobutton(-text => 'Dog', -value => 2, -variable => \$pet)->pack();
$main->Radiobutton(-text => 'Other', -value => 3, -variable => \$pet)->pack();
$main->Label(-textvariable => \$pet)->pack();
$main->MainLoop;
1;
