use strict;

my @a = (4, 5, 6);
print "(", join(", ", @a), ")\n";

push @a, 7..10;
print "(", join(", ", @a), ")\n";

unshift @a, 1..3;
print "(", join(", ", @a), ")\n";

my $a = shift @a;
print "(", join(", ", @a), ")\t\$a = $a\n";

my $b = pop @a;
print "(", join(", ", @a), ")\t\$b = $b\n";

my @b = qw(RP1 RP2 RP3);
my @c = splice(@a, 3, 4, @b);
print "\n", '>>>@c = splice(@a, 3, 4, @b);', "\n";
print "\@a is (", join(", ", @a), ")\n";
print "\@b is (", join(", ", @b), ")\n";
print "\@c is (", join(", ", @c), ")\n";
1;
