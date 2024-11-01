<?php

    function is_prime($n){
        for ($i = 2; $i <= $n/2; $i++)
            if ($n % $i == 0)return false;
        return true;
    }

    function reverse($s){
       return strrev($s);
    }

    function is_palindrome($s){
        return reverse($s) == $s;
    }

echo "
    <html>
        <body>
            <form action='' method='post'>
                <input type='number' name='numb'>
                <input type='text' name='str'>
                <input type='submit' value='Ok'>
            </form>
        </body>
    </html>
";

$n = $_REQUEST['numb'];
$s = $_REQUEST['str'];

if ($n){
    echo "<b>".$n.": </b>";
    echo is_prime($n) ? "Primo" : "Não primo";
}

if ($s){
    echo "<br><b>".$s.": </b>" . reverse($s) . ", ";
    echo is_palindrome($s) ? "Palíndromo":"Não palíndromo";
}

