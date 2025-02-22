[![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions) [![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions) [![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions)

NAME
====

**Number::Rebase** provides routines to manipulate numbers of differing bases

SYNOPSIS
========

```raku
use Number::Rebase;
```

DESCRIPTION
===========

This module provides some convenience functions to convert unsigned integers between different, commonly used number bases: decimal, hexadecimal, octal, and binary. There is also a function to convert between bases 2 through 91.

Note that bases greater than 36 will use a set of digits consisting of a case-sensitive set of ASCII characters in an array indexed from 0..base-1, and the reverse mapping is in a hash. Both exported variables are shown in [NUMBERS](../blob/master/docs/NUMBERS.md).

Also included in that document is more information on other exported variables, number systems (and references), and their use in this module.

The current subroutines are described in detail in [SUBS](../blob/master/docs/SUBS.md) which shows a short description of each exported routine along along with its complete signature.

The functions in this module are recommended for users who don't want to have to deal with the messy code involved with such transformations and who want an easy interface to get the various results they may need.

As an example of the detail involved, any transformation from a non-decimal base to another non-decimal base requires an intermediate step to convert the first non-decimal number to decimal and then convert the decimal number to the final desired base. In addition, adding prefixes, changing to lower-case where appropriate, and increasing lengths will involve more processing.

The following illustrates the process using Raku routines for the example above:

    my $bin = '11001011';
    my $dec = parse-base $bin, 2;
    my $hex = $dec.base : 16;
    say $hex; # OUTPUT 'CB'

The default for each provided function is to take a string (valid decimals may be entered as numbers) representing a valid number in one base and transform it into the desired base with no leading zeroes or descriptive prefix (such as '0x', '0o', and '0b') to indicate the type of number. The default is also to use upper-case characters for the hexadecimal results and all bases greater than 10 and less than 37. Bases greater than 36 use a mixture of upper-case and lower-case characters.

There is an optional parameter to define desired lengths of results (which will result in adding leading zeroes if needed). There are named parameters to have results in lower-case (`:$LC`) for bases between 11 and 36 and add appropriate prefixes to transformed numbers (`:$prefix`) in bases 2 (binary), 8 (octal), and 16 (hecadecimal). Note that requested prefixes will take up two characters in a requested length. There is also an option (`:$suffix`) to add the appropriate base suffix to any number, the result of which will look like this:

    '2Zz3_base-62'

The suffix overrides any requested prefix.

The user can also set an environment variable to set the reponse to situations where the transformed length is greater than the requested length: (1) ignore and provide the required length (the default), (2) warn of the increased length but provide it, and (3) throw an exception and report the offending data.

### method rebase

    method rebase() returns Mu

The original extended character set (29 more chars) after base62 to base91 (from [https://base91.sourceforge.net/](https://base91.sourceforge.net/)):

    ! # $ % & ( ) * + , . / : ; < = > ? @ [ ] ^ _ ` { | } ~ "

In order to use the period as the radix point for fractions we swap the period and the double quotation mark.

    ! # $ % & ( ) * + , " / : ; < = > ? @ [ ] ^ _ ` { | } ~ .

Then, for bases 2 through 90, the radix point is the period. For base 91 we provide a separate routine to return the integer and fractional parts separately.

Following is the standard digit set for bases 2 through 91 (char 0 through 90). The array of digits is indexed by their decimal value.

Following is the standard digit set for bases 2 through 91 (char 0 through 90). The hash is comprised of digit keys and their decimal value.

          ... hash ...

AUTHOR
======

Tom Browder <tbrowder@acm.org>

COPYRIGHT AND LICENSE
=====================

© 2025 Tom Browder

This library is free software; you may redistribute it or modify it under the Artistic License 2.0.

