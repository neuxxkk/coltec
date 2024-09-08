<?php
/* foreach exemplo 1: só valor */

$a = array(1, 2, 3, 17);

foreach ($a as $v) {
    echo "Valor atual de \$a: $v.\n<br>";
}

/* foreach exemplo 2: valor (com sua notação do manual de acesso imprimida para ilustração) */

$a = array(1, 2, 3, 17);

$i = 0; /* unicamente para propósito ilustrativo */

foreach ($a as $v) {
    echo "\$a[$i] => $v.\n<br>";
    $i++;
}

/* foreach exemplo 3: chave e valor */

$a = array(
    "one" => 1,
    "two" => 2,
    "three" => 3,
    "seventeen" => 17
);

foreach ($a as $k => $v) { # A, key and value
    echo "\$a[$k] => $v.\n<br>";
}

/* foreach exemplo 4: vetores multi-dimensionais */
$a = array();
$a[0][0] = "a";
$a[0][1] = "b";
$a[1][0] = "y";
$a[1][1] = "z";

foreach ($a as $v1) {
    foreach ($v1 as $v2) { // para cada vetor no array de vetores
        echo "$v2\n<br>";
    }
}

/* foreach exemplo 5: arrays dinâmicos*/

foreach (array(1, 2, 3, 4, 5) as $v) {
    echo "$v\n<br>";
    $v[2] = 13;
}
?>