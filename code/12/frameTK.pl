#!/usr/bin/perl -w
use strict;
use Tk;
my ($f1, $f2, $f3);
my $main = new MainWindow;
$f1 = $main->Frame()->pack(-side => 'left', -padx => 5);
$f1->Label(-text=>'Left')->pack();
$f1->Button(-text=>'Button1')->pack();
$f2 = $main->Frame()->pack(-side => 'left', -padx => 5);
$f2->Button(-text=>'Button2')->pack();
$f2->Label(-text=>'Middle')->pack();
$f3 = $main->Frame(-relief=>'ridge', -borderwidth=>5)->pack(-side => 'left', -padx => 5);
$f3->Label(-text=>"Right\nFrame")->pack();
$main->MainLoop;
1;
