#!/usr/bin/perl -w
use strict;
use Tk;
my $main = new MainWindow;
my $frame = $main->Frame->pack(-side=>'left');
my $text = $frame->Text(-width => 20, -height => 15)->pack(-side=>'left');
my $scrollbar_x = $frame->Scrollbar(-command => ['xview', $text], -orient => 'horizontal');
my $scrollbar_y = $main->Scrollbar(-command => ['yview', $text]);
$text->configure(-xscrollcommand => ['set', $scrollbar_x]);
$text->configure(-yscrollcommand => ['set', $scrollbar_y]);
$text->pack(-side=>'top');
$scrollbar_x->pack(-side => 'bottom', -fill => 'x');
$scrollbar_y->pack(-side => 'right', -fill => 'y');
$main->MainLoop;
1;
