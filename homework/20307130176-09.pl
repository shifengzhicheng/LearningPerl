#!/usr/bin/perl -w
use strict;
use Time::HiRes qw(time sleep);
use Tk;
use Tk::PlotDataset;
use Tk::LineGraphDataset;
my $scriptname = $0;
my @num_iterations = (10..25);
my (@lib,@dss);
@lib = ('GMP','Calc','LTM','Pari');
foreach (@lib){
    my $lib = $_;
    my (@x,@y);
    foreach my $num_iterations(@num_iterations){
        my $start_time = time;
        system("perl 20307130176-09sqrt2.pl $num_iterations $lib");
        my $end_time = time;
        my $tspend=$end_time-$start_time;
        push @x,$num_iterations;
        push @y,$tspend; 
        last if $tspend>4;
    }
    my $dataset = LineGraphDataset->new (
        -name => $lib,
        -xData => [@x],
        -yData => [@y],
        );
    push @dss, $dataset;
}
plot(\@dss);
sub plot{    
    my $dss = shift;
    my $m = MainWindow->new;
    my $graph = $m->PlotDataset(
	    -width => 800,
	    -height => 500,
        )->pack;
    $graph->addDatasets(@{$dss});
    $graph->plot();
    MainLoop();
    1;
}
1;