<?php 

include_once '../db_connect.php';

ini_set('display_startup_errors', 1);
ini_set('display_errors',1);
error_reporting(-1);

if (isset($_SESSION)) session_destroy();
session_start();

$username = $_REQUEST['username']; // CPF_CNPJ
$passwordTry = $_REQUEST['password'];


try{
    $pdoConn = (new Database())->getConnection();
    
    $stmt = $pdoConn->prepare('SELECT * from Usuario WHERE cpf_cnpj = :username');
    $stmt->bindParam(':username', $username);
    
    $stmt->execute();
    
    $user = $stmt->fetchObject();

    if (md5($passwordTry) == $user->senha || $passwordTry == $user->senha){

        $comm = $pdoConn->prepare('SELECT r.*, u.*, comprador.nome AS nome_usuario FROM Registro_Compra r join Usuario u on u.id_usuario=r.id_estabelecimento join Usuario comprador on comprador.id_usuario=r.id_usuario WHERE r.id_usuario = :id_usuario OR r.id_estabelecimento = :id_usuario');
        $comm->bindParam(':id_usuario', $user->id_usuario);
            
        if ($user->acesso == 'admin'){
            echo "admin";
            $comm = $pdoConn->prepare('SELECT r.*, u.*, comprador.nome AS nome_usuario FROM Registro_Compra r join Usuario u on u.id_usuario=r.id_estabelecimento join Usuario comprador on comprador.id_usuario=r.id_usuario');
        }

        if (isset($comm)){ 
            $comm->execute();
            
            echo $comm->rowCount();
            foreach ($comm->fetchAll(PDO::FETCH_OBJ) as $c) {
                $listaCompras[] = $c;
            }
            
            $_SESSION['compras'] = $listaCompras;
        }

        $stmtEstabelecimento = $pdoConn->prepare('SELECT * FROM Usuario WHERE acesso = :acesso');
        $acesso = 'estabelecimento';
        $stmtEstabelecimento->bindParam(':acesso', $acesso);
        $stmtEstabelecimento->execute();
        
        $usuariosEstabelecimento = [];
        foreach ($stmtEstabelecimento->fetchAll(PDO::FETCH_OBJ) as $usuario) {
            $usuariosEstabelecimento[] = $usuario;
        }
        
        $_SESSION['estabelecimentos'] = $usuariosEstabelecimento;

        $_SESSION['user'] = $user;

        
        header(header: 'Location: ../afterLogin/index.php');
        exit();
        // logged in
    }else{
        $_SESSION['error'] = 'senha Incorreta, tente novamente.';
        header(header: 'Location: login.php');
        exit();
    }

}catch(PDOException $e){
    echo $e->getMessage();
}
