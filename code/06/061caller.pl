##!/usr/bin/perl -w
#use strict;

print "I'm in main code, caller returns: ", join(", ", caller()), "\n\n\n";
print "Call a()\n";
a();
print "Call b()->a()\n";
b();
print "Call c()->b()->a()\n";
c();

sub a {
	print "caller( ) returns: ", join(", ", caller()), "\n";
	print "caller(1) returns: ", join(", ", caller(1)), "\n";
	print "caller(2) returns: ", join(", ", caller(2)), "\n";
	print "caller(3) returns: ", join(", ", caller(3)), "\n";
	print "\n\n\n";
}

sub b {
	a();
}

sub c {
	b();
}

1;
