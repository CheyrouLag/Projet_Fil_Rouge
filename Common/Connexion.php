	<?php try
		{
		$bdd= new pdo('mysql:host=localhost;dbname=Projet_Filrouge;charset=utf8','root','root');
		}
		catch (Exception $e)
		{
			die('Erreur : ' . $e->getMessage());
		}
	?>