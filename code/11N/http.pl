use Net::HTTP;
my ($path, $http, $code, $mess, %h, $buf, $n);
$http = Net::HTTP->new(Host => "animal.vine.homedns.org", KeepAlive => 1)
	or die $@;
foreach $path ("/", "/041/04131A.jpg", "/bad") {
	$http->write_request(GET => $path, 'User-Agent' => "Mozilla/5.0");
	($code, $mess, %h) = $http->read_response_headers;
	print STDERR "$path\ncode : $code, mess : $mess, hash pairs :\n";
	print STDERR "$k = $v\n" while ($k, $v) = each %h ;
	print "------\n";
	next if $code ne "200";
	binmode STDOUT;
	while (1) {
		$buf;
		$n = $http->read_entity_body($buf, 1024);
		die "read failed: $!" unless defined $n;
		last unless $n;
		print $buf;
	}
	print "\n======\n\n";
}
