use strict;

print "Testing map() and join() :\n";
my @a = (1 .. 15);
my @b = map $_ * $_, @a;
my @c = map int(10000 / $_) / 10000, @a;
my @d = map int rand(100), @a;

print "\@a is (", join(", ", @a), ")\n";
print "\@b is (", join(", ", @b), ")\n";
print "\@c is (", join(", ", @c), ")\n";
print "\@d is (", join(", ", @d), ")\n";

print "Testing split() and grep :\n";
my $string = "Albert Cool:Yale University:Feb 5, 1940:Professor";
my @e = split(/:/, $string);
print "\@e is (", join(", ", map "'$_'", @e), ")\n";
my @f = grep(/o/, @e);
print "\@f is (", join(", ", map "'$_'", @f), ")\n";
my @g = grep(/[0-9]/, @e);
print "\@g is (", join(", ", map "'$_'", @g), ")\n";

1
