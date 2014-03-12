-- MySQL dump 10.13  Distrib 5.5.32, for Linux (x86_64)
--
-- Host: localhost    Database: miwu
-- ------------------------------------------------------
-- Server version	5.5.32

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ItunesPaymentTransaction`
--

DROP TABLE IF EXISTS `ItunesPaymentTransaction`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ItunesPaymentTransaction`
--

LOCK TABLES `ItunesPaymentTransaction` WRITE;
/*!40000 ALTER TABLE `ItunesPaymentTransaction` DISABLE KEYS */;
/*!40000 ALTER TABLE `ItunesPaymentTransaction` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accessories`
--

DROP TABLE IF EXISTS `accessories`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accessories`
--

LOCK TABLES `accessories` WRITE;
/*!40000 ALTER TABLE `accessories` DISABLE KEYS */;
/*!40000 ALTER TABLE `accessories` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_LoginSummary`
--

DROP TABLE IF EXISTS `admin_LoginSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_LoginSummary` (
  `playerId` int(10) unsigned NOT NULL,
  `date` int(10) unsigned NOT NULL,
  `month` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playerId`,`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_LoginSummary`
--

LOCK TABLES `admin_LoginSummary` WRITE;
/*!40000 ALTER TABLE `admin_LoginSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_LoginSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_MonthSummary`
--

DROP TABLE IF EXISTS `admin_MonthSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_MonthSummary`
--

LOCK TABLES `admin_MonthSummary` WRITE;
/*!40000 ALTER TABLE `admin_MonthSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_MonthSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_News`
--

DROP TABLE IF EXISTS `admin_News`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_News`
--

LOCK TABLES `admin_News` WRITE;
/*!40000 ALTER TABLE `admin_News` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_News` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_Notice`
--

DROP TABLE IF EXISTS `admin_Notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_Notice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `time` int(10) unsigned NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL DEFAULT '',
  `count` int(10) unsigned NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_Notice`
--

LOCK TABLES `admin_Notice` WRITE;
/*!40000 ALTER TABLE `admin_Notice` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_Notice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_PlayerSummary`
--

DROP TABLE IF EXISTS `admin_PlayerSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_PlayerSummary`
--

LOCK TABLES `admin_PlayerSummary` WRITE;
/*!40000 ALTER TABLE `admin_PlayerSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_PlayerSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_Rank`
--

DROP TABLE IF EXISTS `admin_Rank`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_Rank` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `score` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned DEFAULT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_Rank`
--

LOCK TABLES `admin_Rank` WRITE;
/*!40000 ALTER TABLE `admin_Rank` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_Rank` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_Recharge`
--

DROP TABLE IF EXISTS `admin_Recharge`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_Recharge`
--

LOCK TABLES `admin_Recharge` WRITE;
/*!40000 ALTER TABLE `admin_Recharge` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_Recharge` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_Sales`
--

DROP TABLE IF EXISTS `admin_Sales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_Sales`
--

LOCK TABLES `admin_Sales` WRITE;
/*!40000 ALTER TABLE `admin_Sales` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_Sales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_UserSummary`
--

DROP TABLE IF EXISTS `admin_UserSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin_UserSummary` (
  `date` int(10) unsigned NOT NULL,
  `increase` int(10) unsigned NOT NULL,
  `register` int(10) unsigned NOT NULL,
  `total` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_UserSummary`
--

LOCK TABLES `admin_UserSummary` WRITE;
/*!40000 ALTER TABLE `admin_UserSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_UserSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin_WeekSummary`
--

DROP TABLE IF EXISTS `admin_WeekSummary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_WeekSummary`
--

LOCK TABLES `admin_WeekSummary` WRITE;
/*!40000 ALTER TABLE `admin_WeekSummary` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin_WeekSummary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `arms`
--

DROP TABLE IF EXISTS `arms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `arms` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `armId` int(10) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `arms`
--

LOCK TABLES `arms` WRITE;
/*!40000 ALTER TABLE `arms` DISABLE KEYS */;
/*!40000 ALTER TABLE `arms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `device`
--

DROP TABLE IF EXISTS `device`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `device`
--

LOCK TABLES `device` WRITE;
/*!40000 ALTER TABLE `device` DISABLE KEYS */;
/*!40000 ALTER TABLE `device` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `eUser`
--

DROP TABLE IF EXISTS `eUser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `eUser` (
  `userId` int(11) NOT NULL DEFAULT '0',
  `errorCode` int(10) unsigned NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL DEFAULT '0',
  `command` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`userId`,`errorCode`,`createTime`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `eUser`
--

LOCK TABLES `eUser` WRITE;
/*!40000 ALTER TABLE `eUser` DISABLE KEYS */;
/*!40000 ALTER TABLE `eUser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login` (
  `playerId` int(10) unsigned NOT NULL,
  `loginTime` int(10) unsigned NOT NULL DEFAULT '0',
  `duration` int(10) unsigned DEFAULT NULL,
  `total` int(10) unsigned DEFAULT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `mail`
--

DROP TABLE IF EXISTS `mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `mail`
--

LOCK TABLES `mail` WRITE;
/*!40000 ALTER TABLE `mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `player`
--

DROP TABLE IF EXISTS `player`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `player` (
  `playerId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(20) COLLATE utf8_bin NOT NULL,
  `level` int(10) unsigned NOT NULL DEFAULT '1',
  `score` int(10) unsigned NOT NULL DEFAULT '0',
  `coin` int(10) unsigned NOT NULL DEFAULT '0',
  `jewel` int(10) unsigned DEFAULT '0',
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `player`
--

LOCK TABLES `player` WRITE;
/*!40000 ALTER TABLE `player` DISABLE KEYS */;
/*!40000 ALTER TABLE `player` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `point`
--

DROP TABLE IF EXISTS `point`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `point` (
  `playerId` int(10) unsigned NOT NULL,
  `point` int(10) unsigned NOT NULL DEFAULT '0',
  `refreshTime` int(10) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`playerId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `point`
--

LOCK TABLES `point` WRITE;
/*!40000 ALTER TABLE `point` DISABLE KEYS */;
/*!40000 ALTER TABLE `point` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `process`
--

DROP TABLE IF EXISTS `process`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `process` (
  `processId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `level` int(10) unsigned NOT NULL,
  `stars` tinyint(1) unsigned NOT NULL,
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`processId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `process`
--

LOCK TABLES `process` WRITE;
/*!40000 ALTER TABLE `process` DISABLE KEYS */;
/*!40000 ALTER TABLE `process` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `props`
--

DROP TABLE IF EXISTS `props`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `props` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `propsId` int(10) NOT NULL,
  `num` int(10) NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `props`
--

LOCK TABLES `props` WRITE;
/*!40000 ALTER TABLE `props` DISABLE KEYS */;
/*!40000 ALTER TABLE `props` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `skills`
--

DROP TABLE IF EXISTS `skills`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `skills` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `skillId` int(10) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `skills`
--

LOCK TABLES `skills` WRITE;
/*!40000 ALTER TABLE `skills` DISABLE KEYS */;
/*!40000 ALTER TABLE `skills` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `weapons`
--

DROP TABLE IF EXISTS `weapons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `weapons` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `playerId` int(10) unsigned NOT NULL,
  `weaponId` int(10) NOT NULL,
  `quality` tinyint(4) NOT NULL,
  `level` int(10) NOT NULL DEFAULT '1',
  `isEquiped` tinyint(1) NOT NULL DEFAULT '0',
  `createTime` int(10) unsigned NOT NULL,
  `updateTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `weapons`
--

LOCK TABLES `weapons` WRITE;
/*!40000 ALTER TABLE `weapons` DISABLE KEYS */;
/*!40000 ALTER TABLE `weapons` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-03-12 16:40:58
