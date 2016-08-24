<?php

// Create table
$object -> sql_query("CREATE TABLE IF NOT EXISTS `usersprofile` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `HARDWARE_ID` int(11) NOT NULL,
  `PROFILENAME` varchar(255) DEFAULT NULL,
  `PROFILESIZE` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`,`HARDWARE_ID`)
)  ENGINE=INNODB ;");

?>
