-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Oct 03, 2024 at 12:15 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `safeworklite`
--
CREATE DATABASE IF NOT EXISTS `safeworklite` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `safeworklite`;

-- --------------------------------------------------------

--
-- Table structure for table `Agentes`
--

CREATE TABLE IF NOT EXISTS `Agentes` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_risco` int(11) DEFAULT NULL,
  `nome` varchar(80) NOT NULL,
  `observacao` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_risco` (`ID_risco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Cargos`
--

CREATE TABLE IF NOT EXISTS `Cargos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Cargos_Exames`
--

CREATE TABLE IF NOT EXISTS `Cargos_Exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_cargo` int(11) DEFAULT NULL,
  `ID_exame` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_cargo` (`ID_cargo`),
  KEY `ID_exame` (`ID_exame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Empresas_Setor`
--

CREATE TABLE IF NOT EXISTS `Empresas_Setor` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome_empresa` varchar(100) NOT NULL,
  `nome_setor` varchar(100) NOT NULL,
  `senha` varchar(100) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Exames`
--

CREATE TABLE IF NOT EXISTS `Exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(60) NOT NULL,
  `descricao` varchar(200) NOT NULL,
  `admissao` enum('S','N') DEFAULT NULL,
  `demissao` enum('S','N') NOT NULL,
  `retorno_ao_trabalho` enum('S','N') NOT NULL,
  `vezes_por_ano` int(11) NOT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Funcionarios`
--

CREATE TABLE IF NOT EXISTS `Funcionarios` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_setor` int(11) DEFAULT NULL,
  `ID_cargo` int(11) DEFAULT NULL,
  `nome` varchar(255) NOT NULL,
  `data_matricula` date NOT NULL,
  `data_demissao` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_setor` (`ID_setor`),
  KEY `ID_cargo` (`ID_cargo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Resultados_Esperados_Exames`
--

CREATE TABLE IF NOT EXISTS `Resultados_Esperados_Exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_exame` int(11) DEFAULT NULL,
  `nome_dado` varchar(100) NOT NULL,
  `tipo_dado` enum('numeric','boolean') NOT NULL,
  `resultado_numerico_esperado` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`resultado_numerico_esperado`)),
  `resultado_booleano_esperado` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_exame` (`ID_exame`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Resultados_Exames`
--

CREATE TABLE IF NOT EXISTS `Resultados_Exames` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_examinacao` int(11) DEFAULT NULL,
  `resultado_numerico` decimal(10,2) DEFAULT NULL,
  `resultado_booleano` enum('S','N') DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Riscos`
--

CREATE TABLE IF NOT EXISTS `Riscos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(70) NOT NULL,
  `descricao` varchar(255) NOT NULL,
  `observacao` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `Riscos_Cargos`
--

CREATE TABLE IF NOT EXISTS `Riscos_Cargos` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ID_cargo` int(11) DEFAULT NULL,
  `ID_risco` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ID_cargo` (`ID_cargo`),
  KEY `ID_risco` (`ID_risco`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `Agentes`
--
ALTER TABLE `Agentes`
  ADD CONSTRAINT `Agentes_ibfk_1` FOREIGN KEY (`ID_risco`) REFERENCES `Riscos` (`ID`);

--
-- Constraints for table `Cargos_Exames`
--
ALTER TABLE `Cargos_Exames`
  ADD CONSTRAINT `Cargos_Exames_ibfk_1` FOREIGN KEY (`ID_cargo`) REFERENCES `Cargos` (`ID`),
  ADD CONSTRAINT `Cargos_Exames_ibfk_2` FOREIGN KEY (`ID_exame`) REFERENCES `Exames` (`ID`);

--
-- Constraints for table `Funcionarios`
--
ALTER TABLE `Funcionarios`
  ADD CONSTRAINT `Funcionarios_ibfk_1` FOREIGN KEY (`ID_setor`) REFERENCES `Empresas_Setor` (`ID`),
  ADD CONSTRAINT `Funcionarios_ibfk_2` FOREIGN KEY (`ID_cargo`) REFERENCES `Cargos` (`ID`);

--
-- Constraints for table `Resultados_Esperados_Exames`
--
ALTER TABLE `Resultados_Esperados_Exames`
  ADD CONSTRAINT `Resultados_Esperados_Exames_ibfk_1` FOREIGN KEY (`ID_exame`) REFERENCES `Exames` (`ID`);

--
-- Constraints for table `Riscos_Cargos`
--
ALTER TABLE `Riscos_Cargos`
  ADD CONSTRAINT `Riscos_Cargos_ibfk_1` FOREIGN KEY (`ID_cargo`) REFERENCES `Cargos` (`ID`),
  ADD CONSTRAINT `Riscos_Cargos_ibfk_2` FOREIGN KEY (`ID_risco`) REFERENCES `Riscos` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
