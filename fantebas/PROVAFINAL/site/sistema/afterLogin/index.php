<?php

ini_set('display_startup_errors', 1);
ini_set('display_errors',1);
error_reporting(-1);

    session_start(); 
    if (!isset($_SESSION['user'])){
        header("Location: ../home.php");
        exit();
    }

    $user = $_SESSION['user'];
    
    if (isset($_SESSION['compras'])) $compras = $_SESSION['compras'];
    else $compras = null;

    if (isset($_SESSION['estabelecimentos'])) $estabelecimentos = $_SESSION['estabelecimentos'];
    else $estabelecimentos = null;

    $consultAgent = ($_SESSION['consultAgent'])?? 'Usuario';
    
    $results = ($_SESSION['results'])?? null;
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AleSys</title>
    <link rel="stylesheet" href="./style.css">
    <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/197/197571.png" type="image/png">
</head>

<body>
    <!-- Box de informações do usuário logado posicionado à esquerda superior -->
    <div class="user-info-box" style="<?=($user->acesso == 'estabelecimento') ? 'max-width: 400px;' : ''?>">
        <h1>Bem-vindo, <span id="username"><?php echo $user->nome ?></span>!</h1>
        <div class="user-info">
            <br>
            <p><b><?=($user->acesso=='estabelecimento')?'CNPJ: ':'CPF' . ': '?></b><?=$user->cpf_cnpj?></p>
            <p> <b>Email: </b><?=$user->email?> </p>
            <p><b>Telefone: </b><?=$user->telefone?></p>
            <?php if ($user->acesso == 'cliente'): ?>
                <p><b>Pontos: </b><?=$user->pontos_usuario?></p>
            <?php endif; ?>
            <p style="font-weight:bold;color:#FFFF00;"><?=$user->acesso?></p>
            <br>
            <form class='user-form' action="../quit.php"><input enabled style='background-color: #f0f9;' type="submit" value="Quit"></form>
        </div>
    </div>

    <!-- Container para gerenciamento e lista de usuários -->
    <div class="container" style="<?=($user->acesso == 'estabelecimento') ? 'justify-content: center;' : ''?>">
        <!-- Box de gerenciamento de usuários -->
        <?php if ($user->acesso != 'estabelecimento'):?>
            <div class="box user-management-box">
                <h2>Cadastrar compra</h2>
                <div class="actions">
                    <form action="addPurchase.php" method="post">
                        <?php if ($user->acesso == 'admin'): ?>
                            <input type="text" name="cliente" placeholder="CPF Cliente" required>
                        <?php endif; ?>
                        <select style = 'color: #fff;' name="estabelecimento" required>
                            <?php foreach ($estabelecimentos as $estabelecimento): ?>
                                <option value="<?= $estabelecimento->id_usuario ?>"><?= $estabelecimento->nome ?></option>
                            <?php endforeach; ?>
                        </select>
                        <input type="number" name="preco" placeholder="Preço" required>
                        <input type="date" name="data" placeholder="data" required>
                        <input class='btn' type="submit" value="Cadastrar">
                    </form>
                </div>
            </div>
        <?php endif; ?>

        <!-- Box da lista de usuários if User is cliente or estabelecimento or admin -->
        <div class="box user-list-box">
            <?php if($user->acesso == 'cliente'):?>
                <h2>Lista de compras</h2>
            <?php elseif($user->acesso == 'estabelecimento'):?>
                <h2>Lista de Vendas</h2>
            <?php else:?>
                <h2>Lista transações</h2>
                <form action="DAO.php" method="post">
                    <label for="month">Escolha o mês:</label>
                    <select name="month" id="month" required>
                        <option value="MONTH(data)">Todos</option>
                        <option value="01">Janeiro</option>
                        <option value="02">Fevereiro</option>
                        <option value="03">Março</option>
                        <option value="04">Abril</option>
                        <option value="05">Maio</option>
                        <option value="06">Junho</option>
                        <option value="07">Julho</option>
                        <option value="08">Agosto</option>
                        <option value="09">Setembro</option>
                        <option value="10">Outubro</option>
                        <option value="11">Novembro</option>
                        <option value="12">Dezembro</option>
                    </select>
                    <input class='sub-btn' type="submit" value="Filtrar">
                </form>
            <?php endif; ?>
            <div class='table-container'>
                <table class="user-table">
                    <thead>
                        <tr>
                            <?php if($user->acesso!='cliente'):?><th><?=$consultAgent?></th><?php endif; ?>
                            <?php if($user->acesso!='estabelecimento' && !isset($results)):?><th>Estabelecimento</th><?php endif;?>
                            <th><?=(isset($results))? 'Valor Total' : 'Preço';?></th>
                            <th><?=(isset($results))? 'Pontuação' : 'Data';?></th>
                            <?php if (!isset($results)):?><th>Pontos</th><?php endif; ?>
                        </tr>
                    </thead>
                    <tbody>
                        <?php if (isset($results)): ?>
                            <?php foreach ($_SESSION['results'] as $result): ?>
                                <tr>
                                    <td><?= $result->Usuario ?></td>
                                    <td><?= $result->ValorTotal ?></td>
                                    <td><?= $result->Pontuacao ?></td>
                                </tr>
                            <?php endforeach; ?>
                        <?php else: ?>
                            <?php foreach ($compras as $compra): ?>
                                <tr id="<?= $compra->id_compra ?>">
                                    <?php if($user->acesso!='cliente'):?><td><?= $compra->nome_usuario?></td><?php endif; ?>
                                    <?php if($user->acesso!='estabelecimento'):?><td id="nome-<?= $compra->nome ?>"><?= $compra->nome ?></td><?php endif; ?>
                                    <td id="preco-<?= $compra->id_compra ?>"><?= $compra->preco ?></td>
                                    <td id="data-<?= $compra->id_compra ?>"><?= $compra->data ?></td>
                                    <td id="pontos-<?= $compra->id_compra ?>"><?= $compra->pontos_compra ?></td>
                                </tr>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</body>
</html>

