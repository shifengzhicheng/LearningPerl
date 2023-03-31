#!/usr/bin/perl -w
use strict;
my($line, $result);

print "Enter an empty line to quit. ";
while (1) {
	print "Enter your expression and type [ENTER] : ";
	$line = <STDIN>;
	chomp $line;
	last if not $line;
	$result = eval "$line";
	print "\tError : $@\n" if $@;
	print "\tResult: $result\n" if not $@;
}

1;
