package CompH;
use strict;
use Vector;
our @ISA = qw(Vector);

sub abs {
	my $this = shift;
	return $this->x * $this->x + $this->y * $this->y;
}

1;
