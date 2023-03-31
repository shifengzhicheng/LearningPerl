use strict;

my $Hello = "Hello, World";
my $TimeAround = 2;

print "$Hello for the ", $TimeAround, "nd time!\n";
print "$Hello for the ${TimeAround}nd time!\n";

print "Literals in perl :\t1234\t01234\t0x1234\t12.34\t1.234e5\t1.234e-5\n";
print "Actual values are :\t", 1234, "\t", 01234, "\t", 0x1234, "\t",
	12.34, "\t", 1.234e5, "\t", 1.234e-5, "\n";
1;
