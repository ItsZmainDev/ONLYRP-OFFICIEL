INSERT INTO `addon_account` (name, label, shared) VALUES
	('society_hayes', 'Hayes', 1)
;

INSERT INTO `datastore` (name, label, shared) VALUES
	('society_hayes', 'Hayes', 1)
;

INSERT INTO `addon_inventory` (name, label, shared) VALUES
	('society_hayes', 'Hayes', 1)
;

INSERT INTO `jobs` (name, label) VALUES
	('hayes', 'Hayes')
;

INSERT INTO `job_grades` (job_name, grade, name, label, salary, skin_male, skin_female) VALUES
	('hayes',0,'recrue','Recrue',12,'{}','{}'),
	('hayes',1,'novice','Novice',25,'{}','{}'),
	('hayes',2,'experimente','Experimente',36,'{}','{}'),
	('hayes',3,'assistant','Assistant',48,'{}','{}'),
  	('hayes',4,'boss','Patron',0,'{}','{}')
;

INSERT INTO `items` (`name`, `label`, `limit`, `rare`, `can_remove`) VALUES 
  ('kitcarro','Kit Carosserie',1,0,1),
  ('kitmoteur','Kit Moteur',1,0,1),
  ('crick','Crick',1,0,1),
  ('pince','Pince',1,0,1),
  ('pneu','Pneu',1,0,1),
  ('chiffon','Chiffon',1,0,1);