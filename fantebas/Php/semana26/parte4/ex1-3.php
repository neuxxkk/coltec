<?php
$arr = array(1, 2, 3, 4);
foreach ($arr as &$value) {
    $value = $value * 2;
}
// $arr agora é array(2, 4, 6, 8)
unset($value); // quebre a referência com o elemento index = -1
?>  