<!DOCTYPE html>
<html lang="en">
<head>
    <title>Alemao</title>
    <script>
    </script>
</head>

<body>
    <form method = "get">
        <input onclick = "document.getElementById('textInp').value = ''" type="text" name="msg" id="textInp" value = "Digite uma frase">
        <input type="submit" value="Enviar">
    </form>

    <?php
        $msg = $_REQUEST["msg"];
        $bSpaces = substr_count($msg, ' ');
    ?>

    <div>
        <h1><?php echo getMsg($bSpaces); ?></h1>
    </div>

</body>

<style>
    div{
        color: blue;
    }
</style>

</html>

<?php

function getMsg($bSpaces){
    if ($bSpaces == 0 ) {
        $txt = "A frase não contem nenhum blank spaces!";
       }else{
           switch ($bSpaces){
               case 1:
                   $txt = "A frase contem 1 blank spaces!";
                   break;
               case 2:
                   $txt = "A frase contem 2 blank spaces!";
                   break;
               case 3:
                   $txt = "A frase contem 3 blank spaces!";
                   break;
               default:
                   $txt = " Sua frase contem vários espaços";
                   break;
           }
       }
    return $txt;
}

?>