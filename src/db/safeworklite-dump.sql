-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Linux (x86_64)
-- Host: 127.0.0.1    Database: safeworklite
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

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

-- Table structure for table `Agentes`
DROP TABLE IF EXISTS `Agentes`;
CREATE TABLE `Agentes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_risco` int(11) DEFAULT NULL,
  `nome` varchar(80) NOT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_risco` (`ID_risco`),
  CONSTRAINT `Agentes_ibfk_1` FOREIGN KEY (`ID_risco`) REFERENCES `Riscos` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Cargos`
DROP TABLE IF EXISTS `Cargos`;
CREATE TABLE `Cargos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `ID_setor` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `fk_setor` (`ID_setor`),
  CONSTRAINT `fk_setor` FOREIGN KEY (`ID_setor`) REFERENCES `Empresas_Setor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Cargos_Exames`
DROP TABLE IF EXISTS `Cargos_Exames`;
CREATE TABLE `Cargos_Exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_cargo` int(11) DEFAULT NULL,
  `ID_exame` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_cargo` (`ID_cargo`),
  KEY `ID_exame` (`ID_exame`),
  CONSTRAINT `Cargos_Exames_ibfk_1` FOREIGN KEY (`ID_cargo`) REFERENCES `Cargos` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Cargos_Exames_ibfk_2` FOREIGN KEY (`ID_exame`) REFERENCES `Exames` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Empresas_Setor`
DROP TABLE IF EXISTS `Empresas_Setor`;
CREATE TABLE `Empresas_Setor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(100) NOT NULL,
  `nome_setor` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Exames`
DROP TABLE IF EXISTS `Exames`;
CREATE TABLE `Exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `admissao` enum('S','N') DEFAULT NULL,
  `demissao` enum('S','N') NOT NULL,
  `retorno_ao_trabalho` enum('S','N') NOT NULL,
  `vezes_por_ano` int(11) NOT NULL,
  `ID_setor` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_setor` (`ID_setor`),
  CONSTRAINT `Exames_ibfk_1` FOREIGN KEY (`ID_setor`) REFERENCES `Empresas_Setor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Funcionarios`
DROP TABLE IF EXISTS `Funcionarios`;
CREATE TABLE `Funcionarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_setor` int(11) DEFAULT NULL,
  `ID_cargo` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `data_matricula` date NOT NULL,
  `data_demissao` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_setor` (`ID_setor`),
  KEY `ID_cargo` (`ID_cargo`),
  CONSTRAINT `Funcionarios_ibfk_1` FOREIGN KEY (`ID_setor`) REFERENCES `Empresas_Setor` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Funcionarios_ibfk_2` FOREIGN KEY (`ID_cargo`) REFERENCES `Cargos` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Resultados_Esperados_Exames`
DROP TABLE IF EXISTS `Resultados_Esperados_Exames`;
CREATE TABLE `Resultados_Esperados_Exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_exame` int(11) DEFAULT NULL,
  `nome_dado` varchar(100) NOT NULL,
  `tipo_dado` enum('numeric','boolean') NOT NULL,
  `resultado_numerico_esperado` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`resultado_numerico_esperado`)),
  `resultado_booleano_esperado` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_exame` (`ID_exame`),
  CONSTRAINT `Resultados_Esperados_Exames_ibfk_1` FOREIGN KEY (`ID_exame`) REFERENCES `Exames` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Resultados_Exames`
DROP TABLE IF EXISTS `Resultados_Exames`;
CREATE TABLE `Resultados_Exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_examinacao` int(11) DEFAULT NULL,
  `resultado_numerico` decimal(10,2) DEFAULT NULL,
  `resultado_booleano` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Riscos`
DROP TABLE IF EXISTS `Riscos`;
CREATE TABLE `Riscos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  `ID_setor` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_setor` (`ID_setor`),
  CONSTRAINT `Riscos_ibfk_1` FOREIGN KEY (`ID_setor`) REFERENCES `Empresas_Setor` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Table structure for table `Riscos_Cargos`
DROP TABLE IF EXISTS `Riscos_Cargos`;
CREATE TABLE `Riscos_Cargos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_cargo` int(11) DEFAULT NULL,
  `ID_risco` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_cargo` (`ID_cargo`),
  KEY `ID_risco` (`ID_risco`),
  CONSTRAINT `Riscos_Cargos_ibfk_1` FOREIGN KEY (`ID_cargo`) REFERENCES `Cargos` (`ID`) ON DELETE CASCADE,
  CONSTRAINT `Riscos_Cargos_ibfk_2` FOREIGN KEY (`ID_risco`) REFERENCES `Riscos` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
