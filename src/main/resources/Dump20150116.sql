CREATE DATABASE  IF NOT EXISTS `SUPPLIER` /*!40100 DEFAULT CHARACTER SET latin1 */;
USE `SUPPLIER`;
-- MySQL dump 10.13  Distrib 5.5.40, for debian-linux-gnu (i686)
--
-- Host: 127.0.0.1    Database: SUPPLIER
-- ------------------------------------------------------
-- Server version	5.5.40-0ubuntu0.14.04.1

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
-- Table structure for table `GOOD`
--

DROP TABLE IF EXISTS `GOOD`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `GOOD` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `USER_ID` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `GOOD`
--

LOCK TABLES `GOOD` WRITE;
/*!40000 ALTER TABLE `GOOD` DISABLE KEYS */;
INSERT INTO `GOOD` VALUES (1,'Milk','2015-01-13','1'),(2,'Orange juice','2015-01-13','1'),(3,'Cheese','2015-01-13','1');
/*!40000 ALTER TABLE `GOOD` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LINK`
--

DROP TABLE IF EXISTS `LINK`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `LINK` (
  `ID` int(11) NOT NULL,
  `SUPPLIER_ID` int(11) DEFAULT NULL,
  `GOOD_ID` int(11) DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  `PERCENT` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LINK`
--

LOCK TABLES `LINK` WRITE;
/*!40000 ALTER TABLE `LINK` DISABLE KEYS */;
INSERT INTO `LINK` VALUES (1,1,1,1,'80'),(2,1,2,1,'65'),(3,2,1,1,'75');
/*!40000 ALTER TABLE `LINK` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STAT`
--

DROP TABLE IF EXISTS `STAT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `STAT` (
  `ID` int(11) NOT NULL,
  `DATE` date DEFAULT NULL,
  `DESCRIPTION` varchar(4096) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STAT`
--

LOCK TABLES `STAT` WRITE;
/*!40000 ALTER TABLE `STAT` DISABLE KEYS */;
INSERT INTO `STAT` VALUES (1,'2015-01-13','User Kristina Verigo create a new supplier with id: 1'),(2,'2015-01-13','User Kristina Verigo create a new supplier with id: 2'),(3,'2015-01-13','User Kristina Verigo create a new goods with id: 1'),(4,'2015-01-13','User Kristina Verigo create a new goods with id: 2'),(5,'2015-01-13','User Kristina Verigo create a new goods with id: 3'),(6,'2015-01-13','User Kristina Verigo create a new rating with id: 1'),(7,'2015-01-13','User Kristina Verigo create a new rating with id: 2'),(8,'2015-01-13','User Kristina Verigo create a new rating with id: 3'),(9,'2015-01-13','User Kristina Verigo create a new user with id: 2'),(10,'2015-01-13','User Sally Shapiro create a new supplier with id: 3');
/*!40000 ALTER TABLE `STAT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SUPPLIER`
--

DROP TABLE IF EXISTS `SUPPLIER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SUPPLIER` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `DATE` date DEFAULT NULL,
  `USER_ID` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SUPPLIER`
--

LOCK TABLES `SUPPLIER` WRITE;
/*!40000 ALTER TABLE `SUPPLIER` DISABLE KEYS */;
INSERT INTO `SUPPLIER` VALUES (1,'Minsk food factory','2015-01-13',1),(2,'Gomel food factory','2015-01-13',1),(3,'Vitebsk food factory','2015-01-13',2);
/*!40000 ALTER TABLE `SUPPLIER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `USER`
--

DROP TABLE IF EXISTS `USER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `USER` (
  `ID` int(11) NOT NULL,
  `NAME` varchar(255) DEFAULT NULL,
  `LOGIN` varchar(255) DEFAULT NULL,
  `PASSWORD` varchar(255) DEFAULT NULL,
  `REGISTRATION_DATE` date DEFAULT NULL,
  `ADMIN` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `USER`
--

LOCK TABLES `USER` WRITE;
/*!40000 ALTER TABLE `USER` DISABLE KEYS */;
INSERT INTO `USER` VALUES (1,'Kristina Verigo','kristina','pass','2015-01-08','admin'),(2,'Sally Shapiro','sally','pass','2015-01-13','user');
/*!40000 ALTER TABLE `USER` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2015-01-16 22:49:41
