<?php
session_start();
session_unset();
session_destroy();

var_dump(value: $_SESSION);

header("Location: home.php");
exit(); 