package CompD;
use strict;

#represent object in scalar-ref

use vars qw($id);

$id = 0;

sub new {
	my $proto = shift;
	my $type = ref $proto || $proto;
	my($x, $y) = @_;
	$x = 0 if not $x;
	$y = 0 if not $y;
	$id++;
	my($this) = \"$x:$y:$id";
	bless $this, $type;
	print "Got a new #$id :\t($x, $y) :\t$this.\n";
	$this;
}

sub DESTROY {
	my($this) = shift;
	my($x, $y, $id) = split ":", $$this;
	print "Let's destroy #$id :\t$this.\n";
	1;
}

1;
