use strict;

my($count);

$count = 5;
print "$count\n" while $count-- > 0;

open(FD, ">065.txt");

my($stdout) = select(FD);
print "Select turned to FD\n";
print "$count\n" while $count++ < 5;
print STDERR "NOT ERROR!!!\n";
print "Select will be restored to STDOUT\n";
select($stdout);

print FD "$count\n" while $count-- > 0;
print "Print on screen!\n";

close FD;

1;
