use strict;

print "10:\t" , pi(10), "\n";
print "100:\t" , pi(100), "\n";
print "1000:\t" , pi(1000), "\n";
print "10000:\t" , pi(10000), "\n";
print "100000:\t" , pi(100000), "\n";
print "1000000:\t" , pi(1000000), "\n";

sub pi {
	my($count) = shift;
	my(@distance) = map sqr(rand(1)) + sqr(rand(1)) < 1, 1..$count;
	4 / $count * scalar grep /1/, @distance;
}

sub sqr {
	my($n) = shift;
	return $n * $n;
}

1;
