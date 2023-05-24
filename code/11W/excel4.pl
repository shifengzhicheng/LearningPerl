#!/usr/bin/perl -w
use strict;
use Win32;
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';
$Win32::OLE::Warn = 3;	# die on errors...

my $Book = Win32::OLE->GetObject(Win32::GetCwd . '\OLE2.xls')
    or die "Can't open OLE2.xls";
my $Sheet = $Book->Worksheets('Perl_OLE');
my $Range = $Sheet->Range("A2:E5");
my $Chart = $Book->Charts->Add;
$Chart->{Name} = 'Perl Chart';
$Chart->{ChartType} = xlAreaStacked;
$Chart->SetSourceData({Source => $Range, PlotBy => xlColumns});
$Chart->{HasTitle} = 1;
$Chart->ChartTitle->{Text} = "Items delivered, en route and to be shipped";
$Book->SaveAs(Win32::GetCwd . '\OLE4.xls');
$Chart->Export({
    FileName    => Win32::GetCwd . '\OLE4.gif',
    FilterName  => 'GIF',
    Interactive => 0});
$Book->Close;
1;
