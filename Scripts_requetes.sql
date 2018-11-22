-- Requêtes utiles pour la page "Les Animaux" du site. Ces requêtes permettent d'afficher les 4 derniers animaux enregistrés dans la base --


-- La première requête affiche le dernier animal entré dans la base --
SELECT * FROM animal A INNER JOIN race R ON A.NUM_RACE=R.NUM_RACE INNER JOIN espece E ON R.NUM_ESPECE=E.NUM_ESPECE WHERE NUM_ANIMAL IN (SELECT MAX(NUM_ANIMAL) FROM animal

-- La seconde requête affiche l'avant dernier --
SELECT * FROM animal A INNER JOIN race R ON A.NUM_RACE=R.NUM_RACE INNER JOIN espece E ON R.NUM_ESPECE=E.NUM_ESPECE ORDER BY NUM_ANIMAL DESC LIMIT 1,1

-- L'avant avant dernier --
SELECT * FROM animal A INNER JOIN race R ON A.NUM_RACE=R.NUM_RACE INNER JOIN espece E ON R.NUM_ESPECE=E.NUM_ESPECE ORDER BY NUM_ANIMAL DESC LIMIT 2,1

-- Et enfin, celui en 4ème position --
SELECT * FROM animal A INNER JOIN race R ON A.NUM_RACE=R.NUM_RACE INNER JOIN espece E ON R.NUM_ESPECE=E.NUM_ESPECE ORDER BY NUM_ANIMAL DESC LIMIT 3,1


-- Ensuite, nous allons afficher les requêtes utilisées pour l'affichage du tableau des tarifs --

/*
Ici on souhaite que les montants affichés dans le tableau des tarifs soient indexés directement sur ceux saisis dans la base de donneés.
Ainsi, en cas de mise à jour des prix dans la bdd, le tableau affiché dans le site reste cohérent.
*/
SELECT MONTANT_TARIF FROM tarif WHERE ID_TARIF = 1

SELECT MONTANT_TARIF FROM tarif WHERE ID_TARIF = 2

-- Voici les requêtes utilisées dans les formulaires permettant de faire des menus déroulants --

SELECT * FROM tarif
/* Les données récupérées vont être interprétées par le php qui va nous permettre de réaliser un menu déroulant affichant les libellés des tarifs et prenant la valeur de l'id tarif correspondant*/
	
	
-- Ci dessous, les requêtes inhérentes à l'onglet "Mon Panier" --
-- Cette requête affiche tous les billets correspondant au dernier client enregistré dans la BDD -- 

SELECT ID_BILLET, POSSESSEUR, MONTANT_TARIF FROM billet B INNER JOIN tarif T on B.ID_TARIF=T.ID_TARIF WHERE ID_CLIENT IN (SELECT MAX(ID_CLIENT) FROM billet

-- Puis on va calculer le total que le client devra payer --

SELECT SUM(MONTANT_TARIF) as total from billet B INNER JOIN tarif T on B.ID_TARIF=T.ID_TARIF WHERE ID_CLIENT IN (SELECT MAX(ID_CLIENT) FROM billet


-- MEDE dans le processus d'insertion d'un animal --

-- La variable php $libes contient le libellé de l'espèce saisie, on demande donc le numéro correspondant --

SELECT NUM_ESPECE as ide FROM espece WHERE LIBELLE_ESPECE like '$libes'

-- On fait pareil pour la race -- 

SELECT NUM_RACE as numr FROM race where LIBELLE_RACE like '$libra'


