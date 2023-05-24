#!/usr/bin/perl -w
use strict;
use Win32;
use Win32::Pipe;

my $pipe = new Win32::Pipe("\\\\.\\pipe\\My Perl Pipe");
die "Fail to create pipe\n" if not $pipe;
my $msg = "I'm " . Win32::LoginName . " on " . Win32::NodeName . "\n" .
	"I'm running script $0.";
print "Send to Server:\n$msg\n";
die "Fail to send message\n" if not $pipe->Write($msg);
print "Read from Server:\n";
print $pipe->Read();
$pipe->Disconnect;
$pipe->Close;

1;
