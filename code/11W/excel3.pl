#!/usr/bin/perl -w
use strict;
use Win32;
use Win32::OLE qw(in with);
use Win32::OLE::Const 'Microsoft Excel';
$Win32::OLE::Warn = 3;	# die on errors...

my $Book = Win32::OLE->GetObject(Win32::GetCwd . '\OLE2.xls','Quit')
    or die "Can't open OLE2.xls";
my $Sheet = $Book->Worksheets('Perl_OLE');
my $data = $Sheet->Range("B3:E5")->{Value};
my ($row, $cell);
foreach $row (@$data) {
	foreach $cell (@$row) {
		print "'$cell'\t";
	}
	print "\n";
}
exit;
