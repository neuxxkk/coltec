<?php

function fat($n){
    return $n == 1 ? 1 : $n * fat($n-1) ;
}

echo fat(7);
