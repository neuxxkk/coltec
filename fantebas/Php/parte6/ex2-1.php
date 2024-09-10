<?php

    function is_prime($n){
        for ($i = 2; $i <= $n/2; $i++){
            if ($n % $i == 0){return false;}
        }
        return true;
    }



echo "
    <html>
        <body>
            <form action='' method='post'>
                <input type='number' name='n'>
                <input type='submit' value='Ok'>
            </form>
        </body>
    </html>
";

$n = $_POST['n'];

echo $n."<br>";

echo is_prime($n) ? "Primo" : "Não primo";
