#!/usr/bin/perl -w
use strict;
use Tk;
my($f1,$f2,$f3,$f4);
my $main=MainWindow->new();
$f1=$main->Frame(-borderwidth=>2,-relief=>'ridge')->pack(-side=>'left');
$f2=$main->Frame(-borderwidth=>2,-relief=>'ridge')->pack(-side=>'left');
$f3=$main->Frame(-borderwidth=>2,-relief=>'ridge')->pack(-side=>'left');
$f4=$main->Frame(-borderwidth=>2,-relief=>'ridge')->pack(-side=>'left');

$f1->Button(-text=>'1.pack top')->pack();
$f1->Button(-text=>'2.big',-height=>2,-width=>20)->pack();

$f2->Button(-text=>'1.pack top fill x')->pack(-fill=>'x');
$f2->Button(-text=>'2.big',-height=>2,-width=>20)->pack();

$f3->Button(-text=>'1.pack top pady 10')->pack(-pady=>'10');
$f3->Button(-text=>'2.big',-height=>2,-width=>20)->pack();

$f4->Button(-text=>'1.pack top expand')->pack(-expand=>1);
$f4->Button(-text=>'2.big',-height=>2,-width=>20)->pack();
$f4->Button(-text=>'3.mid fill both',-height=>1,-width=>10)->pack(-fill=>'both');
$f4->Button(-text=>'4.mid-left',-height=>1,-width=>10)->pack(-side=>'left');
$f4->Button(-text=>'5.mid-right',-height=>1,-width=>10)->pack(-side=>'right');
$f4->Button(-text=>'6.mid-bottom',-height=>1,-width=>10)->pack(-side=>'bottom');
$f4->Button(-text=>'7.mid-top',-height=>1,-width=>10)->pack(-side=>'top');

$main->MainLoop;
1;
