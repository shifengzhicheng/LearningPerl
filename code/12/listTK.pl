#!/usr/bin/perl -w
use strict;
use Tk;
my ($list, $out);
my $main = new MainWindow;
$list = $main->Listbox(-width => 30, -height => 5, -selectmode => 'multiple')->pack();
$list->insert('end', 'Perl ABC', 'Advanced Perl', 'VHDL prime', 'Verilog HDL',
	'Embedded OS', 'Multimedia');
$list->bind('<Double-1>', \&get_item);
$out = $main->Text(-width => 26, -height => 5)->pack();
$main -> Button(-text => 'Show',
	-command => \&get_item)->pack();
$main->MainLoop;
1;

sub get_item {
	$out->delete('1.0', 'end');
	my @sel = $list->Getselected();
	for (1..@sel) {
		$out->insert("$_.0", "$sel[$_-1]\n");
	}
}
