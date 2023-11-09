-- Active: 1698431672264@@localhost@3306@db_fullmarket_dump
-- MariaDB dump 10.19  Distrib 10.4.24-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_fullmarket_dump
-- ------------------------------------------------------
-- Server version	10.4.24-MariaDB

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
-- Table structure for table `categoria`
--

create database db_fullmarket_dump;
use db_fullmarket_dump;

DROP TABLE IF EXISTS `categoria`;

CREATE TABLE `categoria` (
  `idCategoria` int(11) NOT NULL AUTO_INCREMENT,
  `nombre` varchar(50) NOT NULL,
  `descripción` varchar(50) NOT NULL,
  PRIMARY KEY (`idCategoria`),
  UNIQUE KEY `unic_nombre` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `categoria` WRITE;

INSERT INTO `categoria` VALUES (1,'Abarrotes','Conservantes'),
(2,'Lácteos','Productos elaborados con leche de vaca o de cabra'),
(3,'Frutas y verduras','Partes comestibles de las plantas'),
(4,'Confitería','Dulces'),
(5,'Bebidas','Líquidos'),
(6,'Pescados','Diversas especies'),
(7,'Empaquetados','Alimentos enlatados, papas fritas etc...'),
(8,'Alcohol','Bebidas alcoholicas'),(9,'nun','nnnnn');

UNLOCK TABLES;


DROP TABLE IF EXISTS `cliente`;


CREATE TABLE `cliente` (
  `idCliente` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(11) NOT NULL,
  `tipoDocumento` enum('CC','PAS','CE','PEP') DEFAULT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correo` varchar(100) DEFAULT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE KEY `unic_identificacion_cliente` (`identificacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4;


LOCK TABLES `cliente` WRITE;

INSERT INTO `cliente` VALUES (1,'1006098658','CC','Karol','Garcias','karol@gmail.com','Cr26O #108-80','315662410'),
(2,'1107038404','CC','Victor','Sanchez',NULL,'Cr29 #72-15','3043751795'),
(3,'1006052384','CC','Jostin','Velasco',NULL,'Cll63 #12Bis-74','3185841212'),
(4,'111363997','CC','Andres','Tafur',NULL,'Cll14A #50-68B','3173502627'),
(5,'1108639584','CC','Jason','Caicedo',NULL,'Cr26M #54-61','3185656661'),
(6,'1110292344','CC','Shary Natalia','Valencia Potorsí','sn@gmail.com','kr50 20 68','44444444'),
(7,'1231313','CC','Juan','Valencia','juan@gmail.com','cl 1676217','3214557');

UNLOCK TABLES;


DROP TABLE IF EXISTS `detallefactura`;

CREATE TABLE `detallefactura` (
  `idDetalleFactura` int(11) NOT NULL AUTO_INCREMENT,
  `valorUnitario` int(11) NOT NULL,
  `cantidad` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  `idFactura` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleFactura`),
  KEY `fk_idProducto` (`idProducto`),
  KEY `fk_idFactura` (`idFactura`),
  CONSTRAINT `fk_idFactura` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`),
  CONSTRAINT `fk_idProducto` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOCK TABLES `detallefactura` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `detalleordencompra`;


CREATE TABLE `detalleordencompra` (
  `idDetalleOrdenCompra` int(11) NOT NULL AUTO_INCREMENT,
  `cantidadCompra` int(10) NOT NULL,
  `valorUnitario` int(11) NOT NULL,
  `subtotal` int(11) NOT NULL,
  `idOrdenDeCompra` int(11) NOT NULL,
  `idProducto` int(11) NOT NULL,
  PRIMARY KEY (`idDetalleOrdenCompra`),
  KEY `fk_idOrdenDeCompra` (`idOrdenDeCompra`),
  KEY `fk_idProductoDetalle` (`idProducto`),
  CONSTRAINT `fk_idOrdenDeCompra` FOREIGN KEY (`idOrdenDeCompra`) REFERENCES `ordendecompra` (`idOrdenDeCompra`),
  CONSTRAINT `fk_idProductoDetalle` FOREIGN KEY (`idProducto`) REFERENCES `producto` (`idProducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOCK TABLES `detalleordencompra` WRITE;

UNLOCK TABLES;


DROP TABLE IF EXISTS `empleado`;

CREATE TABLE `empleado` (
  `idEmpleado` int(11) NOT NULL AUTO_INCREMENT,
  `identificacion` varchar(11) NOT NULL,
  `tipoDocumento` enum('CC','PAS','CE','PEP') DEFAULT NULL,
  `nombres` varchar(50) NOT NULL,
  `apellidos` varchar(50) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `clave` varchar(50) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `idFullMarket` int(11) NOT NULL,
  PRIMARY KEY (`idEmpleado`),
  UNIQUE KEY `unic_identificacion_empleado` (`identificacion`),
  UNIQUE KEY `unic_correo_empleado` (`idEmpleado`),
  KEY `fk_idFullmarket` (`idFullMarket`),
  CONSTRAINT `fk_idFullmarket` FOREIGN KEY (`idFullMarket`) REFERENCES `fullmarket` (`idFullMarket`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4;


LOCK TABLES `empleado` WRITE;

INSERT INTO `empleado` VALUES (1,'1006052865','CC','Juan José','Rodríguez García','juanJ456@gmail.com','juan65478','320 543126',1),
(2,'11060531231','PAS','Messi Andrés','Sánchez Pérez','SanchezLoMejor@hotmail.com','alerta3212','318 544231',1),
(3,'10081531531','CE','María José','Ricardo Martinez','RMMaria@hotmail.com','123maria45','318 543098',1),
(4,'14571533312','PEP','John','Cadenas Carvajal','JCcarvajal@gmail.com','Jhoncito123','300 543128',1),
(5,'10126533712','CC','Laura','González Jaramillo','GonzalezL@gmail.com','Laura456','302 987345',1);

UNLOCK TABLES;


DROP TABLE IF EXISTS `factura`;

CREATE TABLE `factura` (
  `idFactura` int(11) NOT NULL AUTO_INCREMENT,
  `codigoFactura` varchar(7) NOT NULL,
  `fecha` datetime NOT NULL,
  `iva` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idCliente` int(11) NOT NULL,
  PRIMARY KEY (`idFactura`),
  UNIQUE KEY `unic_codigoFactura` (`codigoFactura`),
  KEY `fk_idEmpleado` (`idEmpleado`),
  KEY `fk_idCliente` (`idCliente`),
  CONSTRAINT `fk_idCliente` FOREIGN KEY (`idCliente`) REFERENCES `cliente` (`idCliente`),
  CONSTRAINT `fk_idEmpleado` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOCK TABLES `factura` WRITE;

UNLOCK TABLES;



DROP TABLE IF EXISTS `fullmarket`;

CREATE TABLE `fullmarket` (
  `idFullMarket` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(14) NOT NULL,
  `razonSocial` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `direccionWeb` varchar(200) NOT NULL,
  PRIMARY KEY (`idFullMarket`),
  UNIQUE KEY `unic_nitFullMarket` (`nit`),
  UNIQUE KEY `unic_correoFullmarket` (`correo`),
  UNIQUE KEY `unic_razonSocialFullMarket` (`razonSocial`),
  UNIQUE KEY `unic_direccionWeb` (`direccionWeb`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4;

LOCK TABLES `fullmarket` WRITE;

INSERT INTO `fullmarket` VALUES (1,'123456789-12-1','Full_Market','Kr5 #10-23','3173502617','fullmarket@fullmarke23t.com','https//fullmarkexdt.com ');

UNLOCK TABLES;



DROP TABLE IF EXISTS `ordendecompra`;

CREATE TABLE `ordendecompra` (
  `idOrdenDeCompra` int(11) NOT NULL AUTO_INCREMENT,
  `numeroOrden` int(12) NOT NULL,
  `fechaOrden` datetime NOT NULL,
  `fechaEntrega` datetime NOT NULL,
  `iva` int(11) NOT NULL,
  `total` int(11) NOT NULL,
  `idEmpleado` int(11) NOT NULL,
  `idProveedor` int(11) NOT NULL,
  PRIMARY KEY (`idOrdenDeCompra`),
  UNIQUE KEY `unic_numeroOrden` (`numeroOrden`),
  KEY `fk_idEmpleadoOrden` (`idEmpleado`),
  KEY `fk_idProveedor` (`idProveedor`),
  CONSTRAINT `fk_idEmpleadoOrden` FOREIGN KEY (`idEmpleado`) REFERENCES `empleado` (`idEmpleado`),
  CONSTRAINT `fk_idProveedor` FOREIGN KEY (`idProveedor`) REFERENCES `proveedor` (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


LOCK TABLES `ordendecompra` WRITE;

UNLOCK TABLES;




DROP TABLE IF EXISTS `producto`;


CREATE TABLE `producto` (
  `idProducto` int(11) NOT NULL AUTO_INCREMENT,
  `codigoProducto` varchar(6) NOT NULL,
  `nombre` varchar(50) NOT NULL,
  `precio` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `stock` int(11) NOT NULL DEFAULT 0,
  `idCategoria` int(11) NOT NULL,
  PRIMARY KEY (`idProducto`),
  UNIQUE KEY `unic_codigoProducto` (`codigoProducto`),
  KEY `fk_idCategoria` (`idCategoria`),
  CONSTRAINT `fk_idCategoria` FOREIGN KEY (`idCategoria`) REFERENCES `categoria` (`idCategoria`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4;


LOCK TABLES `producto` WRITE;

INSERT INTO `producto` VALUES (1,'15792','cafe bemoka',5000,'cafe instantaneo marca bemoka',100,1),
(2,'28925','leche entera colanta',4200,'leche entera',100,2),
(3,'42331','naranjas',510,'naranjas frescas de campo',500,3),
(4,'71732','paquete de gomitas acidas',2500,'gomitas con relleno acido',30,4),
(5,'69270','pony malta litro',5000,'bebida gasificada con sabor malta',30,5);

UNLOCK TABLES;


DROP TABLE IF EXISTS `proveedor`;

CREATE TABLE `proveedor` (
  `idProveedor` int(11) NOT NULL AUTO_INCREMENT,
  `nit` varchar(14) NOT NULL,
  `razonSocial` varchar(100) NOT NULL,
  `direccion` varchar(100) NOT NULL,
  `telefono` varchar(10) NOT NULL,
  `correo` varchar(100) NOT NULL,
  `ciudad` varchar(50) NOT NULL,
  PRIMARY KEY (`idProveedor`),
  UNIQUE KEY `unic_nit_proveedor` (`nit`),
  UNIQUE KEY `unic_correo_proveedor` (`correo`),
  UNIQUE KEY `unic_razonSocial_proveedor` (`razonSocial`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4;


LOCK TABLES `proveedor` WRITE;
INSERT INTO `proveedor` VALUES (1,'890303461-2','Carnes frias planta 2','CL 5E CRA 36B','6106000','jefaturacontabilidadhuv@gmail.com','Cali'),(2,'805027337','Dulceria y botaneria niversal','Cll 72U Cra 28E ','3194015','redoriente@emcali.net.co','Cali'),(3,'3885533669','Frutas y verduras la estrella 2','122 Sage Trail','59-819-630','ahalson0@google.com.hk','Medellin'),(4,'6596021130','Bebidas industrial valle','065 Dapin Center','06-762-721','sdameisele1@mozilla.com','Cali'),(5,'4151719709','Colanta 456','528 Eggendart Road','48-275-301','ematteo2@pbs.org','Tulua'),(8,'1231313','Pescados ricos','cl56 7867','33322565','ricos@pescados.com.co','Buenaventura'),(9,'1254879-256','Alqueria','Cl15 17161','3256984714','alqueria@gmail.com.co','Medellin'),(10,'12254654','Trollys','Kr50592','3124659','trollys@gmail.com','Bogota');
UNLOCK TABLES;