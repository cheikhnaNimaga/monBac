<!DOCTYPE html>
<html lang="fr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MonBac</title>
    <link rel="stylesheet" href="style.css"/>
</head>
<body>
    <h1><a href="index.php">Mon Bacalaureat</a></h1>
    <h2> Partie : <span id='gameName'></span></h2>
    <h3> Status : <span id='gameStatus'></span></h3>
    <h3> temps : <span id='gameTime'>0s</span></h3>
    <h3> lettre : <span id='gameLettre'></span>
        <button id="gameNextLetter" onclick="changeLetter()">changer</button>
    </h3>
    <div id="listPlayers">
    
    </div>
    <form method="POST" action='#'>
        <div id='monBacTab'>
        <?php 
        $listColonne= array("prenomG" => "Prénom Garçon",
                            "prenomF"=> "Prénom Fille",
                            "villeOuPays" => "Ville ou Pays",
                            "botanique" => "Botanique",
                            "marque"=> "Marque",
                            "metier"=> "Métier",
                            "objets"=> "Objets",
                            "animaux"=> "Animaux");
        foreach($listColonne as $key=>$value){
            echo "<div class='colonne'>";
            echo "<h4>".$value."</h4>";
            echo "<input type='text' name='".$key."'/>";
            echo "</div>";
        }
        ?>
        </div>
        <input type="hidden" name="manche" id="mancheId" value="" />
        <input type="submit" value="Valider" name="validForm" id="validForm"/>
        <input type="submit" value="Démarrer Manche" name="startGame" id="startGame"/>
    </form>
    <script>
        getGamesInfo();

        function changeLetter(){
            let mancheId= document.getElementById("mancheId").value;
            fetch("./vues/api.php?ressource=manche&id="+mancheId+"&operation=changeLetter")            
                .then((response) => {                
                    return response.json()             
                }).then((result) => {
                    //console.log(result);
                });
        }

        function getGamesInfo(){
            fetch("./vues/api.php?ressource=game&id=<?php echo $_GET["gameId"];?>")            
            .then((response) => {                
                return response.json()             
            }).then((result) => {
                console.log(result);
                if(document.getElementById("gameStatus").textContent=="jeux en cours" &&
                    document.getElementById("mancheId").value!=""){
                    if(result.status=="en attente"){
                        document.getElementById("validForm").click();
                    }
                }
                document.getElementById("gameName").textContent = result.name;
                document.getElementById("gameStatus").textContent = result.status;
                document.getElementById("listPlayers").innerHTML="";
                for(var i=0; i< result.players.length; i++){
                    document.getElementById("listPlayers").innerHTML+="<span>"+result.players[i].name+"</span>";
                }
                if(result.status=="en attente"){
                    document.getElementById("validForm").style.display="none";
                    document.getElementById("startGame").style.display="block";
                    document.getElementById("gameNextLetter").style.display="none";
                }else{
                    document.getElementById("mancheId").value= result.mancheEnCours.id;
                    document.getElementById("validForm").style.display="block";
                    document.getElementById("startGame").style.display="none";
                    document.getElementById("gameLettre").textContent= result.mancheEnCours.lettre;
                    document.getElementById("gameNextLetter").style.display="inline";
                    let startGame= Date.parse(result.mancheEnCours.debut)
                    let now= new Date()
                    let differenceEnMillisecondes = now - startGame;
                    // Conversion de la différence en minutes et secondes
                    let minutes = Math.floor(differenceEnMillisecondes / (1000 * 60));
                    let secondes = Math.floor((differenceEnMillisecondes % (1000 * 60)) / 1000);
                    minutes = minutes<10 ? "0"+minutes : minutes;
                    secondes = secondes<10 ? "0"+secondes : secondes;
                    document.getElementById("gameTime").textContent= minutes+":"+secondes;
                }
            });
            setTimeout(() => {
                getGamesInfo();
            }, 1000);
        }
    </script>
</body>
</html>