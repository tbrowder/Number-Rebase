use Test;

use Number::Rebase :ALL;

plan 2;

my $hex = "ffffffffffffffffffffffffffffffff";
is $hex.chars, 32;
lives-ok {
	rebase $hex, 32, 62, 22;
}
