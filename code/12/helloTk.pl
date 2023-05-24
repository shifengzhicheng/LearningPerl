#!/usr/bin/perl -w
use strict;
use Tk;

my $main = new MainWindow;
$main->title('^_^');
$main->Label(-text=>'Hello World!')->pack;
$main->Label(-text=>'This is Perl/TK!')->pack;
$main->Button(-text => 'Quit',
              -command => sub{exit}
             )->pack;
$main->MainLoop;
1;
