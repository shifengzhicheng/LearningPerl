use strict;

pipe READHANDLE, WRITEHANDLE or die "Can't open pipe.";

my $message;
my $child_pid = fork();

die "Fail to fork!\n" if not defined $child_pid;

if ($child_pid == 0) {
	# in child
	print "I'm child. My pid is $$.\n";
	close READHANDLE;
	$message = "Hello father. " . int rand 100 . ".";
	print "Child send \"$message\" to father.\n";
	print WRITEHANDLE $message;
	close WRITEHANDLE;
} else {
	# in parent
	print "I'm father, pid is $$. Child pid is $child_pid.\n";
	close WRITEHANDLE;
	$message = join "", <READHANDLE>;
	print "Father received : $message\n";
#	waitpid $child_pid, 1;
}

1;
