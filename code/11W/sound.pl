#!/usr/bin/perl -w
use strict;
use Win32;
use Win32::Sound;

Win32::Sound::Volume('100%');
Win32::Sound::Play("CLEAR.WAV", SND_ASYNC);
my($hz, $bits, $channels) 
	= Win32::Sound::Format("CLEAR.WAV");
Win32::Sleep(500);
print "Clear.wav : ${hz}Hz, ${bits}B, ${channels}C\n";
sleep(1);
Win32::Sound::Stop();

1;
