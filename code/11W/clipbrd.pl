#!/usr/bin/perl -w
use strict;
use Win32::Clipboard;

my $clip = Win32::Clipboard();

while (1) {
	if ($clip->WaitForChange(10000)) {
		print "Clipboard changed. Format is ";
		if ($clip->IsText()) {
			print "text. '", $clip->GetText(), "'\n";
		} elsif ($clip->IsFiles()) {
			print "files.\n", join("\n", $clip->GetFiles()), "\n";
		} elsif ($clip->IsBitmap()) {
			print "bitmap.\n";
			open B, ">b.bmp";
			binmode B;
			print B $clip->GetBitmap;
			close B;
		} else {
			print "not supported : ", join(", ", $clip->EnumFormats), "\n";
		}
	} else {
		print "Clipboard not changed, go on waiting...\n"
	}
}

1;
