package CompC;
use strict;

#represent object in code-ref

use vars qw($id);

$id = 0;

sub new {
	my $proto = shift;
	my $type = ref $proto || $proto;
	my($x, $y) = @_;
	$x = 0 if not $x;
	$y = 0 if not $y;
	$id++;
	my($data) = {x=>$x, y=>$y, id=>$id};
	my($this) = sub {
		my $field = shift;
		if (@_) { $data->{$field} = shift }
		return $data->{$field};
	};
	bless $this, $type;
	print "Got a new #$id :\t($x, $y) :\t$this.\n";
	$this;
}

sub DESTROY {
	my($this) = shift;
	my($id) = $this->('id');
	print "Let's destroy #$id :\t$this.\n";
	1;
}

1;
