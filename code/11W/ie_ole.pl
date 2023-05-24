use Win32::OLE;
$ie = Win32::OLE->new('InternetExplorer.Application.1', 'Quit') ||
  die "CreateObject: " . Win32::OLE->LastError;
$ie->{Visible} = 1;
$ie->Navigate("http://www.google.com/");
while ($ie->{Busy}) {
	print "Busy\t";
	sleep(1);
}
print "Done.\n";
sleep(2);
