<?php
include_once '../db_connect.php';

ini_set('display_startup_errors', 1);
ini_set('display_errors',1);
error_reporting(-1);

try{
    $pdoConn = (new Database())->getConnection();

    $stmt = $pdoConn->prepare("SELECT cpf_cnpj FROM Usuario WHERE cpf_cnpj=?");
    $stmt->execute([$_REQUEST['cpf_cnpj']]);

    if (!$stmt->fetchAll(PDO::FETCH_ASSOC)){
        $_REQUEST['fname'] = mb_convert_encoding($_REQUEST['fname'], 'UTF-8', 'auto');

        $stmt = $pdoConn->prepare("INSERT INTO Usuario(nome, cpf_cnpj, email, telefone, senha, acesso) VALUES(?, ?, ?, ?, MD5(?), ?) ");
        $stmt->execute([$_REQUEST['fname'], $_REQUEST['cpf_cnpj'], $_REQUEST['email'], $_REQUEST['telefone'], $_REQUEST['password'], $_REQUEST['acesso']]);

        $username = $_REQUEST['cpf_cnpj'];
        $pass = $_REQUEST['password'];

        header("Location: ../login/connect.php?username=$username&password=$pass");
        exit();
    }else{
        $_SESSION['error'] = 'CPF já cadastrado, tente entrar.';
        header(header: 'Location: signup.php');
        exit();
    }

}catch(PDOException $e){
    echo $e->getMessage();
}