<?php

include_once '../db_connect.php';

ini_set('display_startup_errors', 1);
ini_set('display_errors', 1);
error_reporting(E_ALL);

session_start();

var_dump($_POST);

$user = $_SESSION['user'];

if (isset($_POST['month'])) {
    $_SESSION['consultAgent'] = 'Usuario';
}else{
    header('Location: index.php');
    exit();
}

try {    
    $pdoConn = (new Database())->getConnection();

    // Retrieve the month from POST data
    $month = $_POST['month'];

    $sql = "
        SELECT 
            u.nome AS Usuario, 
            SUM(r.preco) AS ValorTotal, 
            SUM(r.pontos_compra) AS Pontuacao
        FROM 
                Registro_Compra r
        JOIN 
            Usuario u 
        ON 
            u.id_usuario = r.id_usuario
        WHERE 
            MONTH(r.data) = $month
        GROUP BY 
            r.id_usuario;
    ";

    echo $sql;
    // Fetch the results
    $results = $pdoConn->query($sql)->fetchAll(PDO::FETCH_OBJ);

    // Store the results in the session
    $_SESSION['results'] = $results;

    header('Location: index.php');
    exit();
} catch (PDOException $e) {
    echo $e->getMessage();
}
