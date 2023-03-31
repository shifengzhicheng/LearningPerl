#!/usr/bin/perl -w
use strict;

print "PID is $$\n";
print "\@ARGV is ", join ", ", @ARGV;
print "\nTEMP is $ENV{TEMP}\n";
print "PATH is $ENV{PATH}\n";
print "Program name is $0\n";
"ABCDEFG" =~ /CD/;
print "'ABCDEFG' =~ /CD/; (\$`, \$&, \$') is ($`, $&, $');\n";

open(F, "<ABCD");
print "open a non-exist file: open(F, '<ABCD'); \$! is '$!'";

1
