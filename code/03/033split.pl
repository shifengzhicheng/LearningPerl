use strict;

my $a = "Hello World!";
my $b = "This is Perl.";
my $c = "Powerful Perl.";

print join('  ', split //, $_), "\n" foreach ($a, $b, $c);
print "\n";
print join('  ', $_ =~ /./g), "\n" foreach ($a, $b, $c);
print "\n";

print join('  ', $_ =~ /..|./g), "\n" foreach ($a, $b, $c);
print "\n";
print join('  ', $_ =~ /.{1,2}/g), "\n" foreach ($a, $b, $c);
print "\n";

print join('  ', $_ =~ /(.{1,3})(.{0,2})/g), "\n" foreach ($a, $b, $c);
print "\n";

1;
