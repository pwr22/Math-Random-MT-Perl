use strict;
use warnings;
use Test::More;
use Test::Number::Delta within => 1e-14;
BEGIN {
   use_ok('Math::Random::MT::Perl');
}


# OO interface
# Test the ability to automatically generate a seed, return it, and reproduce
# the same series of random number by specifying this seed manually.

my ($gen, $autoseed,
    $num1, $num2, $num3, $num4, $num5, $num6,
    $int1, $int2, $int3, $int4, $int5, $int6);

# Generate a series of 6 random numbers using an autogenerated seed
ok $gen = Math::Random::MT::Perl->new();
ok $num1 = $gen->rand();
ok $num2 = $gen->rand();
ok $num3 = $gen->rand();
ok $int1 = $gen->irand();
ok $int2 = $gen->irand();
ok $int3 = $gen->irand();
ok $autoseed = $gen->get_seed();

# Generate a series of 6 random numbers the using same seed value but manually specified
ok $gen = Math::Random::MT::Perl->new($autoseed);
ok $num4 = $gen->rand();
ok $num5 = $gen->rand();
ok $num6 = $gen->rand();
ok $int4 = $gen->irand();
ok $int5 = $gen->irand();
ok $int6 = $gen->irand();

# Both series of number should be the same
delta_ok $num1, $num4;
delta_ok $num2, $num5;
delta_ok $num3, $num6;
delta_ok $int1, $int4;
delta_ok $int2, $int5;
delta_ok $int3, $int6;

# Generate a series of 6 random numbers the using same seed value but manually specified
ok $gen = Math::Random::MT::Perl->new();
delta_ok $gen->set_seed($autoseed), $autoseed;
ok $num4 = $gen->rand();
ok $num5 = $gen->rand();
ok $num6 = $gen->rand();
ok $int4 = $gen->irand();
ok $int5 = $gen->irand();
ok $int6 = $gen->irand();

# Both series of number should be the same
delta_ok $num1, $num4;
delta_ok $num2, $num5;
delta_ok $num3, $num6;
delta_ok $int1, $int4;
delta_ok $int2, $int5;
delta_ok $int3, $int6;

done_testing();
