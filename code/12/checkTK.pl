#!/usr/bin/perl -w
use strict;
use Tk;
my ($milk, $egg, $bagel) = ('-', '-', '-');
my $main = new MainWindow;
$main->Checkbutton(-text => 'Milk', -onvalue => 1, -offvalue => 0, -variable => \$milk)->pack();
$main->Checkbutton(-text => 'Egg', -variable => \$egg)->pack();
$main->Checkbutton(-text => 'Bagel', -variable => \$bagel)->pack();
$main->Label(-textvariable => \$milk)->pack(-side => 'left');
$main->Label(-textvariable => \$egg)->pack(-side => 'left');
$main->Label(-textvariable => \$bagel)->pack(-side => 'left');
$main->MainLoop;
1;
