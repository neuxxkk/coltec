<?php 
        $check = $_REQUEST['check'];
        $mult = $_REQUEST['mult'];
        $text = $_REQUEST['text'];

    echo "
        <div class='container'>
        <h3>Resultado:</h3>
        <p><b>" . $check . "\n" . $mult . "\n" . $text . "</b></p>
    </div>
";
