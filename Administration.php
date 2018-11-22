<!DOCTYPE html>
<html>
	<header>
		<meta charset="UTF-8">
		<Title> Administration </Title>
		<link rel="stylesheet" href="General.css">
	</header>
	<body>
		<head>
			<nav>		   
				<img src="images/le_zoo.jpg"id=img_top alt "Le zoo"> 
				<ul id="menu" >
					<li><a href="accueil.php"><img src="images/home.png" id=img_home alt"home"></a>					
				</ul>	
			</nav>			
		</head>
		<main>
				
	<!-- 		ici on va créer un formulaire qui va nous permettre de créer de nouveaux annimaux -->
	<div id="title"><p> Ajout d'un nouvel animal </p></div>
			<form method="post" action ="traitement_animaux.php"class="form" id="animal">
				<p><label><u> <b>Espèce</b></u> </label></p>
				<p><label> Nom de l'espèce <input type="text" name="libelle_espece" id="textfield"></label></p>
				<p><label> Type de régime de l'espèce <input type = "text" name="regime_espece" id="textfield"></label></p>
				<p></p>
				
				<p><label> <u><b>Race</b></u> </label></p>		
				<p><label> Nom de la race <input type="text" name="libelle_race" id="textfield"></label></p>
				<p><label> Poids de la race <input type="text" name="poids" id="textfield"></label></p>
				<p> Petite race </p> 
					<input type="radio" name="petite_race" value="0" >  non
					<input type="radio" name="petite_race" value="1" checked="checked" > oui</label>
				
				<p><label> <u><b>Nouvel animal</b></u></label></p>				
				<p><label> Nom de l'animal <input type="text" name="nom" id="textfield"></label></p>
				<p><label> Sexe de l'animal 
					<select name="sexe" id="textfield">
						<option value="M">Mâle</option>
						<option value="F">Femelle</option>
					</select>
					</label>
				</p>				
				<p><label> Date de naissance <input type="date" name="datenaiss" id="textfield"></label></p>
				<p><label> Poids de l'animal <input type="text"  name="poids_animal" id="textfield"></label></p>
				<p><label><b><u> Historique</u></b> <textarea  name="historique" id="textfield"rows="10" cols="80"></textarea></label></p>
				<p></p>
				<p><label> Saisir le chemin de la photo <input type="text" name="photo" id="textfield"></label></p>
				<p><input type="submit" value="ajouter"></p>					
				
			</form>				
		</main>
		<footer>
			<?php				
				include('Common/Footer.php');
				 ?>			
		</footer>		
	</body>
</html>
		