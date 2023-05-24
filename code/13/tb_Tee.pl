#!/usr/bin/perl -w
use strict;
use lib '.';
use TieTee;

open LOG, ">log.txt";
tie *F, 'TieTee', \*STDOUT, \*STDERR, \*LOG;
select F;
print "Hello!\n";
print "I'm writing to 3 files at once!\n";
untie *F;
close LOG;
1;
