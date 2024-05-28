CREATE DATABASE  IF NOT EXISTS `rrhh_umami` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `rrhh_umami`;
-- MySQL dump 10.13  Distrib 8.0.36, for Win64 (x86_64)
--
-- Host: localhost    Database: rrhh_umami
-- ------------------------------------------------------
-- Server version	8.0.36

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
-- Table structure for table `ajustes`
--

DROP TABLE IF EXISTS `ajustes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ajustes` (
  `id_sueldo` int NOT NULL,
  `id_empleado` int DEFAULT NULL,
  `fecha_de_ajuste` date DEFAULT NULL,
  `observaciones` varchar(50) DEFAULT NULL,
  `monto_usd` int NOT NULL,
  `monto_ars` int DEFAULT NULL,
  PRIMARY KEY (`id_sueldo`),
  KEY `fk_ajustes_empleados` (`id_empleado`),
  CONSTRAINT `fk_ajustes_empleados` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ajustes`
--

LOCK TABLES `ajustes` WRITE;
/*!40000 ALTER TABLE `ajustes` DISABLE KEYS */;
INSERT INTO `ajustes` VALUES (1,10,'2024-08-14','PERFORMANCE',1344,NULL),(2,15,'2024-04-28','PERFORMANCE',3808,NULL),(3,31,'2025-02-16','INFLACIÓN',3557,NULL),(4,25,'2024-04-27','INFLACIÓN',2142,NULL),(5,23,'2023-11-16','PERFORMANCE',1709,NULL),(6,29,'2023-12-06','PERFORMANCE',356,400000),(7,25,'2024-01-21','INFLACIÓN',2142,NULL),(8,16,'2023-11-18','INFLACIÓN',259,300000),(9,24,'2024-09-24','PERFORMANCE',2271,NULL),(10,1,'2024-08-26','INFLACIÓN',4041,5000000),(11,32,'2024-06-18','INFLACIÓN',4638,5000000),(12,34,'2023-06-28','PERFORMANCE',1261,NULL),(13,8,'2023-07-06','PERFORMANCE',1543,NULL),(14,17,'2024-10-10','INFLACIÓN',2341,NULL),(15,30,'2024-11-06','INFLACIÓN',3699,NULL),(16,28,'2025-01-15','PERFORMANCE',2508,NULL),(17,22,'2023-03-15','CAMBIO DE LEVEL',3943,NULL),(18,5,'2023-03-08','CAMBIO DE LEVEL',2226,NULL),(19,28,'2023-10-29','CAMBIO DE LEVEL',2508,NULL),(20,21,'2024-03-13','CAMBIO DE LEVEL',2880,NULL);
/*!40000 ALTER TABLE `ajustes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `area`
--

DROP TABLE IF EXISTS `area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `area` (
  `id_area` int NOT NULL,
  `banda` int NOT NULL,
  `desc_area` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_area`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `area`
--

LOCK TABLES `area` WRITE;
/*!40000 ALTER TABLE `area` DISABLE KEYS */;
INSERT INTO `area` VALUES (101,100,'DEVOPS'),(102,100,'BACK-END'),(103,100,'QA'),(104,100,'SOPORTE IT'),(105,100,'FRONT-END'),(106,200,'FINANCE'),(107,200,'OPERATIONS'),(108,200,'PEOPLE'),(109,200,'MKT'),(110,200,'SOPORTE'),(111,200,'CX'),(112,200,'BIZ DEV'),(113,300,'DATA'),(114,300,'PRODUCT'),(115,300,'UX/UI');
/*!40000 ALTER TABLE `area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `bajas_ano`
--

DROP TABLE IF EXISTS `bajas_ano`;
/*!50001 DROP VIEW IF EXISTS `bajas_ano`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `bajas_ano` AS SELECT 
 1 AS `ID_EMPLEADO`,
 1 AS `DIAS_DE_DIFERENCIA`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `contrato`
--

DROP TABLE IF EXISTS `contrato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `contrato` (
  `id_contrato` int NOT NULL,
  `desc_contrato` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_contrato`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `contrato`
--

LOCK TABLES `contrato` WRITE;
/*!40000 ALTER TABLE `contrato` DISABLE KEYS */;
INSERT INTO `contrato` VALUES (1,'Contractor'),(2,'Monotributista'),(3,'Rel de dependencia');
/*!40000 ALTER TABLE `contrato` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `empleados` (
  `id_empleado` int NOT NULL AUTO_INCREMENT,
  `primer_nombre` varchar(50) NOT NULL,
  `segundo_nombre` varchar(50) DEFAULT NULL,
  `primer_apellido` varchar(50) NOT NULL,
  `segundo_apellido` varchar(50) DEFAULT NULL,
  `dni` varchar(20) NOT NULL,
  `cuil` varchar(20) NOT NULL,
  `genero` enum('F','M','No binario') NOT NULL,
  `calle` varchar(50) NOT NULL,
  `numeracion` varchar(50) NOT NULL,
  `piso` varchar(50) DEFAULT NULL,
  `departamento` varchar(50) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `ciudad` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `fecha_alta` date DEFAULT NULL,
  `tipo_de_empleados` enum('C Level','Líder','Team Player') DEFAULT NULL,
  `id_nivel` int NOT NULL,
  `id_area` int NOT NULL,
  `id_contrato` int NOT NULL,
  `id_zona` int NOT NULL,
  `id_lider` int DEFAULT NULL,
  `sueldo` double DEFAULT NULL,
  `banda` enum('100','200','300') DEFAULT NULL,
  PRIMARY KEY (`id_empleado`),
  UNIQUE KEY `email` (`email`),
  KEY `fk_empleados_area` (`id_area`),
  KEY `fk_empleados_contrato` (`id_contrato`),
  KEY `fk_empleados_zona` (`id_zona`),
  KEY `fk_empleados_nivel` (`id_nivel`),
  KEY `fk_empleados_empleados` (`id_lider`),
  CONSTRAINT `fk_empleados_area` FOREIGN KEY (`id_area`) REFERENCES `area` (`id_area`),
  CONSTRAINT `fk_empleados_contrato` FOREIGN KEY (`id_contrato`) REFERENCES `contrato` (`id_contrato`),
  CONSTRAINT `fk_empleados_empleados` FOREIGN KEY (`id_lider`) REFERENCES `empleados` (`id_empleado`),
  CONSTRAINT `fk_empleados_nivel` FOREIGN KEY (`id_nivel`) REFERENCES `nivel` (`id_nivel`),
  CONSTRAINT `fk_empleados_zona` FOREIGN KEY (`id_zona`) REFERENCES `zona` (`id_zona`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `empleados`
--

LOCK TABLES `empleados` WRITE;
/*!40000 ALTER TABLE `empleados` DISABLE KEYS */;
INSERT INTO `empleados` VALUES (1,'Lucas','Alejandro','Gomez','Fernandez','11223344','20987654321','M','Calle San Martin','123','3','A',1001,'NORTE','lucas@gmail.com','1996-11-29','2023-01-15','Líder',15,107,1,3,32,4041,'200'),(2,'Valeria','NULL','Rodriguez','Lopez','22334455','30987654322','F','Av. Libertador','567','5','B',2002,'CORDOBA','valeria@hotmail.com','1996-11-30','2023-02-20','Team Player',10,107,1,2,30,1914,'200'),(3,'Diego','Manuel','Fernandez','Martinez','33445566','40987654323','M','Calle Mayo','890','7','C',3003,'SUR','diego@yahoo.com','1996-12-01','2023-03-10','Líder',22,114,2,4,14,3053,'300'),(4,'Carla','Julieta','Perez','Sanchez','44556677','50987654324','F','Calle Rivadavia','123','9','D',4004,'OESTE','carla@gmail.com','1996-12-02','2023-04-05','Líder',7,101,1,5,37,5224,'100'),(5,'Juan','Pablo','Lopez','Gutierrez','55667788','60987654325','M','Av. Corrientes','456','11','E',5005,'OESTE','juan@hotmail.com','1996-12-03','2023-05-15','Team Player',17,105,1,5,15,2226,'300'),(6,'Mariana','NULL','Alvarez','Diaz','66778899','70987654326','F','Av. Belgrano','789','13','F',6006,'CORDOBA','mariana@yahoo.com','1996-12-04','2023-06-20','Team Player',17,108,2,2,3,181,'300'),(7,'Roberto','Carlos','Sanchez','Perez','77889900','80987654327','M','Calle Jujuy','1011','15','G',7007,'SUR','roberto@gmail.com','1996-12-05','2023-07-10','Team Player',20,106,1,4,3,2379,'300'),(8,'Laura','NULL','Martinez','Fernandez','88990011','90987654328','F','Av. San Juan','1213','17','H',8008,'CORDOBA','laura@hotmail.com','1991-12-06','2023-08-05','Team Player',1,109,2,2,4,1543,'100'),(9,'Marcos','Javier','Gonzalez','Gomez','99001122','10098800','M','Calle Entre Rios','1415','19','I',9009,'CABA','marcos@yahoo.com','1991-12-06','2023-09-15','Team Player',20,101,1,1,15,1174,'300'),(10,'Romina','NULL','Lopez','Martinez','11223344','11098800','F','Av. Colon','1617','21','J',10010,'OESTE','romina@gmail.com','1991-12-08','2023-10-20','Team Player',5,113,2,5,35,1344,'100'),(11,'Lucas','Ezequiel','Fernandez','Garcia','22334455','12098800','M','Calle Uruguay','1819','23','K',11011,'NORTE','lucas@yahoo.com','1991-12-09','2023-11-10','Team Player',20,110,3,3,15,2331,'300'),(12,'Ana','NULL','Sanchez','Lopez','33445566','13098800','F','Av. Pellegrini','2021','25','L',12012,'OESTE','ana@hotmail.com','1991-12-10','2023-12-05','Team Player',11,103,1,5,21,1068,'200'),(13,'Ezequiel','Gonzalo','Martinez','Perez','44556677','14098800','M','Calle Laprida','2223','27','M',13013,'REMOTO','ezequiel@gmail.com','1996-12-11','2024-01-15','Team Player',13,102,3,99,30,2336,'200'),(14,'Carolina','NULL','Lopez','Fernandez','55667788','15098800','F','Av. San Martin','2425','29','N',14014,'CABA','carolina@yahoo.com','1996-12-12','2024-02-20','C Level',24,108,3,1,14,4540,'300'),(15,'Facundo','Martin','Gomez','Diaz','66778899','16098800','M','Calle Rivadavia','2627','31','O',15015,'NORTE','facundo@hotmail.com','1996-12-13','2024-03-10','Líder',22,107,1,3,14,3808,'300'),(16,'Agustina','NULL','Perez','Martinez','77889900','17098800','F','Av. Libertador','2829','33','P',16016,'NORTE','agustina1@gmail.com','1966-12-14','2024-04-05','Team Player',19,102,1,3,22,259,'300'),(17,'Leonardo','Nicolas','Martinez','Gomez','88990011','18098800','M','Calle San Martin','3031','35','Q',17017,'CABA','leonardo@yahoo.com','1996-12-15','2024-05-15','Team Player',1,105,3,1,35,2341,'100'),(18,'Camila','Florencia','Garcia','Alvarez','99001122','19098800','F','Calle Mayo','3233','37','R',18018,'CABA','camila@hotmail.com','1976-12-16','2024-06-20','Líder',14,112,1,1,32,2755,'200'),(19,'Gonzalo','NULL','Rodriguez','Sanchez','11223344','20098800','M','Av. Corrientes','3435','39','S',19019,'REMOTO','gonzalo@gmail.com','1996-12-17','2024-07-10','Team Player',9,102,1,99,18,2566,'200'),(20,'Abril','NULL','Fernandez','Martinez','22334455','21098800','F','Av. Rivadavia','3637','41','T',20020,'CABA','abril@yahoo.com','1996-12-18','2024-08-05','Team Player',10,108,3,1,18,1833,'200'),(21,'Santiago','Matias','Perez','Lopez','33445566','22098800','M','Calle Uruguay','3840','43','U',21021,'REMOTO','santiago@hotmail.com','1996-12-19','2024-09-15','Líder',15,105,1,99,32,2880,'200'),(22,'Valentina','NULL','Martinez','Gutierrez','44556677','23098800','F','Av. Libertador','4041','45','V',22022,'NORTE','valentina@gmail.com','1986-12-20','2024-10-20','Líder',22,105,3,3,14,3943,'300'),(23,'Lautaro','Agustin','Gomez','Fernandez','55667788','24098800','M','Calle San Martin','4243','47','W',23023,'REMOTO','lautaro@yahoo.com','1996-12-21','2024-11-10','Team Player',10,109,3,99,38,1709,'200'),(24,'Lara','NULL','Rodriguez','Sanchez','66778899','25098800','F','Calle Mayo','4445','49','X',24024,'SUR','lara@hotmail.com','1996-12-22','2024-12-05','Team Player',11,106,1,4,1,2271,'200'),(25,'Joaquin','Maximiliano','Fernandez','Gomez','77889900','26098800','M','Av. Corrientes','4647','51','Y',25025,'NORTE','joaquin@gmail.com','1996-12-23','2025-01-15','Team Player',9,108,1,3,1,2142,'200'),(26,'Jimena','NULL','Martinez','Lopez','88990011','27098800','F','Av. San Juan','4849','53','Z',26026,'SUR','jimena@yahoo.com','1986-12-24','2012-02-20','Team Player',11,114,2,4,30,1146,'200'),(27,'Matias','Lucas','Gonzalez','Fernandez','99001122','28098800','M','Calle Uruguay','5051','55','AA',27027,'SUR','matias@hotmail.com','1996-12-25','2025-03-10','Team Player',10,102,1,4,21,1877,'200'),(28,'Agustina','NULL','Perez','Martinez','11223344','29098800','F','Av. Libertador','5253','57','BB',28028,'OESTE','agustina@gmail.com','1996-12-26','2010-04-05','Team Player',20,102,2,5,22,2508,'300'),(29,'Gaston','NULL','Martinez','Gomez','22334455','30098800','M','Calle San Martin','5455','59','CC',29029,'OESTE','gaston1@yahoo.com','1996-12-27','2015-05-15','Team Player',9,103,1,5,38,356,'200'),(30,'Camila','Julieta','Gomez','Sanchez','33445566','31098800','F','Calle Mayo','5657','61','DD',30030,'OESTE','camila1@hotmail.com','1996-12-28','2012-06-20','Líder',15,113,2,5,32,3699,'200'),(31,'Luciano','NULL','Sanchez','Fernandez','44556677','32098800','M','Av. Corrientes','5859','63','EE',31031,'OESTE','luciano1@hotmail.com','1996-12-29','2022-07-10','Líder',7,106,1,5,37,3557,'100'),(32,'Catalina','NULL','Lopez','Garcia','55667788','33098800','F','Av. San Juan','6061','65','FF',32032,'OESTE','catalina1@yahoo.com','1996-12-30','2014-08-05','C Level',16,110,2,5,14,4638,'200'),(33,'Nicolas','Miguel','Garcia','Martinez','66778899','34098800','M','Calle Uruguay','6263','67','GG',33033,'SUR','nicolas2@gmail.com','1980-03-06','2014-09-15','Team Player',21,111,1,4,3,289,'300'),(34,'Sofia','NULL','Martinez','Perez','77889900','35098800','F','Av. Libertador','6465','69','HH',34034,'REMOTO','sofia3@hotmail.com','1967-01-01','2025-10-20','Team Player',13,102,1,99,21,1261,'200'),(35,'Facundo','Tomas','Gomez','Lopez','88990011','0','M','Calle San Martin','6667','71','II',35035,'CABA','facundo3@yahoo.com','2003-01-02','2012-11-10','Líder',6,113,1,1,37,5431,'100'),(36,'Abril','NULL','Perez','Martinez','99001122','37098800','F','Calle Mayo','6869','73','JJ',36036,'SUR','abril3@hotmail.com','1997-01-03','2012-12-05','Team Player',3,101,3,4,4,2158,'100'),(37,'Lautaro','Ignacio','Fernandez','Gonzalez','11223344','38098800','M','Av. Corrientes','7071','75','KK',37037,'REMOTO','lautaro3@gmail.com','1958-01-04','2020-01-15','C Level',8,107,1,99,14,9372,'100'),(38,'Lara','NULL','Rodriguez','Sanchez','22334455','39098800','F','Av. San Juan','7273','77','LL',38038,'NORTE','lara3@yahoo.com','1967-01-05','2018-02-20','Líder',14,114,3,3,32,2722,'200'),(39,'Joaquin','Nicolas','Fernandez','Martinez','33445566','40098800','M','Calle Uruguay','7475','79','MM',39039,'CORDOBA','joaquin3@hotmail.com','1980-01-06','2015-03-10','Team Player',2,101,1,2,31,1437,'100');
/*!40000 ALTER TABLE `empleados` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `afterempleadoinsert` AFTER INSERT ON `empleados` FOR EACH ROW INSERT INTO fichero (id_empleado, fecha_hora_ingreso)
    VALUES (NEW.id_empleado, NOW()) */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `afterempleadoupdate` AFTER UPDATE ON `empleados` FOR EACH ROW BEGIN
    IF OLD.sueldo <> NEW.sueldo THEN
        INSERT INTO ajustes (id_empleado, fecha_de_ajuste, observaciones, monto_usd)
        VALUES (NEW.id_empleado, CURDATE(), 'Ajuste de sueldo', NEW.sueldo);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `beforeempleadodelete` BEFORE DELETE ON `empleados` FOR EACH ROW BEGIN
    INSERT INTO rotacion (id_empleado, fecha_de_baja)
    VALUES (OLD.id_empleado, CURDATE());
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Temporary view structure for view `empleados_de_caba`
--

DROP TABLE IF EXISTS `empleados_de_caba`;
/*!50001 DROP VIEW IF EXISTS `empleados_de_caba`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleados_de_caba` AS SELECT 
 1 AS `ID_EMPLEADO`,
 1 AS `PRIMER_NOMBRE`,
 1 AS `PRIMER_APELLIDO`,
 1 AS `ID_NIVEL`,
 1 AS `DESC_PUESTO`*/;
SET character_set_client = @saved_cs_client;

--
-- Temporary view structure for view `empleados_por_area_y_evaluacion`
--

DROP TABLE IF EXISTS `empleados_por_area_y_evaluacion`;
/*!50001 DROP VIEW IF EXISTS `empleados_por_area_y_evaluacion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleados_por_area_y_evaluacion` AS SELECT 
 1 AS `ID_EMPLEADO`,
 1 AS `PRIMER_NOMBRE`,
 1 AS `PRIMER_APELLIDO`,
 1 AS `DESC_AREA`,
 1 AS `EVALUADOR`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `evaluacion`
--

DROP TABLE IF EXISTS `evaluacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `evaluacion` (
  `id_eval` int NOT NULL,
  `fecha_eval` date NOT NULL,
  `resultado_evaluacion` int NOT NULL,
  `id_empleado` int NOT NULL,
  `evaluado_por` int NOT NULL,
  PRIMARY KEY (`id_eval`,`id_empleado`,`fecha_eval`),
  KEY `fk_evaluacion_empleados` (`id_empleado`),
  CONSTRAINT `fk_evaluacion_empleados` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evaluacion`
--

LOCK TABLES `evaluacion` WRITE;
/*!40000 ALTER TABLE `evaluacion` DISABLE KEYS */;
INSERT INTO `evaluacion` VALUES (1,'2026-03-15',1,4,37),(2,'2026-04-20',1,9,15),(3,'2026-05-25',1,20,18),(4,'2026-06-30',1,25,1),(5,'2026-07-15',1,31,37),(6,'2026-08-20',5,10,35),(7,'2026-09-25',5,15,14),(8,'2026-10-30',5,23,38),(9,'2026-11-15',5,29,38),(10,'2026-12-20',5,24,1),(11,'2027-01-25',5,34,21),(12,'2027-02-20',5,8,4),(13,'2027-03-15',5,28,22),(25,'2026-03-15',2,4,37),(26,'2026-04-20',2,9,15),(27,'2026-05-25',2,20,18),(28,'2026-06-30',2,25,1),(29,'2026-07-15',2,31,37),(30,'2025-06-20',2,4,37);
/*!40000 ALTER TABLE `evaluacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fichero`
--

DROP TABLE IF EXISTS `fichero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fichero` (
  `id_fichero` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int DEFAULT NULL,
  `fecha_hora_ingreso` datetime DEFAULT NULL,
  `fecha_hora_egreso` datetime DEFAULT NULL,
  PRIMARY KEY (`id_fichero`),
  KEY `fk_fichero_empleados` (`id_empleado`),
  CONSTRAINT `fk_fichero_empleados` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fichero`
--

LOCK TABLES `fichero` WRITE;
/*!40000 ALTER TABLE `fichero` DISABLE KEYS */;
INSERT INTO `fichero` VALUES (1,14,'2020-09-25 13:00:00','2020-09-25 17:00:00'),(2,18,'2020-10-25 13:00:00','2020-10-25 17:00:00'),(3,35,'2020-11-25 13:00:00','2020-11-25 17:00:00'),(4,9,'2020-12-25 13:00:00','2020-12-25 17:00:00'),(5,20,'2021-01-25 13:00:00','2021-01-25 17:00:00'),(6,17,'2021-02-25 13:00:00','2021-02-25 17:00:00'),(7,6,'2021-03-25 13:00:00','2021-03-25 17:00:00'),(8,8,'2021-04-25 13:00:00','2021-04-25 17:00:00'),(9,2,'2021-05-25 13:00:00','2021-05-25 17:00:00'),(10,39,'2021-06-25 13:00:00','2021-06-25 17:00:00'),(11,15,'2021-07-25 13:00:00','2021-07-25 17:00:00'),(12,22,'2021-08-25 13:00:00','2021-08-25 17:00:00'),(13,1,'2021-09-25 13:00:00','2021-09-25 17:00:00'),(14,38,'2021-10-25 13:00:00','2021-10-25 17:00:00'),(15,25,'2021-11-25 13:00:00','2021-11-25 17:00:00'),(16,11,'2021-12-25 13:00:00','2021-12-25 17:00:00'),(17,16,'2022-01-25 13:00:00','2022-01-25 17:00:00'),(18,3,'2022-02-25 13:00:00','2022-02-25 17:00:00'),(19,24,'2022-03-25 13:00:00','2022-03-25 17:00:00');
/*!40000 ALTER TABLE `fichero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `inactivos`
--

DROP TABLE IF EXISTS `inactivos`;
/*!50001 DROP VIEW IF EXISTS `inactivos`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `inactivos` AS SELECT 
 1 AS `ID_EMPLEADO`,
 1 AS `PRIMER_NOMBRE`,
 1 AS `PRIMER_APELLIDO`,
 1 AS `FECHA_DE_BAJA`,
 1 AS `ID_BAJA`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `nivel`
--

DROP TABLE IF EXISTS `nivel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nivel` (
  `id_nivel` int NOT NULL,
  `banda` int NOT NULL,
  `desc_puesto` varchar(50) DEFAULT NULL,
  `minima` double NOT NULL,
  `maxima` double NOT NULL,
  PRIMARY KEY (`id_nivel`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nivel`
--

LOCK TABLES `nivel` WRITE;
/*!40000 ALTER TABLE `nivel` DISABLE KEYS */;
INSERT INTO `nivel` VALUES (1,100,'trainee',400,900),(2,100,'junior',800,1300),(3,100,'semisenior',1200,2000),(4,100,'senior',1900,2700),(5,100,'specialist',2900,3500),(6,100,'tl',2400,4400),(7,100,'vice president',4300,7000),(8,100,'c level',6500,10000),(9,200,'trainee',100,400),(10,200,'junior',350,900),(11,200,'semisenior',800,1300),(12,200,'senior',1200,2000),(13,200,'specialist',2000,2700),(14,200,'tl',2600,3500),(15,200,'vice president',3400,4400),(16,200,'c level',4300,7000),(17,300,'trainee',100,400),(18,300,'junior',350,900),(19,300,'semisenior',850,1300),(20,300,'senior',1200,2000),(21,300,'specialist',1900,2700),(22,300,'tl',2900,3500),(23,300,'vice president',3400,4400),(24,300,'c level',4200,7000);
/*!40000 ALTER TABLE `nivel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rotacion`
--

DROP TABLE IF EXISTS `rotacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rotacion` (
  `id_baja` int NOT NULL AUTO_INCREMENT,
  `id_empleado` int DEFAULT NULL,
  `fecha_de_baja` date DEFAULT NULL,
  PRIMARY KEY (`id_baja`),
  KEY `fk_rotacion_empleados` (`id_empleado`),
  CONSTRAINT `fk_rotacion_empleados` FOREIGN KEY (`id_empleado`) REFERENCES `empleados` (`id_empleado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rotacion`
--

LOCK TABLES `rotacion` WRITE;
/*!40000 ALTER TABLE `rotacion` DISABLE KEYS */;
INSERT INTO `rotacion` VALUES (1,4,'2026-03-15'),(2,9,'2026-04-20'),(3,20,'2026-05-25'),(4,25,'2026-06-30'),(5,31,'2026-07-15');
/*!40000 ALTER TABLE `rotacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vista_empleados_completa`
--

DROP TABLE IF EXISTS `vista_empleados_completa`;
/*!50001 DROP VIEW IF EXISTS `vista_empleados_completa`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vista_empleados_completa` AS SELECT 
 1 AS `id_empleado`,
 1 AS `primer_nombre`,
 1 AS `segundo_nombre`,
 1 AS `primer_apellido`,
 1 AS `segundo_apellido`,
 1 AS `dni`,
 1 AS `cuil`,
 1 AS `genero`,
 1 AS `calle`,
 1 AS `numeracion`,
 1 AS `piso`,
 1 AS `departamento`,
 1 AS `codigo_postal`,
 1 AS `ciudad`,
 1 AS `email`,
 1 AS `fecha_de_nacimiento`,
 1 AS `fecha_alta`,
 1 AS `tipo_de_empleados`,
 1 AS `sueldo`,
 1 AS `banda`,
 1 AS `desc_area`,
 1 AS `desc_contrato`,
 1 AS `desc_puesto`,
 1 AS `desc_zona`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `zona`
--

DROP TABLE IF EXISTS `zona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zona` (
  `id_zona` int NOT NULL,
  `desc_zona` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_zona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zona`
--

LOCK TABLES `zona` WRITE;
/*!40000 ALTER TABLE `zona` DISABLE KEYS */;
INSERT INTO `zona` VALUES (1,'CABA'),(2,'CORDOBA'),(3,'NORTE'),(4,'SUR'),(5,'OESTE'),(99,'REMOTO');
/*!40000 ALTER TABLE `zona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'rrhh_umami'
--

--
-- Dumping routines for database 'rrhh_umami'
--
/*!50003 DROP FUNCTION IF EXISTS `monto_teletrabajo` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `monto_teletrabajo`(m_id INT,m_teletrabajo FLOAT) RETURNS float
    READS SQL DATA
BEGIN
DECLARE monto_teletrabajo FLOAT;
		select monto_usd / m_teletrabajo INTO monto_teletrabajo
        from ajustes
        where id_empleado = m_id;
        RETURN monto_teletrabajo;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP FUNCTION IF EXISTS `premio_desempenio` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` FUNCTION `premio_desempenio`(p_id INT,p_premio FLOAT) RETURNS float
    READS SQL DATA
BEGIN
DECLARE premio_desempenio FLOAT;
		select monto_usd * p_premio INTO premio_desempenio
        from ajustes
        where id_empleado = p_id;
        RETURN premio_desempenio;
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `registrarevaluacion` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `registrarevaluacion`(
    IN p_id_empleado INT,
    IN p_fecha_eval DATE,
    IN p_resultado_evaluacion INT,
    IN p_evaluado_por INT
)
BEGIN
    INSERT INTO evaluacion (id_eval, fecha_eval, resultado_evaluacion, id_empleado, evaluado_por)
    VALUES (NULL, p_fecha_eval, p_resultado_evaluacion, p_id_empleado, p_evaluado_por);
END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `sp_actualizacion_sueldos` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
CREATE DEFINER=`root`@`localhost` PROCEDURE `sp_actualizacion_sueldos`(IN inflacion_ars DOUBLE, IN bono_usd DOUBLE)
BEGIN
        -- Seleccione los resultados de ambas consultas
    SELECT e.primer_nombre, 
           e.primer_apellido, 
           s_ars.monto_ARS, 
           (s_ars.monto_ARS * inflacion_ars) AS "Ajuste de inflación Q1",
           s_usd.monto_usd, 
           (s_usd.monto_usd * bono_usd) AS "Bono precarización USD"
    FROM empleados AS e
    left JOIN -- encontrar lo que necesitás, no hace un select y lo plasma, solo lo busca.
    (SELECT id_empleado, monto_ARS
        FROM ajustes
        WHERE monto_usd < 2000 AND fecha_de_ajuste LIKE '2023-01-01') AS s_ars 
        ON e.id_empleado = s_ars.id_empleado
    left JOIN (SELECT id_empleado, monto_usd 
        FROM ajustes 
        WHERE monto_usd > 2000 AND fecha_de_ajuste LIKE '2023-01-01'
    ) AS s_usd ON e.id_empleado = s_usd.id_empleado;

END ;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Final view structure for view `bajas_ano`
--

/*!50001 DROP VIEW IF EXISTS `bajas_ano`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `bajas_ano` AS select `e`.`id_empleado` AS `ID_EMPLEADO`,(to_days(`r`.`fecha_de_baja`) - to_days(`e`.`fecha_alta`)) AS `DIAS_DE_DIFERENCIA` from (`empleados` `e` join `rotacion` `r` on((`e`.`id_empleado` = `r`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleados_de_caba`
--

/*!50001 DROP VIEW IF EXISTS `empleados_de_caba`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleados_de_caba` AS select `e`.`id_empleado` AS `ID_EMPLEADO`,`e`.`primer_nombre` AS `PRIMER_NOMBRE`,`e`.`primer_apellido` AS `PRIMER_APELLIDO`,`e`.`id_nivel` AS `ID_NIVEL`,`n`.`DESC_PUESTO` AS `DESC_PUESTO` from ((`empleados` `e` join `umami`.`zona` `z` on((`e`.`id_zona` = `z`.`ID_ZONA`))) join `umami`.`nivel` `n` on((`e`.`id_nivel` = `n`.`ID_NIVEL`))) where (`z`.`DESC_ZONA` = 'CABA') */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `empleados_por_area_y_evaluacion`
--

/*!50001 DROP VIEW IF EXISTS `empleados_por_area_y_evaluacion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleados_por_area_y_evaluacion` AS select `e`.`ID_EMPLEADO` AS `ID_EMPLEADO`,`e`.`PRIMER_NOMBRE` AS `PRIMER_NOMBRE`,`e`.`PRIMER_APELLIDO` AS `PRIMER_APELLIDO`,`a`.`DESC_AREA` AS `DESC_AREA`,`ev`.`evaluado_por` AS `EVALUADOR` from ((`umami`.`empleados` `e` join `umami`.`area` `a` on((`e`.`ID_AREA` = `a`.`ID_AREA`))) join `evaluacion` `ev` on((`e`.`ID_EMPLEADO` = `ev`.`id_empleado`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `inactivos`
--

/*!50001 DROP VIEW IF EXISTS `inactivos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `inactivos` AS select `e`.`id_empleado` AS `ID_EMPLEADO`,`e`.`primer_nombre` AS `PRIMER_NOMBRE`,`e`.`primer_apellido` AS `PRIMER_APELLIDO`,`r`.`FECHA_DE_BAJA` AS `FECHA_DE_BAJA`,`r`.`ID_BAJA` AS `ID_BAJA` from (`empleados` `e` join `umami`.`rotacion` `r` on((`e`.`id_empleado` = `r`.`ID_EMPLEADO`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_empleados_completa`
--

/*!50001 DROP VIEW IF EXISTS `vista_empleados_completa`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_empleados_completa` AS select `e`.`id_empleado` AS `id_empleado`,`e`.`primer_nombre` AS `primer_nombre`,`e`.`segundo_nombre` AS `segundo_nombre`,`e`.`primer_apellido` AS `primer_apellido`,`e`.`segundo_apellido` AS `segundo_apellido`,`e`.`dni` AS `dni`,`e`.`cuil` AS `cuil`,`e`.`genero` AS `genero`,`e`.`calle` AS `calle`,`e`.`numeracion` AS `numeracion`,`e`.`piso` AS `piso`,`e`.`departamento` AS `departamento`,`e`.`codigo_postal` AS `codigo_postal`,`e`.`ciudad` AS `ciudad`,`e`.`email` AS `email`,`e`.`fecha_de_nacimiento` AS `fecha_de_nacimiento`,`e`.`fecha_alta` AS `fecha_alta`,`e`.`tipo_de_empleados` AS `tipo_de_empleados`,`e`.`sueldo` AS `sueldo`,`e`.`banda` AS `banda`,`a`.`desc_area` AS `desc_area`,`c`.`desc_contrato` AS `desc_contrato`,`n`.`desc_puesto` AS `desc_puesto`,`z`.`desc_zona` AS `desc_zona` from ((((`empleados` `e` join `area` `a` on((`e`.`id_area` = `a`.`id_area`))) join `contrato` `c` on((`e`.`id_contrato` = `c`.`id_contrato`))) join `nivel` `n` on((`e`.`id_nivel` = `n`.`id_nivel`))) join `zona` `z` on((`e`.`id_zona` = `z`.`id_zona`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-05-28  0:39:11
