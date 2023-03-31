use strict;
use Chart::Lines;
my @x = map $_ / 100, -500..500;
my @y1 = map {$_ == 1 ? 0 : ($_*$_-$_- 4)/($_-1)}  @x;
my @y2 = map {$_ * sin($_) * cos($_)} @x;
my $chart = Chart::Lines->new(800, 600);
$chart->add_dataset(@x);
$chart->add_dataset(@y1);
$chart->add_dataset(@y2);
$chart->set('skip_x_ticks' => 100, 	'max_val' => 10,'min_val' => -10);
$chart->png('temp.png');
1;
