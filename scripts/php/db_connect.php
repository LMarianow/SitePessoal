<?php
class DatabaseConnection {
    public static function connect() {
        $db = new DatabaseConnection();

        $host = 'lmariano.me';
        $name = 'mariano';
        $password = 'jvab199610';
        $db1 = 'mariano_pessoal';
        $con = mysqli_connect($host,$name,$password,$db1);
        if(mysqli_connect_errno()) {
          die("Failed to connect to database!");
        }
        return $con;
    }
}
