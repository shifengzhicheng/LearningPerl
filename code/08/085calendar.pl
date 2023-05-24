use HTML::Calendar::Simple;

my $cal = HTML::Calendar::Simple->new;
my $month = $cal->calendar_month;
my $year = HTML::Calendar::Simple->calendar_year;

open M, ">085month.htm";
print M $month;
close M;

open Y, ">085year.htm";
print Y $year;
close Y;

1;
