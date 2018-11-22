-- phpMyAdmin SQL Dump
-- version 4.7.3
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:8889
-- Généré le :  Dim 01 avr. 2018 à 19:45
-- Version du serveur :  5.6.35
-- Version de PHP :  7.1.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";

--
-- Base de données :  `Projet_FilRouge`
--

-- --------------------------------------------------------

--
-- Structure de la table `activite`
--

CREATE TABLE `activite` (
  `ID_ACTIVITE` int(11) NOT NULL,
  `LIBELLE_ACTIVITE` varchar(50) NOT NULL,
  `CAPACITE_ACTIVITE` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `animal`
--

CREATE TABLE `animal` (
  `NUM_ANIMAL` int(11) NOT NULL,
  `NUM_RACE` int(11) NOT NULL,
  `NOM_ANIMAL` varchar(20) NOT NULL,
  `SEXE_ANIMAL` varchar(10) NOT NULL,
  `DATE_NAISSANCE_ANIMAL` date NOT NULL,
  `HISTORIQUE_ANIMAL` varchar(250) NOT NULL DEFAULT '',
  `DATE_DECES_ANIMAL` date DEFAULT NULL,
  `POIDS_ANIMAL_KG` decimal(8,0) NOT NULL,
  `CHEMIN_PHOTO` varchar(300) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `animal`
--

INSERT INTO `animal` (`NUM_ANIMAL`, `NUM_RACE`, `NOM_ANIMAL`, `SEXE_ANIMAL`, `DATE_NAISSANCE_ANIMAL`, `HISTORIQUE_ANIMAL`, `DATE_DECES_ANIMAL`, `POIDS_ANIMAL_KG`, `CHEMIN_PHOTO`) VALUES
(15, 16, 'Pipou', 'M', '2016-05-11', 'pipou est mignon', NULL, '120', 'photos animaux/Pipou.jpg'),
(16, 17, 'Michel', 'M', '2016-10-07', 'Michel est malicieu', NULL, '60', 'photos animaux/Michel.jpg'),
(17, 16, 'Ciriac', 'M', '2016-10-07', 'Ciriac aime le fromage', NULL, '90', 'photos animaux/Ciriac.jpg'),
(18, 19, 'Johnny', 'M', '2018-03-08', 'Johny est un agile tout droit venu des alpes suisses', NULL, '7', 'photos animaux/Johnny.jpg'),
(19, 20, 'Alexis', 'M', '2014-01-08', 'Alexis est notre nouveau petit Capybara de 90 kg. c\'est un rongeur sud américain, excellent nageur et rongeur. Il broute des végétaux en plongée et se reproduit en milieu aquatique comme terrestre. ', NULL, '90', 'photos animaux/Alexis.jpg'),
(21, 27, 'Jonathan', 'M', '2017-01-14', 'Jonathan est un joli petit singe à nez retroussé venu de Birmanie. du haut de ses 50 cm, il ne se laisse pas impressionné en société.', NULL, '0', 'photos animaux/Jonathan.jpeg'),
(22, 28, 'Aurélien', 'M', '2008-01-14', 'Aurélien est un majestueux nasique que l\'on reconnait par son grand nez imposant, il est originaire de Malaisie.', NULL, '34', 'photos animaux/Aurélien.jpg'),
(23, 29, 'Pierre-Yves', 'M', '2018-03-08', 'Pierre-yves est un jeune Moucheroll Royal. Cette race a pour particularité de vivre proche des criques et des rivières dans les forêts tropicales d\'Amérique du Sud', NULL, '0', 'photos animaux/PY.jpg'),
(31, 38, 'Serge', 'M', '2018-03-09', 'Serge aime les fleurs', NULL, '120', 'photos animaux/lama.jpg'),
(32, 16, 'Hervé', 'M', '2018-03-01', 'Hervé adore les lapins', NULL, '70', 'photos animaux/Ciriac.jpg');

--
-- Déclencheurs `animal`
--
DELIMITER $$
CREATE TRIGGER `before_insert_animal` BEFORE INSERT ON `animal` FOR EACH ROW BEGIN
if NEW.SEXE_ANIMAL is not null
    and NEW.SEXE_ANIMAL != 'M'
    and NEW.SEXE_ANIMAL !='F'
        then
        set NEW.SEXE_ANIMAL = null;
    end if;
if NEW.DATE_NAISSANCE_ANIMAL is not null
  and NEW.DATE_NAISSANCE_ANIMAL > CURRENT_DATE()
  then
  set NEW.DATE_NAISSANCE_ANIMAL = null;
  end if;
if NEW.DATE_DECES_ANIMAL is not null
  and NEW.DATE_DECES_ANIMAL < NEW.DATE_NAISSANCE_ANIMAL
  and NEW.DATE_DECES_ANIMAL > CURRENT_DATE() 
      then
      insert into Erreur (erreur) VALUES ('Erreur : La date de décès doit être supérieur à la date de naissance');
  end if;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_animal` BEFORE UPDATE ON `animal` FOR EACH ROW BEGIN
if NEW.SEXE_ANIMAL is not null
    and NEW.SEXE_ANIMAL != 'M'
    and NEW.SEXE_ANIMAL !='F'
        then
        set NEW.SEXE_ANIMAL = null;
    end if;
    
if NEW.DATE_NAISSANCE_ANIMAL is not null
  and NEW.DATE_NAISSANCE_ANIMAL > CURRENT_DATE()
  then
  set NEW.DATE_NAISSANCE_ANIMAL = null;
  end if;
  
if NEW.DATE_DECES_ANIMAL is not null
  and NEW.DATE_DECES_ANIMAL < NEW.DATE_NAISSANCE_ANIMAL
  and NEW.DATE_DECES_ANIMAL > CURRENT_DATE() 
      then
      insert into Erreur (erreur) VALUES ('Erreur : La date de décès doit être supérieur à la date de naissance');
  end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `a_lieu`
--

CREATE TABLE `a_lieu` (
  `ID_ACTIVITE` int(11) NOT NULL,
  `ID_PLANNING_ACTIVITE` int(11) NOT NULL,
  `DUREE_ACTIVITE` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `billet`
--

CREATE TABLE `billet` (
  `ID_BILLET` int(11) NOT NULL,
  `ID_TARIF` int(11) NOT NULL,
  `ID_CLIENT` int(11) NOT NULL,
  `POSSESSEUR` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `billet`
--

INSERT INTO `billet` (`ID_BILLET`, `ID_TARIF`, `ID_CLIENT`, `POSSESSEUR`) VALUES
(1, 1, 6, 'liboulus'),
(2, 1, 6, 'lepout'),
(3, 2, 6, 'restouipie'),
(4, 2, 6, 'restouipie'),
(5, 2, 6, 'biloute'),
(7, 1, 17, 'zef'),
(8, 1, 18, 'michel'),
(9, 1, 18, 'ginette'),
(10, 2, 18, 'pipou'),
(11, 2, 18, 'pipou'),
(12, 2, 18, 'pipou'),
(13, 2, 18, 'pipou'),
(14, 2, 18, 'pipou'),
(15, 2, 18, 'pipou'),
(16, 2, 18, 'pipou'),
(17, 2, 18, 'pipou'),
(18, 2, 18, 'pipou'),
(19, 2, 18, 'pipou'),
(20, 2, 23, 'ozijefiojef'),
(21, 2, 23, 'ozijefiojef'),
(22, 2, 23, 'ozijefiojef'),
(23, 2, 23, 'ozijefiojef'),
(24, 2, 23, 'ozijefiojef'),
(25, 2, 23, 'ozijefiojef'),
(26, 2, 23, 'ozijefiojef'),
(27, 2, 23, 'ozijefiojef'),
(28, 1, 23, 'oizeg'),
(29, 1, 23, 'zeogiog'),
(30, 2, 23, 'irgijg'),
(31, 1, 24, 'alexis'),
(32, 2, 24, 'jon'),
(33, 1, 25, 'Auérli'),
(34, 2, 25, 'garance'),
(35, 1, 25, 'Nathalie'),
(36, 1, 25, 'toto');

-- --------------------------------------------------------

--
-- Structure de la table `client`
--

CREATE TABLE `client` (
  `ID_CLIENT` int(11) NOT NULL,
  `NOM_CLIENT` varchar(50) NOT NULL,
  `PRENOM_CLIENT` varchar(40) NOT NULL,
  `DATE_NAISSANCE_CLIENT` date NOT NULL,
  `CP_CLIENT` char(5) NOT NULL,
  `VILLE_CLIENT` varchar(50) NOT NULL,
  `TELEPHONE_CLIENT` varchar(13) NOT NULL,
  `MAIL_CLIENT` varchar(50) NOT NULL,
  `TYPE_CLIENT` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `client`
--

INSERT INTO `client` (`ID_CLIENT`, `NOM_CLIENT`, `PRENOM_CLIENT`, `DATE_NAISSANCE_CLIENT`, `CP_CLIENT`, `VILLE_CLIENT`, `TELEPHONE_CLIENT`, `MAIL_CLIENT`, `TYPE_CLIENT`) VALUES
(1, 'Schellenberger', 'Alexis', '1996-01-21', '74583', 'Paugres', '7487387409', 'AlexLeBg@gmail.c', 'M'),
(2, 'Polnareff', 'Michel', '2001-01-23', '48463', 'Lyon', '+33673889907', 'Michou@gmail.com', 'M'),
(3, 'zefzefef', 'efzefzef', '2018-02-28', '34784', 'IJHEFIUJ', '9748637846', 'ojzefiohjfe@oijegioj.com', 'F'),
(4, 'zefzefef', 'efzefzef', '2018-02-28', '34784', 'IJHEFIUJ', '9748637846', 'ojzefiohjfe@oijegioj.com', 'F'),
(6, 'rgthj', 'effe', '2018-02-28', '\'\"§§', 'IJHEFIUJ', '8497864', 'erhiohjfe@oijegioj.com', 'F'),
(17, 'micou', 'albretine', '2012-06-07', '67483', 'Macon', '98749873', 'albertine@gmail.com', 'F'),
(18, 'Romatier', 'Pierre-Yves', '2018-03-06', '69007', 'Lyon', '+3398497947', 'PYking@gmail.com', 'M'),
(19, 'oijzeofijzef', 'ojezfoijef', '2018-02-28', '97494', 'LFIE', '988478374', 'ziejiegf@ihjzefij.com', 'M'),
(20, 'oijzeofijzef', 'ojezfoijef', '2018-02-28', '97494', 'LFIE', '988478374', 'ziejiegf@ihjzefij.com', 'M'),
(21, 'oijzeofijzef', 'ojezfoijef', '2018-02-28', '97494', 'LFIE', '988478374', 'ziejiegf@ihjzefij.com', 'M'),
(22, 'oijzeofijzef', 'ojezfoijef', '2018-02-28', '97494', 'LFIE', '988478374', 'ziejiegf@ihjzefij.com', 'M'),
(23, 'oijzeofijzef', 'ojezfoijef', '2018-02-28', '97494', 'LFIE', '988478374', 'ziejiegf@ihjzefij.com', 'M'),
(24, 'zegzeg', 'ezfzegzeg', '2018-03-08', '74947', 'Lyon', 'I7497494674', 'eiheizhf@gmail.com', 'M'),
(25, 'cheyrou-lagreze', 'Emmanuel', '0000-00-00', '74130', 'conatmine u', '', '', 'M');

--
-- Déclencheurs `client`
--
DELIMITER $$
CREATE TRIGGER `before_insert_client` BEFORE INSERT ON `client` FOR EACH ROW BEGIN
if NEW.TYPE_CLIENT is not null
    and NEW.TYPE_CLIENT != 'M'
    and NEW.TYPE_CLIENT !='F'
        then
        set NEW.TYPE_CLIENT = null;
    end if;
    
if NEW.DATE_NAISSANCE_CLIENT is not null
  and NEW.DATE_NAISSANCE_CLIENT > CURRENT_DATE()
  then
  set NEW.DATE_NAISSANCE_CLIENT = null;
  end if;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `before_update_client` BEFORE UPDATE ON `client` FOR EACH ROW BEGIN
if NEW.TYPE_CLIENT is not null
    and NEW.TYPE_CLIENT != 'M'
    and NEW.TYPE_CLIENT !='F'
        then
        set NEW.TYPE_CLIENT = null;
    end if;
    
if NEW.DATE_NAISSANCE_CLIENT is not null
  and NEW.DATE_NAISSANCE_CLIENT > CURRENT_DATE()
  then
  set NEW.DATE_NAISSANCE_CLIENT = null;
  end if;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Structure de la table `definit`
--

CREATE TABLE `definit` (
  `ID_ACTIVITE` int(11) NOT NULL,
  `ID_TARIF` int(11) NOT NULL,
  `NB_ACTIVITE_INSCRIPTION` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `erreur`
--

CREATE TABLE `erreur` (
  `id` int(10) UNSIGNED NOT NULL,
  `erreur` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `erreur`
--

INSERT INTO `erreur` (`id`, `erreur`) VALUES
(1, 'Erreur : La date de décès doit être supérieur à la date de naissance');

-- --------------------------------------------------------

--
-- Structure de la table `espece`
--

CREATE TABLE `espece` (
  `NUM_ESPECE` int(11) NOT NULL,
  `LIBELLE_ESPECE` varchar(20) NOT NULL,
  `TYPE_REGIME_ESPECE` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `espece`
--

INSERT INTO `espece` (`NUM_ESPECE`, `LIBELLE_ESPECE`, `TYPE_REGIME_ESPECE`) VALUES
(30, 'Felin', 'Carnivore'),
(31, 'Canidé', 'Carnivore'),
(33, 'Rapace', 'Carnivore'),
(34, 'Rongeur', 'Herbivore'),
(35, 'Primate', 'Herbivore'),
(43, 'Oiseau', 'Insectivore'),
(53, 'Lama', 'Herbivore');

-- --------------------------------------------------------

--
-- Structure de la table `planning_activite`
--

CREATE TABLE `planning_activite` (
  `ID_PLANNING_ACTIVITE` int(11) NOT NULL,
  `PLAGE_HORAIRE_ACTIVITE` varchar(20) NOT NULL,
  `DATE_PLANNING_ACTIVITE` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `race`
--

CREATE TABLE `race` (
  `NUM_RACE` int(11) NOT NULL,
  `NUM_ESPECE` int(11) NOT NULL,
  `LIBELLE_RACE` varchar(100) NOT NULL,
  `POIDS_RACE_KG` decimal(8,0) DEFAULT NULL,
  `PETITE_RACE` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `race`
--

INSERT INTO `race` (`NUM_RACE`, `NUM_ESPECE`, `LIBELLE_RACE`, `POIDS_RACE_KG`, `PETITE_RACE`) VALUES
(16, 30, 'Tigre', '0', 0),
(17, 31, 'Loup', '0', 0),
(19, 33, 'Aigle', '0', 0),
(20, 34, 'Capybara', '0', 0),
(27, 35, 'Singe à nez retroussé', '1', 1),
(28, 35, 'Nasique', '0', 0),
(29, 43, 'Moucheroll Royal', '1', 0),
(38, 53, 'Alpaga', '0', 0);

-- --------------------------------------------------------

--
-- Structure de la table `tarif`
--

CREATE TABLE `tarif` (
  `ID_TARIF` int(11) NOT NULL,
  `MONTANT_TARIF` decimal(8,0) NOT NULL,
  `LIBELLE_TARIF` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Déchargement des données de la table `tarif`
--

INSERT INTO `tarif` (`ID_TARIF`, `MONTANT_TARIF`, `LIBELLE_TARIF`) VALUES
(1, '10', 'Tarif normal'),
(2, '5', 'Tarif Reduit');

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `activite`
--
ALTER TABLE `activite`
  ADD PRIMARY KEY (`ID_ACTIVITE`),
  ADD UNIQUE KEY `ID_ACTIVITE` (`ID_ACTIVITE`);

--
-- Index pour la table `animal`
--
ALTER TABLE `animal`
  ADD PRIMARY KEY (`NUM_ANIMAL`),
  ADD UNIQUE KEY `NUM_ANIMAL` (`NUM_ANIMAL`),
  ADD KEY `FK_EST_DE_LA_FAMILLE_DES` (`NUM_RACE`);

--
-- Index pour la table `a_lieu`
--
ALTER TABLE `a_lieu`
  ADD PRIMARY KEY (`ID_ACTIVITE`,`ID_PLANNING_ACTIVITE`),
  ADD KEY `FK_A_LIEU2` (`ID_PLANNING_ACTIVITE`);

--
-- Index pour la table `billet`
--
ALTER TABLE `billet`
  ADD PRIMARY KEY (`ID_BILLET`),
  ADD UNIQUE KEY `ID_BILLET` (`ID_BILLET`),
  ADD KEY `FK_ACHETE` (`ID_CLIENT`),
  ADD KEY `FK_OBTIENT` (`ID_TARIF`);

--
-- Index pour la table `client`
--
ALTER TABLE `client`
  ADD PRIMARY KEY (`ID_CLIENT`),
  ADD UNIQUE KEY `ID_CLIENT` (`ID_CLIENT`);

--
-- Index pour la table `definit`
--
ALTER TABLE `definit`
  ADD PRIMARY KEY (`ID_ACTIVITE`,`ID_TARIF`),
  ADD KEY `FK_DEFINIT2` (`ID_TARIF`);

--
-- Index pour la table `erreur`
--
ALTER TABLE `erreur`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `erreur` (`erreur`);

--
-- Index pour la table `espece`
--
ALTER TABLE `espece`
  ADD PRIMARY KEY (`NUM_ESPECE`),
  ADD UNIQUE KEY `NUM_ESPECE` (`NUM_ESPECE`),
  ADD UNIQUE KEY `LIBELLE_ESPECE` (`LIBELLE_ESPECE`);

--
-- Index pour la table `planning_activite`
--
ALTER TABLE `planning_activite`
  ADD PRIMARY KEY (`ID_PLANNING_ACTIVITE`),
  ADD UNIQUE KEY `ID_PLANNING_ACTIVITE` (`ID_PLANNING_ACTIVITE`);

--
-- Index pour la table `race`
--
ALTER TABLE `race`
  ADD PRIMARY KEY (`NUM_RACE`),
  ADD UNIQUE KEY `NUM_RACE` (`NUM_RACE`),
  ADD UNIQUE KEY `LIBELLE_RACE` (`LIBELLE_RACE`),
  ADD KEY `FK_APPARTIENT` (`NUM_ESPECE`);

--
-- Index pour la table `tarif`
--
ALTER TABLE `tarif`
  ADD PRIMARY KEY (`ID_TARIF`),
  ADD UNIQUE KEY `ID_TARIF` (`ID_TARIF`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `activite`
--
ALTER TABLE `activite`
  MODIFY `ID_ACTIVITE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `animal`
--
ALTER TABLE `animal`
  MODIFY `NUM_ANIMAL` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT pour la table `billet`
--
ALTER TABLE `billet`
  MODIFY `ID_BILLET` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=37;
--
-- AUTO_INCREMENT pour la table `client`
--
ALTER TABLE `client`
  MODIFY `ID_CLIENT` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;
--
-- AUTO_INCREMENT pour la table `erreur`
--
ALTER TABLE `erreur`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT pour la table `espece`
--
ALTER TABLE `espece`
  MODIFY `NUM_ESPECE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;
--
-- AUTO_INCREMENT pour la table `planning_activite`
--
ALTER TABLE `planning_activite`
  MODIFY `ID_PLANNING_ACTIVITE` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT pour la table `race`
--
ALTER TABLE `race`
  MODIFY `NUM_RACE` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;
--
-- AUTO_INCREMENT pour la table `tarif`
--
ALTER TABLE `tarif`
  MODIFY `ID_TARIF` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `animal`
--
ALTER TABLE `animal`
  ADD CONSTRAINT `FK_EST_DE_LA_FAMILLE_DES` FOREIGN KEY (`NUM_RACE`) REFERENCES `race` (`NUM_RACE`);

--
-- Contraintes pour la table `a_lieu`
--
ALTER TABLE `a_lieu`
  ADD CONSTRAINT `FK_A_LIEU` FOREIGN KEY (`ID_ACTIVITE`) REFERENCES `activite` (`ID_ACTIVITE`),
  ADD CONSTRAINT `FK_A_LIEU2` FOREIGN KEY (`ID_PLANNING_ACTIVITE`) REFERENCES `planning_activite` (`ID_PLANNING_ACTIVITE`);

--
-- Contraintes pour la table `billet`
--
ALTER TABLE `billet`
  ADD CONSTRAINT `FK_ACHETE` FOREIGN KEY (`ID_CLIENT`) REFERENCES `client` (`ID_CLIENT`),
  ADD CONSTRAINT `FK_OBTIENT` FOREIGN KEY (`ID_TARIF`) REFERENCES `tarif` (`ID_TARIF`);

--
-- Contraintes pour la table `definit`
--
ALTER TABLE `definit`
  ADD CONSTRAINT `FK_DEFINIT` FOREIGN KEY (`ID_ACTIVITE`) REFERENCES `activite` (`ID_ACTIVITE`),
  ADD CONSTRAINT `FK_DEFINIT2` FOREIGN KEY (`ID_TARIF`) REFERENCES `tarif` (`ID_TARIF`);

--
-- Contraintes pour la table `race`
--
ALTER TABLE `race`
  ADD CONSTRAINT `FK_APPARTIENT` FOREIGN KEY (`NUM_ESPECE`) REFERENCES `espece` (`NUM_ESPECE`);
