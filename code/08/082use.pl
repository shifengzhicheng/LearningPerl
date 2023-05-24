#!/usr/bin/perl -w
use strict;

use Config;
use Env;
use lib'.';
use Simple;	# you must put all scripts in current dir.

print join ", ", @Config{'osname', 'cc', 'ccflags'};
print "\nPATH is $PATH\n";
Simple::True();
True();

1;
