#!/usr/bin/perl -w
use strict;
use Tk;
my($f1,$f2,$f3,$f4);
my $main=MainWindow->new();
$main->Button(-text=>'0,0')->grid(-row=>0,-column=>0);
$main->Button(-text=>'0,1')->grid(-row=>0,-column=>1);
$main->Button(-text=>'0,2')->grid(-row=>0,-column=>2);
$main->Button(-text=>'0,3')->grid(-row=>0,-column=>3);
$main->Button(-text=>'0,4')->grid(-row=>0,-column=>4);
$main->Button(-text=>'1,0')->grid(-row=>1,-column=>0);
$main->Button(-text=>'2,0')->grid(-row=>2,-column=>0);
$main->Button(-text=>'3,0')->grid(-row=>3,-column=>0);
$main->Button(-text=>'4,0')->grid(-row=>4,-column=>0);
$main->Button(-text=>'4,5')->grid(-row=>4,-column=>5);
$main->Button(-text=>'1,1 to 2,4')->grid(-row=>1,-column=>1,-rowspan=>2,-columnspan=>4,);
$main->Button(-text=>"3,1 to 4,4\nsticky nwse")->grid(-row=>3,-column=>1,-rowspan=>2,-columnspan=>4,-sticky=>'nwse');
$main->MainLoop;
1;
