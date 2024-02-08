CREATE TABLE `farm_builder` (
  `id` int(12) NOT NULL,
  `job` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `position` longtext NOT NULL,
  `autres` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

ALTER TABLE `farm_builder`
  ADD PRIMARY KEY (`id`);

ALTER TABLE `farm_builder`
  MODIFY `id` int(12) NOT NULL AUTO_INCREMENT;
COMMIT;