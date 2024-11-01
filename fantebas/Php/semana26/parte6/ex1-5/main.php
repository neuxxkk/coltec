<?php

include 'bhaskara.php';

//$s = basVal(9, -12, 4) ?? "Delta negativo, solução impossível!";

$s = [];

basRef(0,-12,4  , $s);

echo (is_array($s)) ? (($s[0] != $s[1]) ? "S = {".$s[0].",".$s[1]."}" : "S = {".$s[0]."}") : "Delta negativo, solução impossível!";
