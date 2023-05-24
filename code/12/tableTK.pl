#!/usr/bin/perl -w
use strict;
use Tk;
use Tk::Table;
my $main = new MainWindow;
my $tab = $main->Table(
	-height => 10,
	-rows => 100,
	-columns => 6,
	-scrollbars => 'se',
	-fixedrows => 1,
	-fixedcolumns => 1,
	-takefocus => 1)->pack;
$tab->put(0, 0, 'i');
$tab->put(0, 1, 'i*i');
$tab->put(0, 2, '1/i');
$tab->put(0, 3, 'sqrt i');
$tab->put(0, 4, 'ln i');
foreach (1..100) {
	$tab->put($_, 0, $_);
	$tab->put($_, 1, $_*$_);
	$tab->put($_, 2, 1/$_);
	$tab->put($_, 3, sqrt $_);
	$tab->put($_, 4, log $_);
}

$main->MainLoop;
1;
