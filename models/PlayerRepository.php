<?php
class PlayerRepository{

    public $bdd;

    public function __construct($connection){
        $this->bdd= $connection;
    }

    public function searchUserFromLogin($login){
        $stmt = $this->bdd->prepare("SELECT * FROM player WHERE name=:login"); 
        $stmt->execute(array("login"=>$login)); 
        $row = $stmt->fetch();
        return $row;
    }

    public function insertPlayer($data){
        $stmt = $this->bdd->prepare("INSERT INTO `player`
                                    (`name`, `password`)
                                    VALUES (:login, :password);"); 
        return $stmt->execute(array("login"=> $data["login"],
                                    "password"=>password_hash($data["password"], PASSWORD_DEFAULT))); 
    }


    public function getFromId($id){
        $stmt = $this->bdd->prepare("SELECT * FROM player WHERE id=? LIMIT 1"); 
        $stmt->execute(array($id)); 
        $row = $stmt->fetch();
        return $row;
    }
}