CREATE DATABASE  IF NOT EXISTS `proyecto` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `proyecto`;
-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: proyecto
-- ------------------------------------------------------
-- Server version	8.0.21

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `nombreCliente` varchar(20) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `Telefono` int NOT NULL,
  `idClientes` int NOT NULL,
  PRIMARY KEY (`idClientes`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('Marco Fernandez','San Rafael',21213231,194305980),('Juan Perez','Alajuela Centro',11111111,312312312);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comision`
--

DROP TABLE IF EXISTS `comision`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `comision` (
  `idComision` int NOT NULL AUTO_INCREMENT,
  `idFactura` int NOT NULL,
  `total` double NOT NULL,
  `PorcentajeComison` double NOT NULL,
  `idUsuario` int NOT NULL,
  PRIMARY KEY (`idComision`),
  KEY `idFactura` (`idFactura`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `comision_ibfk_1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`),
  CONSTRAINT `comision_ibfk_2` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comision`
--

LOCK TABLES `comision` WRITE;
/*!40000 ALTER TABLE `comision` DISABLE KEYS */;
INSERT INTO `comision` VALUES (5,8,6000,12,20),(6,8,25000,50,20);
/*!40000 ALTER TABLE `comision` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `factura`
--

DROP TABLE IF EXISTS `factura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `factura` (
  `idFactura` int NOT NULL AUTO_INCREMENT,
  `idUsuario` int NOT NULL,
  `nombreCliente` varchar(30) NOT NULL,
  `Direccion` varchar(255) NOT NULL,
  `detalle` varchar(50) NOT NULL,
  `Total` double NOT NULL,
  PRIMARY KEY (`idFactura`),
  KEY `idUsuario` (`idUsuario`),
  CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `factura`
--

LOCK TABLES `factura` WRITE;
/*!40000 ALTER TABLE `factura` DISABLE KEYS */;
INSERT INTO `factura` VALUES (8,20,'Pablo Morales','Alajuela Centro, Alajuela','Cuatro costales de cemento',50000),(10,20,'Juan Ezquivel','Tibás','3 latas de pintura',30000);
/*!40000 ALTER TABLE `factura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `importaciones`
--

DROP TABLE IF EXISTS `importaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `importaciones` (
  `idImportaciones` int NOT NULL AUTO_INCREMENT,
  `idProveedor` int NOT NULL,
  `idProducto` int NOT NULL,
  `descripcion` varchar(100) NOT NULL,
  `fechaimportacion` date NOT NULL,
  `Cantidad` int NOT NULL,
  PRIMARY KEY (`idImportaciones`),
  KEY `idProveedor` (`idProveedor`),
  CONSTRAINT `importaciones_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `importaciones`
--

LOCK TABLES `importaciones` WRITE;
/*!40000 ALTER TABLE `importaciones` DISABLE KEYS */;
INSERT INTO `importaciones` VALUES (2,111,8,'ejemplo2','2020-12-13',1),(4,222,2,'dasasdas','2020-12-09',2);
/*!40000 ALTER TABLE `importaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `productos` (
  `idProducto` int NOT NULL AUTO_INCREMENT,
  `idProveedor` int NOT NULL,
  `nombreProducto` varchar(20) NOT NULL,
  `cantidad` int NOT NULL,
  PRIMARY KEY (`idProducto`),
  KEY `idProveedor` (`idProveedor`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`idProveedor`) REFERENCES `proveedores` (`idProveedor`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (2,222,'Martillos',385);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proforma`
--

DROP TABLE IF EXISTS `proforma`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proforma` (
  `idProforma` int NOT NULL AUTO_INCREMENT,
  `nombreCliente` varchar(20) NOT NULL,
  `Detalle` varchar(255) NOT NULL,
  `telefono` int NOT NULL,
  `fechaEmitida` date NOT NULL,
  `vigencia` varchar(20) NOT NULL,
  `AproximadoTotal` double NOT NULL,
  PRIMARY KEY (`idProforma`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proforma`
--

LOCK TABLES `proforma` WRITE;
/*!40000 ALTER TABLE `proforma` DISABLE KEYS */;
INSERT INTO `proforma` VALUES (1,'dsadas','asdasdsa',21312312,'2020-12-10','213312',32),(2,'dsadas','asdasdsa',21312312,'2020-12-10','213312',12312321),(3,'sadasdas','ddasdasd',12312331,'2020-12-15','asdsada',13123);
/*!40000 ALTER TABLE `proforma` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `proveedores` (
  `idProveedor` int NOT NULL,
  `nombreProvedor` varchar(20) NOT NULL,
  `detalle` varchar(100) NOT NULL,
  `telefono` int DEFAULT NULL,
  PRIMARY KEY (`idProveedor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (111,'Herramientas SA','Varias herramientas de construcción',65756756),(222,'Pinturas Lanco','Principal distribuidor de pinturas',12121212);
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `transporte`
--

DROP TABLE IF EXISTS `transporte`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `transporte` (
  `idTransporte` int NOT NULL AUTO_INCREMENT,
  `nombreT` varchar(20) NOT NULL,
  `idFactura` int NOT NULL,
  PRIMARY KEY (`idTransporte`),
  KEY `idFactura` (`idFactura`),
  CONSTRAINT `transporte_ibfk_1` FOREIGN KEY (`idFactura`) REFERENCES `factura` (`idFactura`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `transporte`
--

LOCK TABLES `transporte` WRITE;
/*!40000 ALTER TABLE `transporte` DISABLE KEYS */;
INSERT INTO `transporte` VALUES (3,'TRANSPORTE 1',8);
/*!40000 ALTER TABLE `transporte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int NOT NULL AUTO_INCREMENT,
  `idRol` varchar(10) NOT NULL,
  `contrasena` varchar(100) NOT NULL,
  `nombreUsuario` varchar(20) NOT NULL,
  PRIMARY KEY (`idUsuario`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (18,'ADMIN','202cb962ac59075b964b07152d234b70','juan'),(19,'ADMIN','202cb962ac59075b964b07152d234b70','Adrian'),(20,'VENDEDOR','202cb962ac59075b964b07152d234b70','Fabry'),(21,'RESPALDOS','202cb962ac59075b964b07152d234b70','Nidia'),(22,'VENDEDOR','202cb962ac59075b964b07152d234b70','Vendedor'),(25,'jose','202cb962ac59075b964b07152d234b70','ADMIN');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-14 22:58:07
