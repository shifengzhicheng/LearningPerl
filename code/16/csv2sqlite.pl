#!/usr/bin/perl -w
use strict;
use DBI;

unlink "country.sqlite";
my $dbhCSV = DBI->connect("DBI:CSV:f_dir=csv", '', '')
	or die("Can't connect to DBI:CSV:f_dir=csv\n");
my $dbhSQL = DBI->connect("DBI:SQLite:dbname=country.sqlite", '', '')
	or die("Can't connect to DBI:SQLite:dbname=country.sqlite\n");

$dbhCSV->{f_dir} = 'csv';
$dbhCSV->{csv_tables}->{country} = {'file' => 'Country.csv'};

my $sthSQL = $dbhSQL->prepare("create table countries (
	_ int, country char(40), population int, area int, density int)")
		or die $DBI::errstr;
$sthSQL->execute()
	or die $DBI::errstr;

my $sth = $dbhCSV->prepare("SELECT * FROM country")
	or die "Fail to prepare select.\n";
$sth->execute()
	or die "Fail to execute.\n";
my (@row, $cmd);

while (@row = $sth->fetchrow_array()) {
	print "Row: @row\n";
	s!"!""!g foreach @row;
	$cmd = "insert into countries values (" .
			join(', ', map "\"$_\"", @row) . ")";
	print "cmd: $cmd\n";
	$sthSQL = $dbhSQL->prepare($cmd)
		or die $DBI::errstr;
	$sthSQL->execute()
		or die $DBI::errstr;
}

$dbhCSV->disconnect();
$dbhSQL->disconnect();
1;
