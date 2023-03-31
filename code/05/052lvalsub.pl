
use strict;
sub Lsub : lvalue {
	my($index)=shift;
	$_[$index];
}
my @a = qw(I my teaching perl.);
$" = " ";
print "@a\n";
Lsub(2, @a) = 'learning';
print "@a\n";
1;
