<?php
// Isso:
$a = array( 'color' => 'red',
            'taste' => 'sweet',
            'shape' => 'round',
            'name'  => 'apple',
            4        // chave vai ser 0
          );

$b = array('a', 'b', 'c');

// . . .é completamente equivalente a isso:
$a = array();
$a['color'] = 'red';
$a['taste'] = 'sweet';
$a['shape'] = 'round';
$a['name']  = 'apple';
$a[]        = 4;        // chave vai ser 0

$b = array();
$b[] = 'a';
$b[] = 'b';
$b[] = 'c';

// Após o código acima ser executado, $a vai ser o array
// array('color' => 'red', 'taste' => 'sweet', 'shape' => 'round', 
// 'name' => 'apple', 0 => 4), e $b vai ser o array 
// array(0 => 'a', 1 => 'b', 2 => 'c'), ou simples array('a', 'b', 'c').
