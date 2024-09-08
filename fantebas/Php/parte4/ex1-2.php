<?php
$arr = array('one', 'two', 'three', 'four', 'stop', 'five');
foreach ($arr as $val) { // each() --> deprecated since 7.0.2
    if ($val == 'stop') {
        break;    /* Você poderia escrever 'break 1;' aqui também. */
    }
    echo "$val<br />\n";
}

/* usando o argumento opcional. */

$i = 0;
while (++$i) {
    switch ($i) {
    case 5:
        echo "At 5<br />\n";
        break 1;  /* Saia somente do switch. */
    case 10:
        echo "At 10; quitting<br />\n";
        break 2;  /* Saia do switch e do while. */
    default:
        break;
    }
}
?>