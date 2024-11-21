<head>
  <link rel="stylesheet" href="./signup.css">
  <link rel="shortcut icon" href="https://cdn-icons-png.flaticon.com/512/197/197571.png" type="image/png">
  <title>AleSys</title>
</head>
<form autocomplete='off' class='form' action="cadastrar.php" method="post">
  <div class='control'>
    <h1>
      Cadastro Nota Fiscal Mineira
    </h1>
  </div>

  <?php
  if (isset($_SESSION['error'])) {
      echo "<div style='color: red;'>".$_SESSION['error']."</div>";
      unset($_SESSION['error']); // Remove a mensagem de erro após exibir
  }
  print_r($_SESSION['error']); 
  ?>

  <div class='control block-cube block-input'>
    <input name='fname' placeholder='Nome' type='text'>
    <div class='bg-top'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg-right'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg'>
      <div class='bg-inner'></div>
    </div>
  </div>

  <div class='control block-cube block-input'>
    <input name='cpf_cnpj' placeholder='CPF/CNPJ' type='text'>
    <div class='bg-top'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg-right'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg'>
      <div class='bg-inner'></div>
    </div>
  </div>

  <div class='control block-cube block-input'>
    <input name='telefone' placeholder='Telefone' type='text' autocomplete="off">
    <div class='bg-top'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg-right'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg'>
      <div class='bg-inner'></div>
    </div>
  </div>

  <div class='control block-cube block-input'>
    <input name='email' placeholder='Email' type='email'>
    <div class='bg-top'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg-right'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg'>
      <div class='bg-inner'></div>
    </div>
  </div>

  <div class='control block-cube block-input'>
    <input name='password' placeholder='Senha' type='password' autocomplete="new-password">
    <div class='bg-top'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg-right'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg'>
      <div class='bg-inner'></div>
    </div>
  </div>

  <div class='control block-cube block-input'>
    <select name='acesso' required>
      <option value='' disabled selected>Tipo</option>
      <option value='cliente'>Cliente</option>
      <option value='estabelecimento'>Estabelecimento</option>
    </select>
  </div>
  

  <button class='btn block-cube block-cube-hover' type='submit'>
    <div class='bg-top'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg-right'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg'>
      <div class='bg-inner'></div>
    </div>
    <div class='text'>
      Cadastrar
    </div>
  </button>

  <br>  

  <button class='btn block-cube block-input' type='button' onclick="window.location.href='../login/login.php'">
    <div class='bg-top'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg-right'>
      <div class='bg-inner'></div>
    </div>
    <div class='bg'>
      <div class='bg-inner'></div>
    </div>
    <div class='text'>
      Log In
    </div>
  </button>

  <div class='credits'>
    <a href='#alemao' target='_blank'>
      Alemao
    </a>
  </div>
</form>
