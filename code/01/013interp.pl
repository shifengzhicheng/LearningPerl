use strict;

my $Hello = "Hello, World";
my $TimeAround = 2;

print << "HERE";
* Double quoted strings: Variables are interplated.
* Single quoted strings: Variables are not interplated.
* Back quoted strings: Executed as shell commands.
HERE
print "$Hello for the ", $TimeAround, "nd time!\n";
print "$Hello for the ${TimeAround}nd time!\n";
print '$Hello for the ${TimeAround}nd time!\n';
print "\nExecute cd command and print the result:\n";
print `cd`;	#change to `pwd` if you're running Linux
print "oops!\n";

1;
