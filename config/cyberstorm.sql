-- MySQL dump 10.13  Distrib 5.5.31, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: cyberstorm
-- ------------------------------------------------------
-- Server version	5.5.31-0ubuntu0.12.04.1

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
INSERT INTO `acl` VALUES (1,1,'*14C0E0E3676FF56D27AEEDF53A212EA67B63DB77');
INSERT INTO `acl` VALUES (2,2,'*549946B87E35711AC2DD79A18C8A9FF05026066A');
INSERT INTO `acl` VALUES (3,3,'*CB784E1979C6B1D5C36C8332E13D73C493AE804B');
INSERT INTO `acl` VALUES (4,4,'*D44BBF6DA5586562FB4A16D4019EA704DC9CFC0B');
INSERT INTO `acl` VALUES (5,5,'*9DE88FE59A385D7AC8F8F0CD1F373D75AF7D055F');
INSERT INTO `acl` VALUES (6,6,'*CBA7C6E6A9B84E10601164ABC88B3304422D88C0');
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
-- Table structure for table `attacks`
--

DROP TABLE IF EXISTS `attacks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attacks` (
  `id` smallint(10) unsigned NOT NULL AUTO_INCREMENT,
  `source_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `dest_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  KEY `attacks_source_id` (`source_id`),
  KEY `attacks_dest_id` (`dest_id`),
  CONSTRAINT `attacks_dest_id` FOREIGN KEY (`dest_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `attacks_source_id` FOREIGN KEY (`source_id`) REFERENCES `nodes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
INSERT INTO `ips` VALUES (1,'127.0.0.1',7,'2013-03-10 01:54:08',NULL);
INSERT INTO `ips` VALUES (2,'138.47.158.106',6,'2013-05-08 19:38:20',NULL);
/*!40000 ALTER TABLE `ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `log`
--

DROP TABLE IF EXISTS `log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `log` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `message` varchar(250) NOT NULL DEFAULT '',
  `timestamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
/*!40000 ALTER TABLE `log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logins`
--

DROP TABLE IF EXISTS `logins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `logins` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `team_vm_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `service_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `username` varchar(250) NOT NULL DEFAULT '',
  `password` varchar(250) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `logins_team_vm_id` (`team_vm_id`),
  KEY `logins_service_id` (`service_id`),
  CONSTRAINT `logins_team_vm_id` FOREIGN KEY (`team_vm_id`) REFERENCES `team_vms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `logins_service_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=43 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logins`
--

LOCK TABLES `logins` WRITE;
/*!40000 ALTER TABLE `logins` DISABLE KEYS */;
INSERT INTO `logins` VALUES (1,1,2,'ares','ares');
INSERT INTO `logins` VALUES (2,1,3,'ares','ares');
INSERT INTO `logins` VALUES (3,1,4,'ares','ares');
INSERT INTO `logins` VALUES (4,2,2,'ares','ares');
INSERT INTO `logins` VALUES (5,2,3,'ares','ares');
INSERT INTO `logins` VALUES (6,3,2,'ares','ares');
INSERT INTO `logins` VALUES (7,3,3,'ares','ares');
INSERT INTO `logins` VALUES (8,4,2,'chaos','chaos');
INSERT INTO `logins` VALUES (9,4,3,'chaos','chaos');
INSERT INTO `logins` VALUES (10,4,4,'chaos','chaos');
INSERT INTO `logins` VALUES (11,5,2,'chaos','chaos');
INSERT INTO `logins` VALUES (12,5,3,'chaos','chaos');
INSERT INTO `logins` VALUES (13,6,2,'chaos','chaos');
INSERT INTO `logins` VALUES (14,6,3,'chaos','chaos');
INSERT INTO `logins` VALUES (15,7,2,'hera','hera');
INSERT INTO `logins` VALUES (16,7,3,'hera','hera');
INSERT INTO `logins` VALUES (17,7,4,'hera','hera');
INSERT INTO `logins` VALUES (18,8,2,'hera','hera');
INSERT INTO `logins` VALUES (19,8,3,'hera','hera');
INSERT INTO `logins` VALUES (20,9,2,'hera','hera');
INSERT INTO `logins` VALUES (21,9,3,'hera','hera');
INSERT INTO `logins` VALUES (22,10,2,'hermes','hermes');
INSERT INTO `logins` VALUES (23,10,3,'hermes','hermes');
INSERT INTO `logins` VALUES (24,10,4,'hermes','hermes');
INSERT INTO `logins` VALUES (25,11,2,'hermes','hermes');
INSERT INTO `logins` VALUES (26,11,3,'hermes','hermes');
INSERT INTO `logins` VALUES (27,12,2,'hermes','hermes');
INSERT INTO `logins` VALUES (28,12,3,'hermes','hermes');
INSERT INTO `logins` VALUES (29,13,2,'nyx','nyx');
INSERT INTO `logins` VALUES (30,13,3,'nyx','nyx');
INSERT INTO `logins` VALUES (31,13,4,'nyx','nyx');
INSERT INTO `logins` VALUES (32,14,2,'nyx','nyx');
INSERT INTO `logins` VALUES (33,14,3,'nyx','nyx');
INSERT INTO `logins` VALUES (34,15,2,'nyx','nyx');
INSERT INTO `logins` VALUES (35,15,3,'nyx','nyx');
INSERT INTO `logins` VALUES (36,16,2,'zeus','zeus');
INSERT INTO `logins` VALUES (37,16,3,'zeus','zeus');
INSERT INTO `logins` VALUES (38,16,4,'zeus','zeus');
INSERT INTO `logins` VALUES (39,17,2,'zeus','zeus');
INSERT INTO `logins` VALUES (40,17,3,'zeus','zeus');
INSERT INTO `logins` VALUES (41,18,2,'zeus','zeus');
INSERT INTO `logins` VALUES (42,18,3,'zeus','zeus');
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
  CONSTRAINT `scores_service_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `scores_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
  `up` smallint(5) unsigned NOT NULL DEFAULT '0',
  `down` smallint(5) NOT NULL DEFAULT '0',
  `pwned` smallint(5) NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `services`
--

LOCK TABLES `services` WRITE;
/*!40000 ALTER TABLE `services` DISABLE KEYS */;
INSERT INTO `services` VALUES (1,'HTTP',80,15,-5,-15,'Y');
INSERT INTO `services` VALUES (2,'SSH',22,15,-5,-15,'Y');
INSERT INTO `services` VALUES (3,'FTP',21,15,-5,-15,'Y');
INSERT INTO `services` VALUES (4,'MYSQL',3306,15,-5,-15,'Y');
/*!40000 ALTER TABLE `services` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `team_vms`
--

DROP TABLE IF EXISTS `team_vms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `team_vms` (
  `id` smallint(5) unsigned NOT NULL AUTO_INCREMENT,
  `team_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `vm_id` smallint(5) unsigned NOT NULL DEFAULT '0',
  `ip` varchar(15) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`),
  KEY `team_vms_team_id` (`team_id`),
  KEY `team_vms_vm_id` (`vm_id`),
  CONSTRAINT `team_vms_team_id` FOREIGN KEY (`team_id`) REFERENCES `teams` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `team_vms_vm_id` FOREIGN KEY (`vm_id`) REFERENCES `vms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `team_vms`
--

LOCK TABLES `team_vms` WRITE;
/*!40000 ALTER TABLE `team_vms` DISABLE KEYS */;
INSERT INTO `team_vms` VALUES (1,1,1,'10.1.122.43');
INSERT INTO `team_vms` VALUES (2,1,2,'10.1.47.101');
INSERT INTO `team_vms` VALUES (3,1,3,'10.1.209.95');
INSERT INTO `team_vms` VALUES (4,2,1,'10.2.122.43');
INSERT INTO `team_vms` VALUES (5,2,2,'10.2.47.101');
INSERT INTO `team_vms` VALUES (6,2,3,'10.2.209.95');
INSERT INTO `team_vms` VALUES (7,3,1,'10.3.122.43');
INSERT INTO `team_vms` VALUES (8,3,2,'10.3.47.101');
INSERT INTO `team_vms` VALUES (9,3,3,'10.3.209.95');
INSERT INTO `team_vms` VALUES (10,4,1,'10.4.122.43');
INSERT INTO `team_vms` VALUES (11,4,2,'10.4.47.101');
INSERT INTO `team_vms` VALUES (12,4,3,'10.4.209.95');
INSERT INTO `team_vms` VALUES (13,5,1,'10.5.122.43');
INSERT INTO `team_vms` VALUES (14,5,2,'10.5.47.101');
INSERT INTO `team_vms` VALUES (15,5,3,'10.5.209.95');
INSERT INTO `team_vms` VALUES (16,6,1,'10.6.122.43');
INSERT INTO `team_vms` VALUES (17,6,2,'10.6.47.101');
INSERT INTO `team_vms` VALUES (18,6,3,'10.6.209.95');
/*!40000 ALTER TABLE `team_vms` ENABLE KEYS */;
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
  `color` enum('WHITE','BLACK','RED','BLUE','GREEN','YELLOW','PURPLE','ORANGE') NOT NULL,
  `switch_ip` varchar(15) NOT NULL DEFAULT '',
  `uplink_port` varchar(3) NOT NULL DEFAULT '',
  `sentinel` varchar(250) NOT NULL DEFAULT '',
  `score` smallint(10) NOT NULL DEFAULT '0',
  `challenges` smallint(5) unsigned NOT NULL DEFAULT '0',
  `enabled` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teams`
--

LOCK TABLES `teams` WRITE;
/*!40000 ALTER TABLE `teams` DISABLE KEYS */;
INSERT INTO `teams` VALUES (1,'ARES','RED','10.1.0.2','','',0,0,'Y');
INSERT INTO `teams` VALUES (2,'CHAOS','BLUE','10.2.0.2','','',0,0,'Y');
INSERT INTO `teams` VALUES (3,'HERA','GREEN','10.3.0.2','','',0,0,'Y');
INSERT INTO `teams` VALUES (4,'HERMES','YELLOW','10.4.0.2','','',0,0,'Y');
INSERT INTO `teams` VALUES (5,'NYX','PURPLE','10.5.0.2','','',0,0,'Y');
INSERT INTO `teams` VALUES (6,'ZEUS','ORANGE','10.6.0.2','','',0,0,'Y');
INSERT INTO `teams` VALUES (7,'OLYMPUS','WHITE','10.0.0.2','e17','',0,0,'Y');
INSERT INTO `teams` VALUES (8,'ARTEMIS','BLACK','10.7.0.2','','',0,0,'N');
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
  `enabled` enum('Y','N') NOT NULL DEFAULT 'N',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vms`
--

LOCK TABLES `vms` WRITE;
/*!40000 ALTER TABLE `vms` DISABLE KEYS */;
INSERT INTO `vms` VALUES (1,'Ubuntu Server 12.04.2 LTS','Y');
INSERT INTO `vms` VALUES (2,'Slackware 14.0','N');
INSERT INTO `vms` VALUES (3,'FreeBSD 9.1-RELEASE','N');
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

-- Dump completed on 2013-05-08 15:11:40
