use strict;

use Math::BigInt;

my($i, $j, $two);

$i = Math::BigInt->new('1234567890');
$j = new Math::BigInt '9876543210';
print $i*$j, "\n";
$two = new Math::BigInt '2';
print 2**500, "\n"; 
print $two ** 500;

1;
