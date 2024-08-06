CREATE DATABASE  IF NOT EXISTS `parking_at_tips` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `parking_at_tips`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: parking_at_tips
-- ------------------------------------------------------
-- Server version	8.0.34

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `id` int NOT NULL,
  `parking_name` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (1,'OM car parking'),(2,'MIT car parking');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `car_model`
--

DROP TABLE IF EXISTS `car_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `car_model` (
  `cid` int NOT NULL,
  `ownerId` int DEFAULT NULL,
  `model` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`cid`),
  KEY `ownerId` (`ownerId`),
  CONSTRAINT `car_model_ibfk_1` FOREIGN KEY (`ownerId`) REFERENCES `parking_names` (`pid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `car_model`
--

LOCK TABLES `car_model` WRITE;
/*!40000 ALTER TABLE `car_model` DISABLE KEYS */;
/*!40000 ALTER TABLE `car_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login`
--

DROP TABLE IF EXISTS `login`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `login` (
  `lid` int NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `password` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`lid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login`
--

LOCK TABLES `login` WRITE;
/*!40000 ALTER TABLE `login` DISABLE KEYS */;
/*!40000 ALTER TABLE `login` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_facility`
--

DROP TABLE IF EXISTS `parking_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking_facility` (
  `pfid` int NOT NULL,
  `security` varchar(30) DEFAULT 'CCTV cameras',
  `offers` varchar(20) DEFAULT '2%',
  `pid` int DEFAULT NULL,
  `userId` int DEFAULT NULL,
  PRIMARY KEY (`pfid`),
  KEY `pid` (`pid`),
  KEY `userId` (`userId`),
  CONSTRAINT `parking_facility_ibfk_1` FOREIGN KEY (`pid`) REFERENCES `parking_names` (`pid`),
  CONSTRAINT `parking_facility_ibfk_2` FOREIGN KEY (`userId`) REFERENCES `users` (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_facility`
--

LOCK TABLES `parking_facility` WRITE;
/*!40000 ALTER TABLE `parking_facility` DISABLE KEYS */;
INSERT INTO `parking_facility` VALUES (1,'CCTV cameras,insurance','5%',1,1),(2,'CCTV cameras,insurance','4%',2,2),(3,'CCTV','5%',1,3);
/*!40000 ALTER TABLE `parking_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `parking_names`
--

DROP TABLE IF EXISTS `parking_names`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `parking_names` (
  `pid` int NOT NULL,
  `adminId` int DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(50) DEFAULT NULL,
  `mobile_number` varchar(30) DEFAULT NULL,
  `location` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  KEY `adminId` (`adminId`),
  CONSTRAINT `parking_names_ibfk_1` FOREIGN KEY (`adminId`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `parking_names`
--

LOCK TABLES `parking_names` WRITE;
/*!40000 ALTER TABLE `parking_names` DISABLE KEYS */;
INSERT INTO `parking_names` VALUES (1,1,'OM car parking','Ekta building, Shivaji Nagar','8974849878','ShivajiNagar'),(2,2,'MIT car parking','Kale complex,Kothrud','7988894887','Kothrud');
/*!40000 ALTER TABLE `parking_names` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `uid` int NOT NULL AUTO_INCREMENT,
  `parkingId` int DEFAULT NULL,
  `user_name` varchar(30) DEFAULT NULL,
  `mobile_number` varchar(30) DEFAULT NULL,
  `emailId` varchar(50) DEFAULT NULL,
  `car_model` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`uid`),
  KEY `parkingId` (`parkingId`),
  CONSTRAINT `users_ibfk_1` FOREIGN KEY (`parkingId`) REFERENCES `parking_names` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,1,'Rohit','9456875245','rohit12@gmail.com','Toyota'),(2,2,'Abhi','8758964585','abhi123@gmail.com','BMW'),(3,1,'Bhavesh','9865741235','bhavesh98@gmail.com','KIA');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'parking_at_tips'
--

--
-- Dumping routines for database 'parking_at_tips'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-10 15:16:11
