<?php
ini_set('display_startup_errors', 1);
ini_set('display_errors',1);
error_reporting(-1);

class Database {
    private $host = 'localhost';
    private $db_name = 'NotaFiscal';
    private $username = 'vitornms';
    private $password = '9841';
    private $conn;

    public function __construct() {
        $this->conn = null;

        try {
            $this->conn = new PDO("mysql:host=" . $this->host . ";dbname=" . $this->db_name, $this->username, $this->password);
            $this->conn->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
            return $this->getConnection();
        } catch(PDOException $exception) {
            echo "Connection error: " . $exception->getMessage();
        }
    }

    public function getConnection() {
        return $this->conn;
    }
}
?>