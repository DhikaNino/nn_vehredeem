
CREATE TABLE IF NOT EXISTS `nn_vehicleredeem` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `redeem_code` char(16) DEFAULT NULL,
  `vehicle_model` varchar(100) DEFAULT NULL,
  `admin` varchar(100) DEFAULT NULL,
  `claimed_by` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `redeem_code` (`redeem_code`)
);
