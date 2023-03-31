use strict;

my @s = (
	'RIN	1	2	10MEG',
	'EGAIN	3 0	1 2	100K',
	'RP1	3	4	1K',
	'CP1	4	0	1.5915UF',
	'ROUT	5	6	10',
	);
s/^(C(\S+\s+){3})([0-9\.]+)/$1.($3*2)/e foreach @s;
/^R/ and s/([0-9\.]+)(\S*)$/($1\/2).$2/e foreach @s;
print join "\n", @s;

1;
