use strict;
use warnings;
use Test::More;
use Test::Number::Delta within => 1e-14;
BEGIN {
   use_ok('Math::Random::MT::Perl', qw(srand rand));
}


# Functional interface
# Test the ability to automatically generate a seed, return it, and reproduce
# the same series of random number by specifying this seed manually.

my ($autoseed,
    $num1, $num2, $num3, $num4, $num5, $num6,
    $int1, $int2, $int3, $int4, $int5, $int6);

# Generate a series of 6 random numbers using an autogenerated seed
ok $autoseed = srand();
ok $num1 = rand();
ok $num2 = rand();
ok $num3 = rand();
ok $int1 = rand();
ok $int2 = rand();
ok $int3 = rand();

# Generate a series of 6 random numbers the same seed value but manually specified
ok srand($autoseed);
ok $num4 = rand();
ok $num5 = rand();
ok $num6 = rand();
ok $int4 = rand();
ok $int5 = rand();
ok $int6 = rand();

# Both series of number should be the same
delta_ok $num1, $num4;
delta_ok $num2, $num5;
delta_ok $num3, $num6;
delta_ok $int1, $int4;
delta_ok $int2, $int5;
delta_ok $int3, $int6;

done_testing();
