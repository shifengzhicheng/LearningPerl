use strict;

my $string = "Catch cat catchup";
my @goal = qw(cat dog mouse ant);
$"='|';
print "'$string' =~ /@goal/;\t\t";
print $string =~ /@goal/ ? "Found" : "Not found";

1;
