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
) ENGINE=InnoDB AUTO_INCREMENT=163 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `announcements`
--

LOCK TABLES `announcements` WRITE;
/*!40000 ALTER TABLE `announcements` DISABLE KEYS */;
INSERT INTO `announcements` VALUES (1,'Connect to your gateway on port 12345','2013-05-10 14:21:27',30);
INSERT INTO `announcements` VALUES (2,'Connect to your gateway on port 12345 (using a simple socket)','2013-05-10 14:26:23',60);
INSERT INTO `announcements` VALUES (3,'CHAOS gets 600 points...1st to get on IRC','2013-05-10 14:31:05',30);
INSERT INTO `announcements` VALUES (4,'ZEUS gets 500 points...2nd to get on IRC','2013-05-10 14:31:20',30);
INSERT INTO `announcements` VALUES (5,'ARES gets 400 points...3rd to get on IRC','2013-05-10 14:34:54',30);
INSERT INTO `announcements` VALUES (6,'HERA gets 300 points...4th to get on IRC','2013-05-10 14:37:57',30);
INSERT INTO `announcements` VALUES (7,'HERMES gets 200 points...5th to get on IRC','2013-05-10 14:42:02',30);
INSERT INTO `announcements` VALUES (8,'NYX gets 100 points...Last team to get on IRC','2013-05-10 14:53:11',30);
INSERT INTO `announcements` VALUES (9,'IRC channel OPS, change your channel\'s password and kick everyone but you and me out.','2013-05-10 14:55:59',60);
INSERT INTO `announcements` VALUES (10,'ARES gets 1000 points...Fantastic!','2013-05-10 15:08:44',30);
INSERT INTO `announcements` VALUES (11,'CHAOS gets 1000 points...Magnificent!','2013-05-10 15:09:03',30);
INSERT INTO `announcements` VALUES (12,'HERA gets 1000 points...Beautilicious!','2013-05-10 15:09:20',30);
INSERT INTO `announcements` VALUES (13,'HERMES gets 1000 points...Radical!','2013-05-10 15:09:31',30);
INSERT INTO `announcements` VALUES (14,'NYX gets 1000 points...Totally tubular!','2013-05-10 15:09:41',30);
INSERT INTO `announcements` VALUES (15,'ZEUS gets 1000 points...Stellar!','2013-05-10 15:09:58',30);
INSERT INTO `announcements` VALUES (16,'Over The Wire Semtex Levels 0 through 4->6 for points!','2013-05-10 15:11:11',60);
INSERT INTO `announcements` VALUES (17,'Use guest should be allowed on all your IRC channels (it\'s White)','2013-05-10 15:16:08',60);
INSERT INTO `announcements` VALUES (18,'Actually, user is DCSL not Guest...','2013-05-10 15:16:44',60);
INSERT INTO `announcements` VALUES (19,'HERA gets 350 points...Exploiting IRC to get back in channels after keyword changes','2013-05-10 15:19:40',30);
INSERT INTO `announcements` VALUES (20,'Feel free to relieve yourselves (in the bathroom of course) and grab drinks up front.','2013-05-10 15:26:42',60);
INSERT INTO `announcements` VALUES (21,'ARES gets 200 points...Semtex level 0 solved!','2013-05-10 15:31:49',30);
INSERT INTO `announcements` VALUES (22,'ARES gets 300 points...Semtex level 0->1 solved!','2013-05-10 15:32:55',30);
INSERT INTO `announcements` VALUES (23,'CHAOS gets 200 points...Semtex level 0 solved!','2013-05-10 15:33:33',30);
INSERT INTO `announcements` VALUES (24,'CHAOS gets 300 points...Semtex level 0->1 solved!','2013-05-10 15:33:48',30);
INSERT INTO `announcements` VALUES (25,'CHAOS gets 400 points...Semtex level 1->2 solved!','2013-05-10 15:34:02',30);
INSERT INTO `announcements` VALUES (26,'ZEUS gets 200 points...Semtex level 0 solved!','2013-05-10 15:34:21',30);
INSERT INTO `announcements` VALUES (27,'New challenge (DCSL Control LAN FTP I) for 400 points: Control LAN FTP Server exists between 10.0.143.160-10.0.143.220  What are the file names and associated MD5 hashes of each file, report via IRC? ','2013-05-10 15:50:12',30);
INSERT INTO `announcements` VALUES (28,'ARES gets 400 points...Semtex level 1->2 solved!','2013-05-10 15:53:54',30);
INSERT INTO `announcements` VALUES (29,'HERA gets 200 points...Semtex level 0 solved!','2013-05-10 15:55:32',30);
INSERT INTO `announcements` VALUES (30,'NYX gets 200 points...Semtex level 0 solved!','2013-05-10 15:56:02',30);
INSERT INTO `announcements` VALUES (31,'NYX gets 300 points...Semtex level 0->1 solved!','2013-05-10 15:56:09',30);
INSERT INTO `announcements` VALUES (32,'ZEUS gets 300 points...Semtex level 0->1 solved!','2013-05-10 15:56:47',30);
INSERT INTO `announcements` VALUES (33,'ZEUS gets 400 points...Semtex level 1->2 solved!','2013-05-10 15:56:54',30);
INSERT INTO `announcements` VALUES (34,'HERA gets 300 points...Semtex level 0->1 solved!','2013-05-10 15:58:09',30);
INSERT INTO `announcements` VALUES (35,'CHAOS gets 500 points...Semtex level 2->3 solved!','2013-05-10 15:58:44',30);
INSERT INTO `announcements` VALUES (36,'ZEUS gets 500 points...Semtex level 2->3 solved!','2013-05-10 15:58:56',30);
INSERT INTO `announcements` VALUES (37,'CHAOS gets 1000 points...Semtex level 3->4 solved!','2013-05-10 15:59:17',30);
INSERT INTO `announcements` VALUES (38,'ZEUS gets 1000 points...Semtex level 3->4 solved!','2013-05-10 16:00:58',30);
INSERT INTO `announcements` VALUES (39,'HERA gets 400 points...Semtex level 1->2 solved!','2013-05-10 16:04:25',30);
INSERT INTO `announcements` VALUES (40,'HERMES gets 200 points...Semtex level 0 solved!','2013-05-10 16:07:09',30);
INSERT INTO `announcements` VALUES (41,'NYX gets 400 points...Semtex level 1->2 solved!','2013-05-10 16:07:39',30);
INSERT INTO `announcements` VALUES (42,'NYX gets 500 points...Semtex level 2->3 solved!','2013-05-10 16:07:45',30);
INSERT INTO `announcements` VALUES (43,'Points for Semtex will be allocated shortly...working on something','2013-05-10 16:11:37',60);
INSERT INTO `announcements` VALUES (44,'DCSL Control LAN FTP I challenge for 400 points: Control LAN FTP Server exists between 10.0.143.160-10.0.143.220 What are the file names and associated MD5 hashes of each file, report via IRC?	','2013-05-10 16:12:40',60);
INSERT INTO `announcements` VALUES (45,'ARES gets 500 points...Semtex level 2->3 solved!','2013-05-10 16:21:36',30);
INSERT INTO `announcements` VALUES (46,'ARES gets 1000 points...Semtex level 3->4 solved!','2013-05-10 16:21:42',30);
INSERT INTO `announcements` VALUES (47,'HERA gets 500 points...Semtex level 2->3 solved!','2013-05-10 16:22:11',30);
INSERT INTO `announcements` VALUES (48,'HERA gets 1000 points...Semtex level 3->4 solved!','2013-05-10 16:22:18',30);
INSERT INTO `announcements` VALUES (49,'HERMES gets 300 points...Semtex level 0->1 solved!','2013-05-10 16:23:17',30);
INSERT INTO `announcements` VALUES (50,'HERMES gets 400 points...Semtex level 1->2 solved!','2013-05-10 16:23:24',30);
INSERT INTO `announcements` VALUES (51,'NYX gets 1000 points...Semtex level 3->4 solved!','2013-05-10 16:23:47',30);
INSERT INTO `announcements` VALUES (52,'Don\'t forget Semtex level 4->5','2013-05-10 16:25:54',60);
INSERT INTO `announcements` VALUES (53,'CHAOS gets 1500 points...Semtex level 4->5 solved!','2013-05-10 16:27:00',30);
INSERT INTO `announcements` VALUES (54,'NYX gets 1500 points...Semtex level 4->5 solved!','2013-05-10 16:27:20',30);
INSERT INTO `announcements` VALUES (55,'One LAST time for slackers in CHAOS: DCSL Control LAN FTP I challenge for 400 points: Control LAN FTP Server exists between 10.0.143.160-10.0.143.220 What are the file names and associated MD5 hashes of each file, report via IRC?	','2013-05-10 16:29:08',120);
INSERT INTO `announcements` VALUES (56,'White will be off of IRC for a short bit.  Stay tuned!  By the way, lunch in ~30 minutes! :D','2013-05-10 16:31:19',60);
INSERT INTO `announcements` VALUES (57,'SCADA FTP challenge currently down -- will be up momentarily (which is, of course, subjective)...','2013-05-10 16:42:24',60);
INSERT INTO `announcements` VALUES (58,'PWN 2 OWN!  Your cubicle, that is.','2013-05-10 16:43:24',10);
INSERT INTO `announcements` VALUES (59,'TimeLock is coming up!  Stay tuned and BE AWARE!!!','2013-05-10 16:43:41',30);
INSERT INTO `announcements` VALUES (60,'You will all be receiving Android phones shortly.  You will need to install the APKs from a server later.  Stay Tuned!','2013-05-10 16:47:20',30);
INSERT INTO `announcements` VALUES (61,'HERMES gets -1000 points...You crossed the line!','2013-05-10 16:55:13',30);
INSERT INTO `announcements` VALUES (62,'HERMES gets 1000 points...Thank God there\'s an UNDO button!','2013-05-10 16:55:28',30);
INSERT INTO `announcements` VALUES (63,'HERA gets 1500 points...Semtex level 4->5 solved!','2013-05-10 16:56:42',30);
INSERT INTO `announcements` VALUES (64,'ZEUS gets 1500 points...Semtex level 4->5 solved!','2013-05-10 16:59:30',30);
INSERT INTO `announcements` VALUES (65,'New challenge (Android: QR Confusion) for 1000 points: RTFM!  However, the APK is on our FTP server (your gateway, anonymous)','2013-05-10 17:02:15',30);
INSERT INTO `announcements` VALUES (66,'LUNCH!!!!!  But we\'re not stopping...','2013-05-10 17:19:30',60);
INSERT INTO `announcements` VALUES (67,'Challenges portal at your gateway same port as scoring portal but replace scores with challenges','2013-05-10 17:24:40',120);
INSERT INTO `announcements` VALUES (68,'You should now see challenges...','2013-05-10 17:32:48',60);
INSERT INTO `announcements` VALUES (69,'If you can\'t see all the text, GET A BIGGER SCREEN!','2013-05-10 17:33:24',60);
INSERT INTO `announcements` VALUES (70,'New challenge (Airlocks (Android challenge)) for 1000 points: Don\'t run out of oxygen or get killed by some weird cyber hax0r on rockstar or redbull or monster...','2013-05-10 17:35:36',30);
INSERT INTO `announcements` VALUES (71,'New challenge (Android challenge (another one) - Midnight Madness) for 1000 points: This one might just help you with Airlocks... hehehehehehehha#$%&#$$(@#no carrier','2013-05-10 17:37:23',30);
INSERT INTO `announcements` VALUES (72,'New challenge (DCSL PLC ALARM I) for 200 points: Turn Alarm on. PLC b/t 10.0.143.75-10.0.143.150','2013-05-10 17:41:19',30);
INSERT INTO `announcements` VALUES (73,'Don\'t forget to check the gateway FTP fo more Android challenge APKs.  They are time released and will disappear!','2013-05-10 17:44:03',120);
INSERT INTO `announcements` VALUES (74,'HERMES gets 500  points...Semtex level 2->3 solved!','2013-05-10 17:45:30',30);
INSERT INTO `announcements` VALUES (75,'HERMES gets 1000 points...Semtex level 3->4 solved!','2013-05-10 17:45:39',30);
INSERT INTO `announcements` VALUES (76,'IT\'S CALLED SCALING!  DEAL WITH IT!!','2013-05-10 17:47:38',30);
INSERT INTO `announcements` VALUES (77,'...you suck so much we have to cover for you... ;)','2013-05-10 17:48:03',30);
INSERT INTO `announcements` VALUES (78,'Kidding, of course.  <little voice of the pixies> or maybe not...','2013-05-10 17:48:26',30);
INSERT INTO `announcements` VALUES (79,'HERA wins challenge: DCSL PLC ALARM I!','2013-05-10 17:55:39',30);
INSERT INTO `announcements` VALUES (80,'Circuit Mayhem is on!  EVERYONE must download and install and execute NOW!','2013-05-10 18:06:10',120);
INSERT INTO `announcements` VALUES (81,'You must redownload the Circuit Mayhem APK.','2013-05-10 18:34:03',60);
INSERT INTO `announcements` VALUES (82,'New challenge (DCSL DF I FirefoxHist) for 300 points: FTP:10.0.143.175,guest,123 Report Most Visited Website ','2013-05-10 18:37:27',30);
INSERT INTO `announcements` VALUES (83,'New challenge (DCSL DF II USBAndroid) for 1000 points: FTP:10.0.143.175,guest,123 Report S/N of USB Connected Android Phone','2013-05-10 18:41:34',30);
INSERT INTO `announcements` VALUES (84,'CHAOS wins challenge: DCSL DF I FirefoxHist!','2013-05-10 18:53:08',30);
INSERT INTO `announcements` VALUES (85,'Grade inflation sucks.  YOU DON\'T GET A C FOR COMING TO CLASS.  You don\'t get a trophy for participating.','2013-05-10 19:02:24',60);
INSERT INTO `announcements` VALUES (86,'CHAOS wins challenge: DCSL DF II USBAndroid!','2013-05-10 19:04:03',30);
INSERT INTO `announcements` VALUES (87,'New challenge (DCSL DF III) for 1000 points: CyberStorm2013.dd on FTP @ 10.0.143.175 provide MD5 hash of each file on the desktop (including deleted files)','2013-05-10 19:13:11',30);
INSERT INTO `announcements` VALUES (88,'Tic-Tac-Toe-Titan III - go to FTP at gateway','2013-05-10 19:25:56',60);
INSERT INTO `announcements` VALUES (89,'Tic-Tac-Toe-Titan III - if you win you get 2000 points.  If you lose, you lose points (from 200 up to 600)','2013-05-10 19:31:03',60);
INSERT INTO `announcements` VALUES (90,'Use The Sleuth Kit on the DF III Challenge','2013-05-10 19:35:14',60);
INSERT INTO `announcements` VALUES (91,'QR Confusion is broken!  But you win because you get the secret --> Something about a clock and a lock... u:cyberstorm p:cyberstorm','2013-05-10 19:49:34',120);
INSERT INTO `announcements` VALUES (92,'Airlocks success --> SSTV -- oh how to interpret the \"code\"','2013-05-10 19:55:32',120);
INSERT INTO `announcements` VALUES (93,'New challenge (Dr. Gourd\'s grade inflation challenge) for 500 points: Setup an HTTP server on a port (comm through IRC) - first to get it wins','2013-05-10 20:01:26',30);
INSERT INTO `announcements` VALUES (94,'Check FTP for Forensics hints','2013-05-10 20:02:20',60);
INSERT INTO `announcements` VALUES (95,'For the HTTP challenge, please reinvite DCSL to your IRC channels','2013-05-10 20:03:56',120);
INSERT INTO `announcements` VALUES (96,'Zeus is first and gets Dr. Gourd\'s challenge!','2013-05-10 20:09:38',120);
INSERT INTO `announcements` VALUES (97,'New challenge (Dr. Gourd\'s FTP challenge) for 500 points: Setup an FTP on IP/port msg via IRC - first gets 500','2013-05-10 20:14:28',30);
INSERT INTO `announcements` VALUES (98,'Circuit Mayhem is on!  EVERYONE must download and install and execute NOW!','2013-05-10 20:28:47',120);
INSERT INTO `announcements` VALUES (99,'THAT WAS AN ACCIDENT!!','2013-05-10 20:30:42',10);
INSERT INTO `announcements` VALUES (100,'ARES gets 1700 points...Circuit Mayhem','2013-05-10 20:31:18',30);
INSERT INTO `announcements` VALUES (101,'CHAOS gets 1800 points...Circuit Mayhem','2013-05-10 20:31:41',30);
INSERT INTO `announcements` VALUES (102,'HERA gets 1900 points...Circuit Mayhem','2013-05-10 20:31:58',30);
INSERT INTO `announcements` VALUES (103,'HERMES gets 1300 points...Circuit Mayhem','2013-05-10 20:32:18',30);
INSERT INTO `announcements` VALUES (104,'NYX gets 1800 points...Circuit Mayhem','2013-05-10 20:32:30',30);
INSERT INTO `announcements` VALUES (105,'ZEUS gets 1400 points...Circuit Mayhem','2013-05-10 20:32:38',30);
INSERT INTO `announcements` VALUES (106,'HERMES wins challenge: Tic-Tac-Toe Titan III!','2013-05-10 20:35:37',30);
INSERT INTO `announcements` VALUES (107,'ARES gets -250 points...Tied for 2nd place for Tic-Tac-Toe Titan III','2013-05-10 20:36:39',30);
INSERT INTO `announcements` VALUES (108,'CHAOS gets -250 points...Tied for 2nd place for Tic-Tac-Toe Titan III','2013-05-10 20:36:51',30);
INSERT INTO `announcements` VALUES (109,'ZEUS gets -400 points...4th place for Tic-Tac-Toe Titan III','2013-05-10 20:37:12',30);
INSERT INTO `announcements` VALUES (110,'NYX gets -500 points...5th place for Tic-Tac-Toe Titan III','2013-05-10 20:37:28',30);
INSERT INTO `announcements` VALUES (111,'HERA gets -600 points...6th place for Tic-Tac-Toe Titan III','2013-05-10 20:37:39',30);
INSERT INTO `announcements` VALUES (112,'CHAOS wins challenge: Airlocks (Android challenge)!','2013-05-10 20:38:39',30);
INSERT INTO `announcements` VALUES (113,'ARES wins challenge: Android challenge (another one) - Midnight Madness!','2013-05-10 20:39:38',30);
INSERT INTO `announcements` VALUES (114,'New challenge (Dr. Gourd\'s SSH server) for 1000 points: Set it up on an IP/port - make sure user=jgourd and pass=jgourd - send through IRC','2013-05-10 20:41:19',30);
INSERT INTO `announcements` VALUES (115,'New challenge (Dr. Gourd\'s MySQL server) for 2000 points: Set it up on an IP/port - make sure user=jgourd and pass=jgourd - send through IRC','2013-05-10 20:43:11',30);
INSERT INTO `announcements` VALUES (116,'OLYMPUS wins challenge: Android: QR Confusion!','2013-05-10 20:48:11',30);
INSERT INTO `announcements` VALUES (117,'New challenge (DCSL PLC ALARM II) for 1000 points: Turn Alarm on. PLC b/t 10.0.143.75-10.0.143.150','2013-05-10 20:54:01',30);
INSERT INTO `announcements` VALUES (118,'ARES gets 750 points...Airlocks SSTV is clear dudes!','2013-05-10 20:56:53',30);
INSERT INTO `announcements` VALUES (119,'NYX gets 750 points...Midnight Madness solved too... not bad!','2013-05-10 20:57:29',30);
INSERT INTO `announcements` VALUES (120,'New challenge (DCSL DF III Part B) for 500 points: CyberStorm2013.dd -- What is the largest file on the desktop?','2013-05-10 21:00:01',30);
INSERT INTO `announcements` VALUES (121,'HERMES gets 100 points...Midnight Madness was bad to you.  You pass go and collect $100','2013-05-10 21:00:50',30);
INSERT INTO `announcements` VALUES (122,'HERA wins challenge: DCSL DF III Part B!','2013-05-10 21:02:14',30);
INSERT INTO `announcements` VALUES (123,'New challenge (Cy63r5w33p3r) for 1000 points: Solve the game and decode the hidden message!','2013-05-10 21:04:43',30);
INSERT INTO `announcements` VALUES (124,'Oh, it\'s an APK on the FTP at your gateway...','2013-05-10 21:05:06',30);
INSERT INTO `announcements` VALUES (125,'No MySQL servers????','2013-05-10 21:10:49',60);
INSERT INTO `announcements` VALUES (126,'HERA gets 1000 points...DCSL DF III Completed','2013-05-10 21:11:06',30);
INSERT INTO `announcements` VALUES (127,'HERA wins challenge: DCSL DF III!','2013-05-10 21:15:12',30);
INSERT INTO `announcements` VALUES (128,'HERA gets -1000 points...no doubling dudes!','2013-05-10 21:15:20',30);
INSERT INTO `announcements` VALUES (129,'New challenge (DCSL DF III Part C) for 1250 points: Same image, get James when you have found the Firefox browser history','2013-05-10 21:16:52',30);
INSERT INTO `announcements` VALUES (130,'New challenge (DCSL DF III Part D) for 2500 points: Same image, get James when you have found the Chrome browser history','2013-05-10 21:18:50',30);
INSERT INTO `announcements` VALUES (131,'We\'re working on Cy63r5w33p3r...stay tuned!','2013-05-10 21:21:41',60);
INSERT INTO `announcements` VALUES (132,'ZEUS wins challenge: Dr. Gourd\'s MySQL server!','2013-05-10 21:27:18',30);
INSERT INTO `announcements` VALUES (133,'HINT:CONTROL LAN FTP SERVER 10.0.143.175','2013-05-10 21:27:23',120);
INSERT INTO `announcements` VALUES (134,'ZEUS gets -800 points...Transferred to Chaos','2013-05-10 21:27:35',30);
INSERT INTO `announcements` VALUES (135,'CHAOS gets 800 points...Transferred from Zeus','2013-05-10 21:27:45',30);
INSERT INTO `announcements` VALUES (136,'Cy83r5w33p3r new APK is on the FTP server','2013-05-10 21:28:18',120);
INSERT INTO `announcements` VALUES (137,'CHAOS gets 500 points...Midnight Madness solved too... not bad!','2013-05-10 21:28:43',30);
INSERT INTO `announcements` VALUES (138,'PLC Command List is on Control FTP SERVER 10.0.143.175','2013-05-10 21:34:02',240);
INSERT INTO `announcements` VALUES (139,'Let\'s see if we can find that Android challenge from the CSC122 team Victorious Secret...','2013-05-10 21:34:28',60);
INSERT INTO `announcements` VALUES (140,'Control LAN FTP Server exists 10.0.143.175 u:guest - What are the file names and associated MD5 hashes of each file, report via IRC?	','2013-05-10 21:36:16',120);
INSERT INTO `announcements` VALUES (141,'Control FTP Server pass is most common tech pass','2013-05-10 21:38:52',240);
INSERT INTO `announcements` VALUES (142,'Chrome Challenge: It\'s in there, but think outside of the box or maybe inside the VBox.','2013-05-10 21:40:12',120);
INSERT INTO `announcements` VALUES (143,'20 MINUTES LEFT!!!!!','2013-05-10 21:40:34',60);
INSERT INTO `announcements` VALUES (144,'DCSL FTP \"made a \'123\' on my \'test\'\"','2013-05-10 21:45:06',240);
INSERT INTO `announcements` VALUES (145,'New challenge (Gambler\'s Fallacy...) for 1000 points: ...brought to you by Victorious Secret!  On the FTP server','2013-05-10 21:47:05',30);
INSERT INTO `announcements` VALUES (146,'HERA wins challenge: DCSL DF III Part C!','2013-05-10 21:48:49',30);
INSERT INTO `announcements` VALUES (147,'10 MINUTES!!!!','2013-05-10 21:49:29',10);
INSERT INTO `announcements` VALUES (148,'ZEUS wins challenge: DCSL PLC ALARM II!','2013-05-10 21:49:31',30);
INSERT INTO `announcements` VALUES (149,'Control LAN FTP Hashes anybody???','2013-05-10 21:50:49',120);
INSERT INTO `announcements` VALUES (150,'Update!  Now 600 points! Control LAN FTP Server exists 10.0.143.175 u:guest - What are the file names and associated MD5 hashes of each file, report via IRC?	','2013-05-10 21:54:52',60);
INSERT INTO `announcements` VALUES (151,'5 MINUTES!!!!!','2013-05-10 21:55:28',10);
INSERT INTO `announcements` VALUES (152,'CHAOS wins challenge: DCSL Control LAN FTP I!','2013-05-10 21:57:52',30);
INSERT INTO `announcements` VALUES (153,'Do you want an extra 5 minutes?','2013-05-10 21:59:59',10);
INSERT INTO `announcements` VALUES (154,'Cy83r5w33p3r is now worth 2000 points!','2013-05-10 22:01:27',30);
INSERT INTO `announcements` VALUES (155,'CHAOS wins challenge: Gambler\'s Fallacy...!','2013-05-10 22:02:05',30);
INSERT INTO `announcements` VALUES (156,'ZEUS gets 500 points......for trying...and because Bozeman is soooo depressed.','2013-05-10 22:02:38',30);
INSERT INTO `announcements` VALUES (157,'1 MINUTE LEFT TO GET THE SWEEPER IN!','2013-05-10 22:03:37',60);
INSERT INTO `announcements` VALUES (158,'The sweeper is now worth 3500 points!','2013-05-10 22:06:14',60);
INSERT INTO `announcements` VALUES (159,'HERA wins challenge: DCSL DF III Part D!','2013-05-10 22:07:45',30);
INSERT INTO `announcements` VALUES (160,'HERA gets -500 points...the hint was worth 500 points','2013-05-10 22:08:01',30);
INSERT INTO `announcements` VALUES (161,'The sweeper must be solved by 5:15 (5 minutes left)!','2013-05-10 22:10:11',60);
INSERT INTO `announcements` VALUES (162,'AAAAAAAAAND, WE\'RE DONE!','2013-05-10 22:14:54',3);
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `challenges`
--

LOCK TABLES `challenges` WRITE;
/*!40000 ALTER TABLE `challenges` DISABLE KEYS */;
INSERT INTO `challenges` VALUES (1,'DCSL Control LAN FTP I','Control LAN FTP Server exists between 10.0.143.160-10.0.143.220  What are the file names and associated MD5 hashes of each file, report via IRC? ',600,'2013-05-10 21:57:52',2);
INSERT INTO `challenges` VALUES (2,'Android: QR Confusion','RTFM!  However, the APK is on our FTP server (your gateway, anonymous)',1000,'2013-05-10 20:48:11',7);
INSERT INTO `challenges` VALUES (3,'Airlocks (Android challenge)','Don\'t run out of oxygen or get killed by some weird cyber hax0r on rockstar or redbull or monster...',1000,'2013-05-10 20:38:39',2);
INSERT INTO `challenges` VALUES (4,'Android challenge (another one) - Midnight Madness','This one might just help you with Airlocks... hehehehehehehha#$%&#$$(@#no carrier',1000,'2013-05-10 20:39:38',1);
INSERT INTO `challenges` VALUES (5,'DCSL PLC ALARM I','Turn Alarm on. PLC b/t 10.0.143.75-10.0.143.150',200,'2013-05-10 17:55:39',3);
INSERT INTO `challenges` VALUES (6,'DCSL DF I FirefoxHist','FTP:10.0.143.175,guest,123 Report Most Visited Website ',300,'2013-05-10 18:53:08',2);
INSERT INTO `challenges` VALUES (7,'DCSL DF II USBAndroid','FTP:10.0.143.175,guest,123 Report S/N of USB Connected Android Phone',1000,'2013-05-10 19:04:03',2);
INSERT INTO `challenges` VALUES (8,'DCSL DF III','CyberStorm2013.dd on FTP @ 10.0.143.175 provide MD5 hash of each file on the desktop (including deleted files)',1000,'2013-05-10 21:15:12',3);
INSERT INTO `challenges` VALUES (9,'Tic-Tac-Toe Titan III','Go to FTP and get the tic tac toe APK and install.',2000,'2013-05-10 20:35:37',4);
INSERT INTO `challenges` VALUES (10,'Dr. Gourd\'s grade inflation challenge','Setup an HTTP server on a port (comm through IRC) - first to get it wins',500,'2013-05-10 20:08:28',6);
INSERT INTO `challenges` VALUES (11,'Dr. Gourd\'s FTP challenge','Setup an FTP on IP/port msg via IRC - first gets 500',500,'2013-05-10 20:26:25',5);
INSERT INTO `challenges` VALUES (12,'Dr. Gourd\'s SSH server','Set it up on an IP/port - make sure user=jgourd and pass=jgourd - send through IRC',1000,'2013-05-10 20:44:21',6);
INSERT INTO `challenges` VALUES (13,'Dr. Gourd\'s MySQL server','Set it up on an IP/port - make sure user=jgourd and pass=jgourd - send through IRC',2000,'2013-05-10 21:27:18',6);
INSERT INTO `challenges` VALUES (14,'DCSL PLC ALARM II','Turn Alarm on. PLC b/t 10.0.143.75-10.0.143.150',1000,'2013-05-10 21:49:31',6);
INSERT INTO `challenges` VALUES (15,'DCSL DF III Part B','CyberStorm2013.dd -- What is the largest file on the desktop?',500,'2013-05-10 21:02:14',3);
INSERT INTO `challenges` VALUES (16,'Cy63r5w33p3r','Solve the game and decode the hidden message!',3500,'2013-05-10 22:06:34',NULL);
INSERT INTO `challenges` VALUES (17,'DCSL DF III Part C','Same image, get James when you have found the Firefox browser history',1250,'2013-05-10 21:48:49',3);
INSERT INTO `challenges` VALUES (18,'DCSL DF III Part D','Same image, get James when you have found the Chrome browser history',2500,'2013-05-10 22:07:45',3);
INSERT INTO `challenges` VALUES (19,'Gambler\'s Fallacy...','...brought to you by Victorious Secret!  On the FTP server',1000,'2013-05-10 22:02:05',2);
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
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ips`
--

LOCK TABLES `ips` WRITE;
/*!40000 ALTER TABLE `ips` DISABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=104 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `log`
--

LOCK TABLES `log` WRITE;
/*!40000 ALTER TABLE `log` DISABLE KEYS */;
INSERT INTO `log` VALUES (1,'600 points awarded to CHAOS(BLUE): 1st to get on IRC','2013-05-10 14:31:05');
INSERT INTO `log` VALUES (2,'500 points awarded to ZEUS(ORANGE): 2nd to get on IRC','2013-05-10 14:31:20');
INSERT INTO `log` VALUES (3,'400 points awarded to ARES(RED): 3rd to get on IRC','2013-05-10 14:34:54');
INSERT INTO `log` VALUES (4,'300 points awarded to HERA(GREEN): 4th to get on IRC','2013-05-10 14:37:57');
INSERT INTO `log` VALUES (5,'200 points awarded to HERMES(YELLOW): 5th to get on IRC','2013-05-10 14:42:02');
INSERT INTO `log` VALUES (6,'100 points awarded to NYX(PURPLE): Last team to get on IRC','2013-05-10 14:53:11');
INSERT INTO `log` VALUES (7,'1000 points awarded to ARES(RED): Fantastic!','2013-05-10 15:08:44');
INSERT INTO `log` VALUES (8,'1000 points awarded to CHAOS(BLUE): Magnificent!','2013-05-10 15:09:03');
INSERT INTO `log` VALUES (9,'1000 points awarded to HERA(GREEN): Beautilicious!','2013-05-10 15:09:20');
INSERT INTO `log` VALUES (10,'1000 points awarded to HERMES(YELLOW): Radical!','2013-05-10 15:09:31');
INSERT INTO `log` VALUES (11,'1000 points awarded to NYX(PURPLE): Totally tubular!','2013-05-10 15:09:41');
INSERT INTO `log` VALUES (12,'1000 points awarded to ZEUS(ORANGE): Stellar!','2013-05-10 15:09:58');
INSERT INTO `log` VALUES (13,'350 points awarded to HERA(GREEN): Exploiting IRC to get back in channels after keyword changes','2013-05-10 15:19:40');
INSERT INTO `log` VALUES (14,'200 points awarded to ARES(RED): Semtex level 0 solved!','2013-05-10 15:31:49');
INSERT INTO `log` VALUES (15,'300 points awarded to ARES(RED): Semtex level 0->1 solved!','2013-05-10 15:32:55');
INSERT INTO `log` VALUES (16,'200 points awarded to CHAOS(BLUE): Semtex level 0 solved!','2013-05-10 15:33:33');
INSERT INTO `log` VALUES (17,'300 points awarded to CHAOS(BLUE): Semtex level 0->1 solved!','2013-05-10 15:33:48');
INSERT INTO `log` VALUES (18,'400 points awarded to CHAOS(BLUE): Semtex level 1->2 solved!','2013-05-10 15:34:02');
INSERT INTO `log` VALUES (19,'200 points awarded to ZEUS(ORANGE): Semtex level 0 solved!','2013-05-10 15:34:21');
INSERT INTO `log` VALUES (20,'400 point challenge added: DCSL Control LAN FTP I','2013-05-10 15:50:12');
INSERT INTO `log` VALUES (21,'400 points awarded to ARES(RED): Semtex level 1->2 solved!','2013-05-10 15:53:54');
INSERT INTO `log` VALUES (22,'200 points awarded to HERA(GREEN): Semtex level 0 solved!','2013-05-10 15:55:32');
INSERT INTO `log` VALUES (23,'200 points awarded to NYX(PURPLE): Semtex level 0 solved!','2013-05-10 15:56:02');
INSERT INTO `log` VALUES (24,'300 points awarded to NYX(PURPLE): Semtex level 0->1 solved!','2013-05-10 15:56:09');
INSERT INTO `log` VALUES (25,'300 points awarded to ZEUS(ORANGE): Semtex level 0->1 solved!','2013-05-10 15:56:47');
INSERT INTO `log` VALUES (26,'400 points awarded to ZEUS(ORANGE): Semtex level 1->2 solved!','2013-05-10 15:56:54');
INSERT INTO `log` VALUES (27,'300 points awarded to HERA(GREEN): Semtex level 0->1 solved!','2013-05-10 15:58:09');
INSERT INTO `log` VALUES (28,'500 points awarded to CHAOS(BLUE): Semtex level 2->3 solved!','2013-05-10 15:58:44');
INSERT INTO `log` VALUES (29,'500 points awarded to ZEUS(ORANGE): Semtex level 2->3 solved!','2013-05-10 15:58:56');
INSERT INTO `log` VALUES (30,'1000 points awarded to CHAOS(BLUE): Semtex level 3->4 solved!','2013-05-10 15:59:17');
INSERT INTO `log` VALUES (31,'1000 points awarded to ZEUS(ORANGE): Semtex level 3->4 solved!','2013-05-10 16:00:58');
INSERT INTO `log` VALUES (32,'400 points awarded to HERA(GREEN): Semtex level 1->2 solved!','2013-05-10 16:04:25');
INSERT INTO `log` VALUES (33,'200 points awarded to HERMES(YELLOW): Semtex level 0 solved!','2013-05-10 16:07:09');
INSERT INTO `log` VALUES (34,'400 points awarded to NYX(PURPLE): Semtex level 1->2 solved!','2013-05-10 16:07:39');
INSERT INTO `log` VALUES (35,'500 points awarded to NYX(PURPLE): Semtex level 2->3 solved!','2013-05-10 16:07:45');
INSERT INTO `log` VALUES (36,'500 points awarded to ARES(RED): Semtex level 2->3 solved!','2013-05-10 16:21:36');
INSERT INTO `log` VALUES (37,'1000 points awarded to ARES(RED): Semtex level 3->4 solved!','2013-05-10 16:21:42');
INSERT INTO `log` VALUES (38,'500 points awarded to HERA(GREEN): Semtex level 2->3 solved!','2013-05-10 16:22:11');
INSERT INTO `log` VALUES (39,'1000 points awarded to HERA(GREEN): Semtex level 3->4 solved!','2013-05-10 16:22:18');
INSERT INTO `log` VALUES (40,'300 points awarded to HERMES(YELLOW): Semtex level 0->1 solved!','2013-05-10 16:23:17');
INSERT INTO `log` VALUES (41,'400 points awarded to HERMES(YELLOW): Semtex level 1->2 solved!','2013-05-10 16:23:24');
INSERT INTO `log` VALUES (42,'1000 points awarded to NYX(PURPLE): Semtex level 3->4 solved!','2013-05-10 16:23:47');
INSERT INTO `log` VALUES (43,'1500 points awarded to CHAOS(BLUE): Semtex level 4->5 solved!','2013-05-10 16:27:00');
INSERT INTO `log` VALUES (44,'1500 points awarded to NYX(PURPLE): Semtex level 4->5 solved!','2013-05-10 16:27:20');
INSERT INTO `log` VALUES (45,'-1000 points awarded to HERMES(YELLOW): You crossed the line!','2013-05-10 16:55:13');
INSERT INTO `log` VALUES (46,'1000 points awarded to HERMES(YELLOW): Thank God there\'s an UNDO button!','2013-05-10 16:55:28');
INSERT INTO `log` VALUES (47,'1500 points awarded to HERA(GREEN): Semtex level 4->5 solved!','2013-05-10 16:56:42');
INSERT INTO `log` VALUES (48,'1500 points awarded to ZEUS(ORANGE): Semtex level 4->5 solved!','2013-05-10 16:59:30');
INSERT INTO `log` VALUES (49,'1000 point challenge added: Android: QR Confusion','2013-05-10 17:02:15');
INSERT INTO `log` VALUES (50,'1000 point challenge added: Airlocks (Android challenge)','2013-05-10 17:35:36');
INSERT INTO `log` VALUES (51,'1000 point challenge added: Android challenge (another one) - Midnight Madness','2013-05-10 17:37:23');
INSERT INTO `log` VALUES (52,'200 point challenge added: DCSL PLC ALARM I','2013-05-10 17:41:19');
INSERT INTO `log` VALUES (53,'500  points awarded to HERMES(YELLOW): Semtex level 2->3 solved!','2013-05-10 17:45:30');
INSERT INTO `log` VALUES (54,'1000 points awarded to HERMES(YELLOW): Semtex level 3->4 solved!','2013-05-10 17:45:39');
INSERT INTO `log` VALUES (55,'Challenge ended: DCSL PLC ALARM I (winner: HERA)','2013-05-10 17:55:39');
INSERT INTO `log` VALUES (56,'300 point challenge added: DCSL DF I FirefoxHist','2013-05-10 18:37:27');
INSERT INTO `log` VALUES (57,'1000 point challenge added: DCSL DF II USBAndroid','2013-05-10 18:41:34');
INSERT INTO `log` VALUES (58,'Challenge ended: DCSL DF I FirefoxHist (winner: CHAOS)','2013-05-10 18:53:08');
INSERT INTO `log` VALUES (59,'Challenge ended: DCSL DF II USBAndroid (winner: CHAOS)','2013-05-10 19:04:03');
INSERT INTO `log` VALUES (60,'1000 point challenge added: DCSL DF III','2013-05-10 19:13:11');
INSERT INTO `log` VALUES (61,'500 point challenge added: Dr. Gourd\'s grade inflation challenge','2013-05-10 20:01:26');
INSERT INTO `log` VALUES (62,'500 point challenge added: Dr. Gourd\'s FTP challenge','2013-05-10 20:14:28');
INSERT INTO `log` VALUES (63,'1700 points awarded to ARES(RED): Circuit Mayhem','2013-05-10 20:31:18');
INSERT INTO `log` VALUES (64,'1800 points awarded to CHAOS(BLUE): Circuit Mayhem','2013-05-10 20:31:41');
INSERT INTO `log` VALUES (65,'1900 points awarded to HERA(GREEN): Circuit Mayhem','2013-05-10 20:31:58');
INSERT INTO `log` VALUES (66,'1300 points awarded to HERMES(YELLOW): Circuit Mayhem','2013-05-10 20:32:18');
INSERT INTO `log` VALUES (67,'1800 points awarded to NYX(PURPLE): Circuit Mayhem','2013-05-10 20:32:30');
INSERT INTO `log` VALUES (68,'1400 points awarded to ZEUS(ORANGE): Circuit Mayhem','2013-05-10 20:32:38');
INSERT INTO `log` VALUES (69,'Challenge ended: Tic-Tac-Toe Titan III (winner: HERMES)','2013-05-10 20:35:37');
INSERT INTO `log` VALUES (70,'-250 points awarded to ARES(RED): Tied for 2nd place for Tic-Tac-Toe Titan III','2013-05-10 20:36:39');
INSERT INTO `log` VALUES (71,'-250 points awarded to CHAOS(BLUE): Tied for 2nd place for Tic-Tac-Toe Titan III','2013-05-10 20:36:51');
INSERT INTO `log` VALUES (72,'-400 points awarded to ZEUS(ORANGE): 4th place for Tic-Tac-Toe Titan III','2013-05-10 20:37:12');
INSERT INTO `log` VALUES (73,'-500 points awarded to NYX(PURPLE): 5th place for Tic-Tac-Toe Titan III','2013-05-10 20:37:28');
INSERT INTO `log` VALUES (74,'-600 points awarded to HERA(GREEN): 6th place for Tic-Tac-Toe Titan III','2013-05-10 20:37:39');
INSERT INTO `log` VALUES (75,'Challenge ended: Airlocks (Android challenge) (winner: CHAOS)','2013-05-10 20:38:39');
INSERT INTO `log` VALUES (76,'Challenge ended: Android challenge (another one) - Midnight Madness (winner: ARES)','2013-05-10 20:39:38');
INSERT INTO `log` VALUES (77,'1000 point challenge added: Dr. Gourd\'s SSH server','2013-05-10 20:41:19');
INSERT INTO `log` VALUES (78,'2000 point challenge added: Dr. Gourd\'s MySQL server','2013-05-10 20:43:11');
INSERT INTO `log` VALUES (79,'Challenge ended: Android: QR Confusion (winner: OLYMPUS)','2013-05-10 20:48:11');
INSERT INTO `log` VALUES (80,'1000 point challenge added: DCSL PLC ALARM II','2013-05-10 20:54:01');
INSERT INTO `log` VALUES (81,'750 points awarded to ARES(RED): Airlocks SSTV is clear dudes!','2013-05-10 20:56:53');
INSERT INTO `log` VALUES (82,'750 points awarded to NYX(PURPLE): Midnight Madness solved too... not bad!','2013-05-10 20:57:29');
INSERT INTO `log` VALUES (83,'500 point challenge added: DCSL DF III Part B','2013-05-10 21:00:01');
INSERT INTO `log` VALUES (84,'100 points awarded to HERMES(YELLOW): Midnight Madness was bad to you.  You pass go and collect $100','2013-05-10 21:00:50');
INSERT INTO `log` VALUES (85,'Challenge ended: DCSL DF III Part B (winner: HERA)','2013-05-10 21:02:14');
INSERT INTO `log` VALUES (86,'1000 point challenge added: Cy63r5w33p3r','2013-05-10 21:04:43');
INSERT INTO `log` VALUES (87,'1000 points awarded to HERA(GREEN): DCSL DF III Completed','2013-05-10 21:11:06');
INSERT INTO `log` VALUES (88,'Challenge ended: DCSL DF III (winner: HERA)','2013-05-10 21:15:12');
INSERT INTO `log` VALUES (89,'-1000 points awarded to HERA(GREEN): no doubling dudes!','2013-05-10 21:15:20');
INSERT INTO `log` VALUES (90,'1250 point challenge added: DCSL DF III Part C','2013-05-10 21:16:52');
INSERT INTO `log` VALUES (91,'2500 point challenge added: DCSL DF III Part D','2013-05-10 21:18:50');
INSERT INTO `log` VALUES (92,'Challenge ended: Dr. Gourd\'s MySQL server (winner: ZEUS)','2013-05-10 21:27:18');
INSERT INTO `log` VALUES (93,'-800 points awarded to ZEUS(ORANGE): Transferred to Chaos','2013-05-10 21:27:35');
INSERT INTO `log` VALUES (94,'800 points awarded to CHAOS(BLUE): Transferred from Zeus','2013-05-10 21:27:45');
INSERT INTO `log` VALUES (95,'500 points awarded to CHAOS(BLUE): Midnight Madness solved too... not bad!','2013-05-10 21:28:43');
INSERT INTO `log` VALUES (96,'1000 point challenge added: Gambler\'s Fallacy...','2013-05-10 21:47:05');
INSERT INTO `log` VALUES (97,'Challenge ended: DCSL DF III Part C (winner: HERA)','2013-05-10 21:48:49');
INSERT INTO `log` VALUES (98,'Challenge ended: DCSL PLC ALARM II (winner: ZEUS)','2013-05-10 21:49:31');
INSERT INTO `log` VALUES (99,'Challenge ended: DCSL Control LAN FTP I (winner: CHAOS)','2013-05-10 21:57:52');
INSERT INTO `log` VALUES (100,'Challenge ended: Gambler\'s Fallacy... (winner: CHAOS)','2013-05-10 22:02:05');
INSERT INTO `log` VALUES (101,'500 points awarded to ZEUS(ORANGE): ...for trying...and because Bozeman is soooo depressed.','2013-05-10 22:02:38');
INSERT INTO `log` VALUES (102,'Challenge ended: DCSL DF III Part D (winner: HERA)','2013-05-10 22:07:45');
INSERT INTO `log` VALUES (103,'-500 points awarded to HERA(GREEN): the hint was worth 500 points','2013-05-10 22:08:01');
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
  CONSTRAINT `logins_service_id` FOREIGN KEY (`service_id`) REFERENCES `services` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `logins_team_vm_id` FOREIGN KEY (`team_vm_id`) REFERENCES `team_vms` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
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
) ENGINE=InnoDB AUTO_INCREMENT=650 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nodes`
--

LOCK TABLES `nodes` WRITE;
/*!40000 ALTER TABLE `nodes` DISABLE KEYS */;
INSERT INTO `nodes` VALUES (1,'00:23:ae:1d:25:28',1,'2013-05-10 15:03:37','2013-05-10 15:12:18');
INSERT INTO `nodes` VALUES (2,'d0:67:e5:f0:75:69',1,'2013-05-10 15:03:37',NULL);
INSERT INTO `nodes` VALUES (3,'d0:67:e5:f0:75:6b',1,'2013-05-10 15:03:37',NULL);
INSERT INTO `nodes` VALUES (4,'00:1b:38:df:3e:a1',2,'2013-05-10 15:03:42','2013-05-10 18:19:33');
INSERT INTO `nodes` VALUES (5,'00:1d:09:3e:11:59',2,'2013-05-10 15:03:42','2013-05-10 15:15:39');
INSERT INTO `nodes` VALUES (6,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:03:42','2013-05-10 15:14:33');
INSERT INTO `nodes` VALUES (7,'08:00:27:14:31:e5',2,'2013-05-10 15:03:42','2013-05-10 15:17:49');
INSERT INTO `nodes` VALUES (8,'88:ae:1d:5a:e7:ac',2,'2013-05-10 15:03:42','2013-05-10 18:19:33');
INSERT INTO `nodes` VALUES (9,'d0:67:e5:f0:78:c9',2,'2013-05-10 15:03:42','2013-05-10 17:47:43');
INSERT INTO `nodes` VALUES (10,'d0:67:e5:f0:78:cb',2,'2013-05-10 15:03:42','2013-05-10 17:47:43');
INSERT INTO `nodes` VALUES (11,'00:1d:72:70:25:75',3,'2013-05-10 15:03:47','2013-05-10 17:09:49');
INSERT INTO `nodes` VALUES (12,'00:23:5a:42:fd:2e',3,'2013-05-10 15:03:47','2013-05-10 15:07:03');
INSERT INTO `nodes` VALUES (13,'08:00:27:e7:8e:9f',3,'2013-05-10 15:03:47','2013-05-10 15:36:22');
INSERT INTO `nodes` VALUES (14,'90:e2:ba:02:5c:50',3,'2013-05-10 15:03:47','2013-05-10 18:13:59');
INSERT INTO `nodes` VALUES (15,'f0:bf:97:62:ed:a4',3,'2013-05-10 15:03:47',NULL);
INSERT INTO `nodes` VALUES (16,'00:21:cc:00:34:5f',4,'2013-05-10 15:03:52','2013-05-10 15:04:57');
INSERT INTO `nodes` VALUES (17,'00:25:64:62:3d:c5',4,'2013-05-10 15:03:52','2013-05-10 15:09:18');
INSERT INTO `nodes` VALUES (18,'00:8c:fa:3a:c3:c9',4,'2013-05-10 15:03:52','2013-05-10 15:25:35');
INSERT INTO `nodes` VALUES (19,'d0:67:e5:f0:77:ee',4,'2013-05-10 15:03:52','2013-05-10 15:23:25');
INSERT INTO `nodes` VALUES (20,'d0:67:e5:f0:77:f0',4,'2013-05-10 15:03:52','2013-05-10 18:16:14');
INSERT INTO `nodes` VALUES (21,'e8:03:9a:dd:8a:82',4,'2013-05-10 15:03:52','2013-05-10 16:53:36');
INSERT INTO `nodes` VALUES (22,'00:90:f5:8c:20:30',5,'2013-05-10 15:03:57','2013-05-10 15:25:40');
INSERT INTO `nodes` VALUES (23,'d0:67:e5:f0:71:ee',5,'2013-05-10 15:03:57','2013-05-10 15:11:33');
INSERT INTO `nodes` VALUES (24,'d0:67:e5:f0:71:f0',5,'2013-05-10 15:03:57',NULL);
INSERT INTO `nodes` VALUES (25,'00:0c:29:7a:81:fe',6,'2013-05-10 15:04:02','2013-05-10 15:29:00');
INSERT INTO `nodes` VALUES (26,'00:1e:ec:63:4d:82',6,'2013-05-10 15:04:02','2013-05-10 16:12:32');
INSERT INTO `nodes` VALUES (27,'00:26:6c:76:2a:5e',6,'2013-05-10 15:04:02','2013-05-10 18:51:28');
INSERT INTO `nodes` VALUES (28,'00:26:6c:92:5b:b6',6,'2013-05-10 15:04:02','2013-05-10 15:14:53');
INSERT INTO `nodes` VALUES (29,'d0:67:e5:f0:78:6c',6,'2013-05-10 15:04:02',NULL);
INSERT INTO `nodes` VALUES (30,'d0:67:e5:f0:78:6e',6,'2013-05-10 15:04:02',NULL);
INSERT INTO `nodes` VALUES (31,'00:0c:29:1b:1a:b4',7,'2013-05-10 15:04:07','2013-05-10 15:05:12');
INSERT INTO `nodes` VALUES (32,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:04:07','2013-05-10 15:05:12');
INSERT INTO `nodes` VALUES (33,'00:21:9b:d2:35:a9',7,'2013-05-10 15:04:07','2013-05-10 16:32:09');
INSERT INTO `nodes` VALUES (34,'00:23:32:d4:0f:c4',7,'2013-05-10 15:04:07','2013-05-10 19:24:06');
INSERT INTO `nodes` VALUES (35,'10:9a:dd:6a:d5:4e',7,'2013-05-10 15:04:07','2013-05-10 16:21:18');
INSERT INTO `nodes` VALUES (36,'90:2b:34:39:d3:df',7,'2013-05-10 15:04:07',NULL);
INSERT INTO `nodes` VALUES (37,'d0:67:e5:f0:78:a1',7,'2013-05-10 15:04:07','2013-05-10 22:04:46');
INSERT INTO `nodes` VALUES (38,'d0:67:e5:f0:88:0d',7,'2013-05-10 15:04:07',NULL);
INSERT INTO `nodes` VALUES (39,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:05:12','2013-05-10 15:06:17');
INSERT INTO `nodes` VALUES (40,'00:21:cc:00:34:5f',4,'2013-05-10 15:07:08','2013-05-10 15:09:18');
INSERT INTO `nodes` VALUES (41,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:07:23','2013-05-10 15:08:28');
INSERT INTO `nodes` VALUES (42,'00:0c:29:1b:1a:b4',7,'2013-05-10 15:09:33','2013-05-10 15:10:38');
INSERT INTO `nodes` VALUES (43,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:09:33','2013-05-10 15:11:43');
INSERT INTO `nodes` VALUES (44,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:09:33','2013-05-10 15:10:38');
INSERT INTO `nodes` VALUES (45,'d0:67:e5:f0:71:ef',5,'2013-05-10 15:10:28','2013-05-10 15:11:33');
INSERT INTO `nodes` VALUES (46,'00:23:5a:42:fd:2e',3,'2013-05-10 15:11:23','2013-05-10 15:12:28');
INSERT INTO `nodes` VALUES (47,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:12:48','2013-05-10 15:13:53');
INSERT INTO `nodes` VALUES (48,'00:1f:16:c8:d9:13',2,'2013-05-10 15:14:33','2013-05-10 15:15:39');
INSERT INTO `nodes` VALUES (49,'01-Jan-2000',3,'2013-05-10 15:14:38','2013-05-10 15:15:44');
INSERT INTO `nodes` VALUES (50,'02:18:01',3,'2013-05-10 15:14:38','2013-05-10 15:15:44');
INSERT INTO `nodes` VALUES (51,'02:18:01',3,'2013-05-10 15:14:38','2013-05-10 15:15:44');
INSERT INTO `nodes` VALUES (52,'02:18:03',3,'2013-05-10 15:14:38','2013-05-10 15:15:44');
INSERT INTO `nodes` VALUES (53,'02:18:03',3,'2013-05-10 15:14:38','2013-05-10 15:15:44');
INSERT INTO `nodes` VALUES (54,'00:21:cc:00:34:5f',4,'2013-05-10 15:14:43','2013-05-10 15:17:59');
INSERT INTO `nodes` VALUES (55,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:14:59','2013-05-10 15:16:04');
INSERT INTO `nodes` VALUES (56,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:15:39','2013-05-10 15:17:49');
INSERT INTO `nodes` VALUES (57,'00:23:5a:42:fd:2e',3,'2013-05-10 15:15:44','2013-05-10 15:17:54');
INSERT INTO `nodes` VALUES (58,'00:0c:29:1b:1a:b4',7,'2013-05-10 15:16:04','2013-05-10 15:17:09');
INSERT INTO `nodes` VALUES (59,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:16:04','2013-05-10 15:18:14');
INSERT INTO `nodes` VALUES (60,'00:1d:09:3e:11:59',2,'2013-05-10 15:16:44','2013-05-10 15:17:49');
INSERT INTO `nodes` VALUES (61,'00:0c:29:1b:1a:b4',7,'2013-05-10 15:18:14','2013-05-10 15:31:16');
INSERT INTO `nodes` VALUES (62,'08:00:27:14:31:e5',2,'2013-05-10 15:18:54','2013-05-10 15:19:59');
INSERT INTO `nodes` VALUES (63,'00:23:5a:42:fd:2e',3,'2013-05-10 15:20:04','2013-05-10 15:24:25');
INSERT INTO `nodes` VALUES (64,'00:21:cc:00:34:5f',4,'2013-05-10 15:20:09','2013-05-10 15:21:14');
INSERT INTO `nodes` VALUES (65,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:20:24','2013-05-10 15:23:40');
INSERT INTO `nodes` VALUES (66,'00:1d:09:3e:11:59',2,'2013-05-10 15:21:04','2013-05-10 15:22:10');
INSERT INTO `nodes` VALUES (67,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:21:04','2013-05-10 15:23:15');
INSERT INTO `nodes` VALUES (68,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:22:35','2013-05-10 15:23:40');
INSERT INTO `nodes` VALUES (69,'08:00:27:14:31:e5',2,'2013-05-10 15:23:15','2013-05-10 15:24:20');
INSERT INTO `nodes` VALUES (70,'00:21:cc:00:34:5f',4,'2013-05-10 15:23:25','2013-05-10 15:29:56');
INSERT INTO `nodes` VALUES (71,'01-Jan-2000',6,'2013-05-10 15:24:40','2013-05-10 15:25:45');
INSERT INTO `nodes` VALUES (72,'00:90:f5:8c:20:30',5,'2013-05-10 15:26:45','2013-05-10 15:44:10');
INSERT INTO `nodes` VALUES (73,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:27:35','2013-05-10 15:29:46');
INSERT INTO `nodes` VALUES (74,'00:23:5a:42:fd:2e',3,'2013-05-10 15:27:40','2013-05-10 15:32:01');
INSERT INTO `nodes` VALUES (75,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:28:00','2013-05-10 15:29:05');
INSERT INTO `nodes` VALUES (76,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:28:00','2013-05-10 15:29:05');
INSERT INTO `nodes` VALUES (77,'d0:67:e5:f0:77:ee',4,'2013-05-10 15:28:50','2013-05-10 15:29:56');
INSERT INTO `nodes` VALUES (78,'00:8c:fa:3a:c3:c9',4,'2013-05-10 15:29:56','2013-05-10 15:31:01');
INSERT INTO `nodes` VALUES (79,'01-Jan-2000',4,'2013-05-10 15:29:56','2013-05-10 15:31:01');
INSERT INTO `nodes` VALUES (80,'00:26:6c:92:5b:b6',6,'2013-05-10 15:30:06','2013-05-10 15:35:32');
INSERT INTO `nodes` VALUES (81,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:30:11','2013-05-10 15:31:16');
INSERT INTO `nodes` VALUES (82,'d0:67:e5:f0:77:ee',4,'2013-05-10 15:31:01','2013-05-10 15:32:06');
INSERT INTO `nodes` VALUES (83,'00:21:cc:00:34:5f',4,'2013-05-10 15:34:16','2013-05-10 15:35:21');
INSERT INTO `nodes` VALUES (84,'d0:67:e5:f0:77:ee',4,'2013-05-10 15:34:16','2013-05-10 15:35:21');
INSERT INTO `nodes` VALUES (85,'d0:67:e5:f0:71:ee',5,'2013-05-10 15:34:21','2013-05-10 16:15:42');
INSERT INTO `nodes` VALUES (86,'d0:67:e5:f0:71:ef',5,'2013-05-10 15:34:21','2013-05-10 15:35:26');
INSERT INTO `nodes` VALUES (87,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:35:11','2013-05-10 15:36:17');
INSERT INTO `nodes` VALUES (88,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:35:37','2013-05-10 15:36:42');
INSERT INTO `nodes` VALUES (89,'00:23:5a:42:fd:2e',3,'2013-05-10 15:36:22','2013-05-10 15:37:27');
INSERT INTO `nodes` VALUES (90,'08:00:27:e7:8e:9f',3,'2013-05-10 15:37:27','2013-05-10 15:38:33');
INSERT INTO `nodes` VALUES (91,'00:21:cc:00:34:5f',4,'2013-05-10 15:37:32','2013-05-10 15:39:43');
INSERT INTO `nodes` VALUES (92,'d0:67:e5:f0:77:ee',4,'2013-05-10 15:37:32','2013-05-10 15:38:38');
INSERT INTO `nodes` VALUES (93,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:37:48','2013-05-10 15:38:53');
INSERT INTO `nodes` VALUES (94,'08:00:27:5d:23:02',7,'2013-05-10 15:37:48','2013-05-10 15:39:58');
INSERT INTO `nodes` VALUES (95,'08:00:27:14:31:e5',2,'2013-05-10 15:38:28','2013-05-10 18:19:33');
INSERT INTO `nodes` VALUES (96,'00:0c:29:1b:1a:b4',7,'2013-05-10 15:39:58','2013-05-10 15:41:04');
INSERT INTO `nodes` VALUES (97,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:39:58','2013-05-10 15:41:04');
INSERT INTO `nodes` VALUES (98,'d0:67:e5:f0:77:ee',4,'2013-05-10 15:40:49','2013-05-10 15:41:54');
INSERT INTO `nodes` VALUES (99,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:42:50','2013-05-10 15:45:00');
INSERT INTO `nodes` VALUES (100,'00:21:cc:00:34:5f',4,'2013-05-10 15:43:00','2013-05-10 15:44:05');
INSERT INTO `nodes` VALUES (101,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:44:20','2013-05-10 15:46:31');
INSERT INTO `nodes` VALUES (102,'08:00:27:5d:23:02',7,'2013-05-10 15:44:20','2013-05-10 15:45:26');
INSERT INTO `nodes` VALUES (103,'08:00:27:e7:8e:9f',3,'2013-05-10 15:45:06','2013-05-10 15:46:11');
INSERT INTO `nodes` VALUES (104,'00:1d:09:3e:11:59',2,'2013-05-10 15:46:06','2013-05-10 15:47:11');
INSERT INTO `nodes` VALUES (105,'00:21:cc:00:34:5f',4,'2013-05-10 15:46:16','2013-05-10 15:48:27');
INSERT INTO `nodes` VALUES (106,'00:0c:29:1b:1a:b4',7,'2013-05-10 15:46:31','2013-05-10 16:00:40');
INSERT INTO `nodes` VALUES (107,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:47:37','2013-05-10 15:48:42');
INSERT INTO `nodes` VALUES (108,'d0:67:e5:f0:77:ee',4,'2013-05-10 15:48:27','2013-05-10 15:53:54');
INSERT INTO `nodes` VALUES (109,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:49:48','2013-05-10 15:50:53');
INSERT INTO `nodes` VALUES (110,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:50:28','2013-05-10 15:52:39');
INSERT INTO `nodes` VALUES (111,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:50:53','2013-05-10 15:53:04');
INSERT INTO `nodes` VALUES (112,'08:00:27:5d:23:02',7,'2013-05-10 15:50:53','2013-05-10 15:51:59');
INSERT INTO `nodes` VALUES (113,'08:00:27:e7:8e:9f',3,'2013-05-10 15:51:38','2013-05-10 15:52:44');
INSERT INTO `nodes` VALUES (114,'00:07:e9:23:6f:bd',7,'2013-05-10 15:51:59','2013-05-10 15:53:04');
INSERT INTO `nodes` VALUES (115,'00:0c:29:08:a0:8d',7,'2013-05-10 15:51:59','2013-05-10 15:53:04');
INSERT INTO `nodes` VALUES (116,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:51:59','2013-05-10 15:55:15');
INSERT INTO `nodes` VALUES (117,'90:a2:da:05:00:65',7,'2013-05-10 15:51:59','2013-05-10 15:55:15');
INSERT INTO `nodes` VALUES (118,'00:23:ae:1d:25:28',1,'2013-05-10 15:53:39','2013-05-10 15:54:45');
INSERT INTO `nodes` VALUES (119,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:54:09','2013-05-10 15:56:20');
INSERT INTO `nodes` VALUES (120,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:55:55','2013-05-10 15:57:00');
INSERT INTO `nodes` VALUES (121,'01-Jan-2000',2,'2013-05-10 15:57:00','2013-05-10 15:58:05');
INSERT INTO `nodes` VALUES (122,'02:56:14',2,'2013-05-10 15:57:00','2013-05-10 15:58:05');
INSERT INTO `nodes` VALUES (123,'08:00:27:e7:8e:9f',3,'2013-05-10 15:57:05','2013-05-10 16:01:25');
INSERT INTO `nodes` VALUES (124,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:57:25','2013-05-10 15:58:30');
INSERT INTO `nodes` VALUES (125,'00:0c:29:f8:2f:d8',7,'2013-05-10 15:57:25','2013-05-10 15:58:30');
INSERT INTO `nodes` VALUES (126,'00:e0:b8:e8:21:cf',2,'2013-05-10 15:58:05','2013-05-10 16:00:15');
INSERT INTO `nodes` VALUES (127,'00:0c:29:9f:5f:2c',7,'2013-05-10 15:59:35','2013-05-10 16:01:45');
INSERT INTO `nodes` VALUES (128,'00:e0:b8:e8:21:cf',2,'2013-05-10 16:01:20','2013-05-10 16:04:36');
INSERT INTO `nodes` VALUES (129,'01-Jan-2000',2,'2013-05-10 16:01:20','2013-05-10 16:02:25');
INSERT INTO `nodes` VALUES (130,'00:0c:29:7a:81:fe',6,'2013-05-10 16:02:45','2013-05-10 16:03:51');
INSERT INTO `nodes` VALUES (131,'00:26:6c:92:5b:b6',6,'2013-05-10 16:02:45','2013-05-10 16:58:07');
INSERT INTO `nodes` VALUES (132,'00:0c:29:9f:5f:2c',7,'2013-05-10 16:02:50','2013-05-10 16:03:56');
INSERT INTO `nodes` VALUES (133,'00:0c:29:f8:2f:d8',7,'2013-05-10 16:02:50','2013-05-10 16:03:56');
INSERT INTO `nodes` VALUES (134,'08:00:27:e7:8e:9f',3,'2013-05-10 16:03:36','2013-05-10 19:23:46');
INSERT INTO `nodes` VALUES (135,'d0:67:e5:f0:77:ee',4,'2013-05-10 16:04:46','2013-05-10 16:05:51');
INSERT INTO `nodes` VALUES (136,'00:0c:29:7a:81:fe',6,'2013-05-10 16:04:56','2013-05-10 16:06:01');
INSERT INTO `nodes` VALUES (137,'00:07:e9:23:6f:bd',7,'2013-05-10 16:05:01','2013-05-10 16:07:11');
INSERT INTO `nodes` VALUES (138,'00:0c:29:08:a0:8d',7,'2013-05-10 16:05:01','2013-05-10 16:07:11');
INSERT INTO `nodes` VALUES (139,'00:0c:29:9f:5f:2c',7,'2013-05-10 16:05:01','2013-05-10 16:11:31');
INSERT INTO `nodes` VALUES (140,'00:0c:29:f8:2f:d8',7,'2013-05-10 16:05:01','2013-05-10 16:29:59');
INSERT INTO `nodes` VALUES (141,'00:0c:29:1b:1a:b4',7,'2013-05-10 16:07:11','2013-05-10 16:10:26');
INSERT INTO `nodes` VALUES (142,'00:e0:b8:e8:21:cf',2,'2013-05-10 16:08:56','2013-05-10 16:10:01');
INSERT INTO `nodes` VALUES (143,'00:0c:29:7a:81:fe',6,'2013-05-10 16:10:21','2013-05-10 16:11:26');
INSERT INTO `nodes` VALUES (144,'00:e0:b8:e8:21:cf',2,'2013-05-10 16:12:12','2013-05-10 18:19:33');
INSERT INTO `nodes` VALUES (145,'00:07:e9:23:6f:bd',7,'2013-05-10 16:12:37','2013-05-10 16:13:42');
INSERT INTO `nodes` VALUES (146,'00:0c:29:1b:1a:b4',7,'2013-05-10 16:12:37','2013-05-10 16:32:09');
INSERT INTO `nodes` VALUES (147,'00:0c:29:9f:5f:2c',7,'2013-05-10 16:12:37','2013-05-10 16:13:42');
INSERT INTO `nodes` VALUES (148,'00:21:cc:00:34:5f',4,'2013-05-10 16:14:32','2013-05-10 16:16:42');
INSERT INTO `nodes` VALUES (149,'d0:67:e5:f0:71:ef',5,'2013-05-10 16:14:37','2013-05-10 16:15:42');
INSERT INTO `nodes` VALUES (150,'01-Jan-2000',6,'2013-05-10 16:14:42','2013-05-10 16:15:47');
INSERT INTO `nodes` VALUES (151,'00:0c:29:9f:5f:2c',7,'2013-05-10 16:14:47','2013-05-10 16:23:28');
INSERT INTO `nodes` VALUES (152,'03:22:49',7,'2013-05-10 16:15:52','2013-05-10 16:16:57');
INSERT INTO `nodes` VALUES (153,'00:07:e9:23:6f:bd',7,'2013-05-10 16:15:52','2013-05-10 16:16:57');
INSERT INTO `nodes` VALUES (154,'00:0c:29:08:a0:8d',7,'2013-05-10 16:15:52','2013-05-10 16:16:57');
INSERT INTO `nodes` VALUES (155,'d0:67:e5:f0:77:ee',4,'2013-05-10 16:16:42','2013-05-10 16:17:47');
INSERT INTO `nodes` VALUES (156,'00:0c:29:7a:81:fe',6,'2013-05-10 16:16:52','2013-05-10 16:17:57');
INSERT INTO `nodes` VALUES (157,'d0:67:e5:f0:77:ee',4,'2013-05-10 16:18:52','2013-05-10 16:22:08');
INSERT INTO `nodes` VALUES (158,'00:07:e9:23:6f:bd',7,'2013-05-10 16:19:07','2013-05-10 16:28:54');
INSERT INTO `nodes` VALUES (159,'00:0c:29:08:a0:8d',7,'2013-05-10 16:19:07','2013-05-10 16:20:13');
INSERT INTO `nodes` VALUES (160,'90:a2:da:05:00:65',7,'2013-05-10 16:19:07','2013-05-10 16:26:43');
INSERT INTO `nodes` VALUES (161,'00:21:cc:00:34:5f',4,'2013-05-10 16:19:58','2013-05-10 16:22:08');
INSERT INTO `nodes` VALUES (162,'d0:67:e5:f0:71:ee',5,'2013-05-10 16:20:03','2013-05-10 16:58:02');
INSERT INTO `nodes` VALUES (163,'03:21:36',6,'2013-05-10 16:20:08','2013-05-10 16:21:13');
INSERT INTO `nodes` VALUES (164,'00:1d:09:3e:11:59',2,'2013-05-10 16:20:53','2013-05-10 16:21:58');
INSERT INTO `nodes` VALUES (165,'00:0c:29:08:a0:8d',7,'2013-05-10 16:21:18','2013-05-10 16:22:23');
INSERT INTO `nodes` VALUES (166,'00:21:cc:00:34:5f',4,'2013-05-10 16:23:13','2013-05-10 16:28:39');
INSERT INTO `nodes` VALUES (167,'00:0c:29:08:a0:8d',7,'2013-05-10 16:23:28','2013-05-10 16:32:09');
INSERT INTO `nodes` VALUES (168,'00:23:5a:42:fd:2e',3,'2013-05-10 16:24:13','2013-05-10 16:28:34');
INSERT INTO `nodes` VALUES (169,'00:0c:29:9f:5f:2c',7,'2013-05-10 16:24:33','2013-05-10 16:32:09');
INSERT INTO `nodes` VALUES (170,'08:00:27:5d:23:02',7,'2013-05-10 16:26:43','2013-05-10 16:27:48');
INSERT INTO `nodes` VALUES (171,'d0:67:e5:f0:77:ee',4,'2013-05-10 16:28:39','2013-05-10 16:30:49');
INSERT INTO `nodes` VALUES (172,'90:a2:da:05:00:65',7,'2013-05-10 16:28:54','2013-05-10 16:34:19');
INSERT INTO `nodes` VALUES (173,'00:23:5a:42:fd:2e',3,'2013-05-10 16:29:39','2013-05-10 16:30:44');
INSERT INTO `nodes` VALUES (174,'00:21:cc:00:34:5f',4,'2013-05-10 16:29:44','2013-05-10 16:35:09');
INSERT INTO `nodes` VALUES (175,'00:0c:29:f8:2f:d8',7,'2013-05-10 16:31:04','2013-05-10 17:04:43');
INSERT INTO `nodes` VALUES (176,'00:0c:29:08:a0:8d',7,'2013-05-10 16:33:14','2013-05-10 16:34:19');
INSERT INTO `nodes` VALUES (177,'00:0c:29:1b:1a:b4',7,'2013-05-10 16:33:14','2013-05-10 16:34:19');
INSERT INTO `nodes` VALUES (178,'00:0c:29:9f:5f:2c',7,'2013-05-10 16:33:14','2013-05-10 17:03:38');
INSERT INTO `nodes` VALUES (179,'00:23:5a:42:fd:2e',3,'2013-05-10 16:35:04','2013-05-10 16:39:25');
INSERT INTO `nodes` VALUES (180,'00:0c:29:08:a0:8d',7,'2013-05-10 16:35:24','2013-05-10 16:36:30');
INSERT INTO `nodes` VALUES (181,'00:0c:29:1b:1a:b4',7,'2013-05-10 16:35:24','2013-05-10 16:36:30');
INSERT INTO `nodes` VALUES (182,'90:a2:da:05:00:65',7,'2013-05-10 16:35:24','2013-05-10 16:36:30');
INSERT INTO `nodes` VALUES (183,'d0:67:e5:f0:77:ee',4,'2013-05-10 16:36:14','2013-05-10 16:37:20');
INSERT INTO `nodes` VALUES (184,'01-Jan-2000',1,'2013-05-10 16:37:05','2013-05-10 16:38:10');
INSERT INTO `nodes` VALUES (185,'00:21:cc:00:34:5f',4,'2013-05-10 16:37:20','2013-05-10 16:39:30');
INSERT INTO `nodes` VALUES (186,'00:0c:29:1b:1a:b4',7,'2013-05-10 16:37:35','2013-05-10 16:39:45');
INSERT INTO `nodes` VALUES (187,'08:60:6e:4c:5f:37',1,'2013-05-10 16:38:10','2013-05-10 16:39:15');
INSERT INTO `nodes` VALUES (188,'00:0c:29:08:a0:8d',7,'2013-05-10 16:38:40','2013-05-10 16:39:45');
INSERT INTO `nodes` VALUES (189,'00:21:9b:d2:35:a9',7,'2013-05-10 16:38:40','2013-05-10 18:28:42');
INSERT INTO `nodes` VALUES (190,'90:a2:da:05:00:65',7,'2013-05-10 16:38:40','2013-05-10 16:39:45');
INSERT INTO `nodes` VALUES (191,'00:21:cc:00:34:5f',4,'2013-05-10 16:40:35','2013-05-10 16:41:40');
INSERT INTO `nodes` VALUES (192,'d0:67:e5:f0:77:ee',4,'2013-05-10 16:40:35','2013-05-10 16:41:40');
INSERT INTO `nodes` VALUES (193,'d0:67:e5:f0:88:0b',7,'2013-05-10 16:40:50','2013-05-10 16:43:00');
INSERT INTO `nodes` VALUES (194,'00:0c:29:08:a0:8d',7,'2013-05-10 16:41:55','2013-05-10 16:43:00');
INSERT INTO `nodes` VALUES (195,'00:0c:29:1b:1a:b4',7,'2013-05-10 16:41:55','2013-05-10 16:56:02');
INSERT INTO `nodes` VALUES (196,'90:a2:da:05:00:65',7,'2013-05-10 16:41:55','2013-05-10 16:43:00');
INSERT INTO `nodes` VALUES (197,'00:23:5a:42:fd:2e',3,'2013-05-10 16:42:40','2013-05-10 16:47:01');
INSERT INTO `nodes` VALUES (198,'00:1e:ec:63:4d:82',6,'2013-05-10 16:44:00','2013-05-10 16:47:16');
INSERT INTO `nodes` VALUES (199,'00:21:cc:00:34:5f',4,'2013-05-10 16:44:56','2013-05-10 16:46:01');
INSERT INTO `nodes` VALUES (200,'00:23:ae:1d:25:28',1,'2013-05-10 16:47:56','2013-05-10 17:41:07');
INSERT INTO `nodes` VALUES (201,'00:21:cc:00:34:5f',4,'2013-05-10 16:48:11','2013-05-10 16:50:21');
INSERT INTO `nodes` VALUES (202,'00:1e:ec:63:4d:82',6,'2013-05-10 16:49:26','2013-05-10 16:50:31');
INSERT INTO `nodes` VALUES (203,'00:0c:29:08:a0:8d',7,'2013-05-10 16:49:31','2013-05-10 16:50:36');
INSERT INTO `nodes` VALUES (204,'00:23:5a:42:fd:2e',3,'2013-05-10 16:51:21','2013-05-10 16:55:42');
INSERT INTO `nodes` VALUES (205,'00:21:cc:00:34:5f',4,'2013-05-10 16:51:26','2013-05-10 16:52:31');
INSERT INTO `nodes` VALUES (206,'00:0c:29:08:a0:8d',7,'2013-05-10 16:51:41','2013-05-10 16:52:46');
INSERT INTO `nodes` VALUES (207,'d0:67:e5:f0:77:ee',4,'2013-05-10 16:52:31','2013-05-10 16:54:42');
INSERT INTO `nodes` VALUES (208,'00:21:cc:00:34:5f',4,'2013-05-10 16:53:36','2013-05-10 16:54:42');
INSERT INTO `nodes` VALUES (209,'00:1e:ec:63:4d:82',6,'2013-05-10 16:53:47','2013-05-10 16:54:52');
INSERT INTO `nodes` VALUES (210,'03:56:29',6,'2013-05-10 16:54:52','2013-05-10 16:55:57');
INSERT INTO `nodes` VALUES (211,'00:0c:29:08:a0:8d',7,'2013-05-10 16:54:57','2013-05-10 16:56:02');
INSERT INTO `nodes` VALUES (212,'00:21:cc:00:34:5f',4,'2013-05-10 16:55:47','2013-05-10 16:57:57');
INSERT INTO `nodes` VALUES (213,'d0:67:e5:f0:71:ef',5,'2013-05-10 16:56:57','2013-05-10 16:58:02');
INSERT INTO `nodes` VALUES (214,'e8:03:9a:dd:8a:82',4,'2013-05-10 16:57:57','2013-05-10 20:50:42');
INSERT INTO `nodes` VALUES (215,'00:0c:29:1b:1a:b4',7,'2013-05-10 16:58:12','2013-05-10 17:02:33');
INSERT INTO `nodes` VALUES (216,'00:23:5a:42:fd:2e',3,'2013-05-10 16:58:57','2013-05-10 17:03:18');
INSERT INTO `nodes` VALUES (217,'00:21:cc:00:34:5f',4,'2013-05-10 16:59:02','2013-05-10 17:00:07');
INSERT INTO `nodes` VALUES (218,'00:1e:ec:63:4d:82',6,'2013-05-10 16:59:12','2013-05-10 20:05:16');
INSERT INTO `nodes` VALUES (219,'00:26:6c:92:5b:b6',6,'2013-05-10 17:00:17','2013-05-10 17:01:22');
INSERT INTO `nodes` VALUES (220,'00:26:6c:92:5b:b6',6,'2013-05-10 17:02:28','2013-05-10 17:05:43');
INSERT INTO `nodes` VALUES (221,'00:21:cc:00:34:5f',4,'2013-05-10 17:03:23','2013-05-10 17:05:33');
INSERT INTO `nodes` VALUES (222,'00:1d:09:3e:11:59',2,'2013-05-10 17:04:18','2013-05-10 17:05:23');
INSERT INTO `nodes` VALUES (223,'d0:67:e5:f0:77:ee',4,'2013-05-10 17:04:28','2013-05-10 17:05:33');
INSERT INTO `nodes` VALUES (224,'00:90:f5:8c:20:30',5,'2013-05-10 17:04:33','2013-05-10 17:28:26');
INSERT INTO `nodes` VALUES (225,'00:0c:29:08:a0:8d',7,'2013-05-10 17:04:43','2013-05-10 17:07:58');
INSERT INTO `nodes` VALUES (226,'d0:67:e5:f0:71:ee',5,'2013-05-10 17:06:43','2013-05-10 20:05:11');
INSERT INTO `nodes` VALUES (227,'d0:67:e5:f0:71:ef',5,'2013-05-10 17:06:43','2013-05-10 17:07:48');
INSERT INTO `nodes` VALUES (228,'00:26:6c:92:5b:b6',6,'2013-05-10 17:06:48','2013-05-10 17:13:19');
INSERT INTO `nodes` VALUES (229,'00:23:5a:42:fd:2e',3,'2013-05-10 17:07:38','2013-05-10 17:09:49');
INSERT INTO `nodes` VALUES (230,'00:21:cc:00:34:5f',4,'2013-05-10 17:08:48','2013-05-10 17:12:04');
INSERT INTO `nodes` VALUES (231,'00:07:e9:23:6f:bd',7,'2013-05-10 17:09:03','2013-05-10 17:13:24');
INSERT INTO `nodes` VALUES (232,'00:0c:29:08:a0:8d',7,'2013-05-10 17:09:03','2013-05-10 17:10:09');
INSERT INTO `nodes` VALUES (233,'00:0c:29:1b:1a:b4',7,'2013-05-10 17:10:09','2013-05-10 17:23:10');
INSERT INTO `nodes` VALUES (234,'08:60:6e:4c:5f:37',1,'2013-05-10 17:12:54','2013-05-10 17:16:09');
INSERT INTO `nodes` VALUES (235,'00:0c:29:08:a0:8d',7,'2013-05-10 17:13:24','2013-05-10 17:14:29');
INSERT INTO `nodes` VALUES (236,'00:1d:09:3e:11:59',2,'2013-05-10 17:14:04','2013-05-10 17:16:14');
INSERT INTO `nodes` VALUES (237,'00:1d:72:70:25:75',3,'2013-05-10 17:14:09','2013-05-10 17:19:35');
INSERT INTO `nodes` VALUES (238,'00:21:cc:00:34:5f',4,'2013-05-10 17:14:14','2013-05-10 17:17:29');
INSERT INTO `nodes` VALUES (239,'00:26:6c:92:5b:b6',6,'2013-05-10 17:15:29','2013-05-10 17:17:39');
INSERT INTO `nodes` VALUES (240,'00:07:e9:23:6f:bd',7,'2013-05-10 17:15:34','2013-05-10 17:16:39');
INSERT INTO `nodes` VALUES (241,'d0:67:e5:f0:77:ee',4,'2013-05-10 17:16:24','2013-05-10 17:17:29');
INSERT INTO `nodes` VALUES (242,'00:1d:09:3e:11:59',2,'2013-05-10 17:17:19','2013-05-10 17:19:30');
INSERT INTO `nodes` VALUES (243,'08:60:6e:4c:5f:37',1,'2013-05-10 17:18:20','2013-05-10 17:19:25');
INSERT INTO `nodes` VALUES (244,'00:21:cc:00:34:5f',4,'2013-05-10 17:18:35','2013-05-10 17:19:40');
INSERT INTO `nodes` VALUES (245,'00:07:e9:23:6f:bd',7,'2013-05-10 17:18:50','2013-05-10 17:19:55');
INSERT INTO `nodes` VALUES (246,'00:0c:29:fb:6c:fa',7,'2013-05-10 17:19:55','2013-05-10 17:24:15');
INSERT INTO `nodes` VALUES (247,'00:1d:09:3e:11:59',2,'2013-05-10 17:20:35','2013-05-10 17:21:40');
INSERT INTO `nodes` VALUES (248,'00:07:e9:23:6f:bd',7,'2013-05-10 17:21:00','2013-05-10 17:22:05');
INSERT INTO `nodes` VALUES (249,'00:0c:29:08:a0:8d',7,'2013-05-10 17:21:00','2013-05-10 17:23:10');
INSERT INTO `nodes` VALUES (250,'00:21:cc:00:34:5f',4,'2013-05-10 17:22:55','2013-05-10 17:24:00');
INSERT INTO `nodes` VALUES (251,'00:26:6c:92:5b:b6',6,'2013-05-10 17:23:05','2013-05-10 17:37:12');
INSERT INTO `nodes` VALUES (252,'00:1d:72:70:25:75',3,'2013-05-10 17:23:55','2013-05-10 17:53:14');
INSERT INTO `nodes` VALUES (253,'00:0c:29:1b:1a:b4',7,'2013-05-10 17:24:15','2013-05-10 17:25:20');
INSERT INTO `nodes` VALUES (254,'00:23:5a:42:fd:2e',3,'2013-05-10 17:26:05','2013-05-10 17:30:26');
INSERT INTO `nodes` VALUES (255,'01-Jan-2000',5,'2013-05-10 17:27:21','2013-05-10 17:28:26');
INSERT INTO `nodes` VALUES (256,'00:07:e9:23:6f:bd',7,'2013-05-10 17:27:31','2013-05-10 17:28:36');
INSERT INTO `nodes` VALUES (257,'00:0c:29:1b:1a:b4',7,'2013-05-10 17:27:31','2013-05-10 17:30:46');
INSERT INTO `nodes` VALUES (258,'00:0c:29:fb:6c:fa',7,'2013-05-10 17:27:31','2013-05-10 17:28:36');
INSERT INTO `nodes` VALUES (259,'00:21:cc:00:34:5f',4,'2013-05-10 17:28:21','2013-05-10 17:30:31');
INSERT INTO `nodes` VALUES (260,'00:0c:29:fb:6c:fa',7,'2013-05-10 17:29:41','2013-05-10 17:35:07');
INSERT INTO `nodes` VALUES (261,'08:60:6e:4c:5f:37',1,'2013-05-10 17:31:21','2013-05-10 18:03:55');
INSERT INTO `nodes` VALUES (262,'00:21:cc:00:34:5f',4,'2013-05-10 17:31:36','2013-05-10 17:32:41');
INSERT INTO `nodes` VALUES (263,'00:07:e9:23:6f:bd',7,'2013-05-10 17:31:51','2013-05-10 17:34:01');
INSERT INTO `nodes` VALUES (264,'00:0c:29:08:a0:8d',7,'2013-05-10 17:31:51','2013-05-10 17:35:07');
INSERT INTO `nodes` VALUES (265,'00:23:5a:42:fd:2e',3,'2013-05-10 17:33:41','2013-05-10 17:38:02');
INSERT INTO `nodes` VALUES (266,'00:07:e9:23:6f:bd',7,'2013-05-10 17:35:07','2013-05-10 17:37:17');
INSERT INTO `nodes` VALUES (267,'00:21:cc:00:34:5f',4,'2013-05-10 17:35:57','2013-05-10 17:37:02');
INSERT INTO `nodes` VALUES (268,'10:9a:dd:6a:d5:4e',6,'2013-05-10 17:37:12','2013-05-10 17:42:37');
INSERT INTO `nodes` VALUES (269,'00:1d:09:3e:11:59',2,'2013-05-10 17:37:57','2013-05-10 17:39:02');
INSERT INTO `nodes` VALUES (270,'00:26:6c:92:5b:b6',6,'2013-05-10 17:38:17','2013-05-10 17:39:22');
INSERT INTO `nodes` VALUES (271,'00:0c:29:1b:1a:b4',7,'2013-05-10 17:38:22','2013-05-10 17:51:23');
INSERT INTO `nodes` VALUES (272,'00:0c:29:fb:6c:fa',7,'2013-05-10 17:38:22','2013-05-10 17:41:37');
INSERT INTO `nodes` VALUES (273,'90:a2:da:05:00:65',7,'2013-05-10 17:38:22','2013-05-10 17:39:27');
INSERT INTO `nodes` VALUES (274,'00:26:6c:92:5b:b6',6,'2013-05-10 17:40:27','2013-05-10 17:51:18');
INSERT INTO `nodes` VALUES (275,'00:21:cc:00:34:5f',4,'2013-05-10 17:41:22','2013-05-10 17:44:38');
INSERT INTO `nodes` VALUES (276,'d0:67:e5:f0:77:ee',4,'2013-05-10 17:41:22','2013-05-10 17:42:27');
INSERT INTO `nodes` VALUES (277,'00:23:5a:42:fd:2e',3,'2013-05-10 17:42:22','2013-05-10 17:45:38');
INSERT INTO `nodes` VALUES (278,'10:9a:dd:6a:d5:4e',7,'2013-05-10 17:42:42','2013-05-10 18:27:36');
INSERT INTO `nodes` VALUES (279,'90:a2:da:05:00:65',7,'2013-05-10 17:42:42','2013-05-10 17:57:54');
INSERT INTO `nodes` VALUES (280,'00:1d:09:3e:11:59',2,'2013-05-10 17:43:22','2013-05-10 17:45:33');
INSERT INTO `nodes` VALUES (281,'d0:67:e5:f0:77:ee',4,'2013-05-10 17:43:32','2013-05-10 18:16:14');
INSERT INTO `nodes` VALUES (282,'00:07:e9:23:6f:bd',7,'2013-05-10 17:43:48','2013-05-10 17:45:58');
INSERT INTO `nodes` VALUES (283,'00:0c:29:08:a0:8d',7,'2013-05-10 17:43:48','2013-05-10 17:44:53');
INSERT INTO `nodes` VALUES (284,'00:0c:29:fb:6c:fa',7,'2013-05-10 17:43:48','2013-05-10 17:48:08');
INSERT INTO `nodes` VALUES (285,'00:23:ae:1d:25:28',1,'2013-05-10 17:44:23','2013-05-10 18:03:55');
INSERT INTO `nodes` VALUES (286,'08:00:27:27:46:b3',5,'2013-05-10 17:44:43','2013-05-10 17:46:53');
INSERT INTO `nodes` VALUES (287,'00:0c:29:7a:81:fe',6,'2013-05-10 17:44:48','2013-05-10 17:46:58');
INSERT INTO `nodes` VALUES (288,'00:23:5a:42:fd:2e',3,'2013-05-10 17:46:43','2013-05-10 18:21:49');
INSERT INTO `nodes` VALUES (289,'00:21:cc:00:34:5f',4,'2013-05-10 17:46:48','2013-05-10 17:47:53');
INSERT INTO `nodes` VALUES (290,'00:0c:29:7a:81:fe',6,'2013-05-10 17:48:03','2013-05-10 17:53:29');
INSERT INTO `nodes` VALUES (291,'04:53:40',1,'2013-05-10 17:48:43','2013-05-10 17:49:48');
INSERT INTO `nodes` VALUES (292,'00:1d:09:3e:11:59',2,'2013-05-10 17:48:48','2013-05-10 17:49:53');
INSERT INTO `nodes` VALUES (293,'00:0c:29:08:a0:8d',7,'2013-05-10 17:49:13','2013-05-10 17:50:18');
INSERT INTO `nodes` VALUES (294,'00:0c:29:fb:6c:fa',7,'2013-05-10 17:49:13','2013-05-10 18:10:57');
INSERT INTO `nodes` VALUES (295,'08:00:27:27:46:b3',5,'2013-05-10 17:50:08','2013-05-10 17:53:24');
INSERT INTO `nodes` VALUES (296,'d0:67:e5:f0:88:0b',7,'2013-05-10 17:50:18','2013-05-10 17:51:23');
INSERT INTO `nodes` VALUES (297,'04:55:03',3,'2013-05-10 17:51:03','2013-05-10 17:52:09');
INSERT INTO `nodes` VALUES (298,'00:26:6c:92:5b:b6',6,'2013-05-10 17:52:24','2013-05-10 17:53:29');
INSERT INTO `nodes` VALUES (299,'00:21:cc:00:34:5f',4,'2013-05-10 17:53:19','2013-05-10 17:55:29');
INSERT INTO `nodes` VALUES (300,'00:26:6c:92:5b:b6',6,'2013-05-10 17:54:34','2013-05-10 18:37:18');
INSERT INTO `nodes` VALUES (301,'04:57:31',6,'2013-05-10 17:55:39','2013-05-10 17:56:44');
INSERT INTO `nodes` VALUES (302,'00:0c:29:1b:1a:b4',7,'2013-05-10 17:55:44','2013-05-10 18:02:15');
INSERT INTO `nodes` VALUES (303,'00:1d:09:3e:11:59',2,'2013-05-10 17:56:24','2013-05-10 17:57:29');
INSERT INTO `nodes` VALUES (304,'00:1d:72:70:25:75',3,'2013-05-10 17:56:29','2013-05-10 18:15:04');
INSERT INTO `nodes` VALUES (305,'08:00:27:27:46:b3',5,'2013-05-10 17:58:49','2013-05-10 18:01:00');
INSERT INTO `nodes` VALUES (306,'00:07:e9:23:6f:bd',7,'2013-05-10 17:58:59','2013-05-10 18:01:10');
INSERT INTO `nodes` VALUES (307,'78:2b:cb:66:59:98',2,'2013-05-10 17:59:39','2013-05-10 18:08:21');
INSERT INTO `nodes` VALUES (308,'00:21:cc:00:34:5f',4,'2013-05-10 17:59:49','2013-05-10 18:00:55');
INSERT INTO `nodes` VALUES (309,'00:1d:09:3e:11:59',2,'2013-05-10 18:02:55','2013-05-10 18:04:00');
INSERT INTO `nodes` VALUES (310,'00:07:e9:23:6f:bd',7,'2013-05-10 18:03:20','2013-05-10 18:04:25');
INSERT INTO `nodes` VALUES (311,'01-Jan-2000',1,'2013-05-10 18:03:55','2013-05-10 18:05:00');
INSERT INTO `nodes` VALUES (312,'05:09:00',1,'2013-05-10 18:03:55','2013-05-10 18:05:00');
INSERT INTO `nodes` VALUES (313,'00:21:cc:00:34:5f',4,'2013-05-10 18:04:10','2013-05-10 18:05:15');
INSERT INTO `nodes` VALUES (314,'00:23:ae:1d:25:28',1,'2013-05-10 18:05:00','2013-05-10 19:21:26');
INSERT INTO `nodes` VALUES (315,'08:00:27:27:46:b3',5,'2013-05-10 18:05:20','2013-05-10 18:07:30');
INSERT INTO `nodes` VALUES (316,'00:0c:29:08:a0:8d',7,'2013-05-10 18:06:35','2013-05-10 18:07:40');
INSERT INTO `nodes` VALUES (317,'00:0c:29:1b:1a:b4',7,'2013-05-10 18:06:35','2013-05-10 18:18:40');
INSERT INTO `nodes` VALUES (318,'00:21:cc:00:34:5f',4,'2013-05-10 18:08:31','2013-05-10 18:09:36');
INSERT INTO `nodes` VALUES (319,'00:21:cc:00:34:5f',4,'2013-05-10 18:10:42','2013-05-10 18:14:04');
INSERT INTO `nodes` VALUES (320,'00:07:e9:23:6f:bd',7,'2013-05-10 18:10:57','2013-05-10 18:14:19');
INSERT INTO `nodes` VALUES (321,'00:0c:29:08:a0:8d',7,'2013-05-10 18:12:02','2013-05-10 18:14:19');
INSERT INTO `nodes` VALUES (322,'00:0c:29:fb:6c:fa',7,'2013-05-10 18:12:02','2013-05-10 19:00:14');
INSERT INTO `nodes` VALUES (323,'00:1d:09:3e:11:59',2,'2013-05-10 18:12:43','2013-05-10 18:13:54');
INSERT INTO `nodes` VALUES (324,'08:00:27:27:46:b3',5,'2013-05-10 18:12:58','2013-05-10 18:15:14');
INSERT INTO `nodes` VALUES (325,'00:0c:29:7a:81:fe',6,'2013-05-10 18:13:03','2013-05-10 18:14:14');
INSERT INTO `nodes` VALUES (326,'00:0c:29:7a:81:fe',6,'2013-05-10 18:15:19','2013-05-10 18:18:35');
INSERT INTO `nodes` VALUES (327,'00:07:e9:23:6f:bd',7,'2013-05-10 18:15:24','2013-05-10 18:16:29');
INSERT INTO `nodes` VALUES (328,'00:1d:72:70:25:75',3,'2013-05-10 18:16:09','2013-05-10 19:08:35');
INSERT INTO `nodes` VALUES (329,'90:e2:ba:02:5c:54',3,'2013-05-10 18:16:09','2013-05-10 18:18:19');
INSERT INTO `nodes` VALUES (330,'08:60:6e:4c:5f:37',1,'2013-05-10 18:17:04','2013-05-10 18:21:39');
INSERT INTO `nodes` VALUES (331,'08:00:27:27:46:b3',5,'2013-05-10 18:17:24','2013-05-10 18:19:48');
INSERT INTO `nodes` VALUES (332,'00:07:e9:23:6f:bd',7,'2013-05-10 18:17:34','2013-05-10 18:21:04');
INSERT INTO `nodes` VALUES (333,'00:0c:29:08:a0:8d',7,'2013-05-10 18:17:34','2013-05-10 18:18:40');
INSERT INTO `nodes` VALUES (334,'90:e2:ba:02:5c:50',3,'2013-05-10 18:18:20',NULL);
INSERT INTO `nodes` VALUES (335,'00:21:cc:00:34:5f',4,'2013-05-10 18:18:25','2013-05-10 18:26:15');
INSERT INTO `nodes` VALUES (336,'00:0c:29:08:a0:8d',7,'2013-05-10 18:19:58','2013-05-10 18:21:04');
INSERT INTO `nodes` VALUES (337,'00:0c:29:1b:1a:b4',7,'2013-05-10 18:19:58','2013-05-10 18:21:04');
INSERT INTO `nodes` VALUES (338,'08:00:27:27:46:b3',5,'2013-05-10 18:21:59','2013-05-10 18:27:26');
INSERT INTO `nodes` VALUES (339,'00:07:e9:23:6f:bd',7,'2013-05-10 18:22:09','2013-05-10 18:24:20');
INSERT INTO `nodes` VALUES (340,'00:0c:29:1b:1a:b4',7,'2013-05-10 18:22:09','2013-05-10 18:24:20');
INSERT INTO `nodes` VALUES (341,'08:60:6e:4c:5f:37',1,'2013-05-10 18:22:44','2013-05-10 18:53:13');
INSERT INTO `nodes` VALUES (342,'00:1b:38:df:3e:a1',2,'2013-05-10 18:26:05','2013-05-10 19:10:40');
INSERT INTO `nodes` VALUES (343,'00:e0:b8:e8:21:cf',2,'2013-05-10 18:26:05','2013-05-10 22:10:51');
INSERT INTO `nodes` VALUES (344,'08:00:27:14:31:e5',2,'2013-05-10 18:26:05','2013-05-10 21:18:45');
INSERT INTO `nodes` VALUES (345,'88:ae:1d:5a:e7:ac',2,'2013-05-10 18:26:05',NULL);
INSERT INTO `nodes` VALUES (346,'d0:67:e5:f0:78:c9',2,'2013-05-10 18:26:05',NULL);
INSERT INTO `nodes` VALUES (347,'d0:67:e5:f0:78:cb',2,'2013-05-10 18:26:05',NULL);
INSERT INTO `nodes` VALUES (348,'00:1d:09:3e:11:59',2,'2013-05-10 18:27:11','2013-05-10 18:29:22');
INSERT INTO `nodes` VALUES (349,'00:21:cc:00:34:5f',4,'2013-05-10 18:27:21','2013-05-10 18:32:48');
INSERT INTO `nodes` VALUES (350,'00:0c:29:1b:1a:b4',7,'2013-05-10 18:27:36','2013-05-10 18:30:53');
INSERT INTO `nodes` VALUES (351,'08:00:27:27:46:b3',5,'2013-05-10 18:28:31','2013-05-10 18:38:18');
INSERT INTO `nodes` VALUES (352,'00:0c:29:7a:81:fe',6,'2013-05-10 18:28:37','2013-05-10 18:30:47');
INSERT INTO `nodes` VALUES (353,'00:07:e9:23:6f:bd',7,'2013-05-10 18:28:42','2013-05-10 18:30:53');
INSERT INTO `nodes` VALUES (354,'00:0c:29:08:a0:8d',7,'2013-05-10 18:28:42','2013-05-10 18:29:47');
INSERT INTO `nodes` VALUES (355,'10:9a:dd:6a:d5:4e',7,'2013-05-10 18:28:42','2013-05-10 19:00:14');
INSERT INTO `nodes` VALUES (356,'00:1d:09:3e:11:59',2,'2013-05-10 18:30:27','2013-05-10 18:31:33');
INSERT INTO `nodes` VALUES (357,'00:21:9b:d2:35:a9',7,'2013-05-10 18:30:53','2013-05-10 18:31:58');
INSERT INTO `nodes` VALUES (358,'00:07:e9:23:6f:bd',7,'2013-05-10 18:34:08','2013-05-10 18:37:23');
INSERT INTO `nodes` VALUES (359,'00:0c:29:08:a0:8d',7,'2013-05-10 18:34:08','2013-05-10 18:35:13');
INSERT INTO `nodes` VALUES (360,'00:0c:29:1b:1a:b4',7,'2013-05-10 18:34:08','2013-05-10 18:47:11');
INSERT INTO `nodes` VALUES (361,'00:21:cc:00:34:5f',4,'2013-05-10 18:34:58','2013-05-10 18:39:19');
INSERT INTO `nodes` VALUES (362,'00:0c:29:7a:81:fe',6,'2013-05-10 18:35:08','2013-05-10 18:36:13');
INSERT INTO `nodes` VALUES (363,'00:26:6c:92:5b:b6',6,'2013-05-10 18:38:23','2013-05-10 18:39:29');
INSERT INTO `nodes` VALUES (364,'00:0c:29:08:a0:8d',7,'2013-05-10 18:40:39','2013-05-10 18:41:45');
INSERT INTO `nodes` VALUES (365,'08:00:27:27:46:b3',5,'2013-05-10 18:41:35','2013-05-10 18:43:45');
INSERT INTO `nodes` VALUES (366,'00:26:6c:92:5b:b6',6,'2013-05-10 18:41:40','2013-05-10 18:43:50');
INSERT INTO `nodes` VALUES (367,'00:21:cc:00:34:5f',4,'2013-05-10 18:42:35','2013-05-10 18:43:40');
INSERT INTO `nodes` VALUES (368,'00:1d:09:3e:11:59',2,'2013-05-10 18:43:30','2013-05-10 18:44:35');
INSERT INTO `nodes` VALUES (369,'08:00:27:27:46:b3',5,'2013-05-10 18:44:50','2013-05-10 18:45:56');
INSERT INTO `nodes` VALUES (370,'00:21:cc:00:34:5f',4,'2013-05-10 18:46:56','2013-05-10 18:49:07');
INSERT INTO `nodes` VALUES (371,'08:00:27:27:46:b3',5,'2013-05-10 18:47:01','2013-05-10 20:00:51');
INSERT INTO `nodes` VALUES (372,'00:26:6c:92:5b:b6',6,'2013-05-10 18:51:28','2013-05-10 18:52:33');
INSERT INTO `nodes` VALUES (373,'00:26:6c:76:2a:5e',6,'2013-05-10 18:52:33','2013-05-10 20:22:38');
INSERT INTO `nodes` VALUES (374,'00:0c:29:1b:1a:b4',7,'2013-05-10 18:53:43','2013-05-10 19:01:19');
INSERT INTO `nodes` VALUES (375,'08:60:6e:4c:5f:37',1,'2013-05-10 18:54:18','2013-05-10 18:55:23');
INSERT INTO `nodes` VALUES (376,'00:21:cc:00:34:5f',4,'2013-05-10 18:54:33','2013-05-10 18:55:38');
INSERT INTO `nodes` VALUES (377,'00:07:e9:23:6f:bd',7,'2013-05-10 18:54:48','2013-05-10 18:55:53');
INSERT INTO `nodes` VALUES (378,'00:0c:29:08:a0:8d',7,'2013-05-10 18:54:48','2013-05-10 18:55:53');
INSERT INTO `nodes` VALUES (379,'d0:67:e5:f0:77:ef',4,'2013-05-10 18:55:38',NULL);
INSERT INTO `nodes` VALUES (380,'00:0c:29:7a:81:fe',6,'2013-05-10 18:55:48','2013-05-10 18:56:53');
INSERT INTO `nodes` VALUES (381,'00:26:6c:92:5b:b6',6,'2013-05-10 18:56:53','2013-05-10 18:57:58');
INSERT INTO `nodes` VALUES (382,'08:60:6e:4c:5f:37',1,'2013-05-10 18:59:44','2013-05-10 19:01:54');
INSERT INTO `nodes` VALUES (383,'00:21:cc:00:34:5f',4,'2013-05-10 18:59:59','2013-05-10 19:02:09');
INSERT INTO `nodes` VALUES (384,'00:26:6c:92:5b:b6',6,'2013-05-10 19:00:09','2013-05-10 19:01:14');
INSERT INTO `nodes` VALUES (385,'00:0c:29:fb:6c:fa',7,'2013-05-10 19:01:19','2013-05-10 19:02:24');
INSERT INTO `nodes` VALUES (386,'00:0c:29:1b:1a:b4',7,'2013-05-10 19:02:24','2013-05-10 19:15:25');
INSERT INTO `nodes` VALUES (387,'08:60:6e:4c:5f:37',1,'2013-05-10 19:02:59','2013-05-10 19:05:09');
INSERT INTO `nodes` VALUES (388,'00:0c:29:fb:6c:fa',7,'2013-05-10 19:03:29','2013-05-10 20:57:28');
INSERT INTO `nodes` VALUES (389,'00:26:6c:92:5b:b6',6,'2013-05-10 19:05:34','2013-05-10 19:08:50');
INSERT INTO `nodes` VALUES (390,'08:60:6e:4c:5f:37',1,'2013-05-10 19:06:14','2013-05-10 19:07:19');
INSERT INTO `nodes` VALUES (391,'08:00:27:cd:06:54',6,'2013-05-10 19:06:39','2013-05-10 19:11:00');
INSERT INTO `nodes` VALUES (392,'10:9a:dd:6a:d5:4e',7,'2013-05-10 19:06:44','2013-05-10 19:49:04');
INSERT INTO `nodes` VALUES (393,'00:21:cc:00:34:5f',4,'2013-05-10 19:08:40','2013-05-10 19:09:45');
INSERT INTO `nodes` VALUES (394,'08:60:6e:4c:5f:37',1,'2013-05-10 19:09:30','2013-05-10 19:10:35');
INSERT INTO `nodes` VALUES (395,'00:1d:72:70:25:75',3,'2013-05-10 19:10:45','2013-05-10 19:55:15');
INSERT INTO `nodes` VALUES (396,'00:0c:29:7a:81:fe',6,'2013-05-10 19:11:00','2013-05-10 19:12:05');
INSERT INTO `nodes` VALUES (397,'00:26:6c:92:5b:b6',6,'2013-05-10 19:11:00','2013-05-10 19:13:10');
INSERT INTO `nodes` VALUES (398,'00:07:e9:23:6f:bd',7,'2013-05-10 19:11:05','2013-05-10 19:12:10');
INSERT INTO `nodes` VALUES (399,'08:60:6e:4c:5f:37',1,'2013-05-10 19:11:40','2013-05-10 19:46:24');
INSERT INTO `nodes` VALUES (400,'00:1d:09:3e:11:59',2,'2013-05-10 19:11:45','2013-05-10 19:12:50');
INSERT INTO `nodes` VALUES (401,'00:0c:29:7a:81:fe',6,'2013-05-10 19:13:10','2013-05-10 19:14:15');
INSERT INTO `nodes` VALUES (402,'08:00:27:cd:06:54',6,'2013-05-10 19:13:10','2013-05-10 19:14:15');
INSERT INTO `nodes` VALUES (403,'00:26:6c:92:5b:b6',6,'2013-05-10 19:14:15','2013-05-10 19:17:31');
INSERT INTO `nodes` VALUES (404,'00:21:cc:00:34:5f',4,'2013-05-10 19:15:10','2013-05-10 19:17:21');
INSERT INTO `nodes` VALUES (405,'00:0c:29:7a:81:fe',6,'2013-05-10 19:15:20','2013-05-10 19:16:25');
INSERT INTO `nodes` VALUES (406,'00:0c:29:7a:81:fe',6,'2013-05-10 19:17:31','2013-05-10 19:18:36');
INSERT INTO `nodes` VALUES (407,'00:21:cc:00:34:5f',4,'2013-05-10 19:18:26','2013-05-10 19:19:31');
INSERT INTO `nodes` VALUES (408,'08:00:27:cd:06:54',6,'2013-05-10 19:18:36','2013-05-10 19:22:56');
INSERT INTO `nodes` VALUES (409,'00:26:6c:92:5b:b6',6,'2013-05-10 19:19:41','2013-05-10 19:20:46');
INSERT INTO `nodes` VALUES (410,'00:21:cc:00:34:5f',4,'2013-05-10 19:20:36','2013-05-10 19:21:41');
INSERT INTO `nodes` VALUES (411,'00:26:6c:92:5b:b6',6,'2013-05-10 19:21:51','2013-05-10 19:26:12');
INSERT INTO `nodes` VALUES (412,'00:21:cc:00:34:5f',4,'2013-05-10 19:23:51','2013-05-10 19:30:22');
INSERT INTO `nodes` VALUES (413,'00:07:e9:23:6f:bd',7,'2013-05-10 19:25:12','2013-05-10 19:27:22');
INSERT INTO `nodes` VALUES (414,'00:0c:29:a7:c9:9b',7,'2013-05-10 19:26:17','2013-05-10 19:30:37');
INSERT INTO `nodes` VALUES (415,'00:26:6c:92:5b:b6',6,'2013-05-10 19:27:17','2013-05-10 19:33:47');
INSERT INTO `nodes` VALUES (416,'08:00:27:cd:06:54',6,'2013-05-10 19:27:17','2013-05-10 19:31:37');
INSERT INTO `nodes` VALUES (417,'00:0c:29:1b:1a:b4',7,'2013-05-10 19:27:22','2013-05-10 19:42:34');
INSERT INTO `nodes` VALUES (418,'00:23:32:d4:0f:c4',7,'2013-05-10 19:27:22','2013-05-10 21:41:58');
INSERT INTO `nodes` VALUES (419,'00:23:ae:1d:25:28',1,'2013-05-10 19:31:12','2013-05-10 19:48:34');
INSERT INTO `nodes` VALUES (420,'00:0c:29:a7:c9:9b',7,'2013-05-10 19:31:42','2013-05-10 19:32:47');
INSERT INTO `nodes` VALUES (421,'00:07:e9:23:6f:bd',7,'2013-05-10 19:32:47','2013-05-10 19:33:53');
INSERT INTO `nodes` VALUES (422,'00:21:cc:00:34:5f',4,'2013-05-10 19:34:43','2013-05-10 19:43:24');
INSERT INTO `nodes` VALUES (423,'08:00:27:cd:06:54',6,'2013-05-10 19:34:53','2013-05-10 19:39:13');
INSERT INTO `nodes` VALUES (424,'00:26:6c:92:5b:b6',6,'2013-05-10 19:35:58','2013-05-10 19:38:08');
INSERT INTO `nodes` VALUES (425,'08:00:27:e7:8e:9f',3,'2013-05-10 19:37:53','2013-05-10 19:38:58');
INSERT INTO `nodes` VALUES (426,'00:07:e9:23:6f:bd',7,'2013-05-10 19:38:13','2013-05-10 19:41:28');
INSERT INTO `nodes` VALUES (427,'08:00:27:e7:8e:9f',3,'2013-05-10 19:40:03','2013-05-10 19:49:49');
INSERT INTO `nodes` VALUES (428,'00:26:6c:92:5b:b6',6,'2013-05-10 19:40:18','2013-05-10 19:43:34');
INSERT INTO `nodes` VALUES (429,'00:0c:29:a7:c9:9b',7,'2013-05-10 19:41:28','2013-05-10 19:42:34');
INSERT INTO `nodes` VALUES (430,'90:a2:da:05:00:65',7,'2013-05-10 19:41:28','2013-05-10 19:42:34');
INSERT INTO `nodes` VALUES (431,'00:07:e9:23:6f:bd',7,'2013-05-10 19:42:34','2013-05-10 19:43:39');
INSERT INTO `nodes` VALUES (432,'08:00:27:cd:06:54',6,'2013-05-10 19:43:34','2013-05-10 19:46:49');
INSERT INTO `nodes` VALUES (433,'00:26:6c:92:5b:b6',6,'2013-05-10 19:44:39','2013-05-10 20:19:23');
INSERT INTO `nodes` VALUES (434,'00:07:e9:23:6f:bd',7,'2013-05-10 19:45:49','2013-05-10 19:47:59');
INSERT INTO `nodes` VALUES (435,'00:0c:29:a7:c9:9b',7,'2013-05-10 19:45:49','2013-05-10 19:46:54');
INSERT INTO `nodes` VALUES (436,'00:21:cc:00:34:5f',4,'2013-05-10 19:46:39','2013-05-10 19:49:54');
INSERT INTO `nodes` VALUES (437,'00:0c:29:a7:c9:9b',7,'2013-05-10 19:47:59','2013-05-10 19:50:09');
INSERT INTO `nodes` VALUES (438,'08:60:6e:4c:5f:37',1,'2013-05-10 19:49:39','2013-05-10 19:51:50');
INSERT INTO `nodes` VALUES (439,'08:00:27:e7:8e:9f',3,'2013-05-10 19:52:00','2013-05-10 19:54:10');
INSERT INTO `nodes` VALUES (440,'08:00:27:cd:06:54',6,'2013-05-10 19:52:15','2013-05-10 19:55:30');
INSERT INTO `nodes` VALUES (441,'00:0c:29:a7:c9:9b',7,'2013-05-10 19:53:25','2013-05-10 19:54:30');
INSERT INTO `nodes` VALUES (442,'00:21:cc:00:34:5f',4,'2013-05-10 19:54:15','2013-05-10 19:56:25');
INSERT INTO `nodes` VALUES (443,'08:60:6e:4c:5f:37',1,'2013-05-10 19:55:05','2013-05-10 19:56:10');
INSERT INTO `nodes` VALUES (444,'00:07:e9:23:6f:bd',7,'2013-05-10 19:55:35','2013-05-10 19:56:40');
INSERT INTO `nodes` VALUES (445,'10:9a:dd:6a:d5:4e',7,'2013-05-10 19:55:35','2013-05-10 20:04:16');
INSERT INTO `nodes` VALUES (446,'00:0c:29:a7:c9:9b',7,'2013-05-10 19:56:40','2013-05-10 19:57:45');
INSERT INTO `nodes` VALUES (447,'00:0c:29:1b:1a:b4',7,'2013-05-10 19:57:45','2013-05-10 20:11:52');
INSERT INTO `nodes` VALUES (448,'08:60:6e:4c:5f:37',1,'2013-05-10 19:58:20','2013-05-10 20:01:36');
INSERT INTO `nodes` VALUES (449,'08:00:27:05:64:8f',3,'2013-05-10 19:58:30','2013-05-10 19:59:36');
INSERT INTO `nodes` VALUES (450,'00:0c:29:a7:c9:9b',7,'2013-05-10 19:58:50','2013-05-10 20:01:01');
INSERT INTO `nodes` VALUES (451,'08:00:27:cd:06:54',6,'2013-05-10 19:59:51','2013-05-10 20:03:06');
INSERT INTO `nodes` VALUES (452,'08:00:27:05:64:8f',3,'2013-05-10 20:00:41','2013-05-10 20:13:42');
INSERT INTO `nodes` VALUES (453,'00:21:cc:00:34:5f',4,'2013-05-10 20:01:51','2013-05-10 20:02:56');
INSERT INTO `nodes` VALUES (454,'08:00:27:27:46:b3',5,'2013-05-10 20:01:56','2013-05-10 20:04:06');
INSERT INTO `nodes` VALUES (455,'a4:ba:db:d8:f3:53',6,'2013-05-10 20:02:01','2013-05-10 20:04:11');
INSERT INTO `nodes` VALUES (456,'00:0c:29:a7:c9:9b',7,'2013-05-10 20:03:11','2013-05-10 20:04:16');
INSERT INTO `nodes` VALUES (457,'08:60:6e:4c:5f:37',1,'2013-05-10 20:03:46','2013-05-10 20:05:56');
INSERT INTO `nodes` VALUES (458,'00:1d:72:70:25:75',3,'2013-05-10 20:05:01','2013-05-10 20:20:13');
INSERT INTO `nodes` VALUES (459,'10:9a:dd:6a:d5:4e',7,'2013-05-10 20:05:21','2013-05-10 20:19:28');
INSERT INTO `nodes` VALUES (460,'08:00:27:27:46:b3',5,'2013-05-10 20:06:16','2013-05-10 20:07:21');
INSERT INTO `nodes` VALUES (461,'00:21:cc:00:34:5f',4,'2013-05-10 20:07:16','2013-05-10 20:08:22');
INSERT INTO `nodes` VALUES (462,'08:60:6e:4c:5f:37',1,'2013-05-10 20:08:07','2013-05-10 20:38:30');
INSERT INTO `nodes` VALUES (463,'08:00:27:cd:06:54',6,'2013-05-10 20:08:32','2013-05-10 20:11:47');
INSERT INTO `nodes` VALUES (464,'d0:67:e5:f0:71:ee',5,'2013-05-10 20:09:32','2013-05-10 20:18:13');
INSERT INTO `nodes` VALUES (465,'08:00:27:27:46:b3',5,'2013-05-10 20:10:37','2013-05-10 20:12:47');
INSERT INTO `nodes` VALUES (466,'00:0c:29:a7:c9:9b',7,'2013-05-10 20:10:47','2013-05-10 20:11:52');
INSERT INTO `nodes` VALUES (467,'00:1d:09:3e:11:59',2,'2013-05-10 20:11:27','2013-05-10 20:13:37');
INSERT INTO `nodes` VALUES (468,'00:1e:ec:63:4d:82',6,'2013-05-10 20:12:52','2013-05-10 20:15:02');
INSERT INTO `nodes` VALUES (469,'00:0c:29:a7:c9:9b',7,'2013-05-10 20:12:57','2013-05-10 20:14:02');
INSERT INTO `nodes` VALUES (470,'00:21:cc:00:34:5f',4,'2013-05-10 20:13:47','2013-05-10 20:15:58');
INSERT INTO `nodes` VALUES (471,'00:0c:29:1b:1a:b4',7,'2013-05-10 20:14:02','2013-05-10 20:15:07');
INSERT INTO `nodes` VALUES (472,'08:00:27:27:46:b3',5,'2013-05-10 20:14:57','2013-05-10 20:20:23');
INSERT INTO `nodes` VALUES (473,'00:1e:ec:63:4d:82',6,'2013-05-10 20:16:08','2013-05-10 20:19:23');
INSERT INTO `nodes` VALUES (474,'08:00:27:cd:06:54',6,'2013-05-10 20:16:08','2013-05-10 20:19:23');
INSERT INTO `nodes` VALUES (475,'00:1d:09:3e:11:59',2,'2013-05-10 20:16:53','2013-05-10 20:17:58');
INSERT INTO `nodes` VALUES (476,'d0:67:e5:f0:71:ef',5,'2013-05-10 20:17:08','2013-05-10 20:18:13');
INSERT INTO `nodes` VALUES (477,'08:00:27:05:64:8f',3,'2013-05-10 20:18:03','2013-05-10 20:20:13');
INSERT INTO `nodes` VALUES (478,'00:21:cc:00:34:5f',4,'2013-05-10 20:18:08','2013-05-10 20:20:18');
INSERT INTO `nodes` VALUES (479,'00:23:ae:1d:25:28',1,'2013-05-10 20:18:58','2013-05-10 20:35:15');
INSERT INTO `nodes` VALUES (480,'d0:67:e5:f0:71:ee',5,'2013-05-10 20:19:18','2013-05-10 20:47:31');
INSERT INTO `nodes` VALUES (481,'d0:67:e5:f0:71:ef',5,'2013-05-10 20:19:18','2013-05-10 20:20:23');
INSERT INTO `nodes` VALUES (482,'00:1e:ec:63:4d:82',6,'2013-05-10 20:20:28','2013-05-10 21:11:29');
INSERT INTO `nodes` VALUES (483,'10:9a:dd:6a:d5:4e',7,'2013-05-10 20:20:33','2013-05-10 20:36:50');
INSERT INTO `nodes` VALUES (484,'08:00:27:05:64:8f',3,'2013-05-10 20:22:23','2013-05-10 20:23:28');
INSERT INTO `nodes` VALUES (485,'08:00:27:27:46:b3',5,'2013-05-10 20:22:33','2013-05-10 20:24:44');
INSERT INTO `nodes` VALUES (486,'00:26:6c:92:5b:b6',6,'2013-05-10 20:23:43',NULL);
INSERT INTO `nodes` VALUES (487,'00:21:cc:00:34:5f',4,'2013-05-10 20:24:39','2013-05-10 20:26:49');
INSERT INTO `nodes` VALUES (488,'08:00:27:cd:06:54',6,'2013-05-10 20:24:49','2013-05-10 20:28:04');
INSERT INTO `nodes` VALUES (489,'00:0c:29:1b:1a:b4',7,'2013-05-10 20:25:59','2013-05-10 20:47:41');
INSERT INTO `nodes` VALUES (490,'08:00:27:05:64:8f',3,'2013-05-10 20:26:44','2013-05-10 20:28:54');
INSERT INTO `nodes` VALUES (491,'08:00:27:27:46:b3',5,'2013-05-10 20:26:54','2013-05-10 20:30:09');
INSERT INTO `nodes` VALUES (492,'00:1d:09:3e:11:59',2,'2013-05-10 20:28:49','2013-05-10 20:32:04');
INSERT INTO `nodes` VALUES (493,'00:21:9b:d2:35:a9',7,'2013-05-10 20:29:14','2013-05-10 21:56:05');
INSERT INTO `nodes` VALUES (494,'08:00:27:05:64:8f',3,'2013-05-10 20:29:59','2013-05-10 20:31:04');
INSERT INTO `nodes` VALUES (495,'00:26:6c:76:2a:5e',6,'2013-05-10 20:30:14',NULL);
INSERT INTO `nodes` VALUES (496,'00:1f:16:c8:d9:13',2,'2013-05-10 20:30:59','2013-05-10 20:32:04');
INSERT INTO `nodes` VALUES (497,'08:00:27:27:46:b3',5,'2013-05-10 20:31:14','2013-05-10 20:37:45');
INSERT INTO `nodes` VALUES (498,'00:21:cc:00:34:5f',4,'2013-05-10 20:32:14','2013-05-10 20:33:20');
INSERT INTO `nodes` VALUES (499,'08:00:27:cd:06:54',6,'2013-05-10 20:32:24','2013-05-10 20:36:45');
INSERT INTO `nodes` VALUES (500,'00:1d:09:3e:11:59',2,'2013-05-10 20:33:10','2013-05-10 20:34:15');
INSERT INTO `nodes` VALUES (501,'00:1d:72:70:25:75',3,'2013-05-10 20:34:20','2013-05-10 20:51:42');
INSERT INTO `nodes` VALUES (502,'08:00:27:05:64:8f',3,'2013-05-10 20:34:20','2013-05-10 22:12:01');
INSERT INTO `nodes` VALUES (503,'00:07:e9:23:6f:bd',7,'2013-05-10 20:34:40','2013-05-10 20:35:45');
INSERT INTO `nodes` VALUES (504,'00:21:cc:00:34:5f',4,'2013-05-10 20:35:30','2013-05-10 20:37:40');
INSERT INTO `nodes` VALUES (505,'90:a2:da:05:00:65',7,'2013-05-10 20:35:45','2013-05-10 20:36:50');
INSERT INTO `nodes` VALUES (506,'00:07:e9:23:6f:bd',7,'2013-05-10 20:37:55','2013-05-10 20:41:11');
INSERT INTO `nodes` VALUES (507,'10:9a:dd:6a:d5:4e',7,'2013-05-10 20:37:55',NULL);
INSERT INTO `nodes` VALUES (508,'08:60:6e:4c:5f:37',1,'2013-05-10 20:39:35','2013-05-10 20:41:46');
INSERT INTO `nodes` VALUES (509,'00:21:cc:00:34:5f',4,'2013-05-10 20:39:50','2013-05-10 20:42:01');
INSERT INTO `nodes` VALUES (510,'08:00:27:27:46:b3',5,'2013-05-10 20:39:55','2013-05-10 20:43:11');
INSERT INTO `nodes` VALUES (511,'08:00:27:cd:06:54',6,'2013-05-10 20:41:06','2013-05-10 20:44:21');
INSERT INTO `nodes` VALUES (512,'00:0c:29:08:a0:8d',7,'2013-05-10 20:41:11','2013-05-10 20:42:16');
INSERT INTO `nodes` VALUES (513,'90:a2:da:05:00:65',7,'2013-05-10 20:41:11','2013-05-10 20:42:16');
INSERT INTO `nodes` VALUES (514,'00:07:e9:23:6f:bd',7,'2013-05-10 20:42:16','2013-05-10 20:43:21');
INSERT INTO `nodes` VALUES (515,'00:21:cc:00:34:5f',4,'2013-05-10 20:43:06','2013-05-10 20:44:11');
INSERT INTO `nodes` VALUES (516,'d0:67:e5:f0:71:ef',5,'2013-05-10 20:43:11','2013-05-10 20:45:21');
INSERT INTO `nodes` VALUES (517,'08:60:6e:4c:5f:37',1,'2013-05-10 20:43:56','2013-05-10 20:47:11');
INSERT INTO `nodes` VALUES (518,'00:23:5a:42:fd:2e',3,'2013-05-10 20:44:06','2013-05-10 20:45:11');
INSERT INTO `nodes` VALUES (519,'00:23:ae:1d:25:28',1,'2013-05-10 20:46:06','2013-05-10 20:50:27');
INSERT INTO `nodes` VALUES (520,'00:1d:09:3e:11:59',2,'2013-05-10 20:46:11','2013-05-10 20:47:16');
INSERT INTO `nodes` VALUES (521,'00:21:cc:00:34:5f',4,'2013-05-10 20:46:21','2013-05-10 20:48:31');
INSERT INTO `nodes` VALUES (522,'d0:67:e5:f0:71:ef',5,'2013-05-10 20:46:26','2013-05-10 20:47:31');
INSERT INTO `nodes` VALUES (523,'00:07:e9:23:6f:bd',7,'2013-05-10 20:46:36','2013-05-10 20:47:41');
INSERT INTO `nodes` VALUES (524,'08:60:6e:4c:5f:37',1,'2013-05-10 20:48:16','2013-05-10 20:51:32');
INSERT INTO `nodes` VALUES (525,'08:00:27:27:46:b3',5,'2013-05-10 20:48:36','2013-05-10 20:50:47');
INSERT INTO `nodes` VALUES (526,'08:00:27:cd:06:54',6,'2013-05-10 20:48:41','2013-05-10 20:53:02');
INSERT INTO `nodes` VALUES (527,'90:a2:da:05:00:65',7,'2013-05-10 20:48:47','2013-05-10 20:49:52');
INSERT INTO `nodes` VALUES (528,'00:1d:09:3e:11:59',2,'2013-05-10 20:51:37','2013-05-10 20:54:52');
INSERT INTO `nodes` VALUES (529,'08:00:27:27:46:b3',5,'2013-05-10 20:51:52','2013-05-10 20:52:57');
INSERT INTO `nodes` VALUES (530,'00:0c:29:1b:1a:b4',7,'2013-05-10 20:52:02','2013-05-10 20:55:17');
INSERT INTO `nodes` VALUES (531,'08:60:6e:4c:5f:37',1,'2013-05-10 20:53:42','2013-05-10 21:21:55');
INSERT INTO `nodes` VALUES (532,'00:21:cc:00:34:5f',4,'2013-05-10 20:53:57','2013-05-10 20:56:07');
INSERT INTO `nodes` VALUES (533,'d0:67:e5:f0:71:ee',5,'2013-05-10 20:55:07','2013-05-10 21:17:55');
INSERT INTO `nodes` VALUES (534,'d0:67:e5:f0:71:ef',5,'2013-05-10 20:55:07','2013-05-10 20:56:12');
INSERT INTO `nodes` VALUES (535,'90:a2:da:05:00:65',7,'2013-05-10 20:55:17','2013-05-10 21:20:15');
INSERT INTO `nodes` VALUES (536,'00:1d:09:3e:11:59',2,'2013-05-10 20:55:57','2013-05-10 20:57:02');
INSERT INTO `nodes` VALUES (537,'08:00:27:27:46:b3',5,'2013-05-10 20:56:12','2013-05-10 20:58:23');
INSERT INTO `nodes` VALUES (538,'00:21:cc:00:34:5f',4,'2013-05-10 20:57:12','2013-05-10 21:09:09');
INSERT INTO `nodes` VALUES (539,'00:0c:29:7a:81:fe',6,'2013-05-10 20:57:23','2013-05-10 20:58:28');
INSERT INTO `nodes` VALUES (540,'08:00:27:cd:06:54',6,'2013-05-10 20:57:23','2013-05-10 21:00:38');
INSERT INTO `nodes` VALUES (541,'00:0c:29:fb:6c:fa',7,'2013-05-10 20:58:33','2013-05-10 20:59:38');
INSERT INTO `nodes` VALUES (542,'08:00:27:27:46:b3',5,'2013-05-10 20:59:28','2013-05-10 21:00:33');
INSERT INTO `nodes` VALUES (543,'00:0c:29:1b:1a:b4',7,'2013-05-10 20:59:38','2013-05-10 21:05:03');
INSERT INTO `nodes` VALUES (544,'00:0c:29:7a:81:fe',6,'2013-05-10 21:00:38','2013-05-10 21:01:43');
INSERT INTO `nodes` VALUES (545,'00:0c:29:fb:6c:fa',7,'2013-05-10 21:00:43','2013-05-10 21:02:53');
INSERT INTO `nodes` VALUES (546,'08:00:27:27:46:b3',5,'2013-05-10 21:01:38','2013-05-10 21:05:59');
INSERT INTO `nodes` VALUES (547,'00:07:e9:23:6f:bd',7,'2013-05-10 21:01:48','2013-05-10 21:02:53');
INSERT INTO `nodes` VALUES (548,'00:1d:72:70:25:75',3,'2013-05-10 21:02:33',NULL);
INSERT INTO `nodes` VALUES (549,'e8:03:9a:dd:8a:82',4,'2013-05-10 21:02:38','2013-05-10 21:35:12');
INSERT INTO `nodes` VALUES (550,'00:0c:29:7a:81:fe',6,'2013-05-10 21:02:48','2013-05-10 21:03:53');
INSERT INTO `nodes` VALUES (551,'08:00:27:cd:06:54',6,'2013-05-10 21:04:58','2013-05-10 21:09:19');
INSERT INTO `nodes` VALUES (552,'00:0c:29:7a:81:fe',6,'2013-05-10 21:06:04','2013-05-10 21:08:14');
INSERT INTO `nodes` VALUES (553,'00:0c:29:1b:1a:b4',7,'2013-05-10 21:06:09','2013-05-10 21:07:14');
INSERT INTO `nodes` VALUES (554,'00:0c:29:fb:6c:fa',7,'2013-05-10 21:06:09','2013-05-10 21:17:00');
INSERT INTO `nodes` VALUES (555,'08:00:27:27:46:b3',5,'2013-05-10 21:07:04','2013-05-10 21:14:40');
INSERT INTO `nodes` VALUES (556,'00:1d:09:3e:11:59',2,'2013-05-10 21:07:54','2013-05-10 21:16:35');
INSERT INTO `nodes` VALUES (557,'00:0c:29:7a:81:fe',6,'2013-05-10 21:09:19','2013-05-10 21:12:34');
INSERT INTO `nodes` VALUES (558,'00:21:cc:00:34:5f',4,'2013-05-10 21:10:14','2013-05-10 21:21:05');
INSERT INTO `nodes` VALUES (559,'a4:ba:db:d8:f3:53',6,'2013-05-10 21:11:29','2013-05-10 21:45:08');
INSERT INTO `nodes` VALUES (560,'00:0c:29:1b:1a:b4',7,'2013-05-10 21:11:34','2013-05-10 21:15:55');
INSERT INTO `nodes` VALUES (561,'00:1f:16:c8:d9:13',2,'2013-05-10 21:12:14','2013-05-10 21:16:35');
INSERT INTO `nodes` VALUES (562,'00:0c:29:7a:81:fe',6,'2013-05-10 21:13:39','2013-05-10 21:15:50');
INSERT INTO `nodes` VALUES (563,'08:00:27:cd:06:54',6,'2013-05-10 21:13:39','2013-05-10 21:16:55');
INSERT INTO `nodes` VALUES (564,'00:23:ae:1d:25:28',1,'2013-05-10 21:15:25','2013-05-10 21:23:01');
INSERT INTO `nodes` VALUES (565,'d0:67:e5:f0:71:ef',5,'2013-05-10 21:16:50','2013-05-10 21:17:55');
INSERT INTO `nodes` VALUES (566,'00:0c:29:7a:81:fe',6,'2013-05-10 21:16:55','2013-05-10 21:19:05');
INSERT INTO `nodes` VALUES (567,'00:1d:09:3e:11:59',2,'2013-05-10 21:17:40','2013-05-10 21:18:45');
INSERT INTO `nodes` VALUES (568,'08:00:27:27:46:b3',5,'2013-05-10 21:17:55','2013-05-10 21:25:31');
INSERT INTO `nodes` VALUES (569,'18:03:73:80:c0:70',5,'2013-05-10 21:17:55','2013-05-10 21:20:05');
INSERT INTO `nodes` VALUES (570,'00:1e:ec:63:4d:82',6,'2013-05-10 21:18:00','2013-05-10 22:09:01');
INSERT INTO `nodes` VALUES (571,'00:0c:29:fb:6c:fa',7,'2013-05-10 21:18:05','2013-05-10 21:20:15');
INSERT INTO `nodes` VALUES (572,'08:00:27:14:31:e5',2,'2013-05-10 21:19:50','2013-05-10 21:24:11');
INSERT INTO `nodes` VALUES (573,'00:07:e9:23:6f:bd',7,'2013-05-10 21:20:15','2013-05-10 21:21:20');
INSERT INTO `nodes` VALUES (574,'00:0c:29:1b:1a:b4',7,'2013-05-10 21:20:15','2013-05-10 21:24:36');
INSERT INTO `nodes` VALUES (575,'08:00:27:cd:06:54',6,'2013-05-10 21:21:15','2013-05-10 21:25:36');
INSERT INTO `nodes` VALUES (576,'00:0c:29:fb:6c:fa',7,'2013-05-10 21:21:20','2013-05-10 21:23:31');
INSERT INTO `nodes` VALUES (577,'00:1d:09:3e:11:59',2,'2013-05-10 21:22:00','2013-05-10 21:23:06');
INSERT INTO `nodes` VALUES (578,'00:21:cc:00:34:5f',4,'2013-05-10 21:23:16','2013-05-10 21:24:21');
INSERT INTO `nodes` VALUES (579,'90:a2:da:05:00:65',7,'2013-05-10 21:23:31','2013-05-10 21:24:36');
INSERT INTO `nodes` VALUES (580,'00:21:cc:00:34:5f',4,'2013-05-10 21:25:26','2013-05-10 21:26:31');
INSERT INTO `nodes` VALUES (581,'00:0c:29:fb:6c:fa',7,'2013-05-10 21:25:41','2013-05-10 21:27:51');
INSERT INTO `nodes` VALUES (582,'08:00:27:27:46:b3',5,'2013-05-10 21:26:36','2013-05-10 21:29:51');
INSERT INTO `nodes` VALUES (583,'d0:67:e5:f0:71:ee',5,'2013-05-10 21:26:36','2013-05-10 21:46:08');
INSERT INTO `nodes` VALUES (584,'d0:67:e5:f0:71:ef',5,'2013-05-10 21:26:36','2013-05-10 21:27:41');
INSERT INTO `nodes` VALUES (585,'08:00:27:14:31:e5',2,'2013-05-10 21:27:26','2013-05-10 21:28:31');
INSERT INTO `nodes` VALUES (586,'00:21:cc:00:34:5f',4,'2013-05-10 21:27:36','2013-05-10 21:28:41');
INSERT INTO `nodes` VALUES (587,'00:0c:29:1b:1a:b4',7,'2013-05-10 21:28:56','2013-05-10 21:32:12');
INSERT INTO `nodes` VALUES (588,'08:60:6e:4c:5f:37',1,'2013-05-10 21:29:31','2013-05-10 21:31:42');
INSERT INTO `nodes` VALUES (589,'00:1f:16:c8:d9:13',2,'2013-05-10 21:29:36','2013-05-10 21:31:47');
INSERT INTO `nodes` VALUES (590,'00:21:cc:00:34:5f',4,'2013-05-10 21:29:46','2013-05-10 21:31:57');
INSERT INTO `nodes` VALUES (591,'08:00:27:cd:06:54',6,'2013-05-10 21:29:56','2013-05-10 21:33:12');
INSERT INTO `nodes` VALUES (592,'00:1d:09:3e:11:59',2,'2013-05-10 21:30:41','2013-05-10 21:32:52');
INSERT INTO `nodes` VALUES (593,'00:0c:29:fb:6c:fa',7,'2013-05-10 21:31:07','2013-05-10 21:32:12');
INSERT INTO `nodes` VALUES (594,'90:a2:da:05:00:65',7,'2013-05-10 21:31:07','2013-05-10 21:38:42');
INSERT INTO `nodes` VALUES (595,'08:00:27:27:46:b3',5,'2013-05-10 21:32:02','2013-05-10 21:33:07');
INSERT INTO `nodes` VALUES (596,'00:21:cc:00:34:5f',4,'2013-05-10 21:33:02','2013-05-10 21:38:27');
INSERT INTO `nodes` VALUES (597,'00:1d:09:3e:11:59',2,'2013-05-10 21:33:57','2013-05-10 21:35:02');
INSERT INTO `nodes` VALUES (598,'00:1f:16:c8:d9:13',2,'2013-05-10 21:33:57','2013-05-10 21:38:17');
INSERT INTO `nodes` VALUES (599,'08:00:27:27:46:b3',5,'2013-05-10 21:34:12','2013-05-10 21:35:17');
INSERT INTO `nodes` VALUES (600,'00:0c:29:fb:6c:fa',7,'2013-05-10 21:34:22','2013-05-10 21:59:20');
INSERT INTO `nodes` VALUES (601,'08:60:6e:4c:5f:37',1,'2013-05-10 21:36:02','2013-05-10 22:07:31');
INSERT INTO `nodes` VALUES (602,'00:1d:09:3e:11:59',2,'2013-05-10 21:36:07','2013-05-10 21:37:12');
INSERT INTO `nodes` VALUES (603,'08:00:27:14:31:e5',2,'2013-05-10 21:36:07','2013-05-10 21:37:12');
INSERT INTO `nodes` VALUES (604,'e8:03:9a:dd:8a:82',4,'2013-05-10 21:36:17',NULL);
INSERT INTO `nodes` VALUES (605,'08:00:27:27:46:b3',5,'2013-05-10 21:36:22','2013-05-10 21:38:32');
INSERT INTO `nodes` VALUES (606,'00:0c:29:1b:1a:b4',7,'2013-05-10 21:36:32','2013-05-10 21:40:53');
INSERT INTO `nodes` VALUES (607,'08:00:27:cd:06:54',6,'2013-05-10 21:37:32','2013-05-10 21:41:53');
INSERT INTO `nodes` VALUES (608,'00:07:e9:23:6f:bd',7,'2013-05-10 21:37:37','2013-05-10 21:38:42');
INSERT INTO `nodes` VALUES (609,'00:1d:09:3e:11:59',2,'2013-05-10 21:39:23','2013-05-10 21:43:43');
INSERT INTO `nodes` VALUES (610,'00:21:cc:00:34:5f',4,'2013-05-10 21:39:33','2013-05-10 21:43:53');
INSERT INTO `nodes` VALUES (611,'08:00:27:27:46:b3',5,'2013-05-10 21:40:43','2013-05-10 21:43:58');
INSERT INTO `nodes` VALUES (612,'00:0c:29:08:a0:8d',7,'2013-05-10 21:40:53','2013-05-10 21:41:58');
INSERT INTO `nodes` VALUES (613,'00:1f:16:c8:d9:13',2,'2013-05-10 21:41:33','2013-05-10 21:43:43');
INSERT INTO `nodes` VALUES (614,'90:a2:da:05:00:65',7,'2013-05-10 21:41:58','2013-05-10 21:43:03');
INSERT INTO `nodes` VALUES (615,'00:23:32:d4:0f:c4',7,'2013-05-10 21:43:03','2013-05-10 22:03:40');
INSERT INTO `nodes` VALUES (616,'00:23:ae:1d:25:28',1,'2013-05-10 21:43:38','2013-05-10 21:53:24');
INSERT INTO `nodes` VALUES (617,'08:00:27:27:46:b3',5,'2013-05-10 21:45:03','2013-05-10 21:46:08');
INSERT INTO `nodes` VALUES (618,'00:0c:29:1b:1a:b4',7,'2013-05-10 21:45:13','2013-05-10 21:48:29');
INSERT INTO `nodes` VALUES (619,'00:21:cc:00:34:5f',4,'2013-05-10 21:46:03','2013-05-10 21:48:14');
INSERT INTO `nodes` VALUES (620,'08:00:27:cd:06:54',6,'2013-05-10 21:46:13','2013-05-10 21:50:34');
INSERT INTO `nodes` VALUES (621,'00:07:e9:23:6f:bd',7,'2013-05-10 21:46:18','2013-05-10 21:47:24');
INSERT INTO `nodes` VALUES (622,'08:00:27:27:46:b3',5,'2013-05-10 21:47:13','2013-05-10 21:58:05');
INSERT INTO `nodes` VALUES (623,'d0:67:e5:f0:88:0b',7,'2013-05-10 21:47:24','2013-05-10 21:48:29');
INSERT INTO `nodes` VALUES (624,'00:1d:09:3e:11:59',2,'2013-05-10 21:48:04','2013-05-10 21:51:19');
INSERT INTO `nodes` VALUES (625,'00:1f:16:c8:d9:13',2,'2013-05-10 21:48:04','2013-05-10 21:50:14');
INSERT INTO `nodes` VALUES (626,'90:a2:da:05:00:65',7,'2013-05-10 21:48:29','2013-05-10 21:56:05');
INSERT INTO `nodes` VALUES (627,'00:21:cc:00:34:5f',4,'2013-05-10 21:51:29','2013-05-10 21:52:34');
INSERT INTO `nodes` VALUES (628,'d0:67:e5:f0:71:ee',5,'2013-05-10 21:51:34',NULL);
INSERT INTO `nodes` VALUES (629,'00:1d:09:3e:11:59',2,'2013-05-10 21:52:24','2013-05-10 21:53:29');
INSERT INTO `nodes` VALUES (630,'00:0c:29:1b:1a:b4',7,'2013-05-10 21:52:49','2013-05-10 21:57:10');
INSERT INTO `nodes` VALUES (631,'08:00:27:14:31:e5',2,'2013-05-10 21:53:29','2013-05-10 21:54:34');
INSERT INTO `nodes` VALUES (632,'00:21:cc:00:34:5f',4,'2013-05-10 21:53:39','2013-05-10 21:55:50');
INSERT INTO `nodes` VALUES (633,'08:00:27:cd:06:54',6,'2013-05-10 21:53:49','2013-05-10 21:58:10');
INSERT INTO `nodes` VALUES (634,'00:1d:09:3e:11:59',2,'2013-05-10 21:54:34','2013-05-10 21:55:39');
INSERT INTO `nodes` VALUES (635,'00:23:ae:1d:25:28',1,'2013-05-10 21:55:34',NULL);
INSERT INTO `nodes` VALUES (636,'90:a2:da:05:00:65',7,'2013-05-10 21:57:10','2013-05-10 21:58:15');
INSERT INTO `nodes` VALUES (637,'00:21:9b:d2:35:a9',7,'2013-05-10 21:58:15',NULL);
INSERT INTO `nodes` VALUES (638,'00:21:cc:00:34:5f',4,'2013-05-10 21:59:05','2013-05-10 22:01:15');
INSERT INTO `nodes` VALUES (639,'08:00:27:27:46:b3',5,'2013-05-10 22:00:15','2013-05-10 22:02:25');
INSERT INTO `nodes` VALUES (640,'00:07:e9:23:6f:bd',7,'2013-05-10 22:00:25','2013-05-10 22:01:30');
INSERT INTO `nodes` VALUES (641,'00:0c:29:08:a0:8d',7,'2013-05-10 22:00:25','2013-05-10 22:01:30');
INSERT INTO `nodes` VALUES (642,'00:0c:29:1b:1a:b4',7,'2013-05-10 22:00:25','2013-05-10 22:04:46');
INSERT INTO `nodes` VALUES (643,'00:0c:29:fb:6c:fa',7,'2013-05-10 22:00:25','2013-05-10 22:01:30');
INSERT INTO `nodes` VALUES (644,'08:00:27:cd:06:54',6,'2013-05-10 22:02:30','2013-05-10 22:06:51');
INSERT INTO `nodes` VALUES (645,'00:1d:09:3e:11:59',2,'2013-05-10 22:05:26','2013-05-10 22:06:31');
INSERT INTO `nodes` VALUES (646,'00:21:cc:00:34:5f',4,'2013-05-10 22:07:46','2013-05-10 22:08:51');
INSERT INTO `nodes` VALUES (647,'08:00:27:27:46:b3',5,'2013-05-10 22:08:56','2013-05-10 22:10:01');
INSERT INTO `nodes` VALUES (648,'08:00:27:cd:06:54',6,'2013-05-10 22:10:06',NULL);
INSERT INTO `nodes` VALUES (649,'08:00:27:27:46:b3',5,'2013-05-10 22:11:06',NULL);
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
INSERT INTO `teams` VALUES (1,'ARES','RED','10.1.0.2','e23','',27000,1,'Y');
INSERT INTO `teams` VALUES (2,'CHAOS','BLUE','10.2.0.2','e23','',32250,5,'Y');
INSERT INTO `teams` VALUES (3,'HERA','GREEN','10.3.0.2','e23','',31800,5,'Y');
INSERT INTO `teams` VALUES (4,'HERMES','YELLOW','10.4.0.2','e23','',27000,1,'Y');
INSERT INTO `teams` VALUES (5,'NYX','PURPLE','10.5.0.2','e23','',27550,1,'Y');
INSERT INTO `teams` VALUES (6,'ZEUS','ORANGE','10.6.0.2','e23','',30600,4,'Y');
INSERT INTO `teams` VALUES (7,'OLYMPUS','WHITE','10.0.0.2','e23','',0,1,'Y');
INSERT INTO `teams` VALUES (8,'ARTEMIS','BLACK','10.7.0.2','e23','',0,0,'N');
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
INSERT INTO `vms` VALUES (1,'Ubuntu Server 12.04.2 LTS','N');
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

-- Dump completed on 2013-05-13  7:49:55
