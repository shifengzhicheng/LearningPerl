use strict;

dir_r("c:/TEMP/*");

sub dir_r {
	my $path = shift;
	print "\nList $path:\n";
	my @dir = glob_path($path);
	foreach (@dir) {
		dir_r("$_/*");
	}
}

sub glob_path {
	my $path = shift;
	my @list = glob($path);
	my @dir = ();
	foreach (@list) {
		print "$_\n" if -f $_;
		push @dir, $_ if -d $_;
	}
	return @dir;
}

1;
