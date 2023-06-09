#!/usr/bin/perl -w
use strict;
use Net::SMTP;
use constant HOST => 'your mail server';
use constant USER => 'your account';
use constant SENDER => 'your email account';
use constant RECIPIENT => 'receiver`s account';

my $smtp = Net::SMTP->new(HOST);
#-----SMTP需要身份认证?-----
print "Authenticate Password for " . USER . ":";
my $password = <STDIN>;
chomp $password;
$smtp->auth(USER, $password);
#-----开始发信----
$smtp->mail(SENDER);
$smtp->recipient(RECIPIENT); # ($addr1, $addr2, $addr3...)
$smtp->data();
$smtp->datasend(
	"From: 我\n",
	"To: 你\n",
	"Subject:你好Hello!\n",
	"This is mail body\n邮件\n"
);
$smtp->dataend;
$smtp->quit;
