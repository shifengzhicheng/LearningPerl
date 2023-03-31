# we don't use 'perl -w' and 'strict' in this sample

# use strict;
# use vars qw($x $y);

a();
our $x=7; our $y=17;
a();
sub a {
	my $x = 10; local $y = 5;
	print "ax$x, ay$y\n";
	b();
}
sub b {
	print "bx$x, by$y\n";
}

1;
