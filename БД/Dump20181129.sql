CREATE DATABASE  IF NOT EXISTS `crmpi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `crmpi`;
-- MySQL dump 10.13  Distrib 5.7.24, for Win64 (x86_64)
--
-- Host: localhost    Database: crmpi
-- ------------------------------------------------------
-- Server version	5.7.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `3d_model`
--

DROP TABLE IF EXISTS `3d_model`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `3d_model` (
  `model_id` int(11) NOT NULL,
  `model_file` varchar(90) NOT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `3d_model`
--

LOCK TABLES `3d_model` WRITE;
/*!40000 ALTER TABLE `3d_model` DISABLE KEYS */;
INSERT INTO `3d_model` VALUES (1,'somewhere.txt'),(2,'neverwhere.doc'),(3,'extra.txt'),(4,'somewhere.txt');
/*!40000 ALTER TABLE `3d_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access` (
  `employee_id` int(11) NOT NULL,
  `login` varchar(45) NOT NULL,
  `password` varchar(45) NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `Employee_AccessFK` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access`
--

LOCK TABLES `access` WRITE;
/*!40000 ALTER TABLE `access` DISABLE KEYS */;
INSERT INTO `access` VALUES (1,'num1','012345'),(2,'num2','121212'),(3,'num3','123123'),(4,'num4','12341234');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `amount_of_material`
--

DROP TABLE IF EXISTS `amount_of_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `amount_of_material` (
  `material_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`material_id`),
  CONSTRAINT `InfoAboutMaterail_AmountOfMaterialFK` FOREIGN KEY (`material_id`) REFERENCES `information_about_material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `amount_of_material`
--

LOCK TABLES `amount_of_material` WRITE;
/*!40000 ALTER TABLE `amount_of_material` DISABLE KEYS */;
INSERT INTO `amount_of_material` VALUES (9,111),(10,222);
/*!40000 ALTER TABLE `amount_of_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `changes` (
  `order_number` int(11) NOT NULL,
  `change_time` datetime NOT NULL,
  `change` varchar(200) NOT NULL,
  PRIMARY KEY (`order_number`,`change_time`),
  KEY `Order_ChangesFK_idx` (`change`),
  CONSTRAINT `Order_ChangesFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `changes`
--

LOCK TABLES `changes` WRITE;
/*!40000 ALTER TABLE `changes` DISABLE KEYS */;
/*!40000 ALTER TABLE `changes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `client`
--

DROP TABLE IF EXISTS `client`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `client` (
  `surname` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `telephone_number` varchar(16) NOT NULL,
  `email` varchar(45) NOT NULL,
  `client_id` int(11) NOT NULL,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('Борзых','Никита','Юрьевич','+7-999-888-32-32','allyru@gmail.com',1),('Крилл','Кирилл','Кирильевич','+7-000-111-22-33','shadyguy@mail.ru',2);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery` (
  `supplier_id` int(11) NOT NULL,
  `contract_number` int(11) NOT NULL,
  PRIMARY KEY (`contract_number`),
  KEY `Empoyee_DeliveryFK` (`supplier_id`),
  CONSTRAINT `Empoyee_DeliveryFK` FOREIGN KEY (`supplier_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (4,1),(4,2),(4,3);
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `Occupation_EmployeeFK_idx` (`status`),
  CONSTRAINT `Occupation_EmployeeFK` FOREIGN KEY (`status`) REFERENCES `occupation` (`occupation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Михайлов','Михаил','Михайлович',1),(2,'Равилев','Равиль','Равильевич',2),(3,'Радомиров','Радомир','Радомирович',2),(4,'Святов','Святослав','Святославович',3);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `extra_information`
--

DROP TABLE IF EXISTS `extra_information`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `extra_information` (
  `order_number` int(11) NOT NULL,
  `info` varchar(200) NOT NULL,
  PRIMARY KEY (`order_number`),
  CONSTRAINT `Order_ExtraInfoFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `extra_information`
--

LOCK TABLES `extra_information` WRITE;
/*!40000 ALTER TABLE `extra_information` DISABLE KEYS */;
INSERT INTO `extra_information` VALUES (1,'Сформировать кролика');
/*!40000 ALTER TABLE `extra_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_about_material`
--

DROP TABLE IF EXISTS `information_about_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_about_material` (
  `material_id` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `diameter_of_the_strand` int(11) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_about_material`
--

LOCK TABLES `information_about_material` WRITE;
/*!40000 ALTER TABLE `information_about_material` DISABLE KEYS */;
INSERT INTO `information_about_material` VALUES (7,'Синий','PVA пластик',17),(8,'Оранжевый','Нейлон',18),(9,'Красный','PLA пластик',3),(10,'Зелёный','ABS пластик',2);
/*!40000 ALTER TABLE `information_about_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `material_id` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (9,'Красный','PLA пластик'),(10,'Зелёный','ABS пластик');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `occupation`
--

DROP TABLE IF EXISTS `occupation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `occupation` (
  `occupation_id` int(11) NOT NULL,
  `occupation_name` varchar(45) NOT NULL,
  PRIMARY KEY (`occupation_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `occupation`
--

LOCK TABLES `occupation` WRITE;
/*!40000 ALTER TABLE `occupation` DISABLE KEYS */;
INSERT INTO `occupation` VALUES (1,'Менеджер'),(2,'Работник'),(3,'Снабженец');
/*!40000 ALTER TABLE `occupation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order`
--

DROP TABLE IF EXISTS `order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `status` int(11) NOT NULL,
  `order_number` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `client_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`order_number`),
  KEY `idmodel_idx` (`model_id`),
  KEY `idclient_idx` (`client_id`),
  KEY `Statuses_OrderFK_idx` (`status`),
  CONSTRAINT `Model_OrderFK` FOREIGN KEY (`model_id`) REFERENCES `3d_model` (`model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Statuses_OrderFK` FOREIGN KEY (`status`) REFERENCES `statuses` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (7,1,1000.00,1,1,'Клиенту 1 нужен зеленый кролик','2018-10-24','2018-10-30'),(7,3,529.00,1,2,'Клиенту 1 нужен красный ежик','2018-10-24','2018-10-30'),(3,4,1050.00,2,3,'Клиенту 2 нужен зеленый пингвин ','2018-11-04','1018-11-13'),(5,5,1000.00,1,1,'Повтор заказа 1 ','2018-11-05','2018-11-11');
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_employee`
--

DROP TABLE IF EXISTS `order_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_employee` (
  `order_number` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`order_number`,`employee_id`),
  KEY `Employee_OrderEmployeeFK_idx` (`employee_id`),
  CONSTRAINT `Employee_OrderEmployeeFK` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_OrderEmployeeFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_employee`
--

LOCK TABLES `order_employee` WRITE;
/*!40000 ALTER TABLE `order_employee` DISABLE KEYS */;
INSERT INTO `order_employee` VALUES (4,1),(5,1),(4,2),(5,3);
/*!40000 ALTER TABLE `order_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_material`
--

DROP TABLE IF EXISTS `order_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_material` (
  `order_number` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  PRIMARY KEY (`order_number`,`material_id`),
  KEY `Material_MaterialOrderFK_idx` (`material_id`),
  CONSTRAINT `Material_OrderMaterialFK` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_OrderMaterialFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_material`
--

LOCK TABLES `order_material` WRITE;
/*!40000 ALTER TABLE `order_material` DISABLE KEYS */;
INSERT INTO `order_material` VALUES (5,9),(4,10);
/*!40000 ALTER TABLE `order_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_modification`
--

DROP TABLE IF EXISTS `order_modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_modification` (
  `order_number` int(11) NOT NULL,
  `mark` varchar(200) NOT NULL,
  PRIMARY KEY (`order_number`),
  CONSTRAINT `Order_OrderMmodificationFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_modification`
--

LOCK TABLES `order_modification` WRITE;
/*!40000 ALTER TABLE `order_modification` DISABLE KEYS */;
INSERT INTO `order_modification` VALUES (1,'Добавить уши зеленому кролику');
/*!40000 ALTER TABLE `order_modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider` (
  `company_name` varchar(45) NOT NULL,
  `product` varchar(45) NOT NULL,
  `provider_id` int(11) NOT NULL,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES ('Компания Номер Один в России','PLA пластик',1),('Днепропетровский пластик','ABS пластик',2);
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_deliver`
--

DROP TABLE IF EXISTS `provider_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `provider_deliver` (
  `provider_id` int(11) NOT NULL,
  `contract_number` int(11) NOT NULL,
  PRIMARY KEY (`provider_id`,`contract_number`),
  KEY `DeliveryProvider_DeliverFK_idx` (`contract_number`),
  CONSTRAINT `Delivery_ProviderDeliverFK` FOREIGN KEY (`contract_number`) REFERENCES `delivery` (`contract_number`),
  CONSTRAINT `Provider_ProviderDeliverFK` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_deliver`
--

LOCK TABLES `provider_deliver` WRITE;
/*!40000 ALTER TABLE `provider_deliver` DISABLE KEYS */;
INSERT INTO `provider_deliver` VALUES (1,1),(2,2),(1,3);
/*!40000 ALTER TABLE `provider_deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejected_by_employee_order`
--

DROP TABLE IF EXISTS `rejected_by_employee_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `rejected_by_employee_order` (
  `order_number` int(11) NOT NULL,
  `employee_id` int(11) NOT NULL,
  PRIMARY KEY (`order_number`,`employee_id`),
  KEY `Employee_RejectedByEmployeeOrderFK_idx` (`employee_id`),
  CONSTRAINT `Order_RejectedByEmployeeOrderFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rejected_by_employee_order`
--

LOCK TABLES `rejected_by_employee_order` WRITE;
/*!40000 ALTER TABLE `rejected_by_employee_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `rejected_by_employee_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `request_number` int(11) NOT NULL,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `order_number` int(11) NOT NULL,
  PRIMARY KEY (`request_number`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (11,'2018-11-05','2018-11-12',4),(22,'2018-11-06','2018-11-10',5);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_employee`
--

DROP TABLE IF EXISTS `request_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_employee` (
  `employee_id` int(11) NOT NULL,
  `request_number` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`,`request_number`),
  KEY `Request_EmployeeRequestFK_idx` (`request_number`),
  CONSTRAINT `Employee_RequestEmployeeFK` FOREIGN KEY (`employee_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Request_RequestEmployeeFK` FOREIGN KEY (`request_number`) REFERENCES `request` (`request_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_employee`
--

LOCK TABLES `request_employee` WRITE;
/*!40000 ALTER TABLE `request_employee` DISABLE KEYS */;
INSERT INTO `request_employee` VALUES (2,11),(3,22);
/*!40000 ALTER TABLE `request_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_material`
--

DROP TABLE IF EXISTS `request_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_material` (
  `material_id` int(11) NOT NULL,
  `request_number` int(11) NOT NULL,
  PRIMARY KEY (`material_id`,`request_number`),
  KEY `Request_MaterialRequestFK_idx` (`request_number`),
  CONSTRAINT `AmountOfMaterial_RequestMaterialFK` FOREIGN KEY (`material_id`) REFERENCES `amount_of_material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Request_RequestMaterialFK` FOREIGN KEY (`request_number`) REFERENCES `request` (`request_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_material`
--

LOCK TABLES `request_material` WRITE;
/*!40000 ALTER TABLE `request_material` DISABLE KEYS */;
INSERT INTO `request_material` VALUES (10,11),(9,22);
/*!40000 ALTER TABLE `request_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `status_id` int(11) NOT NULL,
  `status_name` varchar(75) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,'Ожидание ответа работника'),(2,'Заказ принят работником'),(3,'Ожидание материалов'),(4,'Модификация заказа'),(5,'Создание продукта'),(6,'Продукт изготовлен'),(7,'Заказ завершен'),(8,'Заказ отменен'),(9,'Создание модели');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `store_material`
--

DROP TABLE IF EXISTS `store_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `store_material` (
  `material_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  PRIMARY KEY (`material_id`),
  CONSTRAINT `InfoAboutMaterial_StoreMaterialFK` FOREIGN KEY (`material_id`) REFERENCES `information_about_material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `store_material`
--

LOCK TABLES `store_material` WRITE;
/*!40000 ALTER TABLE `store_material` DISABLE KEYS */;
INSERT INTO `store_material` VALUES (7,50),(8,50),(9,200),(10,300);
/*!40000 ALTER TABLE `store_material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'crmpi'
--

--
-- Dumping routines for database 'crmpi'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-11-29 14:02:08
