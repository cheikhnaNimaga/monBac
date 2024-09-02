<?php
    include("../bdd/database.php");
    if(isset($_GET["ressource"]) && $_GET["ressource"]=="game" && !isset($_GET["id"])){
        include("../models/GameRepository.php");
        $modelGame= new GameRepository($bdd);
        echo json_encode($modelGame->getAll());
    }

    if(isset($_GET["ressource"]) && $_GET["ressource"]=="game" && isset($_GET["id"])){
        include("../models/GameRepository.php");
        $modelGame= new GameRepository($bdd);
        echo json_encode($modelGame->getGameInfo($_GET["id"]));
    }

    
    if(isset($_GET["ressource"]) && $_GET["ressource"]=="manche" && isset($_GET["id"])
            &&isset($_GET["operation"]) && $_GET["operation"]=="changeLetter"){
        include("../models/GameRepository.php");
        $modelGame= new GameRepository($bdd);
        if($modelGame->changeLetter($_GET["id"])){
            echo json_encode("ok");
        }else{
            echo json_encode("ko");
        }
    }
?>