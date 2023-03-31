use strict;

# Note:
# -e filename is true, if a file or directory with name "filename" exists.
print "Found 'ABCD.txt'\n" if -e 'ABCD.txt';
print "'ABCD.txt' not found!\n" if not -e 'ABCD.txt';
print "'ABCD.txt' not found!\n" unless -e 'ABCD.txt';

# Note:
# <04*> here means find all file in currenct directory who's file name
# start with 04. This is similar to "dir 04*.*" in DOS prompt.
# Actually you can try <*> to list all files.
print "Found $_\n" while <04*>;

my $i = 1;
my $j = 0;
$j += $i++ until ($i > 100);
print "\$j is $j\n";

1
