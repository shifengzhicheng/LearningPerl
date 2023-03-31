use strict;
my(@list);

sub pi_proto () {3.1416}
sub pi_normal {3.1416}

sub mypush (\@@) {
	my $list = shift;
	push @$list, @_;
}

print "pi_proto + 2 is ", pi_proto + 2, "\n";
print "pi_normal + 2 is ", pi_normal + 2, "\n";
mypush @list, 1, 2, 3, 4;
print "\n";
print "list is (", (join ", ", @list), ")\n";
1;
