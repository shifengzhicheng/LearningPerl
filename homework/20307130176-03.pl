#!/usr/bin/perl

#统计学号邮箱里邮件的发件方有效email地址，按邮件多少
#排序，邮件数量相同的，按email地址逆排序，学号-03.pl

use strict;
use Mail::POP3Client;
use YAML qw(LoadFile);

my ( $user, $pass ) = LoadFile 'secret.txt';
my $pop = new Mail::POP3Client(
    HOST      => 'mail.fudan.edu.cn',
    USER      => $user,
    PASSWORD  => $pass,
    USESSL    => 1,
    AUTH_MODE => 'PASS',
);

my %senders;

my $cnt = $pop->Count();

print "Found $cnt emails.\n";

# 打-1是用户密码错

for ( my $i = 1 ; $i <= $cnt ; $i++ ) {

    # $i 为当前循环到的邮件编号，从1开始，一直到 $cnt 结束
    my $from;
    foreach ( $pop->Head($i) ) {
        chomp;
        if (/^From:\s+(.*)/i) {
            $from = $1;
        }

  # 返回第 $i 封邮件的头部信息，该信息是一个字符串数组
  # ^From: 匹配字符串开头的 From:，表示该行文本必须以 From: 开头。
  # \s+ 匹配至少一个空白字符，这里用于匹配 From: 与邮件地址之间的空格。
  # (.*) 使用括号捕获了一个分组，表示匹配任意多个字符，
  # 这里的字符是除开头的单词（From:）和开头的空格之外的所有字符，该分组使用 * 表示匹配零个或多个字符，即匹配整个邮件地址及其后面可能包含的其他信息。
  # /i 表示正则表达式的模式修饰符，这里使用 i 修饰符表示匹配时忽略大小写。
  # and $from = $1; 如果正则表达式匹配成功，
  # 则将捕获到的文本存储在 $1 变量中，然后将其赋值给变量 $from。
    }
    if ( $from =~ /<(.*)>/ ) {

        # 从\<匹配<，([^>]+) 使用括号捕获了一个分组，
        # 表示匹配任意多个非 > 字符，也就是尖括号内的文本内容,
        # 使用 + 表示至少匹配一个字符
        # \> 匹配 > 字符
        # 使用正则表达式匹配 $from 中的邮件地址
        my $email = $1;

        # 并将地址存储在 $email 变量中。
        $senders{$email}++;
    }
    else {
        # $from = ~s/^ +//;
        $senders{$from}++;
    }
}
my @keys = sort { $senders{$b} <=> $senders{$a} || $b cmp $a } keys %senders;
my $sum;

foreach my $key (@keys) {
    my $t = $senders{$key};
    $sum += $t;
    printf( "%-40s %d\n", $key, $t );
}
print "There are $sum mails in your mailbox";
1;

