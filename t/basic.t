package basic_test;
use strictures;
use Test::InDistDir;
use Test::More;

use Acme::Math::XS qw' mix deg2rad ';

run();
done_testing;
exit;

sub run {

    is mix( 1, 2, 1 ), -2046868284;
    is mix( 1, 2, 1 ), -2046868284;
    is mix( 1, 2, 1 ), -2046868284;
    is mix( 2, 2, 1 ), -1026454904;
    is mix( 3, 2, 1 ), -128124089;
    is mix( 2, 2, 1 ), -1026454904;
    is mix( 2, 2, 2 ), -1942914929;
    is mix( 2, 2, 3 ), -642921038;
    is mix( 2, 2, 4 ), -1206558357;
    is mix( 3, 2, 1 ), -128124089;
    is mix( 3, 2, 2 ), -1164826007;
    is mix( 3, 2, 3 ), -1833207769;
    is mix( 3, 2, 4 ), -766896240;

    is deg2rad( 0 ),   0;
    is deg2rad( 1 ),   0.0174532923847437;
    is deg2rad( 180 ), 3.14159274101257;
    is deg2rad( 360 ), 6.28318548202515;

    return;
}
