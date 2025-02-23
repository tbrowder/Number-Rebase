[![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions) [![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions) [![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions)

NAME
====

**Number::Rebase** provides routines to manipulate numbers of differing bases from 2 to 91

SYNOPSIS
========

```raku
use Number::Rebase;
```

DESCRIPTION
===========

This module provides some convenience functions to convert unsigned integers between different, commonly used number bases: decimal, hexadecimal, octal, and binary.

For completeness, this module's routines converts between between bases 2 through 91. The advantage of the highest base conversion is that much more compression when encoding binary data with ASCII characters.

Note that bases greater than 36 will use a set of digits consisting of a case-sensitive set of ASCII characters in an array indexed from 0..base-1, and the reverse mapping is in a hash. Both exported variables are shown in [NUMBERS](./docs/NUMBERS.md).

Also included in that document is more information on other exported variables, number systems (and references), and their use in this module.

The current subroutines are described in detail in [SUBS](./docs/SUBS.md) which shows a short description of each exported routine along along with its complete signature.

The functions in this module are recommended for users who don't want to have to deal with the messy code involved with such transformations and who want an easy interface to get the various results they may need.

As an example of the detail involved, any transformation from a non-decimal base to another non-decimal base requires an intermediate step to convert the first non-decimal number to decimal and then convert the decimal number to the final desired base. In addition, adding prefixes, changing to lower-case where appropriate, increasing lengths, and handling fractions will involve more processing.

The following illustrates the process using Raku routines for the example above:

    my $bin = '11001011';
    my $dec = parse-base $bin, 2;
    my $hex = $dec.base: 16;
    say $hex; # OUTPUT 'CB'

The default for each provided function is to take a string (valid decimals may be entered as numbers) representing a valid number in one base and transform it into the desired base with no leading zeroes or descriptive prefix (such as '0x', '0o', and '0b') to indicate the type of number. The default is also to use upper-case characters for the hexadecimal results and all bases greater than 10 and less than 37. Bases greater than 36 use a mixture of upper-case and lower-case characters.

There is an optional parameter to define desired lengths of results (which will result in adding leading zeroes if needed). There are named parameters to have results in lower-case (`:$LC`) for bases between 11 and 36 and add appropriate prefixes to transformed numbers (`:$prefix`) in bases 2 (binary), 8 (octal), and 16 (hecadecimal). Note that requested prefixes will take up two characters in a requested length. There is also an option (`:$suffix`) to add the appropriate base suffix to any number, the result of which will look like this:

    '2Zz3_base-62'

The suffix overrides any requested prefix.

The user can define an environment variable to control the reponse to situations where the transformed length is greater than the requested length: (1) ignore and provide the required length (the default), (2) warn of the increased length but provide it, and (3) throw an exception and report the offending data.

The original extended character set (29 more characters) after base62 to base91 (from [https://base91.sourceforge.net/](https://base91.sourceforge.net/)):

    ! # $ % & ( ) * + , . / : ; < = > ? @ [ ] ^ _ ` { | } ~ "

In order to use the period as the radix point for fractions we swap the period and the double quotation mark.

    ! # $ % & ( ) * + , " / : ; < = > ? @ [ ] ^ _ ` { | } ~ .

Then, for bases 2 through 90, the radix point is the period. For base 91 we provide another routine to return the integer and fractional parts separately.

    our @dec2digit is export(:dec2digit) = [
        '0', '1', '2', '3', '4', '5', '6', '7', '8', '9', # 10
        'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J', # 20
        'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T', # 30
        'U', 'V', 'W', 'X', 'Y', 'Z', 'a', 'b', 'c', 'd', # 40
        'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', # 50
        'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', # 60
        'y', 'z', '!', '#', '$', '%', '&', '(', ')', '*', # 70
        '+', ',', '"', '/', ':', ';', '<', '=', '>', '?', # 80
        '@', '[', ']', '^', '_', '`', '{', '|', '}', '~', # 90
        '.',                                              # 91
    ];

Following is the standard digit set for bases 2 through 91 (char 0 through 90). The array of digits is indexed by their decimal value.

Following is the standard digit set for bases 2 through 91 (char 0 through 90). The hash is comprised of digit keys and their decimal value.

    our %digit2dec is export(:digit2dec) = %(
        '0' =>  0, '1' =>  1, '2' =>  2, '3' =>  3, '4' =>  4, '5' =>  5, '6' =>  6, '7' =>  7, '8' =>  8, '9' =>  9, # 10
        'A' => 10, 'B' => 11, 'C' => 12, 'D' => 13, 'E' => 14, 'F' => 15, 'G' => 16, 'H' => 17, 'I' => 18, 'J' => 19, # 20
        'K' => 20, 'L' => 21, 'M' => 22, 'N' => 23, 'O' => 24, 'P' => 25, 'Q' => 26, 'R' => 27, 'S' => 28, 'T' => 29, # 30
        'U' => 30, 'V' => 31, 'W' => 32, 'X' => 33, 'Y' => 34, 'Z' => 35, 'a' => 36, 'b' => 37, 'c' => 38, 'd' => 39, # 40
        'e' => 40, 'f' => 41, 'g' => 42, 'h' => 43, 'i' => 44, 'j' => 45, 'k' => 46, 'l' => 47, 'm' => 48, 'n' => 49, # 50
        'o' => 50, 'p' => 51, 'q' => 52, 'r' => 53, 's' => 54, 't' => 55, 'u' => 56, 'v' => 57, 'w' => 58, 'x' => 59, # 60
        'y' => 60, 'z' => 61, '!' => 62, '#' => 63, '$' => 64, '%' => 65, '&' => 66, '(' => 67, ')' => 68, '*' => 69, # 70
        '+' => 70, ',' => 71, '"' => 72, '/' => 73, ':' => 74, ';' => 75, '<' => 76, '=' => 77, '>' => 78, '?' => 79, # 80
        '@' => 80, '[' => 81, ']' => 82, '^' => 83, '_' => 84, '`' => 85, '{' => 86, '|' => 87, '}' => 88, '~' => 89, # 90
        '.' => 90,                                                                                                    # 91
    );

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2025 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

