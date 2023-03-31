use strict;

print "10:\t" , pi(10), "\n";
print "100:\t" , pi(100), "\n";
print "1000:\t" , pi(1000), "\n";
print "10000:\t" , pi(10000), "\n";
print "100000:\t" , pi(100000), "\n";
print "1000000:\t" , pi(1000000), "\n";

sub pi {
	my($count) = $_[0];
	my($inside);
	
	$inside +=  sqr(rand 1) + sqr(rand 1) < 1
		while $count-- > 0;
	4 / $_[0] * $inside;
}

sub sqr {
	my($n) = shift;
	return $n * $n;
}

1;
