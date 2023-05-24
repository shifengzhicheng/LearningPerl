#!/usr/bin/perl -w
use strict;
use Tk;
my ($text, $out);
my $main = new MainWindow;
$text = $main->Text(-width => 30, -height => 5)->pack;
$out  = $main->Text(-width => 30, -height => 5, -state => 'disabled')->pack;
$main -> Button(-text => 'Show',
	-command => sub {
		$out->configure(-state => 'normal');
		$out->delete('1.0', 'end');
		$out->insert('end', $text->get('1.0', 'end'));
		$out->configure(-state => 'disabled');
		}
	)->pack();
$main->MainLoop;
1;
