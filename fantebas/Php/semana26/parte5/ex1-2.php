<?php
// Array como mapa de propriedade (dicionário)
$map = array( 'version'    => 4,
              'OS'         => 'Linux',
              'lang'       => 'english',
              'short_tags' => true
            );
            
// chaves estritamentes numéricas (array sem chaves)
$array = array( 7,
                8,
                0,
                156,
                -10
              );
// isso é o mesmo que array(0 => 7, 1 => 8, ...)

$switching = array(         10, // chave = 0
                    5    =>  6,
                    3    =>  7, 
                    'a'  =>  4,
                            11, // chave = 6 (maior índice de inteiros era 5)
                    '8'  =>  2, // chave = 8 (inteiro!)
                    '02' => 77, // chave = '02'
                    0    => 12  // o valor 10 vai ser sobrescrito por 12
                  );
                  
// array vazio
$empty = array();         
?>
