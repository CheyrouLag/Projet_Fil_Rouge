<!DOCTYPE html>
<html>
<header>
	<meta charset="UTF-8">
	<Title> Zootopia </Title>
	<link rel="stylesheet" href="General.css">
	<link rel="stylesheet" href="animal.css">

</header>
<body>
	<head>
		<nav>
			<img src="images/Tigre.jpg"id=img_top alt "Tigre"> 
			<ul id="menu">
				<li><a href="accueil.php"><img src="images/home.png" id=img_home alt"home"></a>
				<li><a href="Le_zoo.php"> Le Zoo </a></li>
				<li><a href="Les_animaux.php"> <span class="onit">Les Animaux</span></a></li>
				<li><a href="Reservation.php"> Réservation </a></li>
				<li><a href="login.php"><img id="connexion" src="images/cadena.png" alt="image"></a></li>
			</ul>
		</nav>		
	</head>
	<main>
				<?php 
				include("Common/Connexion.php");
		?>
		
		<div id="title"><p>Nos derniers animaux</p></div>
		<div id="conteneur1" >
		    <div class="element">
		<!-- 	    dans cet élément, on va afficher le dernier animal rentré dans la base -->
		    	<?php
		// 		On commence par intéroger la base pour récupérer les informations de l'animal
		    	$q="SELECT * FROM animal A INNER JOIN race R ON A.NUM_RACE=R.NUM_RACE INNER JOIN espece E ON R.NUM_ESPECE=E.NUM_ESPECE WHERE NUM_ANIMAL IN (SELECT MAX(NUM_ANIMAL) FROM animal)";
		    	$animaux=$bdd->query($q);
		    	foreach($animaux as $animal)
		    	$photo=$animal['CHEMIN_PHOTO']
				?>
		<!-- 		puis on les affiche -->
		    	<div id="nom_animaux"><strong><?php echo($animal['NOM_ANIMAL'])?></strong> </div>
		    	
			    	<img src="<?php echo($photo) ?>" id="photo_animal"> 
		    		<p><?php echo $animal['NOM_ANIMAL']; ?> est né(e) le <?php echo $animal ['DATE_NAISSANCE_ANIMAL']; ?>. <br/> <?php echo $animal['HISTORIQUE_ANIMAL']; ?>.
		    		</p>
		    		<p>Cet animal est un(e) <?php echo $animal['LIBELLE_RACE']; ?> de l'espèce des <?php echo $animal['LIBELLE_ESPECE']; ?>s ainsi son type d'alimentation est <?php echo $animal['TYPE_REGIME_ESPECE']; ?> </p>
		    				
			</div>
		<!-- cet élément affiche l'avant dernier animal -->
		    <div class="element">
		    <?php
		
		        $q="SELECT * FROM animal A INNER JOIN race R ON A.NUM_RACE=R.NUM_RACE INNER JOIN espece E ON R.NUM_ESPECE=E.NUM_ESPECE ORDER BY NUM_ANIMAL DESC LIMIT 1,1";
		        $animaux=$bdd->query($q);
		        foreach($animaux as $animal)
		        $photo=$animal['CHEMIN_PHOTO']
		        ?>
		        <div id="nom_animaux"><strong><?php echo($animal['NOM_ANIMAL'])?></strong> </div>
		        
			        <img src="<?php echo($photo) ?>" id="photo_animal"> 
		            <p><?php echo $animal['NOM_ANIMAL']; ?> est né(e) le <?php echo $animal ['DATE_NAISSANCE_ANIMAL']; ?>. <br/> <?php echo $animal['HISTORIQUE_ANIMAL']; ?>.
		            </p>
		            <p>Cet animal est un(e) <?php echo $animal['LIBELLE_RACE']; ?> de l'espèce des <?php echo $animal['LIBELLE_ESPECE']; ?>s ainsi son type d'alimentation est <?php echo $animal['TYPE_REGIME_ESPECE']; ?> </p>
		           	
		    </div>
		</div>
		<!-- cet élément affiche l'animal situé en troisième position dans la base -->
		<div id="conteneur2">
		    <div class="element">
		       <?php
		
		        $q="SELECT * FROM animal A INNER JOIN race R ON A.NUM_RACE=R.NUM_RACE INNER JOIN espece E ON R.NUM_ESPECE=E.NUM_ESPECE ORDER BY NUM_ANIMAL DESC LIMIT 2,1";
		        $animaux=$bdd->query($q);
		        foreach($animaux as $animal)
		        $photo=$animal['CHEMIN_PHOTO']
		        ?>
		        <div id="nom_animaux">	<strong><?php echo($animal['NOM_ANIMAL'])?></strong> </div>
		      													  
			        <img src="<?php echo($photo) ?>" id="photo_animal"> 
		            <p><?php echo $animal['NOM_ANIMAL']; ?> est né(e) le <?php echo $animal ['DATE_NAISSANCE_ANIMAL']; ?>. <br/> <?php echo $animal['HISTORIQUE_ANIMAL']; ?>.
		            </p>
		            <p>Cet animal est un(e) <?php echo $animal['LIBELLE_RACE']; ?> de l'espèce des <?php echo $animal['LIBELLE_ESPECE']; ?>s ainsi son type d'alimentation est <?php echo $animal['TYPE_REGIME_ESPECE']; ?> </p>
		        
		    </div>
		<!-- cet élément affiche l'animal situé en quatrième position dans la base -->
		    <div class="element">
		        <?php
		
		        $q="SELECT * FROM animal A INNER JOIN race R ON A.NUM_RACE=R.NUM_RACE INNER JOIN espece E ON R.NUM_ESPECE=E.NUM_ESPECE ORDER BY NUM_ANIMAL DESC LIMIT 3,1";
		        $animaux=$bdd->query($q);
		        foreach($animaux as $animal)
		        $photo=$animal['CHEMIN_PHOTO']
		        ?>
		        <div id="nom_animaux"><strong><?php echo($animal['NOM_ANIMAL'])?></strong> </div>
		        
			        <img src="<?php echo($photo) ?>" id="photo_animal"> 
		            <p><?php echo $animal['NOM_ANIMAL']; ?> est né(e) le <?php echo $animal ['DATE_NAISSANCE_ANIMAL']; ?>. <br/> <?php echo $animal['HISTORIQUE_ANIMAL']; ?>.
		            </p>
		            <p>Cet animal est un(e) <?php echo $animal['LIBELLE_RACE']; ?> de l'espèce des <?php echo $animal['LIBELLE_ESPECE']; ?>s ainsi son type d'alimentation est <?php echo $animal['TYPE_REGIME_ESPECE']; ?> </p>
		     
		    </div>
		</div>
	</main>
	<footer>
		<?php
			
			include('Common/Footer.php');
			 ?>		
	</footer>
</body>
</html>
		