-- MySQL dump 10.13  Distrib 8.0.33, for macos13 (arm64)
--
-- Host: localhost    Database: EPL
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `ASSISTERS`
--

DROP TABLE IF EXISTS `ASSISTERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ASSISTERS` (
  `MatchID` int NOT NULL,
  `PlayerID` int NOT NULL,
  `NumOfAssists` int NOT NULL,
  KEY `assisters_ibfk_2` (`PlayerID`),
  KEY `assisters_ibfk_1` (`MatchID`),
  CONSTRAINT `assisters_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `MATCH` (`MatchID`),
  CONSTRAINT `assisters_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYER` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ASSISTERS`
--

LOCK TABLES `ASSISTERS` WRITE;
/*!40000 ALTER TABLE `ASSISTERS` DISABLE KEYS */;
INSERT INTO `ASSISTERS` VALUES (1,8,1),(7,18,1),(7,22,1),(8,15,1),(8,44,1),(9,10,1),(9,9,1),(9,6,1);
/*!40000 ALTER TABLE `ASSISTERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CONTRACT`
--

DROP TABLE IF EXISTS `CONTRACT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `CONTRACT` (
  `ContractID` int NOT NULL AUTO_INCREMENT,
  `TeamID` int NOT NULL,
  `PlayerID` int NOT NULL,
  `Value` int DEFAULT NULL,
  `StartDate` date DEFAULT NULL,
  `EndDate` date DEFAULT NULL,
  PRIMARY KEY (`ContractID`),
  KEY `contract_ibfk_2` (`PlayerID`),
  KEY `contract_ibfk_1` (`TeamID`),
  CONSTRAINT `contract_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `TEAM` (`TeamID`),
  CONSTRAINT `contract_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYER` (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CONTRACT`
--

LOCK TABLES `CONTRACT` WRITE;
/*!40000 ALTER TABLE `CONTRACT` DISABLE KEYS */;
INSERT INTO `CONTRACT` VALUES (1,1,1,12880000,'2021-08-22','2026-06-30'),(2,1,2,39520000,'2023-07-10','2027-06-30'),(3,1,3,13000000,'2022-12-26','2027-06-30'),(4,1,4,31200000,'2021-08-04','2026-06-30'),(5,1,5,20000000,'2023-01-23',NULL),(6,1,6,16440000,'2021-08-19','2028-06-30'),(7,1,7,62400000,'2023-07-15','2028-06-30'),(8,1,8,72800000,'2023-06-29','2028-06-30'),(9,1,9,40560000,'2018-11-02','2027-06-30'),(10,1,10,23400000,'2023-02-27','2027-06-30'),(11,1,11,26000000,'2022-06-30','2027-06-30'),(12,2,12,16900000,'2021-09-03','2026-06-30'),(13,2,13,27300000,'2023-01-01','2026-06-30'),(14,2,14,31200000,'2021-08-13','2026-06-30'),(15,2,15,40000000,'2020-07-01','2027-06-30'),(16,2,16,90000000,'2023-08-05','2028-06-30'),(17,2,17,57200000,'2022-07-12','2027-06-30'),(18,2,18,46800000,'2019-07-05','2026-06-30'),(19,2,19,58500000,'2022-10-14','2027-06-30'),(20,2,20,80000000,'2021-04-15','2025-06-30'),(21,2,21,93600000,'2021-08-01','2027-06-30'),(22,2,22,97500000,'2022-07-13','2027-07-30'),(23,3,34,42900000,'2021-08-04','2027-06-30'),(24,3,35,32900000,'2021-08-05','2025-06-30'),(25,3,36,18200000,'2021-07-01','2026-06-30'),(26,3,37,42900000,'2021-08-13','2025-06-30'),(27,3,38,23400000,'2021-08-25','2026-06-30'),(28,3,39,20000000,'2023-01-01','2028-06-30'),(29,3,40,39000000,'2023-07-01','2028-06-30'),(30,3,41,41600000,'2020-07-01','2024-06-30'),(31,3,42,49500000,'2022-01-30','2027-06-30'),(32,3,43,34320000,'2023-01-01','2028-06-30'),(33,3,44,54600000,'2022-01-12','2025-06-30'),(34,4,45,52500000,'2023-07-20','2028-06-30'),(35,4,46,13500000,'2023-06-02','2028-06-30'),(36,4,47,70720000,'2021-08-14','2025-06-30'),(37,4,48,31200000,'2022-07-27','2027-06-30'),(38,4,49,32200000,'2023-04-06','2027-06-30'),(39,4,50,72800000,'2022-03-30','2026-03-30'),(40,4,51,64200000,'2023-06-29','2028-06-30'),(41,4,52,49920000,'2022-04-01','2026-06-30'),(42,4,53,52000000,'2022-05-30','2027-06-30'),(43,4,54,82000000,'2023-06-30','2028-06-30'),(44,4,55,78000000,'2023-07-19','2028-06-30');
/*!40000 ALTER TABLE `CONTRACT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `LOCATED_AT`
--

DROP TABLE IF EXISTS `LOCATED_AT`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `LOCATED_AT` (
  `TeamID` int NOT NULL,
  `StadiumName` varchar(50) NOT NULL,
  KEY `StadiumName` (`StadiumName`),
  KEY `located_at_ibfk_1` (`TeamID`),
  CONSTRAINT `located_at_ibfk_1` FOREIGN KEY (`TeamID`) REFERENCES `TEAM` (`TeamID`),
  CONSTRAINT `located_at_ibfk_2` FOREIGN KEY (`StadiumName`) REFERENCES `STADIUM` (`StadiumName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `LOCATED_AT`
--

LOCK TABLES `LOCATED_AT` WRITE;
/*!40000 ALTER TABLE `LOCATED_AT` DISABLE KEYS */;
INSERT INTO `LOCATED_AT` VALUES (1,'Emirates Stadium'),(2,'Etihad Stadium'),(3,'Anfield'),(4,'Old Trafford');
/*!40000 ALTER TABLE `LOCATED_AT` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGER`
--

DROP TABLE IF EXISTS `MANAGER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MANAGER` (
  `Fname` varchar(15) NOT NULL,
  `Mname` varchar(15) DEFAULT NULL,
  `Lname` varchar(15) NOT NULL,
  `ManagerID` int NOT NULL AUTO_INCREMENT,
  `Nationality` varchar(20) NOT NULL,
  PRIMARY KEY (`ManagerID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGER`
--

LOCK TABLES `MANAGER` WRITE;
/*!40000 ALTER TABLE `MANAGER` DISABLE KEYS */;
INSERT INTO `MANAGER` VALUES ('Mikel','Arteta','Amatriain',1,'Spanish'),('Josep','Pep','Guardiola Sala',2,'Spanish'),('Jürgen','Norbert','Klopp',3,'German'),('Erik','ten','Hag',4,'Dutch');
/*!40000 ALTER TABLE `MANAGER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MANAGES`
--

DROP TABLE IF EXISTS `MANAGES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MANAGES` (
  `ManagerID` int NOT NULL,
  `TeamID` int NOT NULL,
  PRIMARY KEY (`ManagerID`,`TeamID`),
  KEY `manages_ibfk_2` (`TeamID`),
  CONSTRAINT `manages_ibfk_1` FOREIGN KEY (`ManagerID`) REFERENCES `MANAGER` (`ManagerID`),
  CONSTRAINT `manages_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `TEAM` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MANAGES`
--

LOCK TABLES `MANAGES` WRITE;
/*!40000 ALTER TABLE `MANAGES` DISABLE KEYS */;
INSERT INTO `MANAGES` VALUES (1,1),(2,2),(3,3),(4,4);
/*!40000 ALTER TABLE `MANAGES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MATCH`
--

DROP TABLE IF EXISTS `MATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `MATCH` (
  `MatchID` int NOT NULL AUTO_INCREMENT,
  `Date` date DEFAULT NULL,
  `HomeTeamID` int NOT NULL,
  `AwayTeamID` int NOT NULL,
  `Result` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`MatchID`),
  KEY `match_ibfk_1` (`HomeTeamID`),
  KEY `match_ibfk_2` (`AwayTeamID`),
  CONSTRAINT `match_ibfk_1` FOREIGN KEY (`HomeTeamID`) REFERENCES `TEAM` (`TeamID`),
  CONSTRAINT `match_ibfk_2` FOREIGN KEY (`AwayTeamID`) REFERENCES `TEAM` (`TeamID`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MATCH`
--

LOCK TABLES `MATCH` WRITE;
/*!40000 ALTER TABLE `MATCH` DISABLE KEYS */;
INSERT INTO `MATCH` VALUES (1,'2023-10-08',1,2,'1-0'),(2,'2023-12-16',3,4,NULL),(3,'2024-04-06',4,3,NULL),(4,'2024-02-03',1,3,NULL),(5,'2023-12-23',3,1,NULL),(6,'2024-05-11',4,1,NULL),(7,'2023-10-29',4,2,'0-3'),(8,'2023-11-25',2,3,'1-1'),(9,'2023-09-23',1,4,'3-1');
/*!40000 ALTER TABLE `MATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYER`
--

DROP TABLE IF EXISTS `PLAYER`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYER` (
  `Fname` varchar(15) NOT NULL,
  `Lname` varchar(30) DEFAULT NULL,
  `PlayerID` int NOT NULL AUTO_INCREMENT,
  `DOB` date DEFAULT NULL,
  `Nationality` varchar(50) DEFAULT NULL,
  `Position` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`PlayerID`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYER`
--

LOCK TABLES `PLAYER` WRITE;
/*!40000 ALTER TABLE `PLAYER` DISABLE KEYS */;
INSERT INTO `PLAYER` VALUES ('Aaron','Ramsdale',1,NULL,'England','Goalkeeper'),('William','Saliba',2,NULL,'France','Defender'),('Gabriel','Magalhães',3,NULL,'Brazil','Defender'),('Ben','White',4,NULL,'England','Defender'),('Jakub','Kiwior',5,NULL,'Poland','Defender'),('Martin','Ødegaard',6,NULL,'Norway','Midfielder'),('Declan','Rice',7,NULL,'England','Midfielder'),('Kai','Havertz',8,NULL,'Germany','Midfielder'),('Bukayo','Saka',9,NULL,'England','Forward'),('Gabriel','Martinelli',10,NULL,'Brazil','Forward'),('Eddie','Nketiah',11,NULL,'England','Forward'),('Ederson','NULL',12,NULL,'Brazil','Goalkeeper'),('Kyle','Walker',13,NULL,'England','Defender'),('John','Stones',14,NULL,'England','Defender'),('Nathan','Aké',15,NULL,'Netherlands','Defender'),('Josko','Gvardiol',16,NULL,'Croatia','Defender'),('Rodrigo','Cascante',17,NULL,'Spain','Midfielder'),('Bernardo','Silva',18,NULL,'Portugal','Midfielder'),('Phil','Foden',19,NULL,'England','Midfielder'),('Kevin','De Bruyne',20,NULL,'Belgium','Midfielder'),('Jack','Grealish',21,NULL,'England','Midfielder'),('Erling','Haaland',22,NULL,'Norway','Forward'),('Alisson','Becker',34,NULL,'Brazil','Goalkeeper'),('Trent','Alexander-Arnold',35,NULL,'England','Defense'),('Ibrahima','Konate',36,NULL,'France','Defense'),('Virgil','van Dijk',37,NULL,'Netherlands','Defense'),('Andrew','Robertson',38,NULL,'Scotland','Defense'),('Romeo','Lavia',39,NULL,'Belgium','Midfield'),('Alexis','Mac Allister',40,NULL,'Argentina','Midfield'),('Thiago','Alcantara',41,NULL,'Spain','Midfield'),('Luis','Diaz',42,NULL,'Colombia','Forward'),('Cody','Gakpo',43,NULL,'Netherlands','Forward'),('Mohamed','Salah',44,NULL,'Egypt','Forward'),('André','Onana',45,NULL,'Cameroon','Goalkeeper'),('Diogo','Dalot',46,NULL,'Portugal','Defense'),('Raphael','Varane',47,NULL,'France','Defense'),('Lisandro','Martinez',48,NULL,'Argentina','Defense'),('Luke','Shaw',49,NULL,'England','Defense'),('Casemiro','',50,NULL,'Brazil','Midfield'),('Mason','Mount',51,NULL,'England','Midfield'),('Bruno','Fernandes',52,NULL,'Portugal','Midfield'),('Antony','',53,NULL,'Brazil','Forward'),('Rasmus','Højlund',54,NULL,'Denmark','Forward'),('Marcus','Rashford',55,NULL,'England','Forward');
/*!40000 ALTER TABLE `PLAYER` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYS_FOR`
--

DROP TABLE IF EXISTS `PLAYS_FOR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYS_FOR` (
  `PlayerID` int NOT NULL,
  `TeamID` int NOT NULL,
  KEY `plays_for_ibfk_1` (`PlayerID`),
  KEY `plays_for_ibfk_2` (`TeamID`),
  CONSTRAINT `plays_for_ibfk_1` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYER` (`PlayerID`),
  CONSTRAINT `plays_for_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `TEAM` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYS_FOR`
--

LOCK TABLES `PLAYS_FOR` WRITE;
/*!40000 ALTER TABLE `PLAYS_FOR` DISABLE KEYS */;
INSERT INTO `PLAYS_FOR` VALUES (45,4),(46,4),(47,4),(48,4),(49,4),(50,4),(51,4),(52,4),(53,4),(54,4),(55,4),(34,3),(35,3),(36,3),(37,3),(38,3),(39,3),(40,3),(41,3),(42,3),(43,3),(44,3),(12,2),(13,2),(14,2),(15,2),(16,2),(17,2),(18,2),(19,2),(20,2),(21,2),(22,2),(1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1);
/*!40000 ALTER TABLE `PLAYS_FOR` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PLAYS_MATCH`
--

DROP TABLE IF EXISTS `PLAYS_MATCH`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `PLAYS_MATCH` (
  `MatchID` int NOT NULL,
  `TeamID` int NOT NULL,
  `Role` varchar(10) NOT NULL,
  KEY `plays_match_ibfk_2` (`TeamID`),
  KEY `plays_match_ibfk_1` (`MatchID`),
  CONSTRAINT `plays_match_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `MATCH` (`MatchID`),
  CONSTRAINT `plays_match_ibfk_2` FOREIGN KEY (`TeamID`) REFERENCES `TEAM` (`TeamID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PLAYS_MATCH`
--

LOCK TABLES `PLAYS_MATCH` WRITE;
/*!40000 ALTER TABLE `PLAYS_MATCH` DISABLE KEYS */;
INSERT INTO `PLAYS_MATCH` VALUES (1,1,'Home'),(1,2,'Away'),(2,3,'Home'),(2,4,'Away'),(3,4,'Home'),(3,3,'Away'),(4,1,'Home'),(4,3,'Away'),(5,3,'Home'),(5,1,'Away'),(6,4,'Home'),(6,1,'Away'),(7,4,'Home'),(7,2,'Away'),(8,2,'Home'),(8,3,'Away'),(9,1,'Home'),(9,4,'Away');
/*!40000 ALTER TABLE `PLAYS_MATCH` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SCORERS`
--

DROP TABLE IF EXISTS `SCORERS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `SCORERS` (
  `MatchID` int NOT NULL,
  `PlayerID` int NOT NULL,
  `NumOfGoals` int NOT NULL,
  KEY `scorers_ibfk_2` (`PlayerID`),
  KEY `scorers_ibfk_1` (`MatchID`),
  CONSTRAINT `scorers_ibfk_1` FOREIGN KEY (`MatchID`) REFERENCES `MATCH` (`MatchID`),
  CONSTRAINT `scorers_ibfk_2` FOREIGN KEY (`PlayerID`) REFERENCES `PLAYER` (`PlayerID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SCORERS`
--

LOCK TABLES `SCORERS` WRITE;
/*!40000 ALTER TABLE `SCORERS` DISABLE KEYS */;
INSERT INTO `SCORERS` VALUES (1,10,1),(7,22,1),(7,19,1),(8,22,1),(8,35,1),(9,6,1),(9,7,1),(9,10,1),(9,55,1);
/*!40000 ALTER TABLE `SCORERS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `STADIUM`
--

DROP TABLE IF EXISTS `STADIUM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `STADIUM` (
  `StadiumName` varchar(50) NOT NULL,
  `Country` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `CAPACITY` int DEFAULT NULL,
  PRIMARY KEY (`StadiumName`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `STADIUM`
--

LOCK TABLES `STADIUM` WRITE;
/*!40000 ALTER TABLE `STADIUM` DISABLE KEYS */;
INSERT INTO `STADIUM` VALUES ('Anfield','England','Liverpool',54074),('Emirates Stadium','England','London',60704),('Etihad Stadium','England','Manchester',53400),('Old Trafford','England','Greater Manchester',74310);
/*!40000 ALTER TABLE `STADIUM` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TEAM`
--

DROP TABLE IF EXISTS `TEAM`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `TEAM` (
  `TeamName` varchar(50) NOT NULL,
  `TeamID` int NOT NULL AUTO_INCREMENT,
  `StadiumName` varchar(50) NOT NULL,
  PRIMARY KEY (`TeamID`),
  KEY `StadiumName` (`StadiumName`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TEAM`
--

LOCK TABLES `TEAM` WRITE;
/*!40000 ALTER TABLE `TEAM` DISABLE KEYS */;
INSERT INTO `TEAM` VALUES ('Arsenal',1,'Emirates Stadium'),('Manchester City',2,'Etihad Stadium'),('Liverpool',3,'Anfield'),('Manchester United',4,'Old Trafford');
/*!40000 ALTER TABLE `TEAM` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-12-10 18:56:10
