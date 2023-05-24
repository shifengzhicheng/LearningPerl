package Vector;
use strict;

# Base class vector

sub new {
	my $proto = shift;
	my $type = ref $proto || $proto;
	my($x, $y) = @_;
	$x = 0 if not $x;
	$y = 0 if not $y;
	my($this) = {x=>$x, y=>$y};
	bless $this, $type;
	print "Got a new $type in " . __PACKAGE__ . " :\t($x, $y) :\t$this.\n";
	$this;
}

sub plus {
	my $this = shift;
	my $z = shift;
	$this->{x} += $z->{x};
	$this->{y} += $z->{y};
	$this;
}

sub minus {
	my $this = shift;
	my $z = shift;
	$this->{x} -= $z->{x};
	$this->{y} -= $z->{y};
	$this;
}

sub neg {
	my $this = shift;
	$this->{x} = -$this->{x};
	$this->{y} = -$this->{y};
	$this;
}

sub compare {	# which one far from zero dot
	my $this = shift;
	my $z = shift;
	$this->abs <=> $z->abs;
}

sub abs {
	warn "Abstract method\n"; 0;
}

sub string {
	my $this = shift;
	'('. $this->x . ', ' . $this->y . ')';
}

for my $field qw(x y) {
	no strict "refs";
	*$field = sub {
		my $this = shift;
		$this->{$field} = shift if @_;
		return $this->{$field};
	}	
}

1;
