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
-- Dumping data for table `cargos`
--

LOCK TABLES `cargos` WRITE;
/*!40000 ALTER TABLE `cargos` DISABLE KEYS */;
INSERT INTO `cargos` VALUES (1,'Operador de maquina','opera maquina',4),(2,'fabricador','faz pasta de dente',4),(3,'Coordenador Pedagógico','Responsável por desenvolver, implementar e supervisionar planos pedagógicos. Atua na capacitação e orientação dos professores,',5),(4,'Supervisor de Ensino','Monitora e orienta os professores em relação ao planejamento e prática pedagógica. Avalia relatórios de desempenho, observando as práticas em sala de aula, oferecendo feedback e sugerindo melhorias para otimização do ensino.',5),(5,'Orientador Educacional','Responsável por prestar suporte aos alunos, ajudando no desenvolvimento pessoal e na solução de conflitos.',5),(6,'Assistente de Coordenação','Dá suporte ao coordenador pedagógico em atividades administrativas e organizacionais. Gerencia registros acadêmicos e auxilia na comunicação entre pais e escola',5),(7,'Coordenador de Disciplina','Gerencia a aplicação das normas disciplinares da escola, garantindo um ambiente de respeito e ordem. Atua junto aos professores e demais colaboradores para assegurar o cumprimento do regimento escolar.',5),(8,'Consultor de Avaliação Escolar','Desenvolve e aplica sistemas de avaliação do desempenho dos alunos, propondo estratégias de melhoria contínua. Analisa os resultados das avaliações e sugere ações para melhorar o rendimento escolar.',5),(9,'Coordenador de Projetos Especiais','Analisa dados de desempenho de alunos e professores, preparando relatórios para apoiar a tomada de decisões estratégicas. Utiliza tecnologias de informação para aprimorar o sistema de ensino e planejar ações corretivas.',5),(10,'Gestor de Tecnologia Educacional','Responsável por implementar e supervisionar o uso de novas tecnologias no ambiente escolar. Capacita professores para o uso de ferramentas digitais e promove a integração de plataformas de ensino e aprendizado digital.',5),(11,'Psicopedagogo Escolar','Atua na identificação e orientação de alunos com dificuldades de aprendizado. Trabalha em conjunto com professores e pais para desenvolver estratégias específicas para cada estudante, promovendo um ambiente de apoio e inclusão.\r\n',5);
/*!40000 ALTER TABLE `cargos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cargos_exames`
--

LOCK TABLES `cargos_exames` WRITE;
/*!40000 ALTER TABLE `cargos_exames` DISABLE KEYS */;
/*!40000 ALTER TABLE `cargos_exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `empresas_setor`
--

LOCK TABLES `empresas_setor` WRITE;
/*!40000 ALTER TABLE `empresas_setor` DISABLE KEYS */;
INSERT INTO `empresas_setor` VALUES (4,'mimimidias','woke','123'),(5,'FAESA','coordenação','faesa123');
/*!40000 ALTER TABLE `empresas_setor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `exames`
--

LOCK TABLES `exames` WRITE;
/*!40000 ALTER TABLE `exames` DISABLE KEYS */;
INSERT INTO `exames` VALUES (5,'Audiógo','mede audição','S','N','S',2,4,'Consegue ouvir um GRITO','booleano','null','S'),(7,'hemograma','mede sangue','N','S','S',2,4,'Hemoglobina mL/g','numerico','[13,16]',NULL),(8,'Hemograma Completo','Exame para verificar condições gerais de saúde, como anemia, infecções e distúrbios hematológicos.','S','S','N',2,5,'Hemoglobina (g/dL)','numerico','[13,17]',NULL),(9,'Audiometria','Teste de audição para identificar perdas auditivas em diferentes níveis.','N','S','S',1,5,'Perda Auditiva Detectada','booleano','null','N'),(10,'Exame de Colesterol','Avaliação dos níveis de colesterol total e frações no sangue.','S','N','N',1,5,'Colesterol Total (mg/dL)','numerico','[100,200]',NULL),(11,'Teste de Glicose em Jejum','Exame para medir os níveis de glicose no sangue após um período de jejum.','S','N','S',1,5,'Glicose (mg/dL)','numerico','[70,110]',NULL),(12,'Eletrocardiograma (ECG)','Exame para avaliar a atividade elétrica do coração, identificando anormalidades.','N','S','S',2,5,'Ritmo Cardíaco Normal','booleano','null','S');
/*!40000 ALTER TABLE `exames` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `examinacoes`
--

LOCK TABLES `examinacoes` WRITE;
/*!40000 ALTER TABLE `examinacoes` DISABLE KEYS */;
INSERT INTO `examinacoes` VALUES (3,10,7,'2024-10-23','numerico',12.00,NULL),(4,11,5,'2024-10-11','booleano',0.00,'N'),(5,10,7,'2024-10-26','numerico',17.00,NULL),(6,12,12,'2024-10-23','booleano',0.00,'S'),(7,12,8,'2024-10-19','numerico',18.00,NULL),(8,13,9,'2024-10-25','booleano',0.00,'N'),(9,13,9,'2024-10-30','booleano',0.00,'S'),(10,14,11,'2024-10-02','numerico',120.00,NULL),(11,14,12,'2024-11-01','booleano',0.00,'N'),(12,14,9,'2024-10-11','booleano',0.00,'N'),(13,14,12,'2024-10-05','booleano',0.00,'S'),(14,15,9,'2024-10-26','booleano',0.00,'S'),(15,15,12,'2024-10-26','booleano',0.00,'N'),(16,15,10,'2024-10-05','numerico',90.00,NULL),(17,15,11,'2024-10-10','numerico',120.00,NULL),(18,16,8,'2024-10-24','numerico',14.00,NULL),(19,16,10,'2024-10-19','numerico',150.00,NULL),(20,16,12,'2024-10-19','booleano',0.00,'S'),(21,16,9,'2024-11-09','booleano',0.00,'S'),(22,17,9,'2024-10-19','booleano',0.00,'S'),(23,17,11,'2024-10-05','numerico',150.00,NULL),(24,21,8,'2024-10-11','numerico',14.00,NULL),(25,23,9,'2024-10-12','booleano',0.00,'S'),(26,23,9,'2024-11-09','booleano',0.00,'S'),(27,23,9,'2024-11-14','booleano',0.00,'S');
/*!40000 ALTER TABLE `examinacoes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `funcionarios`
--

LOCK TABLES `funcionarios` WRITE;
/*!40000 ALTER TABLE `funcionarios` DISABLE KEYS */;
INSERT INTO `funcionarios` VALUES (10,4,1,'Sansão','2024-10-05',NULL),(11,4,2,'marquinho','2024-10-25',NULL),(12,5,3,'Bruce Wayne','2018-03-15',NULL),(13,5,11,'Kurt Cobain','2017-07-22',NULL),(14,5,10,'Tony Stark','2020-11-01',NULL),(15,5,9,'David Bowie','2016-04-05',NULL),(16,5,5,'Diana Prince','2019-09-18',NULL),(17,5,4,'Freddie Mercury','2023-01-30',NULL),(18,5,6,'Peter Parker','2021-08-14',NULL),(19,5,7,'Alice Cooper','2018-02-27',NULL),(20,5,8,'Natasha Romanoff','2022-06-10',NULL),(21,5,11,'Mick Jagger','2019-10-19',NULL),(22,5,3,'Clark Kent','2016-11-08',NULL),(23,5,8,'James Hetfield','2021-03-23',NULL),(24,5,9,'Eddie Vedder','2022-04-07',NULL),(25,5,5,'Steve Rogers','2017-07-13',NULL),(26,5,7,'Janis Joplin','2021-05-20',NULL),(27,5,11,'Wanda Maximoff','2018-12-02',NULL),(28,5,4,'Steven Tyler','2019-07-29',NULL),(29,5,9,'David Gilmour','2024-10-15',NULL);
/*!40000 ALTER TABLE `funcionarios` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-23  0:47:23
