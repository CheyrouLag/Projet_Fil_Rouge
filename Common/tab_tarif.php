<table id="tab_tarif">
			<tr>
				<td> tarif Adulte </td>
				<td> tarif Enfant </td>
			</tr>
			<tr>
				<td> <?php  
				$q="SELECT MONTANT_TARIF FROM tarif WHERE ID_TARIF = 1";
				$tarifs=$bdd->query($q);
				foreach ($tarifs as $tarif)
				echo($tarif['MONTANT_TARIF'] . " €");
							
				
			?>  </td>
				<td> <?php
				$q="SELECT MONTANT_TARIF FROM tarif WHERE ID_TARIF = 2";
				$tarifs=$bdd->query($q);
				foreach ($tarifs as $tarif)
				echo($tarif['MONTANT_TARIF'] . " €");?> </td>
			</tr>
</table>