#!/usr/bin/perl -w
use strict;
use Tk;

my $main = new MainWindow;
$main->title('Relief Style');
$main->Label(-text => 'This is to demo the \'-relief\' styles.')->pack;
foreach my $s qw(groove raised sunken flat ridge solid) {
	$main->Label(-text => "$s style", -relief => $s)->pack;
}
$main->Button(-text => 'Quit',
              -command => sub{exit}
             )->pack;
$main->MainLoop;
1;
