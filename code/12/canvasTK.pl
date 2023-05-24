#!/usr/bin/perl -w
use strict;
use Tk;
use Tk::Canvas;
my $main = new MainWindow;
my $canvas = $main->Canvas(
	-background => 'LightYellow',
	-height	=> 400,
	-width	=> 400
	)->pack;
my $arc =$canvas->createArc(100,100,250,350, -extent => 350, -outline=>'black', -start=>50, -fill=>'green');
my $line=$canvas->createLine(100,100,100,350,200,250,100,50,-fill=>'blue',-width=>5);

$canvas->bind($arc, '<Button-1>', [ \&jump, $arc ]);
$canvas->bind($line, '<Double-1>', [ '::jump', $line]);
$main->Button(-text=>'Postscript', -command=>sub {
		$canvas->postscript(-file=>'canvas.ps')
	}
	)->pack;
$main->MainLoop;
1;
sub jump{
	my($canvas) = shift;
	my($id) = shift;
	$canvas->move($id, rand(100) - 50, rand(100) - 50);
}
