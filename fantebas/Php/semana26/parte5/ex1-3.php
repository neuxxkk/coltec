<?php
// PHP 5
foreach ($colors as &$color) {
    $color = strtoupper($color);
}
unset($color); /* certifique-se que alterações póstumas à
$color não irão modificar o último elemento do array */

// Outra forma para versões antigas PHP X; X < 5
foreach ($colors as $key => $color) {
    $colors[$key] = strtoupper($color);
}

print_r($colors);

