use strict;

my @list = (-3 .. 3);
my $item;
print 'loop on "while ($itme = shift @list)"', "\n";
while ($item = shift @list) {
	print "$item\t";
}

print "\n", 'loop on "while (defined($item = shift @list))"', "\n";
@list = (-3 .. 3);
while (defined($item = shift @list)) {
	print "$item\t";
}

print "\n";

1;
