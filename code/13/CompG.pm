package CompG;
use strict;

# Still another way to do get/set

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

for my $field qw(x y id) {
	no strict "refs";
	*$field = sub {
		my $this = shift;
		$this->{$field} = shift if @_;
		return $this->{$field};
	}	
}

sub DESTROY {
	my($this) = shift;
	my($id) = $this->{id};
	my($count) = --${$this->{_COUNT}};
	print "Let's destroy #$id :\t$this. We's $count number of " . ref($this) . " left.\n";
	1;
}

1;
