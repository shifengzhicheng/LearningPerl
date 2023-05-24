package TieRand;

sub TIESCALAR {
	my ($class, $a, $b) = @_;
	($a, $b) = (-1, 1)
		unless	defined $a and
			defined $b and
			$a < $b;
	bless [$b - $a, $a], $class;
}

sub FETCH {
	my ($width, $offset) = @{$_[0]};
	return $offset + rand $width;
}

sub STORE {
	my ($obj, $seed) = @_;
	srand $seed;
}

1;
