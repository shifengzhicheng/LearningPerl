use strict;

print "1) Array under list and scalar context:\n\n";

my @junk = (1, "I", undef, 66..69, "foo");
print << 'HERE';
>>>my @junk = (1, "I", undef, 66..69, "foo");
>>>print @junk, "\n";
HERE
print @junk, "\n"; # an undef warning here, just ignore.
print "=========\n";

print << 'HERE';
>>>print @junk . "\n";
HERE
print @junk . "\n";
print "=========\n";

my $size = @junk;
print "\$size = \@junk; \$size is $size\n";
$size = scalar @junk;
print "\$size = scalar \@junk; \$size is $size\n\n";

print "2) Function 'reverse()' under list and scalar context:\n\n";
@junk = (1, "I", 66..69, "foo");
my @knuj = reverse @junk;
print << 'HERE';
>>>@junk = (1, "I", 66..69, "foo");
>>>@knuj = reverse @junk;
HERE
print "(", join(", ", @knuj), ")\n";

my $junk = "ABCDEFG";
my $knuj = reverse $junk;
print << 'HERE';
>>>$junk = "ABCDEFG";
>>>$knuj = reverse $junk;
HERE
print $knuj;

1;
