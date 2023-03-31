use strict;

demo(
	"123 + 456",
	"123 - 456",
	"123 * 456",
	"123 / 456",
	"12345 / 0",
	"1234 ** 5",
	"123 ** 456",
	"1234 % 56",
	"123 && 456",
	"123 || 456",
	"123 & 456",
	"123 | 456",
	"123 ^ 456",
	"123 . 456",
	"12345 x 6",
	"1 ? 2 : 3",
	"0 ? 2 : 3",
	"1 <=> 2",
	"2 <=> 1",
	"2 <=> 2"
     );

sub demo {
	my($exp, $result, $error);
	foreach $exp (@_) {
		print "Doing $exp : ";
		$result = eval "$exp";
		if ($@) {
			print "Error, $@";
		} else {
			print "Result is $result\n"
		}
	}
}

1;
