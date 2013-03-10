-- MySQL dump 10.13  Distrib 5.5.29, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: cyberstorm
-- ------------------------------------------------------
-- Server version	5.5.29-0ubuntu0.12.04.1

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
-- Current Database: `cyberstorm`
--

/*!40000 DROP DATABASE IF EXISTS `cyberstorm`*/;

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `cyberstorm` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `cyberstorm`;

--
-- Table structure for table `acl`
--

DROP TABLE IF EXISTS `acl`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `acl` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `password` varchar(50) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `acl_team_id` (`team_id`),
  CONSTRAINT `acl_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `acl`
--

LOCK TABLES `acl` WRITE;
/*!40000 ALTER TABLE `acl` DISABLE KEYS */;
INSERT INTO `acl` VALUES (1,1,'*E23149D4931DA6B3ED39B9F8228919EA20C55B18');
INSERT INTO `acl` VALUES (2,2,'*452E1F79E574CFF6CE1F67575B985550958F8E4E');
INSERT INTO `acl` VALUES (3,3,'*E2A6B02D26FA596F6B4905339924C99C667C93E7');
INSERT INTO `acl` VALUES (4,4,'*117DB67087A874F3B39A0BEF9953D19FE6194AEF');
INSERT INTO `acl` VALUES (5,5,'*B8A4AE2B88CD1C48A0C6A09724BFFDAFC6C07ADF');
INSERT INTO `acl` VALUES (6,6,'*CB79338570DC0D14ECF5507ADEB1FCBFF3F0B24B');
/*!40000 ALTER TABLE `acl` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `announcements`
--

DROP TABLE IF EXISTS `announcements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `announcements` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(250) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `duration` smallint(5) unsigned NOT NULL DEFAULT '30',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
/*!40000 ALTER TABLE `announcements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attack_types`
--

DROP TABLE IF EXISTS `attack_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attack_types` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('','NMAP') NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `sentinel` varchar(250) NOT NULL DEFAULT '',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attack_types`
--

LOCK TABLES `attack_types` WRITE;
/*!40000 ALTER TABLE `attack_types` DISABLE KEYS */;
/*!40000 ALTER TABLE `attack_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attacks`
--

DROP TABLE IF EXISTS `attacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attacks` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dest_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `type_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `attacks_source_id` (`source_id`),
  KEY `attacks_dest_id` (`dest_id`),
  KEY `attacks_type_id` (`type_id`),
  CONSTRAINT `attacks_source_id` FOREIGN KEY (`source_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attacks_dest_id` FOREIGN KEY (`dest_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attacks_type_id` FOREIGN KEY (`type_id`) REFERENCES `attack_types` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attacks`
--

LOCK TABLES `attacks` WRITE;
/*!40000 ALTER TABLE `attacks` DISABLE KEYS */;
/*!40000 ALTER TABLE `attacks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `challenges`
--

DROP TABLE IF EXISTS `challenges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `challenges` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `description` varchar(250) NOT NULL DEFAULT '',
  `points` smallint(5) unsigned NOT NULL DEFAULT '0',
  `timestamp_start` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `winner_id` smallint(5) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `challenges_winner_id` (`winner_id`),
  CONSTRAINT `challenges_winner_id` FOREIGN KEY (`winner_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
/*!40000 ALTER TABLE `challenges` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ips`
--

DROP TABLE IF EXISTS `ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ips` (
  `id` smallint(8) unsigned NOT NULL AUTO_INCREMENT,
  `ip` varchar(15) NOT NULL DEFAULT '',
  `team_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `timestamp_up` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp_down` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ips_team_id` (`team_id`),
  CONSTRAINT `ips_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
INSERT INTO `ips` VALUES (1,'127.0.0.1',1,NULL,NULL);
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `vm_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `service_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` varchar(250) NOT NULL DEFAULT '',
  `password` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `logins_team_id` (`team_id`),
  KEY `logins_vm_id` (`vm_id`),
  KEY `logins_service_id` (`service_id`),
  CONSTRAINT `logins_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `logins_vm_id` FOREIGN KEY (`vm_id`) REFERENCES `vms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `logins_service_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
/*!40000 ALTER TABLE `logins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nodes`
--

DROP TABLE IF EXISTS `nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `nodes` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `mac` varchar(17) NOT NULL DEFAULT '',
  `team_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `timestamp_up` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `timestamp_down` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `nodes_team_id` (`team_id`),
  CONSTRAINT `nodes_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
/*!40000 ALTER TABLE `nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `scores`
--

DROP TABLE IF EXISTS `scores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `scores` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `service_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `status` enum('','DOWN','UP','PWNED') NOT NULL DEFAULT '',
  `points` smallint(5) NOT NULL DEFAULT '0',
  `message` varchar(250) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `scores_team_id` (`team_id`),
  KEY `scores_service_id` (`service_id`),
  CONSTRAINT `scores_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scores_service_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `scores`
--

LOCK TABLES `scores` WRITE;
/*!40000 ALTER TABLE `scores` DISABLE KEYS */;
/*!40000 ALTER TABLE `scores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `services`
--

DROP TABLE IF EXISTS `services`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `services` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` enum('','HTTP','FTP','SSH','MYSQL') NOT NULL DEFAULT '',
  `port` smallint(5) unsigned NOT NULL DEFAULT '0',
  `vm_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `up` smallint(5) unsigned NOT NULL DEFAULT '0',
  `down` smallint(5) NOT NULL DEFAULT '0',
  `pwned` smallint(5) NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`),
  KEY `services_vm_id` (`vm_id`),
  CONSTRAINT `services_vm_id` FOREIGN KEY (`vm_id`) REFERENCES `vms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'HTTP',80,1,15,-5,-15,'Y');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teams`
--

DROP TABLE IF EXISTS `teams`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `teams` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL DEFAULT '',
  `color` enum('','RED','BLUE','GREEN','YELLOW','PURPLE','ORANGE') NOT NULL DEFAULT '',
  `switch_ip` varchar(15) NOT NULL DEFAULT '',
  `sentinel` varchar(250) NOT NULL DEFAULT '',
  `score` smallint(10) NOT NULL DEFAULT '0',
  `challenges` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'Anonymous','RED','10.0.0.2','',0,0,'Y');
INSERT INTO `teams` VALUES (2,'LulzSec','BLUE','10.1.0.2','',0,0,'Y');
INSERT INTO `teams` VALUES (3,'Milw0rm','GREEN','10.2.0.2','',0,0,'Y');
INSERT INTO `teams` VALUES (4,'P.H.I.R.M.','YELLOW','10.3.0.2','',0,0,'Y');
INSERT INTO `teams` VALUES (5,'L0pht','PURPLE','10.4.0.2','',0,0,'Y');
INSERT INTO `teams` VALUES (6,'NullCrew','ORANGE','10.5.0.2','',0,0,'Y');
/*!40000 ALTER TABLE `teams` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vms`
--

DROP TABLE IF EXISTS `vms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `vms` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL DEFAULT '',
  `ip` varchar(15) NOT NULL DEFAULT '',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms`
--

LOCK TABLES `vms` WRITE;
/*!40000 ALTER TABLE `vms` DISABLE KEYS */;
INSERT INTO `vms` VALUES (1,'OWASP1','0.30','Y');
/*!40000 ALTER TABLE `vms` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-03-07 17:17:02
