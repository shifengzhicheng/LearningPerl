#!/usr/bin/perl -w
use strict;

package Simple;
use Exporter;
use vars qw(@ISA @EXPORT);
@ISA=qw(Exporter);
@EXPORT=qw(True);
sub True {
  print "I'm Simple::True.\n";
}
1;
