use strict;

my($line, $sum) = ();

open FD, 'perl 071count.pl |';
$sum += $line while $line = <FD>;
close FD;
print $sum;
1;
