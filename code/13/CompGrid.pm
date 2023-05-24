package CompGrid;
use strict;
use Vector;
our @ISA = qw(Vector);

sub new {
	my $proto = shift;
	my $class = ref $proto || $proto;
	my $this = $class->SUPER::new(@_);
	$this->x(int $this->x);
	$this->y(int $this->y);
	bless ($this, $class);	# reconsecrate
}

sub abs {
	my $this = shift;
	return abs $this->x + abs $this->y;
}

1;
