NUMBERS
=======

Note that, in some fonts, some characters are easily misidentified and some implementations of higher bases exchange other, non-alphabetic characters for them. Currently this module does note attempt to handle that and you must file an issue if that causes problems for your use case.

#### Array of digits for bases up to 62

Note the module actually exports an array of all the digits for bases up to 91;

       0 1 2 3 4 5 6 7 8 9
       A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
       a b c d e f g h i j k l m n o p q r s t u v w x y z

#### Hash of reversed mapping of the array above

Note the module actually exports a hash of all the digits for bases up to 91;

       0 =>  0, 1 =>  1, 2 =>  2, 3 =>  3, 4 =>  4, 5 =>  5, 6 =>  6, 7 =>  7, 
         8 =>  8, 9 =>  9,
       A => 10, B => 11, C => 12, D => 13, E => 14, F => 15, G => 16, H => 17, 
         I => 18, J => 19,
       K => 20, L => 21, M => 22, N => 23, O => 24, P => 25, Q => 26, R => 27, 
         S => 28, T => 29,
       U => 30, V => 31, W => 32, X => 33, Y => 34, Z => 35, a => 36, b => 37, 
         c => 38, d => 39,
       e => 40, f => 41, g => 42, h => 43, i => 44, j => 45, k => 46, l => 47, 
         m => 48, n => 49,
       o => 50, p => 51, q => 52, r => 53, s => 54, t => 55, u => 56, v => 57, 
         w => 58, x => 59,
       y => 60, z => 61
    ];

#### Names for some common base numbers [Ref 6.]

<table class="pod-table">
<thead><tr>
<th>Base</th> <th>Number System</th> <th>Base</th> <th>Number System</th> <th>Base</th> <th>Number System</th>
</tr></thead>
<tbody>
<tr> <td>2</td> <td>Binary</td> <td>13</td> <td>Tridecimal</td> <td>32</td> <td>Duotrigesimal</td> </tr> <tr> <td>3</td> <td>Ternary</td> <td>14</td> <td>Tetradecimal</td> <td>33</td> <td>Trtritrigesimal</td> </tr> <tr> <td>4</td> <td>Quaternary</td> <td>15</td> <td>Pentadecimal</td> <td>36</td> <td>Hexatrigesimal</td> </tr> <tr> <td>5</td> <td>Quinary</td> <td>16</td> <td>Hexadecimal</td> <td>52</td> <td>Duoquinquagesimal</td> </tr> <tr> <td>6</td> <td>Senary</td> <td>20</td> <td>Vigesimal</td> <td>56</td> <td>Hexaquinquagesimal</td> </tr> <tr> <td>7</td> <td>Heptary</td> <td>23</td> <td>Trivigesimal</td> <td>57</td> <td>Heptaquinquagesimal</td> </tr> <tr> <td>8</td> <td>Octal</td> <td>24</td> <td>Tetravigesimal</td> <td>58</td> <td>Octoquinquagesimal</td> </tr> <tr> <td>9</td> <td>Nonary [Ref 3.]</td> <td>26</td> <td>Hexavigesimal</td> <td>60</td> <td>Sexagesimal</td> </tr> <tr> <td>10</td> <td>Decimal</td> <td>27</td> <td>Heptavigesimal</td> <td>61</td> <td>Unsexagesimal</td> </tr> <tr> <td>11</td> <td>Undecimal</td> <td>30</td> <td>Trigesimal</td> <td>62</td> <td>Duosexagesimal</td> </tr> <tr> <td>12</td> <td>Duodecimal</td> <td></td> <td></td> <td></td> <td></td> </tr>
</tbody>
</table>

References
----------

0. [Standard positional number systems](https://en.wikipedia.org/wiki/List_of_numeral_systems#Standard_positional_numeral_systems)

1. [Positional number systems](https://en.wikipedia.org/wiki/Numeral_system#Positional_systems_in_detail)

2. [Positional base conversion](https://en.wikipedia.org/wiki/Positional_notation#Base_conversion)

3. [Base](http://mathworld.wolfram.com/Base.html)

4. [Table of bases 2..36 for decimal values 0..256](https://en.wikipedia.org/wiki/Table_of_bases)

5. [Radix](https://en.wikipedia.org/wiki/Radix)

6. [List of numeral systems](https://en.wikipedia.org/wiki/List_of_numeral_systems)

7. [Simple conversion algorithms](http://mathforum.org/library/drmath/view/57074.html)

7a. [Converting Bases](http://mathforum.org/library/drmath/view/55824.html)

8. [Base 91](http://base91.sourceforge.net/)

