#!/usr/bin/perl -w
use strict;
use Net::FTP;

use constant HOST => 'localhost';
use constant USER => 'anonymous';
#connect, login, and list directory
my $ftp = Net::FTP->new(HOST) or die $@;
$ftp->login(USER) or die $@;
print $ftp->pwd, "\n";
my @dir = $ftp->dir;
print join("\n", @dir), "\n";
#download a file and dump to STDOUT
my $fn = 'index.txt';
my $fh = $ftp->retr($fn);
warn "Can't find $fn" if not $fh;
print <$fh> if $fh;
$ftp->quit;
1;
