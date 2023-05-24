package TieTee;

sub TIEHANDLE {
	my ($class, @handles) = @_;
	bless [@handles], $class;
}

sub PRINT {
	my (@handles) = @{shift @_};
	print $_ @_ foreach @handles;
}

1;
