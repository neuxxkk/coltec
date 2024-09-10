<?php

function basVal($a, $b, $c){
    $s=[];
    if ($a){
        $delt = ($b**2) - (4*$a*$c);
        if ($delt >= 0){
            $s[] = (-$b + sqrt($delt)) / (2*$a);
            $s[] = (-$b - sqrt($delt)) / (2*$a);
            return $s;
        }else{
            return null;
        }
    }else{
        return -$c / $b;
    }
}

function basRef($a, $b, $c, &$s){
    if ($a){
        $delt = ($b**2) - (4*$a*$c);
        if ($delt >= 0){
            $s[] = (-$b + sqrt($delt)) / (2*$a);
            $s[] = (-$b - sqrt($delt)) / (2*$a);
        }else{
            $s = null;
        }
    }else{
        $s[] = -$c / $b;
        $s[] = $s[0];
    }
}
