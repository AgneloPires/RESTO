-- phpMyAdmin SQL Dump
-- version 4.0.6deb1
-- http://www.phpmyadmin.net
--
-- Client: localhost
-- Généré le: Ven 25 Avril 2014 à 09:36
-- Version du serveur: 5.5.35-0ubuntu0.13.10.2
-- Version de PHP: 5.5.3-1ubuntu2.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de données: `bugs`
--

-- --------------------------------------------------------

--
-- Structure de la table `carte`
--

CREATE TABLE IF NOT EXISTS `carte` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_categorie` int(11) NOT NULL,
  `libelle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descriptif` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `prix_livraison` float NOT NULL,
  `prix_emporter` float NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_categorie` (`id_categorie`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Contenu de la table `carte`
--

INSERT INTO `carte` (`id`, `id_categorie`, `libelle`, `descriptif`, `prix_livraison`, `prix_emporter`, `url`) VALUES
(1, 1, 'sauterelles sautees', 'Sauterelles sautees dans du beurre', 5, 0, ''),
(2, 2, 'chenilles aux morilles', '', 10, 0, ''),
(3, 3, 'sorbet de fourmis', '', 6, 0, ''),
(4, 8, 'coca-cola', '', 3, 0, ''),
(5, 5, 'mojito', '', 8, 0, ''),
(6, 1, 'salade de chenilles', '', 7, 5, ''),
(7, 1, 'Libellules en pagaille', '', 6, 4, ''),
(8, 1, 'Mousse de larve', '', 5, 3, ''),
(9, 2, 'Sauterelles au whisky', '', 16, 13, 'source/img/sauterelle_sky.jpg'),
(10, 2, 'Boboun d''antenne', '', 13, 10, ''),
(11, 3, 'Croquant sautant', '', 8, 6, ''),
(12, 3, 'Chenille flottante', '', 7, 5, '');

-- --------------------------------------------------------

--
-- Structure de la table `categorie`
--

CREATE TABLE IF NOT EXISTS `categorie` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_parent` int(11) DEFAULT NULL,
  `libelle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_boisson` (`id_parent`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=9 ;

--
-- Contenu de la table `categorie`
--

INSERT INTO `categorie` (`id`, `id_parent`, `libelle`) VALUES
(1, NULL, 'entree'),
(2, NULL, 'plat'),
(3, NULL, 'dessert'),
(4, NULL, 'boisson'),
(5, 4, 'cocktail'),
(6, 4, 'vin'),
(7, 4, 'biere'),
(8, 4, 'soda');

-- --------------------------------------------------------

--
-- Structure de la table `commande`
--

CREATE TABLE IF NOT EXISTS `commande` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_user` int(4) NOT NULL,
  `id_reduction` int(10) NOT NULL,
  `adresse` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `commentaire` varchar(4096) COLLATE utf8_unicode_ci NOT NULL,
  `date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `prix` float NOT NULL,
  `emporter` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`),
  KEY `id_reduction` (`id_reduction`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `composer`
--

CREATE TABLE IF NOT EXISTS `composer` (
  `id_menu` int(4) NOT NULL,
  `id_carte` int(4) NOT NULL,
  PRIMARY KEY (`id_carte`,`id_menu`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contenu de la table `composer`
--

INSERT INTO `composer` (`id_menu`, `id_carte`) VALUES
(1, 1),
(1, 2),
(1, 3),
(1, 8),
(1, 10),
(1, 12),
(2, 6),
(2, 7),
(2, 9),
(2, 10),
(2, 11),
(2, 12);

-- --------------------------------------------------------

--
-- Structure de la table `descriptif`
--

CREATE TABLE IF NOT EXISTS `descriptif` (
  `id_commande` int(4) NOT NULL,
  `id_carte` int(4) NOT NULL,
  `id_menu` int(4) NOT NULL,
  `quantite` int(4) NOT NULL,
  PRIMARY KEY (`id_commande`,`id_carte`,`id_menu`),
  KEY `id_carte` (`id_carte`),
  KEY `id_menu` (`id_menu`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `livre`
--

CREATE TABLE IF NOT EXISTS `livre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_user` int(11) NOT NULL,
  `comment` varchar(4096) COLLATE utf8_unicode_ci NOT NULL,
  `date_comment` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `livre`
--

INSERT INTO `livre` (`id`, `id_user`, `comment`, `date_comment`) VALUES
(2, 404, 'coucou', '2014-04-24 08:10:41');

-- --------------------------------------------------------

--
-- Structure de la table `menu`
--

CREATE TABLE IF NOT EXISTS `menu` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `descriptif` varchar(500) COLLATE utf8_unicode_ci NOT NULL,
  `prix_livraison` float NOT NULL,
  `prix_emporter` float NOT NULL,
  `url` varchar(200) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Contenu de la table `menu`
--

INSERT INTO `menu` (`id`, `libelle`, `descriptif`, `prix_livraison`, `prix_emporter`, `url`) VALUES
(1, 'Menu bugz spicy', '', 20, 15, ''),
(2, 'Menu 1001 pattes', '', 22, 17, '');

-- --------------------------------------------------------

--
-- Structure de la table `reduction`
--

CREATE TABLE IF NOT EXISTS `reduction` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `code` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `pourcentage` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Contenu de la table `reduction`
--

INSERT INTO `reduction` (`id`, `code`, `pourcentage`) VALUES
(1, 'AAAAA', 5);

-- --------------------------------------------------------

--
-- Structure de la table `reservation`
--

CREATE TABLE IF NOT EXISTS `reservation` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `id_user` int(4) NOT NULL,
  `id_service` int(4) NOT NULL,
  `date` datetime NOT NULL,
  `couvert` int(3) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `id_user` (`id_user`,`id_service`),
  KEY `id_service` (`id_service`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `reserver`
--

CREATE TABLE IF NOT EXISTS `reserver` (
  `id_table` int(4) NOT NULL,
  `id_reservation` int(4) NOT NULL,
  PRIMARY KEY (`id_table`,`id_reservation`),
  KEY `id_reservation` (`id_reservation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Structure de la table `service`
--

CREATE TABLE IF NOT EXISTS `service` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `libelle` varchar(20) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `table`
--

CREATE TABLE IF NOT EXISTS `table` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `code` varchar(4) COLLATE utf8_unicode_ci NOT NULL,
  `capacite` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `id` int(4) NOT NULL AUTO_INCREMENT,
  `login` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `prenom` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `nom` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `tel` varchar(10) COLLATE utf8_unicode_ci NOT NULL,
  `adresse` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `cp` int(5) NOT NULL,
  `ville` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `mail` varchar(100) COLLATE utf8_unicode_ci NOT NULL,
  `societe` varchar(50) COLLATE utf8_unicode_ci NOT NULL,
  `pass` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `point` int(4) NOT NULL,
  `admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `login` (`login`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=405 ;

--
-- Contenu de la table `user`
--

INSERT INTO `user` (`id`, `login`, `prenom`, `nom`, `tel`, `adresse`, `cp`, `ville`, `mail`, `societe`, `pass`, `point`, `admin`) VALUES
(1, 'mojho', 'Carlos', 'Rodrigues', '0000000000', '20 rue tartanpion', 91222, 'Chourtres', 'blabla@cloche.com', '', '1234', 35, 1),
(404, 'client anonyme', '', '', '', '', 0, '', '', '', '', 0, 0);

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `carte`
--
ALTER TABLE `carte`
  ADD CONSTRAINT `carte_ibfk_1` FOREIGN KEY (`id_categorie`) REFERENCES `categorie` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `commande`
--
ALTER TABLE `commande`
  ADD CONSTRAINT `commande_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `commande_ibfk_2` FOREIGN KEY (`id_reduction`) REFERENCES `reduction` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `composer`
--
ALTER TABLE `composer`
  ADD CONSTRAINT `composer_ibfk_1` FOREIGN KEY (`id_carte`) REFERENCES `carte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `composer_ibfk_2` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `descriptif`
--
ALTER TABLE `descriptif`
  ADD CONSTRAINT `descriptif_ibfk_1` FOREIGN KEY (`id_commande`) REFERENCES `commande` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `descriptif_ibfk_2` FOREIGN KEY (`id_carte`) REFERENCES `carte` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `descriptif_ibfk_3` FOREIGN KEY (`id_menu`) REFERENCES `menu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `livre`
--
ALTER TABLE `livre`
  ADD CONSTRAINT `livre_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reservation`
--
ALTER TABLE `reservation`
  ADD CONSTRAINT `reservation_ibfk_1` FOREIGN KEY (`id_user`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reservation_ibfk_2` FOREIGN KEY (`id_service`) REFERENCES `service` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `reserver`
--
ALTER TABLE `reserver`
  ADD CONSTRAINT `reserver_ibfk_1` FOREIGN KEY (`id_table`) REFERENCES `table` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `reserver_ibfk_2` FOREIGN KEY (`id_reservation`) REFERENCES `reservation` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
