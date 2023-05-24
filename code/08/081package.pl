$a = 4; my $b = 'X';
print "In main: $a, $::a, $main::a\n";

package A;
$a = 6;	print "package A, $a, $b\n";

package A::B;
$a = 7; 	print "package A::B, $a, $b\n";

package B;
$a = 8; 	print "package B, $a, $b\n";
$C::a=9;

print "$::a, $A::a, $A::B::a, $B::a, $C::a\n";
print join(", ", keys %main::), "\n";
print join(", ", keys %A::), "\n";
print join(", ", keys %A::B::), "\n";
print join(", ", keys %B::), "\n";
print join(", ", keys %C::), "\n";
