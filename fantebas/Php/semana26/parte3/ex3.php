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
        $resp = substr_count($msg, ' ');
    ?>

    <div>
        <?php 
        if (strlen($msg) > 0 ) {
         echo "<h1>A frase " . $msg . " contem " . $resp . " blank spaces!</h1>";
        }
        ?>
    </div>

</body>

<style>
    div{
        color: purple;
    }
</style>

</html>
