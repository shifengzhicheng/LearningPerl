#!/usr/bin/perl -w

use DBI;
use Data::Dumper;

#my $dbh = DBI->connect("DBI:CSV:f_dir=csv", '', '',)	# both works for f_dir attrib
my $dbh = DBI->connect("DBI:CSV:f_dir=csv", '', '', {f_dir => 'csv'})
	or die("Can't connect to DBI:CSV:\n");

$dbh->{csv_tables}->{wiki} = { 'file' => 'wiki.csv'};
my $sth = $dbh->prepare("SELECT country FROM wiki")
	or die "Fail to prepare SELECT.\n";
# also can combine the above lines to a single:
# $sth = $dbh->prepare("SELECT Country FROM wiki.csv") or die ...;

$sth->execute()
	or die "Fail to execute.\n";
my @row;

while (@row = $sth->fetchrow_array()) {
	print "Row: @row\n";
}

warn "Data fetching erro $DBI::errstr\n"
	if $DBI::err;

print '"', $dbh->tables(), '"', "\n";
my ($k, $v);
while (($k, $v) = each %{$dbh->{csv_tables}{wiki}}) {
	print "$k => $v\n";
}


$dbh->disconnect();

1;
