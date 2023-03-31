#!/usr/bin/perl -w
use strict;
use Data::Dumper;
use GraphViz;
use Tk;
use Tk::GraphViz;
# 55 + (6 + 7 + 8*99 + 10)*12 + 23
my $tree = ['+', 55, ['*', ['+', 6, 7, ['*', 8, 99], 10], 12], 23];
my $symbol;

$symbol = 'A';	# give each node a unique name
print Dumper $tree;
showTk(graph($tree));

sub showTk {
	my $g = shift;
	my $m = new MainWindow;
	my $gv = $m->GraphViz(-width => 600, -height => 600) -> pack;
	$gv->show($g, fit=>0);
	MainLoop();
}

sub walk;
sub graph {
	my $tree = shift;
	my $g = GraphViz->new(width=>8, height=>8);
	$symbol = 'A';
	walk($tree, $g);
	open F, ">expr.png";
	binmode F;
	print F $g->as_png;
	close F;
	print "See also 'expr.png'.\n";
	return $g;
}

sub walk {
	my ($tree, $g) = @_;
	my $type = ref $tree eq 'ARRAY' ? $tree->[0] : 'I';
	my $res = $symbol;
	if ($type eq 'I') {
		$g->add_node($symbol++, label=>$tree);
		return $res;
	}

	my @list = @$tree;
	$g->add_node($symbol++, label => shift @list);
	$g->add_edge($res => walk($_, $g)) foreach @list;
	return $res;
}

1;
