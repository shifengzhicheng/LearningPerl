use strict;

my $s = "a1a\nb2b\nc3c";
my $m;

print "Match s/\$/:/ with modifier\n";

$m = $s;
$m =~ s/$/:/g;
$m =~ s/\n/\\n/g;
print "g\t---$m---\n";

$m = $s;
$m =~ s/$/:/sg;
$m =~ s/\n/\\n/g;
print "sg\t---$m---\n";

$m = $s;
$m =~ s/$/:/mg;
$m =~ s/\n/\\n/g;
print "mg\t---$m---\n";

$m = $s;
$m =~ s/$/:/msg;
$m =~ s/\n/\\n/g;
print "msg\t---$m---\n";

print "\nMatch s/^/:/ with modifier\n";

$m = $s;
$m =~ s/^/:/g;
$m =~ s/\n/\\n/g;
print "g\t---$m---\n";

$m = $s;
$m =~ s/^/:/sg;
$m =~ s/\n/\\n/g;
print "sg\t---$m---\n";

$m = $s;
$m =~ s/^/:/mg;
$m =~ s/\n/\\n/g;
print "mg\t---$m---\n";

$m = $s;
$m =~ s/^/:/msg;
$m =~ s/\n/\\n/g;
print "msg\t---$m---\n";

print "\nMatch s/./:/ with modifier\n";

$m = $s;
$m =~ s/./:/g;
$m =~ s/\n/\\n/g;
print "g\t---$m---\n";

$m = $s;
$m =~ s/./:/sg;
$m =~ s/\n/\\n/g;
print "sg\t---$m---\n";

$m = $s;
$m =~ s/./:/mg;
$m =~ s/\n/\\n/g;
print "mg\t---$m---\n";

$m = $s;
$m =~ s/./:/msg;
$m =~ s/\n/\\n/g;
print "msg\t---$m---\n";

1;
