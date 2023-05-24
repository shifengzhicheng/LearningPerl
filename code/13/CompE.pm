package CompE;
use strict;

# Add get, set methods.
# Class data '$id' and '$count' as my variable.

my $id = 0;
my $count = 0;

sub new {
	my $proto = shift;
	my $type = ref $proto || $proto;
	my($x, $y) = @_;
	$x = 0 if not $x;
	$y = 0 if not $y;
	$id++;
	my($this) = {x=>$x, y=>$y, id=>$id, _COUNT=>\$count};
	${$this->{_COUNT}}++;
	bless $this, $type;
	print "Got a new #$id :\t($x, $y) :\t$this.\n";
	$this;
}

sub x {
	my $this = shift;
	$this->{x} = shift if (@_);
	$this->{x};
}

sub y {
	my $this = shift;
	$this->{y} = shift if (@_);
	$this->{y};
}

sub id {
	my $this = shift;
	$this->{id} = shift if (@_ and $_[0] > $id);
	$this->{id};
}

sub DESTROY {
	my($this) = shift;
	my($id) = $this->{id};
	my($count) = --${$this->{_COUNT}};
	print "Let's destroy #$id :\t$this. We's $count number of " . ref($this) . " left.\n";
	1;
}

1;
