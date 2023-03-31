use strict;

print "Testing foreach and for\n";
my $a = -1;
print "$a\n";
foreach $a (0..10) { print "$a\t"; }
print "$a\n";
for $a (0..10) { print "$a\t"; }	#Note: The 'for' here is short for 'foreach'.
print "$a\n";
foreach my $a (0..10) { print "$a\t"; }
print "$a\n";
for ($a = 0; $a <= 10; $a++) { print "$a\t"; }
print "$a\n";

1;
