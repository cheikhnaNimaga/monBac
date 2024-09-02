<?php
include("./models/PlayerRepository.php");
class PlayerController{

    public $model;

    public function __construct($database){
        $this->model= new PlayerRepository($database);
    }

    public function traitement(){
        if($_GET["page"]=="login"){
           $this->traitementLogin();
           $this->traitementConnect();
           include("./vues/login.php");
        }
    }


    ///////////////////////////
    //Gestion inscription/////
    //////////////////////////
    private function traitementLogin(){
        if(isset($_POST["inscription"])){
            if(empty($_POST["login"])
                ||empty($_POST["password"])
                ||empty($_POST["confirmation"])){
                echo "<p style='color:red'>Tous les champs sont obligatoires!</p>";
            }else  if(empty($_POST["password"])!=empty($_POST["confirmation"])){
                echo "<p style='color:red'>Tous les champs sont obligatoires!</p>";
            }else{
                try{
                  $this->model->insertPlayer($_POST);
                }
                catch(PDOException $e){
                    printf("Erreur lors de l'inscription : %s\n", $e->getMessage());
                    exit();
                }finally{
                    echo "<p style='color:green'>Inscription réussite!</p>";
                }
            }
        }
    }

    private function traitementConnect(){
        ///////////////////////////
        //Gestion connexion   /////
        //////////////////////////
        if(isset($_POST["connexion"])){
            if(empty($_POST["login"]) || empty($_POST["password"])){
                echo "<p style='color:red'>Tous les champs sont obligatoires!</p>";
            }else{
                $row = $this->model->searchUserFromLogin($_POST['login']);
                if(is_array($row) && password_verify($_POST['password'], $row["password"])){
                    $_SESSION["user"]= $row;
                    header("Location: index.php");
                }else{
                    echo "<p style='color:red'>Identifiants incorrect!</p>";
                }
            }
        }
    }




}