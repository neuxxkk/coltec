<?php
    $Age = $_POST["Age"];
    $Fname = $_POST["Fname"];
    $Lname = $_POST["Lname"];
?>
<html class="no-js" lang="pt-br">
    <head>
        <title>Personal INFO</title>
    </head>
    <body>
        <form method="post" action="<?php echo $PHP_SELF;?>">
            Primeiro Nome:<input type="text" size="12" maxlength="12" name="Fname"><br />
            Sobrenome:<input type="text" size="12" maxlength="36" name="Lname"><br />
            <input type="submit" value="Enviar" >
        </form>
        <?php
          echo "Olá, ".$Fname." ".$Lname.".<br />";
        ?>

        <h2><?php echo $Fname ?> qual sua idade</h2>

        <form method="post" action="<?php echo $PHP_SELF;?>">
            <input type="number" name="Age"><br/>
            <input type="submit" value="Enviar" >
        </form>

        <h1>Idade: <?php echo $Age ?></h1>

