use Number::Rebase;

unit class Number::Rebase::number;

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
            $!fraction = frac $!num;
        }
    }
    elsif $!base {
        # then the input number must be a string
        die "FATAL: input '{$!num}' is NOT a string" if $!num !~~ /Str/;
        # check the number for the correct base
    }
}

