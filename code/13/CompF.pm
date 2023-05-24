package CompF;
use strict;

# Let's use AUTOLOAD to do all the get/set

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

our $AUTOLOAD;

sub AUTOLOAD {
	my $this = shift;
	my $name = $AUTOLOAD;
	$name =~ s!.*:!!;
	return undef unless exists $this->{$name};
	$this->{$name} = shift @_ if @_;
	print "AUTOLOAD $name method successful!\n";
	$this->{$name};
}

sub DESTROY {
	my($this) = shift;
	my($id) = $this->{id};
	my($count) = --${$this->{_COUNT}};
	print "Let's destroy #$id :\t$this. We's $count number of " . ref($this) . " left.\n";
	1;
}

1;
