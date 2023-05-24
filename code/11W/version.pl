#!/usr/bin/perl -w
use strict;

use Win32;

my ($service_pack, $major, $minor, $build, $platform_id) = Win32::GetOSVersion();
my ($perlbuild) = Win32::BuildNumber();
my ($is95, $isnt) = (Win32::IsWin95(), Win32::IsWinNT());

print << "Here";
Win32::GetOSVersion() returns:
	service_pack	$service_pack
	major.minor	$major.$minor
	build		$build
	platform_id	$platform_id (0 win32, 1 win9x, 2 winNT)
	
Win32::BuildNumber() returns:
	$perlbuild

Win32::IsWin95() returns $is95
Win32::IsWinNT() returns $isnt
Here

1;
