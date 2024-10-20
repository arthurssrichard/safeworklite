CREATE DATABASE  IF NOT EXISTS `safeworklite` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `safeworklite`;
-- MySQL dump 10.13  Distrib 8.0.38, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: safeworklite
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB

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
-- Table structure for table `cargos`
--

DROP TABLE IF EXISTS `cargos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cargos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ID_setor` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_setor` (`ID_setor`),
  CONSTRAINT `fk_setor` FOREIGN KEY (`ID_setor`) REFERENCES `empresas_setor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `empresas_setor`
--

DROP TABLE IF EXISTS `empresas_setor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empresas_setor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(100) NOT NULL,
  `nome_setor` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `exames`
--

DROP TABLE IF EXISTS `exames`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `admissao` enum('S','N') DEFAULT NULL,
  `demissao` enum('S','N') NOT NULL,
  `retorno_ao_trabalho` enum('S','N') NOT NULL,
  `vezes_por_ano` int(11) NOT NULL,
  `ID_setor` int(11) NOT NULL,
  `resultado_nome_dado` varchar(100) NOT NULL,
  `resultado_tipo_dado` enum('numerico','booleano') NOT NULL,
  `resultado_numerico_esperado` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin CHECK (json_valid(`resultado_numerico_esperado`)),
  `resultado_booleano_esperado` enum('S','N'),
  PRIMARY KEY (`ID`),
  KEY `ID_setor` (`ID_setor`),
  CONSTRAINT `Exames_ibfk_1` FOREIGN KEY (`ID_setor`) REFERENCES `empresas_setor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `examinacoes`
--

DROP TABLE IF EXISTS `examinacoes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `examinacoes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_funcionario` int(11) NOT NULL,
  `ID_exame` int(11) NOT NULL,
  `data_realizada` date NOT NULL,
  `tipo_dado` enum('numerico','booleano') NOT NULL,
  `resultado_numerico` decimal(10,2) DEFAULT NULL,
  `resultado_booleano` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_funcionario` (`ID_funcionario`),
  KEY `ID_exame` (`ID_exame`),
  CONSTRAINT `examinacoes_ibfk_1` FOREIGN KEY (`ID_funcionario`) REFERENCES `funcionarios` (`ID`),
  CONSTRAINT `examinacoes_ibfk_2` FOREIGN KEY (`ID_exame`) REFERENCES `exames` (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `funcionarios`
--

DROP TABLE IF EXISTS `funcionarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_setor` int(11) DEFAULT NULL,
  `ID_cargo` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `data_matricula` date NOT NULL,
  `data_demissao` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_setor` (`ID_setor`),
  KEY `ID_cargo` (`ID_cargo`),
  CONSTRAINT `Funcionarios_ibfk_1` FOREIGN KEY (`ID_setor`) REFERENCES `empresas_setor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Funcionarios_ibfk_2` FOREIGN KEY (`ID_cargo`) REFERENCES `cargos` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-15 22:21:02
