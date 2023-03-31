use strict;

my @lines = <DATA>;	# Read in data
chomp @lines;		# Remove CRLF
my $line = lc join " ", @lines;
$line =~ s/[^a-z]+/ /g;	# remove ,:.()'
my @words = split / /, $line;
my @chars = split //, $line;
print "=====List of all words:\n";
print join "\t", @words;
my ($word, $char, $count, %words, %chars);
$words{$_}++ foreach @words;
$chars{$_}++ foreach @chars;
print "\n\n=====Word count:\n";
print "$word\t$count\n" while ($word, $count) = each %words;
print "\n\n=====Char count:\n";
print "$char\t$count\n" while ($char, $count) = each %chars;
1;

__END__
There is one minor difference: if variables
are declared with my in the initialization
section of the for, the lexical scope of those
variables is exactly the for loop (the body of
the loop and the control sections).
Besides the normal array index looping, for can
lend itself to many other interesting applications.
Here's one that avoids the problem you get into
if you explicitly test for end-of-file on an
interactive file descriptor causing your program
to appear to hang.
