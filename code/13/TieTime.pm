package TieTime;
use strict;

sub TIESCALAR {
	my $class = shift;
	my $now = (shift || 0) + time;
	return bless \$now, $class
}

sub FETCH {
	my $this = shift;
	return time - $$this;
}

sub STORE {
	my $this = shift;
	my $now = time;
	$$this = (shift || 0) + $now;
	return $now - $$this;
}

1;
