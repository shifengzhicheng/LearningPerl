use strict;

my $a = 'This is a 103.52 dollar cheque.';
$a =~ /([0-9]+)\.([0-9]+)/;
my ($int, $frag) = ($1, $2);
print "\$a is '$a', \$int is '$int', \$frag is '$frag'.\n";
$a =~ s!([0-9]+)\.([0-9]+)!$2.$1!;
print "Swap int and frag part by s///, \$a is '$a'.\n";

1;
