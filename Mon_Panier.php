<!DOCTYPE html >
<html>
	<header> 
		<title> Mon Panier </title>
		<meta charset="UTF-8">
		<link rel="stylesheet" href="General.css">
	</header>
	
	<body>
		<main>
		<?php 
			include('Common/Connexion.php');
		?>
		
			<table id="tab_panier">
<!-- 					On commence par écrir les titres des colonnes du tableau -->
				<?php
				echo("<TR>" . "<TD> Billet </TD> " . "<TD> Prénom du possesseur </TD> " ." <TD > montant </TD> "."<TD> </TD>" ."</TR>");
				
// 				puis on va récupérer chaque tuples inscrits dans la table billet où l'ID client correspondant est celui du dernier enregistré
				$q="SELECT ID_BILLET, POSSESSEUR, MONTANT_TARIF FROM billet B INNER JOIN tarif T on B.ID_TARIF=T.ID_TARIF WHERE ID_CLIENT IN (SELECT MAX(ID_CLIENT) FROM billet) ";
				$billets=$bdd->query($q);
				foreach ($billets as $billet)
					echo("<TR>"."<TD>".$billet['ID_BILLET'] . " </TD>" . " <TD>". $billet['POSSESSEUR'] . " </TD> " . "<TD>" . $billet['MONTANT_TARIF'] . "</TD>" . "<TD> " . "€" ."</TD></TR>" );
				?>
				
				<tr>
					<td colspan="4">
<!-- 						On réalise une somme des montants des billets présents dans le tableau -->
					 <?php
						echo(" <b>La somme de vos achats s'élève à<b> ");
								
						$q="SELECT SUM(MONTANT_TARIF) as total from billet B INNER JOIN tarif T on B.ID_TARIF=T.ID_TARIF WHERE ID_CLIENT IN (SELECT MAX(ID_CLIENT) FROM billet)";
						$billets=$bdd->query($q);
						foreach($billets as $billet)
						echo($billet["total"]. " €");
					?>
					
					</td>
				</tr>
				<tr>
<!-- 					On invite l'utilisateur à retourner sur la page d'accueil -->
					<td colspan="4">
						Vous pouvez retourner à la page d'accueil en cliquant <a href="accueil.php" > ici </a>
					</td>	
				</tr>
			</table>
		</main>
	</body>
</html>