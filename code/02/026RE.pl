use strict;

my $string = "Catch cat catchup";
$string =~ m[cat];
print "\$string is $string\n";
print '$string =~ m[cat];';
print "\t\t'$`', '$&', '$''\n";

$string =~ m!ch!;
print '$string =~ m!ch!;';
print "\t\t'$`', '$&', '$''\n";
$string =~ s[cat][dog];
print '$string =~ s[cat][dog];';
print "\t\t\$string is '$string'\n";

$string =~ tr/cat/123/;
print '$string =~ tr/cat/123/;';
print "\t\t\$string is '$string'\n";


1;
