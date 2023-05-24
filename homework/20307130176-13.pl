#!/usr/bin/perl -w
binmode( STDOUT, ":utf8" );
use strict;
use utf8;
use CGI qw/:standard/;
my @characters = qw/食 野 之 蒿 我 有 嘉 宾 德 音 孔 昭 视 民 不 恌/;
my @coding     = map { sprintf( "%04b", $_ ) } 0 .. 15;
my @line       = map { [] } 0 .. 3;
my %mapping    = map { $coding[$_] => $characters[$_] } 0 .. $#coding;
my $CharacterCode;
my @choice = map { 'choice' . "$_" } 0 .. 3;
my @choiceValues;

# 将16字分成四行
foreach (@coding) {
    foreach my $i ( 0 .. 3 ) {
        if ( substr( $_, $i, 1 ) == '1' ) {
            push @{ $line[$i] }, $mapping{$_};
        }
    }
}

# 绑定choiceValue的值
foreach my $index ( 0 .. 3 ) {
    push @choiceValues, param( $choice[$index] );
}

print header( -charset => 'utf8' )
  . start_html( -title => "猜字游戏" )
  . start_form( 'GET', '/cgi-bin/20307130176-13.pl' )
  . h2('请在以下汉字中选择一个记住')
  . h3(@characters)
  . h3("你猜的字在以下的汉字中吗？");

# 显示问题以及对应的选项
foreach my $i ( 0 .. 3 ) {
    print p("请选择以下字中是否有你猜测的字?")
      . p( join( " ", @{ $line[$i] } ) )
      . radio_group(
        -name    => $choice[$i],
        -values  => [ 'yes', 'no' ],
        -default => 'no'
      );
}

print p() . submit( -name => 'submit', -value => "我想好了" );

# 判断选项结果对应的字
foreach my $index ( 0 .. 3 ) {
    $CharacterCode .= ( $choiceValues[$index] eq 'yes' ) ? '1' : '0';
}

print h3("你猜的字是：") . p("$mapping{$CharacterCode}") . end_form() . end_html;
1;
