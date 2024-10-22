/*!999999\- enable the sandbox mode */ 
-- MariaDB dump 10.19  Distrib 10.11.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: compta
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-0ubuntu0.24.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `ARTICLE`
--

DROP TABLE IF EXISTS `ARTICLE`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ARTICLE` (
  `ID` int(11) NOT NULL,
  `ref` varchar(255) NOT NULL,
  `designation` varchar(255) DEFAULT NULL,
  `prix` decimal(10,2) NOT NULL,
  `ID_fou` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_fournisseur` (`ID_fou`),
  CONSTRAINT `fk_fournisseur` FOREIGN KEY (`ID_fou`) REFERENCES `FOURNISSEUR` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ARTICLE`
--

LOCK TABLES `ARTICLE` WRITE;
/*!40000 ALTER TABLE `ARTICLE` DISABLE KEYS */;
/*!40000 ALTER TABLE `ARTICLE` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `BON`
--

DROP TABLE IF EXISTS `BON`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `BON` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `numero` int(11) NOT NULL,
  `date_cmde` date NOT NULL,
  `delai` int(11) NOT NULL,
  `ID_fou` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_fou` (`ID_fou`),
  CONSTRAINT `BON_ibfk_1` FOREIGN KEY (`ID_fou`) REFERENCES `FOURNISSEUR` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `BON`
--

LOCK TABLES `BON` WRITE;
/*!40000 ALTER TABLE `BON` DISABLE KEYS */;
/*!40000 ALTER TABLE `BON` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `COMPO`
--

DROP TABLE IF EXISTS `COMPO`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `COMPO` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `qte` int(11) DEFAULT NULL,
  `ID_bon` int(11) NOT NULL,
  `ID_art` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_bon` (`ID_bon`),
  KEY `ID_art` (`ID_art`),
  CONSTRAINT `COMPO_ibfk_1` FOREIGN KEY (`ID_bon`) REFERENCES `BON` (`ID`),
  CONSTRAINT `COMPO_ibfk_2` FOREIGN KEY (`ID_art`) REFERENCES `ARTICLE` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `COMPO`
--

LOCK TABLES `COMPO` WRITE;
/*!40000 ALTER TABLE `COMPO` DISABLE KEYS */;
/*!40000 ALTER TABLE `COMPO` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `FOURNISSEUR`
--

DROP TABLE IF EXISTS `FOURNISSEUR`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `FOURNISSEUR` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nom` varchar(30) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `FOURNISSEUR`
--

LOCK TABLES `FOURNISSEUR` WRITE;
/*!40000 ALTER TABLE `FOURNISSEUR` DISABLE KEYS */;
/*!40000 ALTER TABLE `FOURNISSEUR` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-22  0:40:51
