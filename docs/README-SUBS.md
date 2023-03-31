Subroutines Exported by the `:ALL` Tag
======================================

<table class="pod-table">
<tbody>
<tr> <td>bin2dec</td> <td>bin2hex</td> <td>bin2oct</td> </tr> <tr> <td>dec2bin</td> <td>dec2hex</td> <td>dec2oct</td> </tr> <tr> <td>hex2bin</td> <td>hex2dec</td> <td>hex2oct</td> </tr> <tr> <td>oct2bin</td> <td>oct2dec</td> <td>oct2hex</td> </tr> <tr> <td>rebase</td> <td></td> <td></td> </tr>
</tbody>
</table>

### sub bin2dec

    # Purpose: Convert a binary number (string) to a decimal number.
    # Params : Binary number (string), desired length (optional).
    # Returns: Decimal number (or string).
    sub bin2dec(Str:D $bin where &binary,
                UInt $len = 0
                --> Cool) is export(:bin2dec) {...}

### sub bin2hex

    # Purpose: Convert a binary number (string) to a hexadecimal number (string).
    # Params : Binary number (string), desired length (optional), prefix (optional), 
    #          lower-case (optional).
    # Returns: Hexadecimal number (string).
    sub bin2hex(Str:D $bin where &binary,
                UInt $len = 0,
                Bool :$prefix = False,
                Bool :$LC = False
	        --> Str) is export(:bin2hex) {...}

### sub bin2oct

    # Purpose: Convert a binary number (string) to an octal number (string).
    # Params : Binary number (string), desired length (optional), prefix (optional).
    # Returns: Octal number (string).
    sub bin2oct($bin where &binary,
                UInt $len = 0,
                Bool :$prefix = False
                --> Str) is export(:bin2oct) {...}

### sub dec2bin

    # Purpose: Convert a non-negative integer to a binary number (string).
    # Params : Non-negative decimal number, desired length (optional), prefix (optional).
    # Returns: Binary number (string).
    sub dec2bin($dec where &decimal,
                UInt $len = 0,
                :$prefix = False
                --> Str) is export(:dec2bin) {...}

### sub dec2hex

    # Purpose: Convert a non-negative integer to a hexadecimal number (string).
    # Params : Non-negative decimal number, desired length (optional), prefix 
               (optional), lower-case (optional).
    # Returns: Hexadecimal number (string).
    sub dec2hex($dec where &decimal,
                UInt $len = 0,
                Bool :$prefix = False,
                Bool :$LC = False
	        --> Str) is export(:dec2hex) {...}

### sub dec2oct

    # Purpose: Convert a non-negative integer to an octal number (string).
    # Params : Decimal number, desired length (optional), prefix (optional).
    # Returns: Octal number (string).
    sub dec2oct($dec where &decimal,
                UInt $len = 0,
                Bool :$prefix = False
                --> Cool) is export(:dec2oct) {...}

### sub hex2bin

    # Purpose: Convert a non-negative hexadecimal number (string) to a binary string.
    # Params : Hexadecimal number (string), desired length (optional), prefix (optional).
    # Returns: Binary number (string).
    sub hex2bin(Str:D $hex where &hexadecimal,
                UInt $len = 0,
                Bool :$prefix = False
                --> Str) is export(:hex2bin) {...}

### sub hex2dec

    # Purpose: Convert a non-negative hexadecimal number (string) to a decimal number.
    # Params : Hexadecimal number (string), desired length (optional).
    # Returns: Decimal number (or string).
    sub hex2dec(Str:D $hex where &hexadecimal,
                UInt $len = 0
                --> Cool) is export(:hex2dec) {...}

### sub hex2oct

    # Purpose: Convert a hexadecimal number (string) to an octal number (string).
    # Params : Hexadecimal number (string), desired length (optional), prefix (optional).
    # Returns: Octal number (string).
    sub hex2oct($hex where &hexadecimal, UInt $len = 0,
                Bool :$prefix = False
                --> Str) is export(:hex2oct) {...}

### sub oct2bin

    - Purpose: Convert an octal number (string) to a binary number (string).
    - Params : Octal number (string), desired length (optional), prefix (optional).
    - Returns: Binary number (string).
    sub oct2bin($oct where &octal, UInt $len = 0,
                Bool :$prefix = False
                --> Str) is export(:oct2bin) {...}

### sub oct2dec

    # Purpose: Convert an octal number (string) to a decimal number.
    # Params : Octal number (string), desired length (optional).
    # Returns: Decimal number (or string).
    sub oct2dec($oct where &octal, UInt $len = 0
                --> Cool) is export(:oct2dec) {...}

### sub oct2hex

    # Purpose: Convert an octal number (string) to a hexadecimal number (string).
    # Params : Octal number (string), desired length (optional), prefix (optional), 
    #          lower-case (optional).
    # Returns: Hexadecimal number (string).
    sub oct2hex($oct where &octal, UInt $len = 0,
                Bool :$prefix = False,
                Bool :$LC = False
                --> Str) is export(:oct2hex) {...}

### sub rebase

    # Purpose: Convert any number (integer or string) and base (2..62) to a 
    #          number in another base (2..62).
    # Params : Number (string), desired length (optional), prefix (optional), 
    #          lower-case (optional).
    # Returns: Desired number (decimal or string) in the desired base.
    sub rebase($num-i,
               $base-i where &all-bases,
               $base-o where &all-bases,
               UInt $len = 0,
               Bool :$prefix = False,
               Bool :$LC = False
               --> Cool) is export(:baseM2baseN) {...}

