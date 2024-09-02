<?php
$dsn="mysql:dbname=monbac;host=localhost";
try{
    $bdd=new PDO($dsn,"root","");
}
catch(PDOException $e){
    printf("Échec de la connexion : %s\n", $e->getMessage());
    exit();
}
?>