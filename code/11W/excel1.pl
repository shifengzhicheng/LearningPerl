#!/usr/bin/perl -w
use strict;
use Win32;
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';
$Win32::OLE::Warn = 3;	# die on errors...

my $Excel = Win32::OLE->GetActiveObject('Excel.Application')
    || Win32::OLE->new('Excel.Application', 'Quit');
$Excel->{Visible} = 1;
my $Book = $Excel->Workbooks->Add(); #Workbook object
my $Sheet = $Book->Worksheets(1); #Worksheet object
$Sheet->{Name} = 'Perl_OLE';
my $Range = $Sheet->Range("B2:E2");
$Range->{Value} = [qw(Spring Summer Fall Winter)];
$Range->Font->{Bold} = 1;

$Sheet->Range("A3:A5")->{Value} = [['张三'], ['李四'], ['王五']];

$Sheet->Range("B3:E5")->{Value} = [
		[80, 80, 85, 80],
		[90, 80, 70, 70],
		[60, 70, 90, 100]
	];
my $name = Win32::GetCwd() . '\OLE.xls';
unlink $name;
$Book->SaveAs($name, undef, '111');
$Book->Close;
1;
