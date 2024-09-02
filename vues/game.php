<div id="listGames">
</div>

<form method="POST" action="#" id="formAddGame">
    <span>Nom:</span>
    <input type="text" name="name"/>
    <input type="submit" name="addGame" value="Ajouter"/>
</form>

<script>
getGames();

function getGames(){
    fetch("./vues/api.php?ressource=game")            
    .then((response) => {                
        return response.json()             
    }).then((result) => {
        document.getElementById("listGames").innerHTML="";
        for(var i=0; i< result.length; i++){
            document.getElementById("listGames").innerHTML+="<a href='index.php?gameId="+result[i].id+"'>"+result[i].name+"</a>";
        }
    });
    setTimeout(() => {
        getGames();
    }, 1000);
}
</script>