<?php
/* exemplo 1 */

$i = 1;
while ($i <= 10) {
    echo $i++;  /* o valor printado ia ser
                   $i antes do incremento
                   (pos-incremento) */
}

/* exemplo 2 */

$i = 1;
while ($i <= 10):
    echo $i;
    $i++;
endwhile;
?>