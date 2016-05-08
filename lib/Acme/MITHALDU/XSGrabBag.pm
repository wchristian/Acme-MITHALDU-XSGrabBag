package Acme::MITHALDU::XSGrabBag;
use strictures;
use Exporter 'import';
use Acme::MITHALDU::XSGrabBag::Inline ();
use Inline::C                         ();

# VERSION

# ABSTRACT: a bunch of XS math functions i'm not sure where to shove yet

# COPYRIGHT

our @EXPORT_OK = qw(
  mix
  deg2rad
  rad2deg
  dot2_product
);

Acme::MITHALDU::XSGrabBag::Inline->import(
    C => join "\n",
    _mix(),
    _deg2rad(),
    _rad2deg(),
    _dot2_product(),
);

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

sub _mix {
    <<'...';
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
}

=head2 my $deg = deg2rad( $rad )

32 bit degree to radian conversion, dirty, but fast.

=cut

sub _deg2rad {
    <<'...';
float deg2rad(float degrees) {
    return 0.0174532925 * degrees;
}
...
}

=head2 my $rad = rad2deg( $deg )

32 bit radian to degree conversion, dirty, but fast.

=cut

sub _rad2deg {
    <<'...';
float rad2deg(float radians) {
    return 57.2957795786 * radians;
}
...
}

=head2 my $dot = dot2_product( $xa, $ya, $xb, $yb )

Simple dot product calculation for 2d vectors.

=cut

sub _dot2_product {
    <<'...';
int dot2_product( int xa, int ya, int xb, int yb ) {
    int sum = 0;
    sum += xa * xb;
    sum += ya * yb;
    return sum;
}
...
}

1;
