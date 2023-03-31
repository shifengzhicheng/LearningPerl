#!/usr/bin/perl -w
use strict;

sub addA {
	my($listA, $listB) = @_;
	my @listA = @$listA;
	my @listB = @$listB;
	my ($A, $B, @result) = ();
	while (defined ($A = shift @listA)) {
		push @result, $A + shift @listB;
	}
	@result;
}

sub addB (\@\@) {
	my($listA, $listB) = @_;
	my @listA = @$listA;
	my @listB = @$listB;
	my ($A, $B, @result) = ();
	while (defined ($A = shift @listA)) {
		push @result, $A + shift @listB;
	}
	@result;
}

sub addC {
	my($listA, $listB) = @_;
	my ($A, $B, @result) = ();
	while (defined ($A = shift @$listA)) {
		push @result, $A + shift @$listB;
	}
	@result;
}

my @A = map int rand 10, 1..10;
my @B = map int rand 10, 1..10;
my @C = addA(\@A, \@B);
my @D = addB(@A, @B);
print "\@A : (", join(", ", @A), ")\n";
print "\@B : (", join(", ", @B), ")\n";
print "\@C : (", join(", ", @C), ")\n";
print "\@D : (", join(", ", @D), ")\n";
print "-----------------------------------\n";
my @E = addC(\@A, \@B);
print "\@A : (", join(", ", @A), ")\n";
print "\@B : (", join(", ", @B), ")\n";
print "\@E : (", join(", ", @E), ")\n";


1;
