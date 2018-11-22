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
			<img src="images/le_zoo.jpg"id=img_top alt "Le zoo"> 
			<ul id="menu">
				<li><a href="accueil.php"><img src="images/home.png" id=img_home alt"home"></a>
				<li><a href="Le_zoo.php"> <span class="onit">Le Zoo</span> </a></li>
				<li><a href="Les_animaux.php"> Les Animaux</a></li>
				<li><a href="Reservation.php"> Réservation </a></li>
				<li><a href="login.php"><img id="connexion" src="images/cadena.png" alt="image"></a></li>
			</ul>	
		</nav>		
	</head>
	<main>
		<div id="title"> <p> Plan du zoo </p> </div>
		<img src="images/Plan_zoo.jpg" id="plan_zoo" alt"plan du zoo">
	</main>
	<footer>
		<?php
			
			include('Common/Footer.php');
			 ?>		
	</footer>	
</body>
</html>
		