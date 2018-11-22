<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="General.css">
	<title></title>
</head>
	<body>	
	<!-- on demande les identifiants pour l'administrateur, ici, par défaut, les identifiants sont 'admin' 'admin' -->
	<div id="title"><p>Veuillez entrer vos identifiants</p></div>	
    	<form action="verif_login.php" method="post" class="form" id="form_connexion">
           	<p>Votre login <input type="text" name="login" id="textfield"></p>
            <p>Votre password <input type="password" name="password" id="textfield" ></p>
            <input type="submit" value="Valider" >
        </form>
	
	</body>
</html>