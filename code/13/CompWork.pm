package CompWork;
use strict;
use Vector;
our @ISA = qw(Vector);

use overload
	'+=' => 'plus',
	'""' => 'string';
sub abs {
	my $this = shift;
	return abs $this->x + abs $this->y;
}

1;
