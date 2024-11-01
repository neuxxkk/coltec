<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <title>Alemao</title>
</head>
<body>
    <form action="" method="post">
        <input type="password" name="pass" id="idPass">
        <input type="submit" value="Enviar">
    </form>

    <?php
        $pass = $_REQUEST['pass'];
        $file = fopen("password.txt", "a+");
        if ($pass) fwrite($file, $pass."\n");
        fclose($file);
    ?>

</body>
</html>
