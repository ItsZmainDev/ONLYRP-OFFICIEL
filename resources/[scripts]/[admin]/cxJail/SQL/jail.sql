CREATE TABLE `jails` (
	`playerId` INT(11) NULL DEFAULT '0',
	`identifier` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci',
	`time` INT(11) NULL DEFAULT NULL,
	`staffName` VARCHAR(50) NULL DEFAULT NULL COLLATE 'utf8mb4_general_ci'
)
COLLATE='utf8mb4_general_ci'
ENGINE=InnoDB
;
