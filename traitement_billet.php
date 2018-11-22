<!DOTCYPE html >
<html>
	<header> 
		<title> Prise de billets </title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="General.css">
	</header>
	<body>
		
		<?php 
			include('Common/Connexion.php');		
// 	on cherche l'identifiant du dernier client enregistré
			$reponse = $bdd->query('SELECT ID_CLIENT FROM client ORDER BY ID_CLIENT DESC LIMIT 1');
 
			while ($donnees = $reponse->fetch())
			{
				$id_client = $donnees['ID_CLIENT'] ;
			}
			$reponse->closeCursor();
			
// 	Puis on récupère les informations saisies dans le formulaire 
			if (ISSET($_POST['possesseur'])){
				$pb = $_POST['possesseur'];
			}
			if (isset($_POST['tarif'])){
				$tarif = $_POST['tarif'];
			}
// 	On inscrit les informations dans la BDD
			if(isset($id_client) && isset($pb) && isset($tarif)){
				$req = $bdd->prepare('INSERT INTO billet ( ID_TARIF, ID_CLIENT, POSSESSEUR) VALUES (:id_tarif,:id_client, :possesseur_billet)');
				
				$req->execute(array(
					'id_tarif'=>$tarif,
					'id_client'=> $id_client,
					'possesseur_billet'=>$pb
				));
			}
		?>	
		
				
		<main>
			<div id="title"><p> vous pouvez prendre un autre billet ou consulter votre panier  </p></div>
		
<!-- 		on affiche le tableau des tarif -->
			<?php include('Common/tab_tarif.php')?>
				
<!-- 				On prépare une requette permettant d'afficher les libellés des tarifs dans une liste déroulante du formulaire -->
					<?php $query = $bdd->prepare("SELECT * FROM tarif");
					$query->execute();
					$tarif = $query->fetchAll();?>
			
				<form method="POST" action="traitement_billet.php" class="form" id="billet" >
						
						<p><label>Quel est le nom du possesseur du billet? </label> <input type="text" name="possesseur" id="textfield"></p>
						<label> sélectionner le tarif </label>
								<select name='tarif'>
<!-- 		Puis on intègre les informations de la requête dans la liste déroulante -->
								<?php if($tarif): ?>
								 <?php foreach($tarif as $t):?> 
											<option value = "<?= $t['ID_TARIF'] ?>" name="tarif"><?= $t['LIBELLE_TARIF'] ?></option>
								 <?php endforeach; ?>
								 <?endif; ?>
								</select>
						<p><input type="submit" value ="valider"></p>
				</form>
			<div id="contenu_important"><p> -----> Consulter <a href="Mon_Panier.php"> Mon Panier </a></p></div>
		</main>
	</body>
</html>