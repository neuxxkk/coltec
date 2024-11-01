<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alemao</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <form action="" method="post">
        <p>    
            <label for="idN2">Number 1:</label>
            <input type="numer" name="n1" id="idN1">
        </p>

        <p>Operação:<br>
                <label for="idTimes">x</label>
                <input type="radio" name="operation" id="idTimes" value = '*'>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <label for="idDiv">/</label>
                <input type="radio" name="operation" id="idDiv" value = '/'>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <label for="idSum">+</label>
                <input type="radio" name="operation" id="idSum" value = '+'>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <label for="idSub">-</label>
                <input type="radio" name="operation" id="idSub" value = '-'>
        </p>

        <p>    
            <label for="idN2">Number 2:</label>
            <input type="number" name="n2" id="idN2">
        </p>
        <input type="submit" value="Send">
    </form>

    <?php 
        $n1 = $_REQUEST['n1'];
        $n2 = $_REQUEST['n2'];
        $operation = $_REQUEST['operation'];

        switch ($operation) {
            case '+':
                $r = $n1 + $n2;
                break;          
            case '-':
                $r = $n1 - $n2;
                break;
            case '*':
                $r = $n1 * $n2;
                break;
            case '/':
                $r = $n1 / $n2;
                break;
            default:
                $r = "Operação inválida!";
                break;
        }

    ?>

    <div>
        <h3>Resultado:</h3>
        <p><b><?php echo $n1 . $operation . $n2 . ' = ' . $r ?></b></p>
    </div>

</body>
</html>


