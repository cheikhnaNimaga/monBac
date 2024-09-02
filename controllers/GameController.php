<?php
include("./models/GameRepository.php");
class GameController{

    public $model;

    public function __construct($database){
        $this->model= new GameRepository($database);
    }

    public function traitement(){
        if(isset($_POST["addGame"])){
           $this->model->insertGame($_POST);
        }

        if(isset($_GET["gameId"])){
            $participation= $this->model->checkParticipation($_GET["gameId"], $_SESSION["user"]["id"]);
            if(!$participation){
                $this->model->insertParticipation($_GET["gameId"], $_SESSION["user"]["id"]);
            }
            if(isset($_POST["startGame"])){
                $this->model->updateGameStatus($_GET["gameId"], "jeux en cours");
                $this->model->createManche($_GET["gameId"]);
                $mancheId= $this->model->bdd->lastInsertId();
                $this->model->updateGameManche($_GET["gameId"], $mancheId);
            }else if(isset($_POST["validForm"])){
                $this->model->savePlayerInfo($_POST);
                $this->model->updateGameManche($_GET["gameId"], NULL);
                $this->model->updateGameStatus($_GET["gameId"], "en attente");
            }
        }
    }
}
?>