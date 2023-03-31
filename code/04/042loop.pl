use strict;

my ($i, $j) = (1, 0);
while ($i <= 100) {
	$j += $i;
	$i++;
	print "$j\t";
}
print "\n";

($i, $j) = (1, 0);
while (1) {
	$j += $i;
	$i++;
	print "$j\t";
	last if $i > 100;
}
print "\n";

1
