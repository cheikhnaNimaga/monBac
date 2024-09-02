<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MonBac</title>
    <link rel="icon" type="image/jpeg" href="./images/logomonbac.jpg">
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
    <?php
        session_start();
        include("./bdd/database.php");
        if(!isset($_SESSION["user"])){
            if(isset($_GET["page"])&&$_GET["page"]=="login"){
                include("./controllers/PlayerController.php");
                $playerController= new PlayerController($bdd);
                $playerController->traitement();
            }else{
                include("./vues/login.php");
            }
        }else{
            include("./controllers/GameController.php");
            $gameController= new GameController($bdd);
            $gameController->traitement();  
            if(!isset($_GET["page"]) && !isset($_GET["gameId"])){
                include("./vues/game.php");
            }else if(isset($_GET["gameId"])){
                include("./vues/manche.php");
            }
        }
    ?>
</body>
</html>