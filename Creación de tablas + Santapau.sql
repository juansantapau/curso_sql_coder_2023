
CREATE TABLE `asistencia` (
  `id_asistencia` int NOT NULL AUTO_INCREMENT,
  `id_proceso` varchar(25) DEFAULT NULL,
  `fecha_vig` date DEFAULT NULL,
  `id_operario` int DEFAULT NULL,
  PRIMARY KEY (`id_asistencia`),
  KEY `id_operario` (`id_operario`),
  CONSTRAINT `asistencia_ibfk_1` FOREIGN KEY (`id_operario`) REFERENCES `nomina` (`id_operario`)
  )

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
  )

CREATE TABLE `nomina` (
  `id_operario` int NOT NULL,
  `nombre` varchar(25) DEFAULT NULL,
  `apellido` varchar(25) DEFAULT NULL,
  `CUIL` bigint DEFAULT NULL,
  `direccion_residencia` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id_operario`)
) 

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
)

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
)
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
);

CREATE TABLE proveedores (
    id_proveedor INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15)
);

CREATE TABLE clientes (
    id_cliente INT PRIMARY KEY,
    nombre VARCHAR(255),
    direccion VARCHAR(255),
    telefono VARCHAR(15),
    email VARCHAR(255)
);

