package Acme::MITHALDU::XSGrabBag;
use strictures;
use Exporter 'import';
use Acme::MITHALDU::XSGrabBag::Inline ();

# VERSION

# ABSTRACT: a bunch of XS math functions i'm not sure where to shove yet

# COPYRIGHT

our @EXPORT_OK = qw( mix deg2rad );

sub _func { Acme::MITHALDU::XSGrabBag::Inline->import( C => @_ ) }

=head1 DESCRIPTION

This module is an experimental space for me to work with XS functions meant for
L<Microidium|https://github.com/wchristian/Microidium>.

=head1 FUNCTIONS

=head2 my $hash = mix( $a, $b, $c )

Takes 3 x 32 bits of data as integers, mixes them, combining all 96 bits of
input to generate a pseudo-random hash returned as a 32 bit integer.

Original implementation by
L<Bob Jenkins|http://web.archive.org/web/20071224045401/http://www.burtleburtle.net/bob/c/lookup2.c>.

=cut

_func <<'...';
int mix(int a, int b, int c) {
    a -= b; a -= c; a ^= (c>>13);
    b -= c; b -= a; b ^= (a<<8);
    c -= a; c -= b; c ^= (b>>13);
    a -= b; a -= c; a ^= (c>>12);
    b -= c; b -= a; b ^= (a<<16);
    c -= a; c -= b; c ^= (b>>5);
    a -= b; a -= c; a ^= (c>>3);
    b -= c; b -= a; b ^= (a<<10);
    c -= a; c -= b; c ^= (b>>15);
    return c;
}
...


=head2 my $deg = deg2rad( $rad )

32 bit degree to radian conversion, dirty, but fast.

=cut

_func <<'...';
float deg2rad(float degrees) {
    return 0.0174532925 * degrees;
}
...

1;
