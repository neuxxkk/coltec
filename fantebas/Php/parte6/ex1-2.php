<?php

function fatorial($n){
    $f = 1;
    for ($i = $n; $i > 0; $i--){
        $f *= $i;
    }
    return $f;
}

echo fatorial(5);
