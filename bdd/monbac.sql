-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1
-- Généré le : mar. 14 mai 2024 à 14:40
-- Version du serveur : 10.4.32-MariaDB
-- Version de PHP : 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `monbac`
--

-- --------------------------------------------------------

--
-- Structure de la table `game`
--

CREATE TABLE `game` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL DEFAULT 'en attente',
  `mancheEnCours` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `game`
--

INSERT INTO `game` (`id`, `name`, `status`, `mancheEnCours`) VALUES
(7, 'Partie test', 'en attente', NULL),
(8, 'chamoyan', 'en attente', NULL),
(9, 'Naila', 'en attente', NULL),
(10, 'Moha', 'en attente', NULL),
(11, 'Ilyes', 'en attente', NULL),
(12, 'Moha', 'en attente', NULL),
(13, 'Samar', 'en attente', NULL);

-- --------------------------------------------------------

--
-- Structure de la table `information`
--

CREATE TABLE `information` (
  `id` int(11) NOT NULL,
  `prenomG` varchar(250) NOT NULL,
  `prenomF` varchar(250) NOT NULL,
  `villeOuPays` varchar(250) NOT NULL,
  `botanique` varchar(250) NOT NULL,
  `marque` varchar(250) NOT NULL,
  `metier` varchar(250) NOT NULL,
  `objets` varchar(250) NOT NULL,
  `animaux` varchar(250) NOT NULL,
  `manche` int(11) NOT NULL,
  `player` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `information`
--

INSERT INTO `information` (`id`, `prenomG`, `prenomF`, `villeOuPays`, `botanique`, `marque`, `metier`, `objets`, `animaux`, `manche`, `player`) VALUES
(1, 'YANIS', 'YANISSA', 'YEMEN', 'YUZU', 'YVES SAINT LAURENT', 'YOGA', 'YOYO', 'YORKSHIRE', 17, 5),
(2, 'yacine', 'yasmine', 'yemen', 'ylang', 'y', '', '', '', 17, 4),
(3, 'yanis', 'yasmina', 'yamen', 'yuzu', 'yamaha', '', '', '', 17, 10),
(4, 'Yalan', 'Yona', 'Yvelines', '', 'Yves Saint Laurent ', 'Yogaiste', 'Yoyo', '', 17, 6),
(5, 'Yassine', 'Yasmina', 'Yemen', '', 'Yamaha', '', 'Yaourt', '', 17, 8),
(6, 'Yohan', 'Yaël', 'Yemen', '', 'Yoplai', '', '', '', 17, 3),
(7, 'yanis', 'yona', 'yemen', '', 'yoko', '', 'yop ', 'yack', 17, 7),
(8, '', '', '', '', '', '', '', '', 18, 9),
(9, 'IBRAHIM', 'INES', 'ITALIE', 'IRIS', 'IKKS', 'INFORMATICIEN', 'IPHONE', 'IGUANE', 19, 5),
(10, 'ilan', 'ines', 'italie', '', '', '', '', '', 19, 4),
(11, 'Igor', 'Igora', 'Irlande', 'I', 'I', 'I', 'I', 'Iguane', 19, 6),
(12, 'ilyes', 'ines', 'iles maurices', '', '', 'i', 'Interrupteur', '', 19, 7),
(13, 'ilan', 'ilianan', 'ile morice', 'icaque ', 'ibm', 'informaticien', '', '', 19, 10),
(14, 'Igor', 'Ivanna', 'inde', '', '', 'Illustrateur', '', '', 19, 8),
(15, 'Ivan', 'Ilona', 'Italie', 'Iris', 'I', 'Ingénieur', 'Iphone', '', 19, 3),
(16, 'Walter', 'Wassila', 'Walonie', '', 'Wolvagen', 'wagonier', '', '', 20, 3),
(17, 'william', 'Waffa', 'Willonie', '', 'wondernana', 'wagonniste', 'will', '', 20, 9),
(18, 'wasim', 'wassila', 'wyoming', '', '', 'wagonnier', 'wagon', '', 20, 10),
(19, 'William', 'Wassila', 'Wakanda', 'Wasabi', 'Walmart', 'Wagonier', 'Weed', 'Wapiti', 20, 6),
(20, 'wassim', 'wassila', 'wolfsburg', 'wasabi', 'i', 'wagonniste', 'wagon', 'wapiti', 20, 7),
(21, 'William', 'Wassia', 'Washinghton', '', 'Warners bros', 'Web designer', 'Wagon', '', 20, 8),
(22, 'walter', 'wassila', 'wolsburg', 'weigelia', 'wolsagen', '', '', '', 20, 4),
(23, 'WALID', 'WASSILA', 'WALSBURG', '', 'WOLSWAGEN', 'WEB PLANNEUR', '', '', 20, 5),
(24, 'Léon', 'Léa', 'Letonie', 'L', '', '', '', '', 21, 3),
(25, 'leon', 'lina', 'luxembourg', '', '', '', '', '', 21, 10),
(26, 'Liam', 'Lola', 'Lituanie', 'L', '', '', '', '', 21, 9),
(27, 'Logan', 'Lily', 'Liechtenstein ', 'L', '', '', '', '', 21, 6),
(28, 'lamine', '', '', '', '', '', '', '', 21, 4),
(29, 'lassine', 'lalia', '', '', '', '', '', '', 21, 7),
(30, 'Liam', 'Léa', 'Lille', 'Liore', '', '', '', '', 21, 8),
(31, 'LORIS', 'LINDA', 'LONDRE', 'LAURIER', '', '', '', '', 21, 5),
(32, '', '', '', '', '', '', '', '', 22, 6),
(33, '', '', '', '', '', '', '', '', 22, 5),
(34, '', '', '', '', '', '', '', '', 22, 8),
(35, '', '', '', '', '', '', '', '', 22, 7),
(36, '', '', '', '', '', '', '', '', 22, 4),
(37, '', '', '', '', '', '', '', '', 22, 3),
(38, '', '', '', '', '', '', '', '', 22, 10),
(39, '', '', '', '', '', '', '', '', 22, 9),
(40, '', '', '', '', '', '', '', '', 23, 6),
(41, '', '', '', '', '', '', '', '', 24, 4),
(42, '', '', '', '', '', '', '', '', 24, 3),
(43, '', '', '', '', '', '', '', '', 24, 10),
(44, '', '', '', '', '', '', '', '', 24, 9),
(45, '', '', '', '', '', '', '', '', 24, 6),
(46, '', '', '', '', '', '', '', '', 24, 5),
(47, '', '', '', '', '', '', '', '', 24, 7),
(48, '', '', '', '', '', '', '', '', 27, 6),
(49, '', '', '', '', '', '', '', '', 27, 8),
(50, '', '', '', '', '', '', '', '', 27, 5),
(51, '', '', '', '', '', '', '', '', 27, 4),
(52, '', '', '', '', '', '', '', '', 27, 7),
(53, '', '', '', '', '', '', '', '', 27, 3),
(54, '', '', '', '', '', '', '', '', 27, 10),
(55, 'JEAN', 'JADE', 'JAMAIQUE', 'JUJUBIER', 'JORDAN', 'JURISTE', 'JAVELOT', 'JAGUAR', 29, 5),
(56, 'joan', 'joanne ', 'japon', '', 'jd', '', '', '', 29, 10),
(57, 'Joan', 'Julliette', 'Jordanie', '', 'Jordan', 'Jardinier', 'Jouet', 'Jaguar', 29, 8),
(58, 'jean', 'jasmine', '', 'juliette', 'jamal\'s', '', 'jade', 'jaguar', 29, 4),
(59, 'Jalil', 'Jalila', 'Jamaïque', 'J', 'J', 'Joaillier', 'Ja', 'Jaguar', 29, 6),
(60, 'Joan', 'Joana', 'Japon', 'Jade', 'jaqu', 'Judoka', 'jare', 'jibon', 29, 3),
(61, 'julien', 'julie', 'jordanie', 'jacques', 'jordan', 'joueur', 'jouet', '', 29, 7),
(62, 'Joan', 'Juliette', 'Jordanie', 'Ja', 'Jules', '', '', '', 29, 9),
(63, 'Sultan', 'Sultana', 'Saint etienne', 'Safran', 'Sega', 'Sage femme ', 'Souris', 'Souris', 30, 8),
(64, 'Soprano', 'Sophie', 'Sologne', 'S', 'Spiderman', 'Sar', 'Serpillère ', 'Serpent', 30, 6),
(65, 'SEBASATIEN', 'SERINE', 'SUISSE', 'S', 'SON', 'SAPEUR POMPIER', '', 'SOURIS', 30, 5),
(66, 'Sami', 'Samar', 'Suède', 'Salade', '', 'SaperPompier', '', '', 30, 9),
(67, 'Salim', 'Salima', 'Sibery', '', '', 'sapeur pompier', 'scie', 'serpent', 30, 3),
(68, 'salah', 'sandrine', 'syrie', '', 'sony', 'serveur', 'souris', 'souris', 30, 4),
(69, 'salim', 'sarah', 'slovenie', '', 's', 's', 'salopette', '', 30, 7),
(70, 'sacha', 'sacha', 'srilanka', 'sureau noir', 'samba', 'soudeur', 'soulier ', '', 30, 10),
(71, '', '', '', '', '', '', '', '', 31, 8),
(72, '', '', '', '', '', '', '', '', 31, 7),
(73, '', '', '', '', '', '', '', '', 31, 6),
(74, '', '', '', '', '', '', '', '', 31, 5),
(75, '', '', '', '', '', '', '', '', 31, 9),
(76, '', '', '', '', '', '', '', '', 31, 10),
(77, '', '', '', '', '', '', '', '', 31, 4),
(78, '', '', '', '', '', '', '', '', 31, 3);

-- --------------------------------------------------------

--
-- Structure de la table `manche`
--

CREATE TABLE `manche` (
  `id` int(11) NOT NULL,
  `lettre` varchar(1) NOT NULL,
  `debut` datetime NOT NULL DEFAULT current_timestamp(),
  `fin` datetime NOT NULL,
  `game` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `manche`
--

INSERT INTO `manche` (`id`, `lettre`, `debut`, `fin`, `game`) VALUES
(17, 'Y', '2024-05-14 14:24:54', '0000-00-00 00:00:00', 7),
(18, 'Z', '2024-05-14 14:28:21', '0000-00-00 00:00:00', 13),
(19, 'I', '2024-05-14 14:28:30', '0000-00-00 00:00:00', 7),
(20, 'W', '2024-05-14 14:30:47', '0000-00-00 00:00:00', 7),
(21, 'L', '2024-05-14 14:34:56', '0000-00-00 00:00:00', 7),
(22, 'Z', '2024-05-14 14:35:21', '0000-00-00 00:00:00', 7),
(23, 'A', '2024-05-14 14:35:23', '0000-00-00 00:00:00', 7),
(24, 'V', '2024-05-14 14:35:26', '0000-00-00 00:00:00', 7),
(25, 'A', '2024-05-14 14:35:29', '0000-00-00 00:00:00', 7),
(26, 'P', '2024-05-14 14:35:30', '0000-00-00 00:00:00', 7),
(27, 'I', '2024-05-14 14:35:30', '0000-00-00 00:00:00', 7),
(28, 'L', '2024-05-14 14:35:36', '0000-00-00 00:00:00', 7),
(29, 'J', '2024-05-14 14:35:36', '0000-00-00 00:00:00', 7),
(30, 'S', '2024-05-14 14:37:07', '0000-00-00 00:00:00', 7),
(31, 'H', '2024-05-14 14:38:35', '0000-00-00 00:00:00', 7);

-- --------------------------------------------------------

--
-- Structure de la table `participe`
--

CREATE TABLE `participe` (
  `id` int(11) NOT NULL,
  `game` int(11) NOT NULL,
  `player` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `participe`
--

INSERT INTO `participe` (`id`, `game`, `player`) VALUES
(10, 7, 3),
(15, 7, 4),
(11, 7, 5),
(13, 7, 6),
(14, 7, 7),
(12, 7, 8),
(18, 7, 9),
(16, 7, 10),
(8, 8, 4),
(9, 10, 6),
(17, 13, 9);

-- --------------------------------------------------------

--
-- Structure de la table `player`
--

CREATE TABLE `player` (
  `id` int(11) NOT NULL,
  `name` varchar(250) NOT NULL,
  `password` text NOT NULL,
  `avatar` longblob DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Déchargement des données de la table `player`
--

INSERT INTO `player` (`id`, `name`, `password`, `avatar`) VALUES
(3, 'joan', '$2y$10$2TNx6XH/hMJc7Fkc9Fonh..Af8dIqkkAObHh39So1/GrwX.F3pu9m', NULL),
(4, 'grigori', '$2y$10$nBmKwNeMwlaVuceXB934KOEwv2j3jy4jf5ZzQMxEDujTYRuSbw.A2', NULL),
(5, 'Nanou', '$2y$10$jhqcHmuXpgnVkFa6KLcVQucBoiv//TqRzJ1VGfLN9Rik4m5w19lw.', NULL),
(6, 'Moha', '$2y$10$Dn5ZHybicclzMA9JennvbubpJOdy5.NzSqe1ealGQIXVxtqCeaAL2', NULL),
(7, 'Ilyes', '$2y$10$aommpuv6YBwvQO0ZptfIrOaGJMGyVxUnH5cjO0PowLnl2wUthPQIO', NULL),
(8, 'Comoco75', '$2y$10$WkD.aEFoY1dKlrqSolQbaO/gKq0eAPZhXNSKSUKqPiqHf4Ucdu0he', NULL),
(9, 'SamarKS', '$2y$10$2boDQ5nh6GzFeeazcTzCw.5OM6MuGLaoCtPl.uPBeXT5AfvsIaCyu', NULL),
(10, 'Zoubairou', '$2y$10$QHFroa4Vow08GTlt0chQJ.ao5GZkdqxOzpcA/DbOC/vObKu7Og.ve', NULL);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `game`
--
ALTER TABLE `game`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_game_encours` (`mancheEnCours`);

--
-- Index pour la table `information`
--
ALTER TABLE `information`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_manche_info` (`manche`),
  ADD KEY `fk_player_info` (`player`);

--
-- Index pour la table `manche`
--
ALTER TABLE `manche`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_game_manche` (`game`);

--
-- Index pour la table `participe`
--
ALTER TABLE `participe`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `game` (`game`,`player`),
  ADD KEY `fk_player_game` (`player`);

--
-- Index pour la table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `game`
--
ALTER TABLE `game`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT pour la table `information`
--
ALTER TABLE `information`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=79;

--
-- AUTO_INCREMENT pour la table `manche`
--
ALTER TABLE `manche`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT pour la table `participe`
--
ALTER TABLE `participe`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT pour la table `player`
--
ALTER TABLE `player`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `game`
--
ALTER TABLE `game`
  ADD CONSTRAINT `fk_game_encours` FOREIGN KEY (`mancheEnCours`) REFERENCES `manche` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `information`
--
ALTER TABLE `information`
  ADD CONSTRAINT `fk_manche_info` FOREIGN KEY (`manche`) REFERENCES `manche` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_player_info` FOREIGN KEY (`player`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `manche`
--
ALTER TABLE `manche`
  ADD CONSTRAINT `fk_game_manche` FOREIGN KEY (`game`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Contraintes pour la table `participe`
--
ALTER TABLE `participe`
  ADD CONSTRAINT `fk_game_player` FOREIGN KEY (`game`) REFERENCES `game` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `fk_player_game` FOREIGN KEY (`player`) REFERENCES `player` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
