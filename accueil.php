<!DOCTYPE html>
<html>
	<header>
		<meta charset="UTF-8">
		<Title> Zootopia </Title>
		<link rel="stylesheet" href="General.css">	
	</header>
	<body>
		<head>
			<img src="images/Accueil-lemur.png"id=img_top alt "Lémuriens"> 	
			<nav>
				<ul id="menu">
					<li><a href="accueil.php"><img src="images/home.png" id=img_home alt"home"></a>
					<li><a href="Le_zoo.php"> Le Zoo </a></li>
					<li><a href="Les_animaux.php"> Les Animaux</a></li>
					<li><a href="Reservation.php"> Réservation </a></li>
					<li><a href="login.php"><img id="connexion" src="images/cadena.png" alt="image"></a></li>
				</ul>
			</nav>			
		</head>
		<main>
			<div id="bienvenue"> 
				<p><b> Bienvenue à Zootopia ! </b></p>
				<p> Bienvenue sur le site du plus grand zoo de la région Rhône Alpes.</p>
				<p>Venez visiter ce magnifique lieu situé en plein coeur de la métropole Lyonnaise.</p>
			</div>
				<iframe id="map" src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2890.66365971799!2d4.860491285870716!3d45.7482585877398!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!		1s0x0%3A0x5730dfbf74a29f6f!2sUniversit%C3%A9+Jean+Moulin+Lyon+3!5e0!3m2!1sfr!2sfr!4v1489578623822" ></iframe>
				
			<div id="adresse">
				<p>6 Cours Albert Thomas, 69008 Lyon</p>
			</div>
	
			<div id="actualité">
				<h1> Actualités </h1>
				<p> Le parc zoologique Zootopia ouvrira ses portes dans très peu de temps, vous trouverez toutes les informations nécessaires sur le site.</p>
				<p>	Le parc célébrera son ouverture à la journée d'inauguration du 07/08/2018 pendant laquelle de nombreuses animations auront lieu, activités avec les animaux, découverte du parc, concert de Rihanna, ateliers de soins des animaux et 
					bien plus encore! </p>
				<p> Les horaires d'ouverture du parc seront les suivantes: 08H00 -- 18H00 du Mardi au Dimanche</p>
				<p> Suivez nous sur les réseaux sociaux grâce aux liens situés en bas de page </p>
				
			</div>
		</main>
		<footer>
		<!-- ici on intègre le code de la page footer.php -->
			<?php
				
				include('Common/Footer.php');
				 ?>
			
		</footer>	
	</body>
</html>
		