use strict;

package inner;
# Xiaofang Zhou, Mar 2022.
# Using Perl in a more mathematical way.
# Remember to install these CPAN modules
# before using inner.pm:
# cpan/install Tk LineGraphDataset Tk::PlotDataset

use Exporter 'import';
our @EXPORT = qw(norm inner frac va kv rx poly plot);

use Tk;
use Tk::PlotDataset;
use Tk::LineGraphDataset;

use constant LOW => -3.14159;
use constant HIGH => 3.14159;
use constant SAMPLES => 201;

my %frac = (0 => 1,);
sub frac {
	$frac{$_[0]} // ($frac{$_[0]} = $_[0] * frac($_[0] - 1));
}

# 这个是向量加
sub va {
	my (@f) = @_;
	return sub {
		my $sum = 0;
		$sum += $_->($_[0]) foreach @f;
		$sum;
	}
};

# 这个是为向量乘一个系数k
sub kv {
	my ($k, $v) = @_;
	return sub { $k * $v->($_[0]) }
}

# 这个是DIY的范数
sub norm_diy {	# DIY, mix of manhattan, maximum
	my ($f) = @_;
	my $step = (HIGH - LOW) / (SAMPLES - 1);
	my $v = abs($f->(HIGH));
	my ($x, $max, $res) = (LOW, $v, $v);
	foreach (0 .. SAMPLES - 2) {
		$v = abs($f->($x));
		$max = $v if $v > $max;
		$res += $v;
		$x += $step;
	}
	0.5 * ($max + $res) / SAMPLES;
}

# 这个是欧式范数
sub norm {	# euclidean
	my ($f) = @_;
	my $step = (HIGH - LOW) / (SAMPLES - 1);
	my $v = ($f->(HIGH)) ** 2;
	my ($x, $res) = (LOW, $v);
	foreach (0 .. SAMPLES - 2) {
		$v = ($f->($x)) ** 2;
		$res += $v;
		$x += $step;
	}
	sqrt($res / SAMPLES);
}

# 这个是内积
sub inner {
	my ($f1, $f2) = @_;
	my $normadd = norm(sub {$f1->($_[0]) + $f2->($_[0])});
	my $normsub = norm(sub {$f1->($_[0]) - $f2->($_[0])});
	0.25 * ($normadd * $normadd - $normsub * $normsub);
}

# 这个是计算单个多项式的值
sub rx {
	my ($x, $v) = @_;
	my ($p, $s) = (1, 0);
	foreach (@$v) {
		$s += $_ * $p;
		$p *= $x;
	}
	$s;
}

# 计算多项式的函数，参数是 $x以及多项式参数数组@v的引用
# 返回一个代码块，代码块调用了函数rx
sub poly {
	my @v = @{$_[0]};
	return sub {
		rx($_[0], [@v]);
	};
}

# 这个是画图
sub plot {
	my ($name, $func, @x, @y, @dss, $step, $dataset);
	$step = (HIGH - LOW) / (SAMPLES - 1);
	@x = map LOW + $step * $_, 0 .. SAMPLES - 1;
	while (@_) {
		$name = shift;
		$func = shift;
		@y = map $func->($_), @x;
		# print "@y";...;
		$dataset = LineGraphDataset->new (
			-name => $name,
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
}

1;
