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
				<ul id="menu" >
					<li><a href="accueil.php"><img src="images/home.png" id=img_home alt"home"></a></li>
					
				</ul>	
			</nav>
		</head>

		<!-- 	connexion à la BDD -->
			<?php
				include("Common/Connexion.php");
		
		// verification des données entrées dans le formulaire
		// les blocs sont volontairement séparés visuellement puisqu'ils correspondent à 3 tables distinctes à alimenter
		
		if(null !==($_POST['libelle_espece']))
		{$libes = $_POST['libelle_espece'];}
		if(null !==($_POST['regime_espece']))
		{$reges = $_POST['regime_espece'];}
		
		if(null !==($_POST['libelle_race']))
		{$libra = $_POST['libelle_race'];}
		if(null !==($_POST['poids']))
		{$poids = $_POST['poids'];}
		if(null !==($_POST['petite_race']))
		{$petra = $_POST['petite_race'];}
		
		if(null !==($_POST['nom']))
		{$nom = $_POST['nom'];}
		if(null !==($_POST['sexe']))
		{$sexe = $_POST['sexe'];}
		if(null !==($_POST['datenaiss']))
		{$datna = $_POST['datenaiss'];}
		if(null !==($_POST['poids_animal']))
		{$pdsan = $_POST['poids_animal'];}
		if(null !==($_POST['historique']))
		{$histor = $_POST['historique'];}
		if(null !==($_POST['photo']))
		{$photo = $_POST["photo"];}
		
		
		// ici on commence par alimenter la table "Espece", l'ordre est important et doit être respecté compte tenu des contraintes de la base
			if(!empty($libes) && !empty($reges) )
				{
					$req=$bdd->prepare('INSERT INTO espece(LIBELLE_ESPECE, TYPE_REGIME_ESPECE) VALUES(:libelle_espece, :regime_espece)');
					$req->execute(array(
						'libelle_espece'=>$libes,
						'regime_espece'=>$reges
					));
				}
		// 		si la condition n'est pas respecté une fenêtre d'alerte s'ouvre indiquant l'erreur, et le navigateur reviens sur la page du formulaire grace à window.history.back()
					else{?><script language="javascript">
						       window.alert("Les informations n'ont pas été saisies correctement");
						       window.history.back();
							</script><?php;}
								
		// 		une fois les informations entrées dans la table Espece, on récupère le numéro espèce généré grâce à la requête suivante.
		// 		le programme étant lu en cascade, la position de cette requête est importante car si elle est située plus haut dans le code, elle ne pourra pas récupérer les informations nécessaires
				$q="SELECT NUM_ESPECE as ide FROM espece WHERE LIBELLE_ESPECE like '$libes'";
							$especes=$bdd->query($q);
							foreach ($especes as $espece)
							$espra = $espece['ide'] ;
									
		// 		on alimente ensuite là table Race qui dépend directement de la table Espèce
						
			if(!empty($libra)  )
				{
					$req=$bdd->prepare('INSERT INTO race(NUM_ESPECE, LIBELLE_RACE, POIDS_RACE_KG, PETITE_RACE) VALUES (:espra,:libelle_race, :poids, :petite_race)');
					$req->execute(array(
						'espra'=>$espra,
						'libelle_race'=>$libra,
						'poids'=>$poids,
						'petite_race'=>$petra
					));			
				}
				
		// 		à l'instar de ce que nous avons fait après l'inse
				$q="SELECT NUM_RACE as numr FROM race where LIBELLE_RACE like '$libra' ";
								$races=$bdd->query($q);
								foreach ($races as $race)
								$raani = $race['numr'] ;
						
		
		if(isset($nom) && isset($sexe) && isset($datna) && isset($pdsan) && isset($histor))
		{
			$req=$bdd->prepare('INSERT INTO animal(NUM_RACE, NOM_ANIMAL, SEXE_ANIMAL, DATE_NAISSANCE_ANIMAL, HISTORIQUE_ANIMAL, POIDS_ANIMAL_KG, CHEMIN_PHOTO) VALUES (:raani ,:nom, :sexe, :datenaiss, :historique, :poids_animal, :photo)');	
			$req->execute(array(
				'raani'=>$raani,
				'nom'=>$nom,
				'sexe'=>$sexe,
				'datenaiss'=>$datna,
				'historique'=>$histor,
				'poids_animal'=>$pdsan,
				'photo'=>$photo
			));
			}
		
		 ?>
		<main> 
		 	<p> Bravo ! Votre nouvel animal se trouve maintenant sur la page Animaux du site, voulez-vous en rentrer un nouveau ? <a href="Administration.php"> Oui </a> <a href="accueil.php"> Non </a></p>
		</main>
	</body>
</html>