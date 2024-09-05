<?php
$s1 = "Hello";
$s2 = "world";
$s3 = "!";

echo '<b>s1: </b>' . $s1 . ', <b>s2: </b>' . $s2 . ', <b>s3: </b>' . $s3;

$word = $s1 .', '. $s2 . $s3;

echo '<br>' . $word . "<br> tamanho: ". strlen($word);
?>