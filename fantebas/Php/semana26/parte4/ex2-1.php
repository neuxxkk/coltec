<?php
$dec = 25;
$bin = '';

function bin_dec($dec, $bin = ''){
    if ($dec == 0){
        return $bin != '' ? $bin : 0 ;
    }

    $digit = $dec % 2;
    $bin = $digit . $bin;
    
    return bin_dec(floor($dec / 2), $bin);
}

echo bin_dec($dec);

?>