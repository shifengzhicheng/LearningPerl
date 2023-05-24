#!/usr/bin/perl -w

use DBI;

#unlink "list.dbf", "rank.dbf";

my $dbh = DBI->connect("DBI:mysqlPP:database=test;host=127.0.0.1",
	'try', '333', {RaiseError => 1})
	or die $DBI::errstr;

my $sth = $dbh->prepare("create table list (id int, name char(20), male boolean, dob date)")
	or die $DBI::errstr;

$sth->execute()
	or die $DBI::errstr;

$sth = $dbh->prepare('insert into list values("10", "Weby", "0", "19881009")')
	or die $DBI::errstr;
$sth->execute()
	or die $DBI::errstr;

my ($line, @data);
foreach $line (<DATA>) {
	chomp $line;
	@data = split /,\s+/, $line;
	next unless @data == 4;
	$data[-1] =~ s/^(\d+)[-.\/](\d+)[-.\/](\d+)$/sprintf '%04d%02d%02d', $1, $2, $3/e;
	# Note that DBD::XBase accept "YYYYMMDD" for date format.
	$sth = $dbh->prepare("insert into list values(" .
		join(',', map "\"$_\"", @data) .
		")")
		or die $DBI::errstr;
	$sth->execute()
		or die $DBI::errstr;
}

$sth = $dbh->prepare("create table rank (id int, perl int);")
	or die $DBI::errstr;
$sth->execute()
	or die $DBI::errstr;
#$sth = $dbh->prepare("alter table rank add mcu int")
#$sth = $dbh->prepare("ALTER TABLE rank modify perl mcu;")
#	or die $DBI::errstr;
#$sth->execute()
#	or die $DBI::errstr;

foreach (split / /, "11,100 21,98 3,75 14,85 10,91") {
	$sth = $dbh->prepare("insert into rank values($_);");
	$sth->execute();
}

$sth = $dbh->prepare("update list set name = concat(list.name, '!') where id in (select id from rank where perl > 90)");
$sth->execute();

$sth = $dbh->prepare("select * from list ;");
$sth->execute();
my @row;
while (@row = $sth->fetchrow_array()) {
	print "Row: @row\n";
}

$dbh->disconnect;

1;
__END__
11, Job, 1, 1968-12-1
21, Chip, 1, 1966-4-3
3, Lane, 1, 1977-9-15
14, Flora, 0, 1988-5-20
