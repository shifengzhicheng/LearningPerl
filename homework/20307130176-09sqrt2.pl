#!/usr/bin/perl -w
use strict;
# my $num_iterations = 10;
# my $lib = "GMP";
# print $lib;
my ($num_iterations,$lib)=@ARGV;
myrequire($lib);
my $p = Math::BigInt->new('1');
my $q = Math::BigInt->new('1');
for (my $i = 0; $i < $num_iterations; $i++) {       
    my $new_p = $p->bmul(2)->bmul($q);
    my $new_q = $q->bmuladd($q,$p->bmul($p));
    $p = $new_p;
    $q = $new_q;     
}
1;

sub myrequire{
    my $lib = shift;
    require Math::BigInt;
    Math::BigInt->import(lib => $lib);
    # 在这里使用 GMP 库进行计算
};