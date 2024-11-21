<?php
    session_start();
    session_unset();
    session_destroy();

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Nota Fiscal Mineira</title>
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/197/197571.png" type="image/png">
</head>
<style>
    /* Reset some default browser styles */
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Arial', sans-serif;
}

body {
    background: linear-gradient(270deg, #007BFF, #28a745, #ff7f50);
    background-size: 600% 600%;
    animation: gradientAnimation 10s ease infinite;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
}

/* Keyframes for the moving gradient */
@keyframes gradientAnimation {
    0% {
        background-position: 0% 50%;
    }
    50% {
        background-position: 100% 50%;
    }
    100% {
        background-position: 0% 50%;
    }
}


.container {
    text-align: center;
    background-color: #fff;
    padding: 50px;
    padding-left: 100px;
    padding-right: 100px;
    border-radius: 12px;
    box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
}

h1 {
    font-size: 2.5rem;
    color: #333;
    margin-bottom: 10px;
}

p {
    font-size: 1.1rem;
    color: #666;
    margin-bottom: 40px;
}

.button-group {
    display: flex;
    justify-content: center;
    gap: 20px;
}

.btn {
    text-decoration: none;
    font-size: 1.1rem;
    color: #fff;
    background-color: #007BFF;
    padding: 15px 30px;
    border-radius: 30px;
    transition: background-color 0.3s ease;
}

.btn-cadastro {
    background-color: #28a745;
}

.btn:hover {
    background-color: #0056b3;
}

.btn-cadastro:hover {
    background-color: #218838;
}

/* Mobile responsive adjustments */
@media (max-width: 600px) {
    .btn {
        padding: 12px 25px;
        font-size: 1rem;
    }

    .container {
        padding: 30px;
    }

    h1 {
        font-size: 2rem;
    }

    p {
        font-size: 1rem;
    }
}
    
</style>
<body>
    <div class="container">
        <h1>Bem-vindo Nota Fiscal Mineira</h1>
        <p>Choose an option below</p>
        <div class="button-group">
            <a href="login/login.php" class="btn">Login</a>
            <a href="cadastro/signup.php" class="btn btn-cadastro">Cadastro</a>
        </div>
    </div>
</body>
</html>
