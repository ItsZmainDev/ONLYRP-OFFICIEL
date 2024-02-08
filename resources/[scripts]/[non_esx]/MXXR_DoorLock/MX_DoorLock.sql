CREATE TABLE `mxdoorlock` (
  `name` varchar(25) DEFAULT NULL,
  `objectModel` varchar(18) DEFAULT NULL,
  `objectHeading` varchar(20) DEFAULT NULL,
  `objectCoords` varchar(80) DEFAULT NULL,
  `job` varchar(12) DEFAULT NULL,
  `job2` varchar(12) DEFAULT NULL,
  `locked` int(1) NOT NULL DEFAULT 0,
  `garagedoors` int(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;