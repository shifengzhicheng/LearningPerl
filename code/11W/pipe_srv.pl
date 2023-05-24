#!/usr/bin/perl -w
use strict;
use Win32;
use Win32::Pipe;

die "Must be NT to create a named pipe.\n" if not Win32::IsWinNT();
my $pipe = new Win32::Pipe("My Perl Pipe");
die "Fail to create pipe\n" if not $pipe;
die "Fail to connect pipe\n" if not $pipe->Connect;
my $msg = "I'm " . Win32::LoginName . " on " . Win32::NodeName . "\n" .
	"I'm running script $0.";
print "Send to Client:\n$msg\n";
die "Fail to send message\n" if not $pipe->Write($msg);
print "Read from Client:\n";
print $pipe->Read();
$pipe->Disconnect;
$pipe->Close;

1;
