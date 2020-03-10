#!/usr/bin/env raku

my @n = 1.2, 3.45678e2, .012, 1.0, 0xa, 0o10, 0b10, 45,
        '1.2', '3.45678e2', '.012', '1.0', '0xa', '0o10', '0b10', '45';

for @n {
    frac $_;
}
        
sub frac($n) {
    say "DEBUG frac:";
    say "  input: |$n|";
    say "  name: {$n.^name}";
    #return Any if $n ~~ /Int/;
    # if it's a string, convert to a number
    my $num = $n.Num;
    #return Any if $n ~~ /Int/;
    say "  .Num: |$num|";
    my $f = $num.split('.')[1]; 
    if $f.defined {
        say "  frac: |$f|";
    }
    else {
        say "  frac: |(undef)|";
    }
    my $i = $num.truncate;
    say "  .truncate: |$i|";
}
