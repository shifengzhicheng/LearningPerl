#!/usr/bin/perl -w
use strict;
use Net::SMTP;
use constant HOST => 'your mail server';
use constant USER => 'your account';
use constant SENDER => 'your email account';
use constant RECIPIENT => 'receiver`s account';

my $smtp = Net::SMTP->new(HOST);
#-----SMTP��Ҫ�����֤?-----
print "Authenticate Password for " . USER . ":";
my $password = <STDIN>;
chomp $password;
$smtp->auth(USER, $password);
#-----��ʼ����----
$smtp->mail(SENDER);
$smtp->recipient(RECIPIENT); # ($addr1, $addr2, $addr3...)
$smtp->data(<<"HERE");
hello
HERE
$smtp->quit;
