# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.6.12)
# Database: miwu
# Generation Time: 2014-01-15 19:04:44 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table accessories
# ------------------------------------------------------------

DROP TABLE IF EXISTS `accessories`;

CREATE TABLE `accessories` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `acId` int(10) NOT NULL,
  `quality` tinyint(4) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table admin_LoginSummary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_LoginSummary`;

CREATE TABLE `admin_LoginSummary` (
  `playerId` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `month` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playerId`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table admin_MonthSummary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_MonthSummary`;

CREATE TABLE `admin_MonthSummary` (
  `date` int(10) unsigned NOT NULL,
  `au` int(10) unsigned NOT NULL,
  `pu` int(10) unsigned NOT NULL,
  `rmb` int(10) unsigned NOT NULL,
  `dollar` int(10) unsigned NOT NULL,
  `jpy` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table admin_News
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_News`;

CREATE TABLE `admin_News` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title_jp` varchar(255) COLLATE utf8_bin NOT NULL,
  `title_en` varchar(255) COLLATE utf8_bin NOT NULL,
  `title_zh` varchar(255) COLLATE utf8_bin NOT NULL,
  `content_jp` text COLLATE utf8_bin NOT NULL,
  `content_en` text COLLATE utf8_bin NOT NULL,
  `content_zh` text COLLATE utf8_bin NOT NULL,
  `isTop` tinyint(4) unsigned NOT NULL DEFAULT '0',
  `startTime` int(10) unsigned NOT NULL,
  `endTime` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table admin_Notice
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_Notice`;

CREATE TABLE `admin_Notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table admin_PlayerSummary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_PlayerSummary`;

CREATE TABLE `admin_PlayerSummary` (
  `date` int(10) unsigned NOT NULL,
  `week` int(10) unsigned NOT NULL,
  `month` int(10) unsigned NOT NULL,
  `rmb` decimal(10,2) unsigned NOT NULL,
  `dollar` decimal(10,2) unsigned NOT NULL,
  `jpy` decimal(10,2) unsigned NOT NULL,
  `dnu` int(10) unsigned NOT NULL,
  `dau` int(10) unsigned NOT NULL,
  `ydau` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `vip_today` int(10) unsigned NOT NULL,
  `vip_increase` int(10) unsigned NOT NULL,
  `vip_total` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table admin_Rank
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_Rank`;

CREATE TABLE `admin_Rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table admin_Recharge
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_Recharge`;

CREATE TABLE `admin_Recharge` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `date` int(10) unsigned NOT NULL,
  `playerId` int(10) unsigned NOT NULL,
  `week` int(10) unsigned NOT NULL,
  `month` int(10) unsigned NOT NULL,
  `rmb` decimal(10,2) NOT NULL,
  `dollar` decimal(10,2) NOT NULL,
  `jpy` decimal(10,2) NOT NULL,
  `product_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='3';



# Dump of table admin_Sales
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_Sales`;

CREATE TABLE `admin_Sales` (
  `date` int(10) unsigned NOT NULL,
  `cp_1` int(10) unsigned NOT NULL DEFAULT '0',
  `cp_6` int(10) unsigned NOT NULL DEFAULT '0',
  `cp_12` int(10) unsigned NOT NULL DEFAULT '0',
  `line` int(10) unsigned NOT NULL DEFAULT '0',
  `stone` int(10) unsigned NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table admin_UserSummary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_UserSummary`;

CREATE TABLE `admin_UserSummary` (
  `date` int(10) unsigned NOT NULL,
  `increase` int(10) unsigned NOT NULL,
  `register` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table admin_WeekSummary
# ------------------------------------------------------------

DROP TABLE IF EXISTS `admin_WeekSummary`;

CREATE TABLE `admin_WeekSummary` (
  `date` int(10) unsigned NOT NULL,
  `au` int(10) unsigned NOT NULL,
  `pu` int(10) unsigned NOT NULL,
  `rmb` int(10) unsigned NOT NULL,
  `dollar` int(10) unsigned NOT NULL,
  `jpy` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table arms
# ------------------------------------------------------------

DROP TABLE IF EXISTS `arms`;

CREATE TABLE `arms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `armId` int(10) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table device
# ------------------------------------------------------------

DROP TABLE IF EXISTS `device`;

CREATE TABLE `device` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `uid` varchar(255) COLLATE utf8_bin NOT NULL,
  `playerId` int(10) unsigned DEFAULT NULL,
  `token` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '' COMMENT '可用来给设备发送信息的token',
  `terminal` varchar(20) COLLATE utf8_bin DEFAULT '',
  `os` varchar(20) COLLATE utf8_bin DEFAULT '',
  `createTime` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table eUser
# ------------------------------------------------------------

DROP TABLE IF EXISTS `eUser`;

CREATE TABLE `eUser` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `errorCode` int(10) unsigned NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  `command` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`userId`,`errorCode`,`createTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table ItunesPaymentTransaction
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ItunesPaymentTransaction`;

CREATE TABLE `ItunesPaymentTransaction` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned DEFAULT NULL,
  `sns_id` varchar(64) COLLATE utf8_bin NOT NULL,
  `transaction_id` varchar(255) COLLATE utf8_bin NOT NULL,
  `transaction_status` int(10) unsigned NOT NULL,
  `product_id` varchar(45) COLLATE utf8_bin NOT NULL,
  `price` decimal(10,2) unsigned NOT NULL,
  `dollar` decimal(10,2) unsigned NOT NULL,
  `jpy` decimal(10,2) unsigned NOT NULL,
  `quantity` int(10) unsigned NOT NULL,
  `props` varchar(20) COLLATE utf8_bin NOT NULL,
  `integral` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  UNIQUE KEY `transaction_id` (`transaction_id`),
  KEY `sns_id` (`sns_id`),
  KEY `Index_4` (`createTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table login
# ------------------------------------------------------------

DROP TABLE IF EXISTS `login`;

CREATE TABLE `login` (
  `playerId` int(10) unsigned NOT NULL,
  `loginTime` int(10) unsigned NOT NULL DEFAULT '0',
  `duration` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table mail
# ------------------------------------------------------------

DROP TABLE IF EXISTS `mail`;

CREATE TABLE `mail` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `from` tinyint(4) NOT NULL,
  `desc` varchar(63) COLLATE utf8_bin NOT NULL,
  `gift` varchar(255) COLLATE utf8_bin NOT NULL,
  `isReceived` tinyint(4) NOT NULL DEFAULT '0',
  `receiveTime` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `playerId` (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table player
# ------------------------------------------------------------

DROP TABLE IF EXISTS `player`;

CREATE TABLE `player` (
  `playerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT '1',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `inviteCode` varchar(10) COLLATE utf8_bin DEFAULT '',
  `inviteCount` int(10) unsigned NOT NULL DEFAULT '0',
  `inviterId` int(10) unsigned DEFAULT NULL,
  `combats` int(10) unsigned NOT NULL DEFAULT '1' COMMENT '战斗力',
  `stars` int(10) unsigned DEFAULT '0',
  `ban` tinyint(4) NOT NULL DEFAULT '0',
  `createTime` int(10) NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playerId`),
  UNIQUE KEY `name` (`name`),
  KEY `inviteCode` (`inviteCode`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table point
# ------------------------------------------------------------

DROP TABLE IF EXISTS `point`;

CREATE TABLE `point` (
  `playerId` int(10) unsigned NOT NULL,
  `point` int(10) unsigned NOT NULL DEFAULT '0',
  `refreshTime` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table process
# ------------------------------------------------------------

DROP TABLE IF EXISTS `process`;

CREATE TABLE `process` (
  `processId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `stars` tinyint(1) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table props
# ------------------------------------------------------------

DROP TABLE IF EXISTS `props`;

CREATE TABLE `props` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `propsId` int(10) NOT NULL,
  `num` int(10) NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table skills
# ------------------------------------------------------------

DROP TABLE IF EXISTS `skills`;

CREATE TABLE `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `skillId` int(10) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;



# Dump of table weapons
# ------------------------------------------------------------

DROP TABLE IF EXISTS `weapons`;

CREATE TABLE `weapons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `weaponId` int(10) NOT NULL,
  `quality` tinyint(4) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
