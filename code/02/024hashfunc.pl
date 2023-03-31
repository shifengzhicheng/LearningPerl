use strict;

my %hex2bin = (
	0 => "0000", 1 => "0001", 2 => "0010", 3 => "0011",
	4 => "0100", 5 => "0101", 6 => "0110", 7 => "0111",
	8 => "1000", 9 => "1001", A => "1010", B => "1011",
	C => "1100", D => "1101", E => "1110", F => "1111"
	);
print "key of \%hex2bin : (", join(", ", keys %hex2bin), ")\n\n";
print "values : (", join(", ", values %hex2bin), ")\n\n";
print "dump \%hex2bin using each() :\n";
my($k, $v);
print "($k => $v)\n" while ($k, $v) = each %hex2bin;
print "scalar \%hex2bin is ", scalar %hex2bin;

1;
