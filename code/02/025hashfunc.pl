use strict;

my %oct2bin = (
	0 => "000", 1 => "001", 2 => "010", 3 => "011",
	4 => "100", 5 => "101", 6 => "110", 7 => "111"
	);
print "%oct2bin is (";
my($k, $v);
print " $k=>$v " while ($k, $v) = each %oct2bin;
print ")\n";

print "undef \$oct2bin{0} can't delete \$oct2bin{0} :\n";
undef $oct2bin{0};
print "==> (";
print " $k=>", defined $v ? "$v " : "undef " while ($k, $v) = each %oct2bin;
print ")\n";

print "delete \$oct2bin{0} can delete \$oct2bin{0} :\n";
delete $oct2bin{0};
print "==> (";
print " $k=>", defined $v ? "$v " : "undef " while ($k, $v) = each %oct2bin;
print ")\n";

1
