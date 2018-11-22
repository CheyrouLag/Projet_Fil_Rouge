<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<link rel="stylesheet" type="text/css" href="General.css">
	<title></title>
</head>
	<body> 
	<?php 
		if(!empty($_POST['login'])){
		$log=$_POST['login'];
		}
		if(!empty($_POST['password'])){
		$pass=$_POST['password'];
		}
		
// 	grace à une condition, on vérifie si les identifiants correspondent, s'ils sont bon, le javascript s'execute et ouvre la page admin, sinon, une boite de dialogue affiche une erreur
		
		if (!empty($log) && !empty($pass) && $log=="admin" && $pass=="admin")
		{
	?>	 
			<script language="javascript">
		       window.open('Administration.php');
		       window.close();
			</script>
	<?php }
			
	else{?><script language="javascript">
		       window.alert("Les informations n'ont pas été saisies correctement");
		       window.history.back();
			</script><?php;}?>	
	</body>
</html>