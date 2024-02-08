SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

CREATE TABLE IF NOT EXISTS `owned_vehicles` (
	`owner` VARCHAR(60) NOT NULL,
	`plate` varchar(12) NOT NULL,
	`vehicle` longtext,
	PRIMARY KEY (`plate`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

ALTER TABLE `owned_vehicles` ADD COLUMN `vole` int(1) NOT NULL DEFAULT 0;

ALTER TABLE `owned_vehicles` ADD COLUMN `etat` int(1) NOT NULL DEFAULT 0;

ALTER TABLE `owned_vehicles` ADD COLUMN `nom` varchar(50) NOT NULL DEFAULT 'Sans Nom';

ALTER TABLE `owned_vehicles` ADD COLUMN `renamecar` varchar(20) DEFAULT NULL;