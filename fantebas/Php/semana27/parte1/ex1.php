<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Alemao</title>
</head>
<body>
    <form action="" method="post">
        <p>    
            <label for="idName">Nome:</label>
            <input type="text" name="name" id="idName">
        </p>
        <p>
        <label for = "idHeight">Altura:</label>
        <input type="number" name="height" id="idHeight">
        </p>
        <p>
        <label for="idWeight">Peso:</label>
        <input type="number" name="weight" id="idWeight">
        </p>
        <p>Gênero:
            <label for="idMasc">Masculino</label>
            <input type="radio" name="gender" id="idMasc" value = 'Masculino'>
            <label for="idFem">Feminino</label>
            <input type="radio" name="gender" id="idFem" value = 'Feminino'>
        </p>
        <p>
        <label for="idAge">Idade:</label>
        <input type="number" name="age" id="idAge">
        </p>
        <input type="submit" value="Send">
    </form>

    <?php 
        $name = $_REQUEST['name'];
        $height = $_REQUEST['height'];
        $weight = $_REQUEST['weight'];
        $gender  = $_REQUEST['gender'];
        $age = $_REQUEST['age'];
    ?>

    <div>
        <h3>Dados:</h3>
        <p><b>Nome: </b><?php echo $name; ?></p>
        <p><b>Height: </b><?php echo $height; ?></p>
        <p><b>Weight: </b><?php echo $weight; ?></p>
        <p><b>Gender: </b><?php echo $gender; ?></p>
        <p><b>Age: </b><?php echo $gender; ?></p>
    </div>

</body>
</html>


