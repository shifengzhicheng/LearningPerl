#!/usr/bin/perl -w
use strict;
use Chart::Lines;

my @x_values;
my @y_values;
my $flag = 0;
my $min_val = 0;
my $max_val = 0;
while (<>) {
  chomp;
  if (/^={3}\s=+$/) {
    $flag = 1;
    next;
  # 匹配3个=号一个空格还有至少第一个等号，匹配到就是到了数据行了
  # 直接快进到下一行
  # 这个时候把flag置为1
  }

  if ($flag) {
    my ($x, $y1, $y2) = split;
    # 如果数据有定义，那就push y 和与之对应的 x
    if(defined($y1)){
      push @y_values, $y1;
      push @x_values, $x;
    }
    if(defined($y2)){
      push @y_values, $y2;
      push @x_values, $x + 1;
    }
    
    # 取数据装进数组中
    if ($y1 < $min_val) {
      $min_val = $y1;
    }
    if ($y1 > $max_val) {
      $max_val = $y1;
    }
      if ($y2 < $min_val) {
      $min_val = $y2;
    }
    if ($y2 > $max_val) {
      $max_val = $y2;
    }
    # 为了方便表示取了最大最小值
  }
}
# 画图
my $chart = Chart::Lines->new(800, 600);
$chart->add_dataset(@x_values);
$chart->add_dataset(@y_values);
$chart->set('title' => 'Coefficient Curve',
            'legend' => 'bottom',
            'x_label' => 'X',
            'y_label' => 'Y',
            'min_val' => $min_val-($max_val-$min_val)/20,
            'max_val' => $max_val+($max_val-$min_val)/20,
            'skip_x_ticks' => 10);
$chart->png('20307130176.png');
1;