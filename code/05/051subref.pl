use strict;
my $subref = sub {$_[0] + $_[1]};
my $add = $subref;
print &$add(1,2), "\t", &{$add}(1,2), "\t", $add->(1,2);
1;
