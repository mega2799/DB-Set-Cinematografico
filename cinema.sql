-- MariaDB dump 10.19  Distrib 10.6.4-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: cinema
-- ------------------------------------------------------
-- Server version	10.6.4-MariaDB

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
-- Table structure for table `Acquisto`
--

DROP TABLE IF EXISTS `Acquisto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Acquisto` (
  `idAcquisto` int(8) NOT NULL,
  `data` date NOT NULL,
  `prezzoTotale` float NOT NULL,
  `P_IVA_DITTA` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idAcquisto`),
  KEY `P_IVA_DITTA` (`P_IVA_DITTA`),
  CONSTRAINT `Acquisto_ibfk_1` FOREIGN KEY (`P_IVA_DITTA`) REFERENCES `Ditta` (`P_IVA_DITTA`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Acquisto`
--

LOCK TABLES `Acquisto` WRITE;
/*!40000 ALTER TABLE `Acquisto` DISABLE KEYS */;
/*!40000 ALTER TABLE `Acquisto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `AcquistoCostume`
--

DROP TABLE IF EXISTS `AcquistoCostume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `AcquistoCostume` (
  `codC` int(11) NOT NULL,
  `idAcquisto` int(11) NOT NULL,
  `prezzo` float NOT NULL,
  PRIMARY KEY (`codC`,`idAcquisto`),
  KEY `idAcquisto` (`idAcquisto`),
  CONSTRAINT `AcquistoCostume_ibfk_1` FOREIGN KEY (`codC`) REFERENCES `Costume` (`codC`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `AcquistoCostume_ibfk_2` FOREIGN KEY (`idAcquisto`) REFERENCES `Acquisto` (`idAcquisto`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `AcquistoCostume`
--

LOCK TABLES `AcquistoCostume` WRITE;
/*!40000 ALTER TABLE `AcquistoCostume` DISABLE KEYS */;
/*!40000 ALTER TABLE `AcquistoCostume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Costume`
--

DROP TABLE IF EXISTS `Costume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Costume` (
  `codC` int(6) NOT NULL,
  `tipo` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL CHECK (`tipo` = 'epoca' or `tipo` = 'contemporaneo' or `tipo` = 'fantasia'),
  `descrizione` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CF` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codP` int(11) NOT NULL,
  PRIMARY KEY (`codC`),
  KEY `CF` (`CF`),
  KEY `codP` (`codP`),
  CONSTRAINT `Costume_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `MembroTroupe` (`CF`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Costume_ibfk_2` FOREIGN KEY (`codP`) REFERENCES `PosizioneMagazzino` (`codP`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Costume`
--

LOCK TABLES `Costume` WRITE;
/*!40000 ALTER TABLE `Costume` DISABLE KEYS */;
/*!40000 ALTER TABLE `Costume` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `CostumeScena`
--

DROP TABLE IF EXISTS `CostumeScena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CostumeScena` (
  `codC` int(11) NOT NULL,
  `codScena` int(11) NOT NULL,
  PRIMARY KEY (`codC`,`codScena`),
  KEY `codScena` (`codScena`),
  CONSTRAINT `CostumeScena_ibfk_1` FOREIGN KEY (`codC`) REFERENCES `Costume` (`codC`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `CostumeScena_ibfk_2` FOREIGN KEY (`codScena`) REFERENCES `ScenaCiak` (`codScena`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CostumeScena`
--

LOCK TABLES `CostumeScena` WRITE;
/*!40000 ALTER TABLE `CostumeScena` DISABLE KEYS */;
/*!40000 ALTER TABLE `CostumeScena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Distribuzione`
--

DROP TABLE IF EXISTS `Distribuzione`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Distribuzione` (
  `P_IVA` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codF` int(11) NOT NULL,
  PRIMARY KEY (`P_IVA`,`codF`),
  KEY `codF` (`codF`),
  CONSTRAINT `Distribuzione_ibfk_1` FOREIGN KEY (`P_IVA`) REFERENCES `Enti` (`P_IVA`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Distribuzione_ibfk_2` FOREIGN KEY (`codF`) REFERENCES `Film` (`codF`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Distribuzione`
--

LOCK TABLES `Distribuzione` WRITE;
/*!40000 ALTER TABLE `Distribuzione` DISABLE KEYS */;
/*!40000 ALTER TABLE `Distribuzione` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Ditta`
--

DROP TABLE IF EXISTS `Ditta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Ditta` (
  `P_IVA_DITTA` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(41) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codInd` int(11) NOT NULL,
  PRIMARY KEY (`P_IVA_DITTA`),
  KEY `codInd` (`codInd`),
  CONSTRAINT `Ditta_ibfk_1` FOREIGN KEY (`codInd`) REFERENCES `Indirizzo` (`codInd`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Ditta`
--

LOCK TABLES `Ditta` WRITE;
/*!40000 ALTER TABLE `Ditta` DISABLE KEYS */;
/*!40000 ALTER TABLE `Ditta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Enti`
--

DROP TABLE IF EXISTS `Enti`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Enti` (
  `P_IVA` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codInd` int(11) NOT NULL,
  PRIMARY KEY (`P_IVA`),
  KEY `codInd` (`codInd`),
  CONSTRAINT `Enti_ibfk_1` FOREIGN KEY (`codInd`) REFERENCES `Indirizzo` (`codInd`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Enti`
--

LOCK TABLES `Enti` WRITE;
/*!40000 ALTER TABLE `Enti` DISABLE KEYS */;
/*!40000 ALTER TABLE `Enti` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Film`
--

DROP TABLE IF EXISTS `Film`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Film` (
  `codF` int(11) NOT NULL AUTO_INCREMENT,
  `titolo` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genere` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL CHECK (`genere` = 'Animazione' or `genere` = 'Avventura' or `genere` = 'Azione' or `genere` = 'Biografico' or `genere` = 'Commedia' or `genere` = 'Documentario' or `genere` = 'Drammatico' or `genere` = 'Pornografico' or `genere` = 'Fantascienza' or `genere` = 'Fantasy' or `genere` = 'Guerra' or `genere` = 'Horror' or `genere` = 'Musical' or `genere` = 'Storico' or `genere` = 'Thriller' or `genere` = 'Western'),
  `durata` int(3) NOT NULL CHECK (`durata` > 0),
  `dataUscita` date DEFAULT NULL,
  `idSerie` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`codF`),
  KEY `idSerie` (`idSerie`),
  CONSTRAINT `Film_ibfk_1` FOREIGN KEY (`idSerie`) REFERENCES `SerieLetteraria` (`idSerie`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Film`
--

LOCK TABLES `Film` WRITE;
/*!40000 ALTER TABLE `Film` DISABLE KEYS */;
/*!40000 ALTER TABLE `Film` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Film_Membro_Troupe`
--

DROP TABLE IF EXISTS `Film_Membro_Troupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Film_Membro_Troupe` (
  `codF` int(11) NOT NULL,
  `CF` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`codF`,`CF`),
  KEY `CF` (`CF`),
  CONSTRAINT `Film_Membro_Troupe_ibfk_1` FOREIGN KEY (`codF`) REFERENCES `Film` (`codF`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Film_Membro_Troupe_ibfk_2` FOREIGN KEY (`CF`) REFERENCES `MembroTroupe` (`CF`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Film_Membro_Troupe`
--

LOCK TABLES `Film_Membro_Troupe` WRITE;
/*!40000 ALTER TABLE `Film_Membro_Troupe` DISABLE KEYS */;
/*!40000 ALTER TABLE `Film_Membro_Troupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Finanziatore`
--

DROP TABLE IF EXISTS `Finanziatore`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Finanziatore` (
  `P_IVA_FINANZIATORE` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(41) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codInd` int(11) NOT NULL,
  `percentualeGuadagno` float NOT NULL CHECK (`percentualeGuadagno` between 0 and 100),
  PRIMARY KEY (`P_IVA_FINANZIATORE`),
  KEY `codInd` (`codInd`),
  CONSTRAINT `Finanziatore_ibfk_1` FOREIGN KEY (`codInd`) REFERENCES `Indirizzo` (`codInd`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Finanziatore`
--

LOCK TABLES `Finanziatore` WRITE;
/*!40000 ALTER TABLE `Finanziatore` DISABLE KEYS */;
/*!40000 ALTER TABLE `Finanziatore` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Fondo`
--

DROP TABLE IF EXISTS `Fondo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Fondo` (
  `codFondo` varchar(13) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataAccredito` date NOT NULL,
  `patrimonio` float NOT NULL CHECK (`patrimonio` >= 0),
  `P_IVA_SPONSOR` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `P_IVA_FINANZIATORE` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CF` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codF` int(11) NOT NULL,
  PRIMARY KEY (`codFondo`),
  KEY `P_IVA_SPONSOR` (`P_IVA_SPONSOR`),
  KEY `P_IVA_FINANZIATORE` (`P_IVA_FINANZIATORE`),
  KEY `CF` (`CF`),
  KEY `codF` (`codF`),
  CONSTRAINT `Fondo_ibfk_1` FOREIGN KEY (`P_IVA_SPONSOR`) REFERENCES `Sponsor` (`P_IVA_SPONSOR`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Fondo_ibfk_2` FOREIGN KEY (`P_IVA_FINANZIATORE`) REFERENCES `Finanziatore` (`P_IVA_FINANZIATORE`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Fondo_ibfk_3` FOREIGN KEY (`CF`) REFERENCES `MembroTroupe` (`CF`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Fondo_ibfk_4` FOREIGN KEY (`codF`) REFERENCES `Film` (`codF`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Fondo`
--

LOCK TABLES `Fondo` WRITE;
/*!40000 ALTER TABLE `Fondo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Fondo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Incasso`
--

DROP TABLE IF EXISTS `Incasso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Incasso` (
  `percentualeTrattenute` float NOT NULL,
  `codF` int(11) NOT NULL,
  `codInd` int(11) NOT NULL,
  PRIMARY KEY (`codF`,`codInd`),
  KEY `codInd` (`codInd`),
  CONSTRAINT `Incasso_ibfk_1` FOREIGN KEY (`codF`) REFERENCES `Film` (`codF`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Incasso_ibfk_2` FOREIGN KEY (`codInd`) REFERENCES `Indirizzo` (`codInd`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Incasso`
--

LOCK TABLES `Incasso` WRITE;
/*!40000 ALTER TABLE `Incasso` DISABLE KEYS */;
/*!40000 ALTER TABLE `Incasso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Indirizzo`
--

DROP TABLE IF EXISTS `Indirizzo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Indirizzo` (
  `codInd` int(11) NOT NULL,
  `città` varchar(21) COLLATE utf8mb4_unicode_ci NOT NULL,
  `via` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `civico` int(4) NOT NULL,
  `CAP` int(5) NOT NULL CHECK (octet_length(`CAP`) = 5),
  PRIMARY KEY (`codInd`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Indirizzo`
--

LOCK TABLES `Indirizzo` WRITE;
/*!40000 ALTER TABLE `Indirizzo` DISABLE KEYS */;
/*!40000 ALTER TABLE `Indirizzo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Magazzino`
--

DROP TABLE IF EXISTS `Magazzino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Magazzino` (
  `numMagazzino` int(8) NOT NULL,
  `codInd` int(11) NOT NULL,
  PRIMARY KEY (`numMagazzino`),
  KEY `codInd` (`codInd`),
  CONSTRAINT `Magazzino_ibfk_1` FOREIGN KEY (`codInd`) REFERENCES `Indirizzo` (`codInd`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Magazzino`
--

LOCK TABLES `Magazzino` WRITE;
/*!40000 ALTER TABLE `Magazzino` DISABLE KEYS */;
/*!40000 ALTER TABLE `Magazzino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `MembroTroupe`
--

DROP TABLE IF EXISTS `MembroTroupe`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `MembroTroupe` (
  `CF` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `cognome` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `IBAN` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dataNascita` date NOT NULL,
  `telefono` varchar(15) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codInd` int(11) NOT NULL,
  `percentualeContributo` float DEFAULT NULL CHECK (`percentualeContributo` between 0 and 100),
  `ruolo` varchar(41) COLLATE utf8mb4_unicode_ci NOT NULL CHECK (`ruolo` in ('sceneggiatore','produttore','produttore esecutivo','aiuto regista','capo regista','regista','attore','stilista','operatore')),
  `tipoOperatore` varchar(31) COLLATE utf8mb4_unicode_ci DEFAULT NULL CHECK (`tipoOperatore` in ('fonico','fotografico')),
  PRIMARY KEY (`CF`),
  KEY `codInd` (`codInd`),
  CONSTRAINT `MembroTroupe_ibfk_1` FOREIGN KEY (`codInd`) REFERENCES `Indirizzo` (`codInd`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `MembroTroupe`
--

LOCK TABLES `MembroTroupe` WRITE;
/*!40000 ALTER TABLE `MembroTroupe` DISABLE KEYS */;
/*!40000 ALTER TABLE `MembroTroupe` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Membro_Troupe_Scena`
--

DROP TABLE IF EXISTS `Membro_Troupe_Scena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Membro_Troupe_Scena` (
  `codScena` int(11) NOT NULL,
  `CF` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`codScena`,`CF`),
  KEY `CF` (`CF`),
  CONSTRAINT `Membro_Troupe_Scena_ibfk_1` FOREIGN KEY (`codScena`) REFERENCES `ScenaCiak` (`codScena`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `Membro_Troupe_Scena_ibfk_2` FOREIGN KEY (`CF`) REFERENCES `MembroTroupe` (`CF`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Membro_Troupe_Scena`
--

LOCK TABLES `Membro_Troupe_Scena` WRITE;
/*!40000 ALTER TABLE `Membro_Troupe_Scena` DISABLE KEYS */;
/*!40000 ALTER TABLE `Membro_Troupe_Scena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OggettiDiScena`
--

DROP TABLE IF EXISTS `OggettiDiScena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OggettiDiScena` (
  `codO` int(6) NOT NULL,
  `tipo` varchar(21) COLLATE utf8mb4_unicode_ci DEFAULT NULL CHECK (`tipo` in ('arredo','maschere','armi','mobili','strumentoMusicale','motori')),
  `descrizione` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codP` int(11) NOT NULL,
  PRIMARY KEY (`codO`),
  KEY `codP` (`codP`),
  CONSTRAINT `OggettiDiScena_ibfk_1` FOREIGN KEY (`codP`) REFERENCES `PosizioneMagazzino` (`codP`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OggettiDiScena`
--

LOCK TABLES `OggettiDiScena` WRITE;
/*!40000 ALTER TABLE `OggettiDiScena` DISABLE KEYS */;
/*!40000 ALTER TABLE `OggettiDiScena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OggettoScena`
--

DROP TABLE IF EXISTS `OggettoScena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OggettoScena` (
  `codO` int(11) NOT NULL,
  `codScena` int(11) NOT NULL,
  PRIMARY KEY (`codO`,`codScena`),
  KEY `codScena` (`codScena`),
  CONSTRAINT `OggettoScena_ibfk_1` FOREIGN KEY (`codO`) REFERENCES `OggettiDiScena` (`codO`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `OggettoScena_ibfk_2` FOREIGN KEY (`codScena`) REFERENCES `ScenaCiak` (`codScena`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OggettoScena`
--

LOCK TABLES `OggettoScena` WRITE;
/*!40000 ALTER TABLE `OggettoScena` DISABLE KEYS */;
/*!40000 ALTER TABLE `OggettoScena` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `PosizioneMagazzino`
--

DROP TABLE IF EXISTS `PosizioneMagazzino`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `PosizioneMagazzino` (
  `codP` int(5) NOT NULL,
  `numMagazzino` int(11) NOT NULL,
  `scaffale` int(3) NOT NULL,
  `percorso` varchar(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`codP`,`numMagazzino`),
  KEY `numMagazzino` (`numMagazzino`),
  CONSTRAINT `PosizioneMagazzino_ibfk_1` FOREIGN KEY (`numMagazzino`) REFERENCES `Magazzino` (`numMagazzino`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `PosizioneMagazzino`
--

LOCK TABLES `PosizioneMagazzino` WRITE;
/*!40000 ALTER TABLE `PosizioneMagazzino` DISABLE KEYS */;
/*!40000 ALTER TABLE `PosizioneMagazzino` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ScenaCiak`
--

DROP TABLE IF EXISTS `ScenaCiak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ScenaCiak` (
  `codScena` int(10) NOT NULL,
  `noteDiProduzione` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rullo` int(4) NOT NULL,
  `numRiprese` int(4) NOT NULL,
  `dataInizio` date DEFAULT NULL,
  `dataFine` date DEFAULT NULL,
  `costoAffittoGiornaliero` float DEFAULT NULL,
  `codInd` int(11) NOT NULL,
  `codF` int(11) NOT NULL,
  PRIMARY KEY (`codScena`),
  KEY `codInd` (`codInd`),
  KEY `codF` (`codF`),
  CONSTRAINT `ScenaCiak_ibfk_1` FOREIGN KEY (`codInd`) REFERENCES `Indirizzo` (`codInd`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `ScenaCiak_ibfk_2` FOREIGN KEY (`codF`) REFERENCES `Film` (`codF`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ScenaCiak`
--

LOCK TABLES `ScenaCiak` WRITE;
/*!40000 ALTER TABLE `ScenaCiak` DISABLE KEYS */;
/*!40000 ALTER TABLE `ScenaCiak` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SediTerritoriali`
--

DROP TABLE IF EXISTS `SediTerritoriali`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SediTerritoriali` (
  `P_IVA` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codInd` int(11) NOT NULL,
  PRIMARY KEY (`codInd`),
  KEY `P_IVA` (`P_IVA`),
  CONSTRAINT `SediTerritoriali_ibfk_1` FOREIGN KEY (`P_IVA`) REFERENCES `Enti` (`P_IVA`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `SediTerritoriali_ibfk_2` FOREIGN KEY (`codInd`) REFERENCES `Indirizzo` (`codInd`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SediTerritoriali`
--

LOCK TABLES `SediTerritoriali` WRITE;
/*!40000 ALTER TABLE `SediTerritoriali` DISABLE KEYS */;
/*!40000 ALTER TABLE `SediTerritoriali` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `SerieLetteraria`
--

DROP TABLE IF EXISTS `SerieLetteraria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `SerieLetteraria` (
  `idSerie` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `titolo` varchar(51) COLLATE utf8mb4_unicode_ci NOT NULL,
  `genere` varchar(40) COLLATE utf8mb4_unicode_ci NOT NULL,
  `CF` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idSerie`),
  KEY `CF` (`CF`),
  CONSTRAINT `SerieLetteraria_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `MembroTroupe` (`CF`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `SerieLetteraria`
--

LOCK TABLES `SerieLetteraria` WRITE;
/*!40000 ALTER TABLE `SerieLetteraria` DISABLE KEYS */;
/*!40000 ALTER TABLE `SerieLetteraria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Sponsor`
--

DROP TABLE IF EXISTS `Sponsor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Sponsor` (
  `P_IVA_SPONSOR` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nome` varchar(41) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`P_IVA_SPONSOR`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Sponsor`
--

LOCK TABLES `Sponsor` WRITE;
/*!40000 ALTER TABLE `Sponsor` DISABLE KEYS */;
/*!40000 ALTER TABLE `Sponsor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `StilistaCostume`
--

DROP TABLE IF EXISTS `StilistaCostume`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `StilistaCostume` (
  `CF` varchar(12) COLLATE utf8mb4_unicode_ci NOT NULL,
  `codC` int(11) NOT NULL,
  PRIMARY KEY (`CF`,`codC`),
  KEY `codC` (`codC`),
  CONSTRAINT `StilistaCostume_ibfk_1` FOREIGN KEY (`CF`) REFERENCES `MembroTroupe` (`CF`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `StilistaCostume_ibfk_2` FOREIGN KEY (`codC`) REFERENCES `Costume` (`codC`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `StilistaCostume`
--

LOCK TABLES `StilistaCostume` WRITE;
/*!40000 ALTER TABLE `StilistaCostume` DISABLE KEYS */;
/*!40000 ALTER TABLE `StilistaCostume` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-11-14 17:33:39
