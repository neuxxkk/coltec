<?php

$m1 = [
    [1,3,2],
    [1,2,3],
    [2,3,1]
];

$m2 = [
    [4,2,1],
    [0,2,2],
    [3,0,2]
];

$m3 = [];

for ($i=0; $i<sizeof($m1); $i++){ // j do m1 é o i do m2
    for ($kj=0; $kj < sizeof($m1); $kj++) {
        $n = 0;
        for ($j=0; $j < sizeof($m1[$i]); $j++) { 
            $n += $m1[$i][$j] * $m2[$j][$kj];
        }
        echo $n. ", ";
        $m3[$i][$kj] = $n;
    }
    echo "\n<br>";
}
