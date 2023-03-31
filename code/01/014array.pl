use strict;

my @a = (1, 2, 3, "oops", 5, 6);
my @b = (5, 1..6, 7);
my @c = qw(aaa bbb ccc);
my @d = (5.1 .. 16.6);
my @e = ();
print << 'HERE';
Assignments:
	@a = (1, 2, 3, "oops", 5, 6);
	@b = (5, 1..6, 7);
	@c = qw(aaa bbb ccc);
	@d = (5.1 .. 16.6);
	@e = ();
HERE
print "Values:\n";
print "\t\@a = (", join(", ", @a), ")\n";
print "\t\@b = (", join(", ", @b), ")\n";
print "\t\@c = (", join(", ", @c), ")\n";
print "\t\@d = (", join(", ", @d), ")\n";
print "\t\@e = (", join(", ", @e), ")\n";

print "\nAccess array elements\n";
print "\$#a is $#a\n";
print "\$a[0] is $a[0], \$a[1] is $a[1], \$a[2] is $a[2]\n";
print "\$a[-1] is $a[-1], \$a[-2] is $a[-2], \$a[-3] is $a[-3]\n";
print "add new value 'EE' to \$a[10]. ";
$a[10] = 'EE';
print "Now \@a becomes :\n";
print "\t(", join(", ", map defined $_ ? "'$_'" : "undef", @a), ")\n";

1;
