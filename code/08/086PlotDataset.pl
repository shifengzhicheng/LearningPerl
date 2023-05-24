#!/usr/bin/perl -w
use strict;

use Tk;
use Tk::PlotDataset;
use Tk::LineGraphDataset;

my ($fn, $f, $x, $y, @dss, $dataset, @x, @y);
foreach (
	['exp x', sub {exp $_[0]}],
	['x**2', sub {$_[0]**2}],
	['x**3', sub {$_[0]**3}],
	) {
	($fn, $f) = @$_;
	@x = @y = ();
	foreach $x (map $_ / 20, 10..100) {
		$y = $f->($x);
		last if $y > 10;
		push @x, $x;
		push @y, $y;
	}
	next unless @x;
	$dataset = LineGraphDataset -> new(
		-name => $fn,
		-xData => [@x],
		-yData => [@y],
	);
	push @dss, $dataset;
}

my $m = MainWindow->new;
my $graph = $m->PlotDataset(
	-width => 800,
	-height => 500,
	)->pack;
$graph->addDatasets(@dss);
$graph->plot;
MainLoop;
1;
