#!/usr/bin/perl -w
use strict;

use Win32;
print "Win32::LoginName() is ", Win32::LoginName(), "\n";
print "Win32::NodeName() is ", Win32::NodeName(), "\n";
print "Win32::DomainName() is ", Win32::DomainName(), "\n";
print "Win32::GetCwd() is ", Win32::GetCwd(), "\n";
print "Win32::SetCwd('D:\\').\n"; Win32::SetCwd('D:\\');
print "Win32::GetCwd() is ", Win32::GetCwd(), " now.\n";
print "Win32::FsType() is (", join(", ", Win32::FsType()), ")\n";
print "Win32::GetNextAvailDrive() is ", Win32::GetNextAvailDrive(), "\n";
print "Win32::GetTickCount() is ", Win32::GetTickCount(), "(milliseconds)\n";

1;
