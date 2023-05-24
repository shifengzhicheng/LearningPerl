#!/usr/bin/perl -w
use strict;
use Tk;
my($ck, $r);
my $main = new MainWindow;
my $menubar = $main->Frame(-relief => 'raised', -borderwidth => 2)->pack(-side => 'top', -fill => 'x');
my $menufile = $menubar->Menubutton(-text => 'File', -underline => 0, -tearoff => 0) -> pack(-side => 'left');
my $menuopts  = $menubar->Menubutton(-text => 'Options', -underline => 0, -tearoff => 0) -> pack(-side => 'left');
my $menuhelp = $menubar->Menubutton(-text => 'Help', -underline => 0, -tearoff => 1) -> pack(-side => 'left');

$menufile->command(-label => 'Open');
$menufile->command(-label => 'Exit', -command => sub{exit}, -underline => 1);

my $menucasc=$menuopts->menu->Menu();
$menucasc->add('command', -label=>'level');
$menuopts->cascade(-label=>'Cascade');
$menuopts->entryconfigure('Cascade', -menu=>$menucasc);
$menuopts->checkbutton(-label => 'Check', -variable => \$ck);
$menuopts->separator();
$menuopts->radiobutton(-label => 'R1', variable=>\$r);
$menuopts->radiobutton(-label => 'R2', variable=>\$r);

$menuhelp->command(-label => 'About');
$main->Label(-text => "Hello\nworld!", -height=>10, -width=>40)->pack;
$main->MainLoop;
1;
