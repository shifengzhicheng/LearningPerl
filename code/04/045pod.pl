use strict;

print << "Here";
# This is a dummy perl script to demo the pod feature.
# type the following commands:
# pod2text 045pod.pl
# pod2html 045pod.pl (and view result view html brower)
Here

__END__

=head1 This is a sample head1 line.

Descriptions

=head2 This is a head2 line.

I<Italicize>, B<bold>, C<code E<lt>=E<gt>>

=over 4

=item *

First item

=item *

Second item

=over 8

=item 1

First item

=item 2

Second item

=back

=back

=over 4

=item Foo()

Description of Foo function

=item Bar()

Description of Bar function

=back

=cut
