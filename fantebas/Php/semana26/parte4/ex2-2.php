
<?php
$dec = $_GET["dec"];
$bin = $_GET["bin"];

if ($dec && $bin){
    $binTry = dec_bin($dec);
    if ($binTry == $bin){
        echo "You're RIGHT";
    }else{
        echo "You're WRONG";
    }
}else if ($dec){
    $bin = dec_bin($dec);
}else if ($bin){
    $dec = bin_dec($bin);
}else{
}

function dec_bin($dec, $bin = ''){
    if ($dec == 0){
        return $bin != '' ? $bin : 0 ;
    }

    $digit = $dec % 2;
    $bin = $digit . $bin;
    
    return dec_bin(floor($dec / 2), $bin);
}   

function bin_dec($bin){
    $dec = 0;
    $array_bin = str_split($bin);
    $p = sizeof($array_bin) - 1;
    foreach ($array_bin as $b){
        $dec += $b * (2**$p);
        $p --;
    }
    
    return $dec;
}
?>

<html>
    <head>
       <title>Binary-Decimal</title>
       <script>
        function cleanInput(){
            inputs = document.querySelectorAll("input[type='text']");
            inputs.forEach(inp => {
                inp.value = ("type binary type decimal".includes(inp.value)) ? '':inp.value;
            });
        }
       </script>
    </head>
    <body>
        <h1>Convert Bin, Dec</h1>

        <form action="" method="GET">
            <h4>Binary</h4>
            <input onclick = "value = ''" type="text" name="bin" id="binInput" value="<?php echo $bin ? $bin:"type binary" ?>">
            <h4>Decimal</h4>
            <input onclick = "value = ''" type="text" name="dec" id="decInput" value="<?php echo $dec ? $dec:"type decimal" ?>">
            <br>
            <input onclick = cleanInput() type="submit" value="Convert">
        </form>
    </body>
</html>

