#!/usr/bin/env raku

my $debug = @*ARGS ?? 1 !! 0;

my @n = 1.2, 3.45678e2, .012, 1.0, 0xa, 0o10, 0b10, 45,
        '1.2', '3.45678e2', '.012', '1.0', '0xa', '0o10', '0b10', '45';

for @n {
    frac $_;
}
        
sub frac($n) {
    # if it's a string, convert to a number
    my $num = $n.Num;
    my $f = $num.split('.')[1]; 
    my $i = $num.truncate;
    
    if $debug {
        print qq:to/HERE/;
        DEBUG frac:
          input:     |$n|
          name:      |{$n.^name}|
          .Num:      |$num|
          .truncate: |$i|
        HERE
        if $f.defined {
            say "  frac:      |$f|";
        }
        else {
            say "  frac:      |(undef)|";
        }
    }
    $f;
}
