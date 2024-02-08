CREATE TABLE `licenses` (
	`type` varchar(60) NOT NULL,
	`label` varchar(60) NOT NULL,

	PRIMARY KEY (`type`)
);

INSERT INTO `licenses` (`type`, `label`) VALUES
('boat', 'Boat License'),
('dmv', 'Code de la route'),
('drive', 'Permis de conduire'),
('drive_bike', 'Permis moto'),
('drive_truck', 'Permis camion'),
('weapon', 'Permis de port d\'arme');
