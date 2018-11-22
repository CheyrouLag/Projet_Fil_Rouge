<!DOCTYPE html>
<html>
	<header>
		<meta charset="UTF-8">
		<Title> Zootopia </Title>
		<link rel="stylesheet" href="General.css">
	</header>
	<body>
		<head>
			<nav>
				<img src="images/acces_zoo.jpg"id=img_top alt "reservation"> 
				<ul id="menu">				
					<li><a href="accueil.php"><img src="images/home.png" id=img_home alt"home"></a>
					<li><a href="Le_zoo.php"> Le Zoo </a></li>
					<li><a href="Les_animaux.php"> Les Animaux</a></li>
					<li><a href="Reservation.php"><span class=	"onit"> Réservation</span> </a></li>
					<li><a href="login.php"><img id="connexion" src="images/cadena.png" alt="image"></a></li>
				</ul>			
			</nav>	
		</head>
		<main>
			<div id="title"> <p>Pour commencer, veuillez saisir vos informations</p> </div>
			
			
			<form method="post" action="Traitement.php" class="form" id="info_client">
				<p><label> Votre Sexe </label>
					<select name="sexe" id="textfield">
						<option value="none">Non définit</option>
						<option value="F">Femme</option>
						<option value="M">Homme</option>
					</select>
				</p>
				<p><label> Votre Prénom </label><input type="text" name="prenom" id="textfield"></p>
				<p><label> Votre Nom </label> <input type="text" name="nom" id="textfield"></p>
				<p><label> Votre Date de naissance </label> <input type="date"  name="datenaiss"  id="textfield" ></p>
				<p><label> Votre Code postal </label> <input type="text" name="codepostal" id="textfield" maxlength="5"></p>
				<p><label> Votre Ville </label> <input type="text" name="ville" id="textfield"></p>
				<p><label> Votre Numéro de téléphone </label> <input type="tel" name="numtel" id="textfield"></p>
				<p><label> Votre Email </label> <input type="email" name="mail" id="textfield"></p>
				
				<input type="submit" value="Valider" id="submit">
			</form>
		</main>
		
		<footer>
			<?php
				
				include('Common/Footer.php');
				 ?>
		</footer>
		
	</body>
</html>
		