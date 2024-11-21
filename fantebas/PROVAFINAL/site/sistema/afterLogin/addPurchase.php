<?php

include_once '../db_connect.php';

ini_set('display_startup_errors', 1);
ini_set('display_errors',1);
error_reporting(-1);

session_start();
$user = $_SESSION['user'];


try{
    $conn = (new Database())->getConnection();
} catch (PDOException $e) {
echo "Error: " . $e->getMessage();
}
// Check if POST request
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $id_estabelecimento = $_POST['estabelecimento'];
    $preco = $_POST['preco'];
    $data = $_POST['data'];
    $pontos = $preco * 10;
    $cpf = ($user->acesso=='cliente')? $user->cpf_cnpj : $_POST['cliente'];

    // Prepare and bind
    $sql = "INSERT INTO Registro_Compra (id_usuario, id_estabelecimento, preco, data, pontos_compra) VALUES ((SELECT id_usuario FROM Usuario WHERE cpf_cnpj = :cpf), :id_estabelecimento, :preco, :data, :pontos)";
    $stmt = $conn->prepare($sql);
    $stmt->bindParam(':cpf', $cpf);
    $stmt->bindParam(':id_estabelecimento', $id_estabelecimento);
    $stmt->bindParam(':preco', $preco);
    $stmt->bindParam(':data', $data);
    $stmt->bindParam(':pontos', $pontos);

    // Update user points
    $conn->exec("UPDATE Usuario SET pontos_usuario = pontos_usuario + $pontos WHERE cpf_cnpj = $cpf");

    // Execute the statement
    if ($stmt->execute()) {
        echo "New purchase record created successfully";
        header("Location: ../login/connect.php?username=$user->cpf_cnpj&password=$user->senha");
    } else {
        echo "Error: " . $stmt->error;
    }

    // Close statement
    $stmt->close();
}

// Close connection
$conn->close();
?>