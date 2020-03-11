#!/usr/bin/env raku

my $debug = @*ARGS ?? 1 !! 0;

my @n = 1.2, 3.45678e2, .012, 1.0, 0xa, 0o10, 0b10, 45,
        '1.2', '3.45678e2', '.012', '1.0', '0xa', '0o10', '0b10', '45',
        'abc', 'xyz';

for @n {
    my $typ = $_.^name;
  
    my $f = frac $_;
    $f = 'undef' if !$f.defined;
    say "$_, $f";
    next;

    =begin comment
    frac $_;
    =end comment

    #=begin comment
    my $int;
    my $frac;
    parts $_, $int, $frac;
    $frac = 'undef' if !$frac.defined;
    say "$_, $int, $frac";
    #=end comment
}
        
multi parts($n --> List) {
    # puts $n's parts in $int and $frac
    my $int = $n.truncate;
    my $frac = frac $n;
    return $int, $frac;
}
        
multi parts($n, $int is rw, $frac is rw) {
    # puts $n's parts in $int and $frac
    $int = $n.truncate;
    $frac = frac $n;
}

sub frac($n) {
    # Note: Even though an arg may have a '.0' it will
    # be treated as an undefined value for the fractional
    # part.

    # For inputs as a string:
    # If the input is of a higher base than ?? it cannot
    # have a '.' as a radix point, otherwise it can only
    # have one '.'.
    my $is-str  = 0;
    my $is-allo = 0;
    if $n.^name eq 'Str' {
        ++$is-str;
        # check to see if it's an allomorph
        my $x = <<$n>>;
        my $typ = $x.^name;
        ++$is-allo if $typ ~~ /Int|Rat|Num/;
        # a crude check
        my $nc = 0;
        for $n.comb {
            ++$nc if $_ eq '.';
        } 
        if !$is-allo {
            # need to determine if
            note "WARNING: $n is not an allomorph ($typ)" if 1 || $debug;
            note "Skipping for now until proper handling is implemented for non-allomorph strings as numbers";
            next;
        }
        note "WARNING: Number '$n' contains $nc radix chars ('.')" if $nc > 1;
    }

    my $num = $n.Num;
    my $f = $num.split('.')[1]; 
    my $i = $num.truncate;
    
    if $debug {
        print qq:to/HERE/;
        DEBUG frac:
          input:     |$n|
          string?    |$is-str|
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
