#!/usr/bin/perl -w
# for Winword 2000, not for Winword 97, not tested on Winword 2003
use strict;
use Win32;
use Win32::OLE;
my $line = "Hello World!";
my $wd = Win32::OLE->new('Word.Application') ||
	die "CreateObject: " . Win32::OLE->LastError;
$wd->{Visible} = 1;
my $doc = $wd->Documents->Add();
$wd->Selection->Font->{Size} = 100;
$wd->Selection->Font->{SmallCaps} = 100;
$wd->Selection->Font->{Animation} = 3;
$wd->Selection->TypeText($line);
$doc->SaveAs(Win32::GetCwd . '\ole.doc',undef,undef,"111");
1;
