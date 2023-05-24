#!/usr/bin/perl -w

use DBI;

my $dbh = DBI->connect("dbi:Proxy:hostname=localhost;port=3333;dsn=DBI:mysqlPP:database=test;host=127.0.0.1",
	'try', '333', {RaiseError => 1})
	or die $DBI::errstr;

my $sth = $dbh->prepare("drop table list, rank")
	or die $DBI::errstr;

$sth->execute()
	or die $DBI::errstr;

$dbh->disconnect;

1;
