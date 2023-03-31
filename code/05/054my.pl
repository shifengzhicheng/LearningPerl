use strict;

my $x = 1;

sub a {
	my $x = 6;
	$x--;
	$x + b() + c();
}

sub b {
	$x--;
	return $x * $x;
}

sub c {
	my $x = 7;
	$x --;
	return $x * $x;
}

print $x, "\t", a();
1;
