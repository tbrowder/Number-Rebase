Subroutines Exported by the `:ALL` Tag
======================================

<table class="pod-table">
<thead><tr>
<th>Col 1</th> <th>Col 2</th> <th>Col 3</th>
</tr></thead>
<tbody>
<tr> <td>bin2dec</td> <td>bin2hex</td> <td>bin2oct</td> </tr> <tr> <td>dec2bin</td> <td>dec2hex</td> <td>dec2oct</td> </tr> <tr> <td>hex2bin</td> <td>hex2dec</td> <td>hex2oct</td> </tr> <tr> <td>oct2bin</td> <td>oct2dec</td> <td>oct2hex</td> </tr> <tr> <td>rebase</td> <td></td> <td></td> </tr>
</tbody>
</table>

### sub bin2dec

    - Purpose: Convert a binary number (string) to a decimal number.
    - Params : Binary number (string), desired length (optional).
    - Returns: Decimal number (or string).

    sub bin2dec(Str:D $bin where &binary,
                UInt $len = 0
                --> Cool) is export(:bin2dec) {...}

