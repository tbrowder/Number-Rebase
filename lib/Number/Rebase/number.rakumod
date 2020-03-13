use Number::Rebase;

class Number::Rebase::number {

    # as originally input:
    has $.num;
    has $.base;

    # the decimal number resulting from the input
    has $.integer;
    has $.fraction = 0;

    method new($num, :$base) {
        self.bless: :$num, :$base;
    }

    submethod TWEAK {
        if $!num ~~ /Int|Rat|Num/ {
            $!base = 10;
            # break into integer and fractional parts
            if $!num ~~ Int {
                $!integer  = $!num;
            }
            else {
                $!integer  = $!num.truncate;
    #            $!fraction = frac $!num;
            }
        }
        elsif $!base {
            # then the input number must be a string
            die "FATAL: input '{$!num}' is NOT a string" if $!num !~~ /Str/;
            # check the number for the correct base
        }
    }

} # class Number::Rebase::number

# subs

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

sub frac($n, :$base = 0) {
    # Note: Even though an arg may have a '.0' it will
    # be treated as an undefined value for the fractional
    # part.

    # For inputs as a string:
    # If the input is of base 91 it cannot
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
            # need to determine if the base is 91
            if $nc {
                if $base == 91 {
                    note "WARNING: $n is base 91 with one or more periods.";
                    next;
                }
                elsif $nc > 1 {
                    note "WARNING: $n is not base 91 but it has multiple periods.";
                    next;
                }
            }
            note "WARNING: $n is not an allomorph ($typ)" if 1 || $debug;
            note "Skipping for now until proper handling is implemented for non-allomorph strings as numbers";
            next;
        }
        note "WARNING: Number '$n' contains $nc radix chars ('.')" if $nc > 1;
    }

    my $num = $n.Num;
    my $f = $num.split('.')[1];
    my $i = $num.truncate;
    # any undefined fraction will be treated as zero
    $f = 0 if !$f.defined;

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
