[![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/linux.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions) [![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/macos.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions) [![Actions Status](https://github.com/tbrowder/Number-Rebase/actions/workflows/windows.yml/badge.svg)](https://github.com/tbrowder/Number-Rebase/actions)

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

