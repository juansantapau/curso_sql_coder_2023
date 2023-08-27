-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: proyectofinal
-- ------------------------------------------------------
-- Server version	8.0.33

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
-- Table structure for table `asistencia`
--

DROP TABLE IF EXISTS `asistencia`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asistencia` (
  `id_asistencia` int NOT NULL AUTO_INCREMENT,
  `id_proceso` varchar(25) DEFAULT NULL,
  `fecha_vig` date DEFAULT NULL,
  `id_operario` int DEFAULT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_operario` (`id_operario`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`id_operario`) REFERENCES `nomina` (`id_operario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asistencia`
--

LOCK TABLES `asistencia` WRITE;
/*!40000 ALTER TABLE `asistencia` DISABLE KEYS */;
/*!40000 ALTER TABLE `asistencia` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `empleados`
--

DROP TABLE IF EXISTS `empleados`;
/*!50001 DROP VIEW IF EXISTS `empleados`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `empleados` AS SELECT 
 1 AS `nombre`,
 1 AS `apellido`,
 1 AS `id_operario`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `materiaprima`
--

DROP TABLE IF EXISTS `materiaprima`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `materiaprima` (
  `id_mp` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `empaque` varchar(25) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `lote` int DEFAULT NULL,
  `fecha_compra` date DEFAULT NULL,
  `precio_kg` decimal(10,0) DEFAULT NULL,
  `kg_comprados` int DEFAULT NULL,
  `proveedor` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_mp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `materiaprima`
--

LOCK TABLES `materiaprima` WRITE;
/*!40000 ALTER TABLE `materiaprima` DISABLE KEYS */;
/*!40000 ALTER TABLE `materiaprima` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `nomina`
--

DROP TABLE IF EXISTS `nomina`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `nomina` (
  `id_operario` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(25) DEFAULT NULL,
  `CUIL` bigint DEFAULT NULL,
  `direccion_residencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_operario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `nomina`
--

LOCK TABLES `nomina` WRITE;
/*!40000 ALTER TABLE `nomina` DISABLE KEYS */;
INSERT INTO `nomina` VALUES (1,'Pedro','Rodriguez',2038658236,'Lopez y planes'),(2,'Luis','Rodriguez',20386582367,'Lopez y planes'),(3,'Santiago','Martinez',2039687458,'Mitre'),(4,'Matias','Dominguez',2039687452,'Marcos A Zar'),(5,'Juan','Santapau',2039658234,'Love Parry');
/*!40000 ALTER TABLE `nomina` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proceso`
--

DROP TABLE IF EXISTS `proceso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proceso` (
  `id_proceso` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `envase` varchar(25) DEFAULT NULL,
  `cantidad_prod` int DEFAULT NULL,
  `id_operario` int DEFAULT NULL,
  `fechavig` date DEFAULT NULL,
  PRIMARY KEY (`id_proceso`),
  KEY `id_operario` (`id_operario`),
  CONSTRAINT `proceso_ibfk_1` FOREIGN KEY (`id_operario`) REFERENCES `nomina` (`id_operario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proceso`
--

LOCK TABLES `proceso` WRITE;
/*!40000 ALTER TABLE `proceso` DISABLE KEYS */;
INSERT INTO `proceso` VALUES (1,'LGLSP','Bacha',10,1,'2010-06-23'),(2,'LGLGSH','Bacha',10,2,'2023-05-28'),(3,'LGLGSH','Cajas',10,2,'2023-06-28'),(4,'LGNP','Cajas',10,3,'2023-07-28');
/*!40000 ALTER TABLE `proceso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `id_producto` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `envaseprod` varchar(25) DEFAULT NULL,
  `cantidad` int DEFAULT NULL,
  `id_proceso` int DEFAULT NULL,
  `fechavig` date DEFAULT NULL,
  PRIMARY KEY (`id_producto`),
  KEY `id_proceso` (`id_proceso`),
  CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`id_proceso`) REFERENCES `proceso` (`id_proceso`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (1,'Langostino Premium','Caja',50,3,'2023-07-25'),(2,'Langostino Low','Master',100,1,'2023-06-25'),(3,'Langostino Medium','Master',100,4,'2023-06-25');
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ventas`
--

DROP TABLE IF EXISTS `ventas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ventas` (
  `id_venta` int NOT NULL AUTO_INCREMENT,
  `id_mp` int DEFAULT NULL,
  `id_producto` int DEFAULT NULL,
  `fecha_venta` date DEFAULT NULL,
  `cantidad_vendida` int DEFAULT NULL,
  `fecha_fact` date DEFAULT NULL,
  `fecha_cobr` date DEFAULT NULL,
  PRIMARY KEY (`id_venta`),
  KEY `id_mp` (`id_mp`),
  KEY `id_producto` (`id_producto`),
  CONSTRAINT `ventas_ibfk_1` FOREIGN KEY (`id_mp`) REFERENCES `materiaprima` (`id_mp`),
  CONSTRAINT `ventas_ibfk_2` FOREIGN KEY (`id_producto`) REFERENCES `producto` (`id_producto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ventas`
--

LOCK TABLES `ventas` WRITE;
/*!40000 ALTER TABLE `ventas` DISABLE KEYS */;
/*!40000 ALTER TABLE `ventas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `vistaproduccion`
--

DROP TABLE IF EXISTS `vistaproduccion`;
/*!50001 DROP VIEW IF EXISTS `vistaproduccion`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `vistaproduccion` AS SELECT 
 1 AS `apellido`,
 1 AS `cantidad_prod`,
 1 AS `nombre`,
 1 AS `id_proceso`,
 1 AS `fechavig`*/;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `empleados`
--

/*!50001 DROP VIEW IF EXISTS `empleados`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `empleados` AS select `nomina`.`nombre` AS `nombre`,`nomina`.`apellido` AS `apellido`,`nomina`.`id_operario` AS `id_operario` from `nomina` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vistaproduccion`
--

/*!50001 DROP VIEW IF EXISTS `vistaproduccion`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vistaproduccion` AS select `nomina`.`apellido` AS `apellido`,`proceso`.`cantidad_prod` AS `cantidad_prod`,`proceso`.`nombre` AS `nombre`,`proceso`.`id_proceso` AS `id_proceso`,`proceso`.`fechavig` AS `fechavig` from (`nomina` join `proceso` on((`nomina`.`id_operario` = `proceso`.`id_operario`))) */;
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

-- Dump completed on 2023-07-22 16:14:29
