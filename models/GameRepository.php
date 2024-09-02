<?php
class GameRepository{

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

    public function insertGame($data){
        $stmt = $this->bdd->prepare("INSERT INTO `game`
                                    (`name`)
                                    VALUES (:name);"); 
        return $stmt->execute(array("name"=> $data["name"])); 
    }

    public function updateGameStatus($gameId, $status){
        $stmt = $this->bdd->prepare("update `game` set status=:status where id=:id"); 
        return $stmt->execute(array("status"=> $status,
                                    "id"=>$gameId)); 
    }

    public function updateGameManche($gameId, $mancheId){
        $stmt = $this->bdd->prepare("update `game` set mancheEnCours=:mancheEnCours where id=:id"); 
        return $stmt->execute(array("mancheEnCours"=> $mancheId,
                                    "id"=>$gameId)); 
    }

    public function createManche($gameId){
        $stmt = $this->bdd->prepare("INSERT INTO `manche`
                            (`lettre`, `game`)
                            VALUES (:lettre, :game);");
        // Générer un nombre aléatoire entre 0 et 25
        $random_number = mt_rand(0, 25);
        // Convertir le nombre aléatoire en lettre en utilisant l'alphabet
        $lettre = chr(65 + $random_number); // 65 est le code ASCII pour 'A'
        return $stmt->execute(array("lettre"=> $lettre,
                                    "game"=>$gameId));
    }

    public function checkParticipation($gameId, $userId){
        $stmt = $this->bdd->prepare("SELECT * FROM participe where game=:game and player=:player"); 
        $stmt->execute(array("game"=> $gameId,
                             "player"=> $userId)); 
        $row = $stmt->fetch();
        return $row;
    }

    public function insertParticipation($gameId, $userId){
        $stmt = $this->bdd->prepare("INSERT INTO `participe`
                                    (`game`, `player`)
                                    VALUES (:game, :player);"); 
        return $stmt->execute(array("game"=> $gameId,
                                    "player"=> $userId)); 
    }


    public function getAll(){
        $stmt = $this->bdd->prepare("SELECT * FROM game"); 
        $stmt->execute(); 
        $row = $stmt->fetchAll();
        return $row;
    }

    public function getGameInfo($id){
        $stmt = $this->bdd->prepare("SELECT * FROM game where id=:id"); 
        $stmt->execute(array("id"=>$id)); 
        $row = $stmt->fetch();
        
        $stmt2 = $this->bdd->prepare("SELECT p.name FROM participe left join player as p on p.id=participe.player  where game=:id"); 
        $stmt2->execute(array("id"=>$id)); 
        $row2 = $stmt2->fetchAll();
        $row["players"]=$row2;
        
        if($row["mancheEnCours"]){
            $stmt3 = $this->bdd->prepare("SELECT * FROM manche where id=:id"); 
            $stmt3->execute(array("id"=>$row["mancheEnCours"])); 
            $row3 = $stmt3->fetch();
            $row["mancheEnCours"]= $row3;
        }

        $stmt4 = $this->bdd->prepare("SELECT pl.name, i.* FROM information as i 
                                        left JOIN player as pl on i.player=pl.id
                                        left JOIN manche as m on m.id=i.manche
                                        where m.game=:id"); 
        $stmt4->execute(array("id"=>$id)); 
        $row4 = $stmt4->fetchAll();
        $row["reponses"]= $row4;
        return $row;
    }

    public function changeLetter($mancheId){
        $stmt = $this->bdd->prepare("update manche set lettre=:letter where id=:id"); 
        // Générer un nombre aléatoire entre 0 et 25
        $random_number = mt_rand(0, 25);
        // Convertir le nombre aléatoire en lettre en utilisant l'alphabet
        $lettre = chr(65 + $random_number); // 65 est le code ASCII pour 'A'
        return $stmt->execute(array("letter"=> $lettre,
                                    "id"=>$mancheId)); 
    }


    public function savePlayerInfo($data){
        $stmt = $this->bdd->prepare("INSERT INTO `information`
        (`prenomG`, `prenomF`, `villeOuPays`, `botanique`, `marque`, `metier`, `objets`, `animaux`, `manche`, `player`)
        VALUES (:prenomG, :prenomF, :villeOuPays, :botanique, :marque, :metier, :objets, :animaux, :manche, :player);"); 
        return $stmt->execute(array('prenomG'=>$data['prenomG'],
                                     "prenomF"=>$data['prenomF'], 
                                     "villeOuPays"=>$data['villeOuPays'], 
                                     "botanique"=>$data['botanique'], 
                                     "marque"=>$data['marque'], 
                                     "metier"=>$data['metier'], 
                                     "objets"=>$data['objets'], 
                                     "animaux"=>$data['animaux'], 
                                     "manche"=>$data['manche'], 
                                     "player"=>$_SESSION['user']['id'])); 
    }
}