

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


CREATE TABLE `nomina` (
  `id_operario` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(25) DEFAULT NULL,
  `CUIL` bigint DEFAULT NULL,
  `direccion_residencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_operario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

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




-- Dump completed on 2023-07-22 16:14:29
