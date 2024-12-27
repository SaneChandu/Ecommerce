-- MySQL dump 10.13  Distrib 8.0.39, for Win64 (x86_64)
--
-- Host: localhost    Database: ecom
-- ------------------------------------------------------
-- Server version	8.0.39

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `additems`
--

DROP TABLE IF EXISTS `additems`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `additems` (
  `itemid` varchar(30) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `discription` longtext,
  `qty` varchar(20) DEFAULT NULL,
  `category` enum('electronics','grocery','fashion','home') DEFAULT NULL,
  `price` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`itemid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `additems`
--

LOCK TABLES `additems` WRITE;
/*!40000 ALTER TABLE `additems` DISABLE KEYS */;
INSERT INTO `additems` VALUES ('B7pH9qQ2a','samsung Galaxy z flip6','samsung Galaxy z flip6 mobile,purple color','1','electronics','100000'),('D6yR1pR2t','Men Nike shoe ','Hand-painted customized Air Force 1 with brown & black leather paint.','1','fashion','5000'),('F4yE4zB1l','women anarkali','white anarkali','1','fashion','1400'),('F9yT1hT8i','microwave oven','samsung microwave oven,black','1','home','6000'),('H0yH6wF6m','watch','titan watch','1','electronics','3000'),('I8oK8cV6m','galaxy s24','Samsung Galaxy S24 Ultra, AI Android Smartphone, 12GB RAM, 512GB storage','1','electronics','100000'),('J1pK3wC5o','samsung Galaxy z flip6','samsung Galaxy z flip6 mobile,purple color','1','electronics','100000'),('K9kW2sD2n','poloraid camera','purple Mini 8 Polaroid Camera With 10 Sheets Of Film And Brand New Batteries.','1','electronics','700'),('O3lL6lQ7h','headphones','Sony WH-CH720N, Wireless Over-Ear Active Noise Cancellation Headphones with Mic, up to 35 Hours Playtime, Multi-Point Connection, ','1','electronics','7000'),('U1kV4gS0z','fruits','fresh fruits','1','grocery','150'),('V2iP7tQ9q','women\'s shirt','casual shirt','1','fashion','1100'),('W5pF6jN3y','Denim Jacket','Wrangler Women\'s Denim Jacket','1','fashion','1999');
/*!40000 ALTER TABLE `additems` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin` (
  `name` varchar(30) DEFAULT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `email` varchar(90) DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `password` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('vandana','9675342561','chandanasane77@gmail.com','Banglore','vandu123');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cart` (
  `username` varchar(40) NOT NULL,
  `productname` varchar(100) NOT NULL,
  `quantity` int NOT NULL,
  `price` int NOT NULL,
  `totalprice` int NOT NULL,
  PRIMARY KEY (`username`,`productname`),
  CONSTRAINT `cart_ibfk_1` FOREIGN KEY (`username`) REFERENCES `signup` (`name`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `order_id` bigint NOT NULL AUTO_INCREMENT,
  `itemid` varchar(30) NOT NULL,
  `item_name` longtext NOT NULL,
  `qty` int DEFAULT NULL,
  `total_price` bigint DEFAULT NULL,
  `user` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`order_id`),
  KEY `user` (`user`),
  KEY `itemid` (`itemid`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user`) REFERENCES `signup` (`name`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`itemid`) REFERENCES `additems` (`itemid`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,'U1kV4gS0z','fruits',1,150,'chandana');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `signup`
--

DROP TABLE IF EXISTS `signup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `signup` (
  `name` varchar(40) NOT NULL,
  `mobile` varchar(12) DEFAULT NULL,
  `email` varchar(75) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `password` text,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `signup`
--

LOCK TABLES `signup` WRITE;
/*!40000 ALTER TABLE `signup` DISABLE KEYS */;
INSERT INTO `signup` VALUES ('chandana','9390700770','sanechandana24@gmail.com','ATP','1234567'),('sirisha','7468674478','eedashirisha88@gmail.com','hyderabad','12345'),('zoe','9490124080','saneniha72@gmail.com','hyderabad','123456');
/*!40000 ALTER TABLE `signup` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-27 14:58:27
