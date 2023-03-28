### method base

```raku
method base() returns Mu
```

The original extended character set (29 more chars) after base62 to base91 (from http://base91.sourceforge.net/): 1 2 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 ! # $ % & ( ) * + , . / : ; < = > ? @ [ ] ^ _ ` { | } ~ " In order to use the period as the radix point for fractions we swap the period and the double quotation mark. 1 2 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 ! # $ % & ( ) * + , " / : ; < = > ? @ [ ] ^ _ ` { | } ~ . Then, for bases 2 through 90 the radix point is the period. For base 91 we provide a separate routine to return the integer and fractional parts separately. Standard digit set for bases 2 through 91 (char 0 through 91). The array of digits is indexed by their decimal value. Standard digit set for bases 2 through 91 (char 0 through 90). The hash is comprised of digit keys and their decimal value.

