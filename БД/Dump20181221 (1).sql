CREATE DATABASE  IF NOT EXISTS `crmpi` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `crmpi`;
-- MySQL dump 10.13  Distrib 8.0.13, for Win64 (x86_64)
--
-- Host: localhost    Database: crmpi
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `3d_model` (
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_file` varchar(90) NOT NULL,
  `screenshot` varchar(150) DEFAULT NULL COMMENT 'Путь к файлу со скриншотом модели',
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `3d_model`
--

LOCK TABLES `3d_model` WRITE;
/*!40000 ALTER TABLE `3d_model` DISABLE KEYS */;
INSERT INTO `3d_model` VALUES (1,'dragon.stl','C:\\screen1.jpg'),(2,'tower.stl','C:\\screen2.jpg'),(3,'bird.stl','C:\\screen3.jpg'),(4,'podshipnic.stl','C:\\screen4.jpg'),(5,'death_star.stl','C:\\screen5.jpg'),(6,'building.stl','C:\\screen6.jpg'),(7,'number_six.stl','C:\\screen7.jpg'),(8,'coffee_bean.stl','C:\\screen8.jpg'),(9,'statue.stl','C:\\screen9.jpg'),(10,'thanos_glove.stl','C:\\screen10.jpg'),(11,'pen.stl','C:\\screen11.jpg'),(12,'book.stl','C:\\screen12.jpg'),(13,'wand.stl','C:\\screen13.jpg'),(14,'letter_a.stl','C:\\screen14.jpg'),(15,'letter_s.stl','C:\\screen15.jpg'),(16,'bus.stl','C:\\screen16.jpg'),(17,'metatron.stl','C:\\screen17.jpg'),(18,'fork.stl','C:\\screen18.jpg'),(19,'deer.stl','C:\\screen19.jpg'),(20,'pig.stl','C:\\screen20.jpg');
/*!40000 ALTER TABLE `3d_model` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access`
--

DROP TABLE IF EXISTS `access`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `access` VALUES (1,'num1','d6a9a933c8aafc51e55ac0662b6e4d4a'),(2,'num2','93279e3308bdbbeed946fc965017f67a'),(3,'num3','4297f44b13955235245b2497399d7a93'),(4,'num4','ed2b1f468c5f915f3f1cf75d7068baae');
/*!40000 ALTER TABLE `access` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `changes`
--

DROP TABLE IF EXISTS `changes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `client` (
  `surname` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `telephone_number` varchar(16) NOT NULL,
  `email` varchar(45) NOT NULL,
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('Краснов','Кирилл','Карлович','8-999-111-12-12','shade@gmail.com',1),('Смирнова','Дарья','Петровна','8-999-222-23-23','smirnova_d@gmail.com',2),('Брусова','Полина','Сергеевна','8-999-333-34-34','brusova@gmail.com',3),('Вилоусов','Григорий','Павлович','8-912-444-4545','darklord@gmail.com',4),('Семенова','Валентина','Григорьевна','8-923-233-12-42','rewat@gmail.com',5),('Дисник','Регина','Юрьевна','8-933-124-25-53','ted_s@gmail.com',6),('Кукеев','Владислав','Сергеев','8-924-122-25-23','pathe_ag@gmail.com',7),('Учинов','Сергей','Григорьев','8-932-503-25-12','sf_gsehs@gmail.com',8),('Понкин','Владислав','Петрович','8-924-255-30-20','tru_egg@gmail.com',9),('Одинсон','Тор','Одинович','8-616-616-61-61','hammer_lover@gmail.com',10),('Гришин','Сергей','Евгеньевич','8-924-255-12-52','god_of_fer@gmail.com',11),('Звеньев','Олег','Денисович','8-922-124-15-20','sgd_2gd@gmail.com',12),('Акинов','Петр','Петрович','8-924-125-90-00','marich@gmail.com',13),('Нешкин','Алексей','Евгеньевич','8-924-242-12-52','xatren@gmail.com',14),('Рукшин','Андрей','Кириллович','8-911-244-12-87','typerat@gmail.com',15),('Автолеев','Равшан','Криллович','8-244-155-14-15','puttywe@gmail.com',16),('Леснов','Павел','Евгеньвич','8-244-167-46-23','togreat@gmail.com',17);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery` (
  `supplier_id` int(11) NOT NULL,
  `contract_number` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `start_delivery` date NOT NULL,
  `end_delivery` date NOT NULL,
  `path_to_document` varchar(200) NOT NULL,
  PRIMARY KEY (`contract_number`),
  KEY `Empoyee_DeliveryFK` (`supplier_id`),
  KEY `DeliveryStatuses_DeliveryFK_idx` (`status`),
  KEY `InfoAboutMaterial_DeliveryFK_idx` (`material_id`),
  CONSTRAINT `DeliveryStatuses_DeliveryFK` FOREIGN KEY (`status`) REFERENCES `delivery_statuses` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Empoyee_DeliveryFK` FOREIGN KEY (`supplier_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `InfoAboutMaterial_DeliveryFK` FOREIGN KEY (`material_id`) REFERENCES `information_about_material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (4,1,7,200,3,'2018-09-10','2018-09-12','C:\\dog1.doc'),(4,2,8,200,3,'2018-09-10','2018-09-12','C:\\dog2.doc'),(4,3,9,200,3,'2018-09-10','2018-09-12','C:\\dog3.doc'),(4,4,10,200,2,'2018-12-03','2018-12-22','C:\\dog4.docx'),(4,5,11,200,3,'2018-09-10','2018-09-12','C:\\dog5.doc'),(4,6,12,200,3,'2018-09-10','2018-09-12','C:\\dog6.doc'),(4,7,13,100,3,'2018-09-10','2018-09-12','C:\\dog7.doc'),(4,8,10,300,3,'2018-12-01','2018-12-03','C:\\dog8.doc'),(4,9,14,300,3,'2018-12-01','2018-12-04','C:\\dog9.doc'),(4,10,15,300,3,'2018-12-01','2018-12-03','C:\\dog10.doc'),(4,11,16,300,3,'2018-12-01','2018-12-03','C:\\dog11.doc'),(4,12,17,300,3,'2018-12-01','2018-12-03','C:\\dog12.doc'),(4,13,18,300,3,'2018-12-01','2018-12-03','C:\\dog13.doc'),(4,14,19,300,3,'2018-12-01','2018-12-03','C:\\dog14.doc'),(4,15,20,300,3,'2018-12-01','2018-12-22','C:\\dog15.doc'),(4,16,21,300,3,'2018-12-01','2018-12-03','C:\\dog16.doc'),(4,17,22,300,3,'2018-12-01','2018-12-03','C:\\dog17.doc'),(4,18,23,300,3,'2018-12-01','2018-12-03','C:\\dog18.doc'),(4,19,24,300,3,'2018-12-01','2018-12-03','C:\\dog19.doc');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `delivery_BEFORE_INSERT` BEFORE INSERT ON `delivery` FOR EACH ROW BEGIN
if(new.`end_delivery`<new.`start_delivery`)
then
signal sqlstate '45000'
SET MESSAGE_TEXT ="Check dates";
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `delivery_statuses`
--

DROP TABLE IF EXISTS `delivery_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `delivery_statuses` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_statuses`
--

LOCK TABLES `delivery_statuses` WRITE;
/*!40000 ALTER TABLE `delivery_statuses` DISABLE KEYS */;
INSERT INTO `delivery_statuses` VALUES (1,'Сборка заказа'),(2,'Заказ в пути'),(3,'Заказ получен');
/*!40000 ALTER TABLE `delivery_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `employee` (
  `employee_id` int(11) NOT NULL AUTO_INCREMENT,
  `surname` varchar(45) NOT NULL,
  `name` varchar(45) NOT NULL,
  `patronymic` varchar(45) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  KEY `Occupation_EmployeeFK_idx` (`status`),
  CONSTRAINT `Occupation_EmployeeFK` FOREIGN KEY (`status`) REFERENCES `occupation` (`occupation_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `extra_information` VALUES (1,'Растворимый в воде материал'),(2,'Биоразлагаемый материал'),(3,'Максимально гладкая поверхность, высокая прочность'),(4,'Будет стоять в помещении с высокой влажностью, т.е. необходим материал с высокой гигроскопичностью,  особая прочность и термостойкость'),(5,'Экологические материалы'),(6,'Будет стоять в помещении с высокой влажностью'),(7,'Долговечный материал'),(8,'Водорастворимый материал'),(9,'Экологичность'),(10,'Максимальная детализация, мягкость'),(11,'Максимально гладкая поверхность'),(12,'Биоразлагаемость'),(13,'Максимальная детализация, схожесть с деревом'),(14,'Долговечность продукта'),(15,'Долговечность продукта'),(16,'Экологичность, так как будет игрушкой'),(17,'Долговечноть продукта'),(18,'Максимально гладкая поверхность'),(19,'Игрушка, экологичность материалов'),(20,'Игрушка, безопасная для ребенка');
/*!40000 ALTER TABLE `extra_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_about_material`
--

DROP TABLE IF EXISTS `information_about_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `information_about_material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `diameter_of_the_strand` int(11) NOT NULL,
  `image` varchar(200) NOT NULL,
  `cost` int(11) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_about_material`
--

LOCK TABLES `information_about_material` WRITE;
/*!40000 ALTER TABLE `information_about_material` DISABLE KEYS */;
INSERT INTO `information_about_material` VALUES (7,'Синий','PVA пластик',12,'https://photogora.ru/img/product/thumb/4615/1473685090161644615.jpg',500),(8,'Оранжевый','Нейлон',10,'https://photogora.ru/img/product/big/3678/1473684899456743678.jpg',450),(9,'Красный','PLA пластик',3,'https://photogora.ru/img/product/big/6053/14780170410.jpg',333),(10,'Зелёный','ABS пластик',2,'https://photogora.ru/img/product/th/3502/1473674175814253502.jpg',444),(11,'Оранжевый','Нейлон',3,'https://photogora.ru/img/product/big/3678/1473684899456743678.jpg',555),(12,'Чёрный','PLA пластик',5,'https://photogora.ru/img/product/th/4782/147368516884874782.jpg',666),(13,'Белый','PVA пластик',5,'https://photogora.ru/img/product/big/3394/14811066250.jpg',777),(14,'Серый','PLA пластик',4,'https://photogora.ru/img/product/big/8144/15046184470.jpg',888),(15,'Синий','ABS пластик',8,'https://photogora.ru/img/product/thumb/4615/1473685090161644615.jpg',999),(16,'Коричневый','PVA пластик',5,'https://photogora.ru/img/product/big/6852/14891565980.jpg',1),(17,'Белый','PLA пластик',4,'https://photogora.ru/img/product/big/3394/14811066250.jpg',111),(18,'Жёлтый','PLA пластик',3,'https://photogora.ru/img/product/big/6350/14830415300.jpg',222),(19,'Фиолетовый','PLA пластик',8,'https://photogora.ru/img/product/thumb/4636/1473685089903504636.jpg',333),(20,'Синий','PLA пластик',4,'https://photogora.ru/img/product/thumb/4615/1473685090161644615.jpg',444),(21,'Жёлтый','PLA пластик',2,'https://photogora.ru/img/product/big/6350/14830415300.jpg',555),(22,'Коричневый','PLA пластик',4,'https://photogora.ru/img/product/big/4935/147368525499864935.jpg',666),(23,'Розовый','PLA пластик',4,'https://photogora.ru/img/product/th/7862/15007320180.jpg',777),(24,'Серый','LAYWOOD-3D',3,'https://photogora.ru/img/product/big/8144/15046184470.jpg',888);
/*!40000 ALTER TABLE `information_about_material` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `information_about_material_BEFORE_INSERT` BEFORE INSERT ON `information_about_material` FOR EACH ROW BEGIN
if (exists (select 1 from `information_about_material` where `color`=new.`color` and `type`=new.`type` and `diameter_of_the_strand`=new.`diameter_of_the_strand`))
then
signal sqlstate '45000'
SET MESSAGE_TEXT = "You're trying to add value that exists in the table information about materials. Don't do it NEVER.";
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `information_about_material_AFTER_INSERT` AFTER INSERT ON `information_about_material` FOR EACH ROW BEGIN
if (exists (select 1 from `material` where `color`=new.`color` and `type`=new.`type`) is false)
then
insert ignore into `crmpi`.`material`(`type`,`color`) 
values (new.`type`,new.`color`);
end if;
if (exists (select 1 from `store_material` where `material_id`=new.`material_id`) is false)
then
insert ignore into `crmpi`.`store_material`(`material_id`,`amount`) 
values (new.`material_id`,'0');
end if;
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
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `information_about_material_BEFORE_UPDATE` BEFORE UPDATE ON `information_about_material` FOR EACH ROW BEGIN
if (new.`color`<>old.`color` or new.`type`<>old.`type` or new.`diameter_of_the_strand`<>old.`diameter_of_the_strand`)
then
if (exists (select 1 from `information_about_material` where `color`=new.`color` and `type`=new.`type` and `diameter_of_the_strand`=new.`diameter_of_the_strand`))
then
signal sqlstate '45000'
SET MESSAGE_TEXT = "You're trying to change the row to value that exists in the table information about material";
end if;
end if;
if (new.`color`<>old.`color` or new.`type`<>old.`type`)
then
if 
(
(SELECT COUNT(*) FROM 
(select material_id, color, `type` from
(select * from
(SELECT COUNT(*) AS repetitions, `color` , `type`,`material_id`
FROM `information_about_material` 
GROUP BY `color`, `type` having repetitions>1) as rr )as `mt` left join (select `material_id` as `main_id`,`color`as `main_color`,`type` as `main_type` from material) as `main_table`
on mt.color=main_table.main_color and mt.type=main_table.main_type
where `color`=old.`color` and `type`=old.`type`) as tt) <> 1
)
then
if(
(SELECT COUNT(*) FROM 
(select material_id, color, `type` from
(select * from
(SELECT COUNT(*) AS repetitions, `color` , `type`,`material_id`
FROM `information_about_material` 
GROUP BY `color`, `type`) as rr1 )as `mt1` left join (select `material_id` as `main_id`,`color`as `main_color`,`type` as `main_type` from material) as `main_table1`
on mt1.color=main_table1.main_color and mt1.`type`=main_table1.main_type
where `color`=new.`color` and `type`=new.`type`) as tt1) <> 0
)
then
delete from `material`
where `color`=old.`color` and `type`=old.`type`;
else
delete from `material`
where `color`=old.`color` and `type`=old.`type`;
insert ignore into `crmpi`.`material`(`type`,`color`) 
values (new.`type`,new.`color`);
end if;
else
if (
(SELECT COUNT(*) FROM 
(select material_id, color, `type` from
(select * from
(SELECT COUNT(*) AS repetitions, `color` , `type`,`material_id`
FROM `information_about_material` 
GROUP BY `color`, `type`) as rr2 )as `mt2` left join (select `material_id` as `main_id`,`color`as `main_color`,`type` as `main_type` from material) as `main_table2`
on mt2.color=main_table2.main_color and mt2.type=main_table2.main_type
where `color`=new.`color` and `type`=new.`type`) as tt2) <> 1
)
then
insert ignore into `crmpi`.`material`(`type`,`color`) 
values (new.`type`,new.`color`);
end if;
end if;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `information_about_material_BEFORE_DELETE` BEFORE DELETE ON `information_about_material` FOR EACH ROW BEGIN
if ((select `amount` from `store_material` where `material_id`=old.`material_id`)>0)
then
signal sqlstate '45000'
SET MESSAGE_TEXT = "You're trying to delete material, which is exists in store.";
else 
delete from `store_material` where `material_id` = old.`material_id`;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `information_about_material_AFTER_DELETE` AFTER DELETE ON `information_about_material` FOR EACH ROW BEGIN
delete from `material` where `material_id` in (select `material_id` from
(select * from
(select `material`.`material_id`, `material`.`color`,`material`.`type` from `material` )as `t1` left join 
(select `information_about_material`.`material_id` as `p1`,`information_about_material`.`color` as `p2`,`information_about_material`.`type` as `p3` from `information_about_material` )as `t2`
on `t1`.`color`=`t2`.`p2` and `t1`.`type`= `t2`.`p3` having `p1` is null)  as `ft`)
;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Синий','PVA пластик'),(2,'Красный','PLA пластик'),(3,'Зелёный','ABS пластик'),(4,'Оранжевый','Нейлон'),(5,'Чёрный','PLA пластик'),(6,'Белый','PVA пластик'),(7,'Серый','PLA пластик'),(8,'Синий','ABS пластик'),(9,'Коричневый','PVA пластик'),(10,'Белый','PLA пластик'),(11,'Жёлтый','PLA пластик'),(12,'Фиолетовый','PLA пластик'),(13,'Синий','PLA пластик'),(15,'Коричневый','PLA пластик'),(16,'Розовый','PLA пластик'),(17,'Серый','LAYWOOD-3D');
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `material_BEFORE_INSERT` BEFORE INSERT ON `material` FOR EACH ROW BEGIN
if (exists (select 1 from `material` where `color`=new.`color` and `type`=new.`type`) is true)
then
signal sqlstate '45000'
SET MESSAGE_TEXT = "You're trying to add value that exists in the table material";
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `material_BEFORE_UPDATE` BEFORE UPDATE ON `material` FOR EACH ROW BEGIN
if (new.`color`<>old.`color` or new.`type`<>old.`type`)
then
if (exists (select 1 from `material` where `color`=new.`color` and `type`=new.`type`))
then
signal sqlstate '45000'
SET MESSAGE_TEXT = "You're trying to change the row to value that exists in the table material";
end if;
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `occupation`
--

DROP TABLE IF EXISTS `occupation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `occupation` (
  `occupation_id` int(11) NOT NULL AUTO_INCREMENT,
  `occupation_name` varchar(45) NOT NULL,
  PRIMARY KEY (`occupation_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order` (
  `status` int(11) NOT NULL,
  `order_number` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(8,2) NOT NULL,
  `client_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `material_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`order_number`),
  KEY `idmodel_idx` (`model_id`),
  KEY `idclient_idx` (`client_id`),
  KEY `Statuses_OrderFK_idx` (`status`),
  KEY `idmaterial_idx` (`material_id`),
  CONSTRAINT `Client_OrderFK` FOREIGN KEY (`client_id`) REFERENCES `client` (`client_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Material_OrderFK` FOREIGN KEY (`material_id`) REFERENCES `material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Model_OrderFK` FOREIGN KEY (`model_id`) REFERENCES `3d_model` (`model_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Statuses_OrderFK` FOREIGN KEY (`status`) REFERENCES `statuses` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (7,1,500.00,1,1,'Синий дракон','2018-09-12',1),(7,2,1000.00,2,2,'Мини-копия останкинской башни красного цвета','2018-09-12',2),(6,3,1000.00,3,3,'Зелёная птица','2018-12-03',3),(3,4,1200.00,3,4,'Подшипник оранжевый','2018-12-03',4),(5,5,1100.00,4,5,'Мини-копия звезды смерти','2018-12-03',5),(4,6,1552.00,5,6,'Серая мини-копия здания','2018-12-03',7),(4,7,1000.00,6,7,'Синее число 6','2018-12-04',8),(4,8,500.00,7,8,'Коричневое зерно кофе','2018-12-04',9),(6,9,1400.00,8,9,'Белая статуя Афины','2018-12-04',10),(5,10,2000.00,9,10,'Жёлтая перчатка','2018-12-04',11),(5,11,600.00,10,11,'Чёрная ручка','2018-12-04',5),(3,12,900.00,11,12,'Красная книга','2018-12-05',2),(3,13,1900.00,12,13,'Серая палочка','2018-12-05',17),(3,14,800.00,13,14,'Фиолетовая буква A','2018-12-05',12),(3,15,800.00,13,15,'Фиолетовая буква S','2018-12-05',12),(3,16,600.00,14,16,'Синий автобус','2018-12-05',13),(3,17,750.00,15,17,'Фиолетовый Метатрон','2018-12-05',12),(9,18,600.00,16,18,'Золотистая вилка','2018-12-06',11),(1,19,580.00,17,19,'Коричневый олень','2018-12-06',15),(9,20,600.00,17,20,'Розовая свинья','2018-12-06',16),(8,21,600.00,17,20,'Повтор заказа 20','2018-12-06',16),(8,22,500.00,7,8,'Кофейное зерно, повтор','2018-12-19',9);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_employee`
--

DROP TABLE IF EXISTS `order_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `order_employee` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(6,1),(7,1),(8,1),(9,1),(10,1),(11,1),(12,1),(13,1),(14,1),(15,1),(16,1),(17,1),(18,1),(19,1),(20,1),(21,1),(22,1),(1,2),(3,2),(6,2),(7,2),(8,2),(12,2),(13,2),(14,2),(15,2),(2,3),(4,3),(5,3),(9,3),(10,3),(11,3),(16,3),(17,3),(18,3),(19,3),(20,3);
/*!40000 ALTER TABLE `order_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_end_dates`
--

DROP TABLE IF EXISTS `order_end_dates`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `order_end_dates` (
  `order_number` int(11) NOT NULL,
  `end_date` date NOT NULL,
  PRIMARY KEY (`order_number`),
  CONSTRAINT `Order_OrderEndDatesFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_end_dates`
--

LOCK TABLES `order_end_dates` WRITE;
/*!40000 ALTER TABLE `order_end_dates` DISABLE KEYS */;
INSERT INTO `order_end_dates` VALUES (1,'2018-12-15'),(2,'2018-12-10'),(3,'2018-12-10'),(4,'2018-12-20'),(5,'2018-12-15'),(6,'2018-12-25'),(7,'2018-12-25'),(8,'2018-12-25'),(9,'2018-12-25'),(10,'2018-12-25'),(11,'2018-12-25'),(12,'2018-12-25'),(13,'2018-12-25'),(14,'2018-12-25'),(15,'2018-12-26'),(16,'2018-12-26'),(17,'2018-12-26'),(18,'2018-12-30'),(19,'2018-12-30'),(20,'2018-12-30');
/*!40000 ALTER TABLE `order_end_dates` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `order_end_dates_BEFORE_INSERT` BEFORE INSERT ON `order_end_dates` FOR EACH ROW BEGIN
if(new.`end_date`< (select `date` from `order` where `order_number`=new.`order_number`))
then
signal sqlstate '45000'
SET MESSAGE_TEXT ="Check start date";
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `order_modification`
--

DROP TABLE IF EXISTS `order_modification`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `order_modification` VALUES (1,'Дата окончания: 2018-09-15'),(2,'Дата окончания: 2018-09-20'),(17,'Дата окончания: 2018-12-26');
/*!40000 ALTER TABLE `order_modification` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider`
--

DROP TABLE IF EXISTS `provider`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `provider` (
  `company_name` varchar(45) NOT NULL,
  `product` varchar(45) NOT NULL,
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES ('Компания Номер Один в России','PLA пластик',1),('Днепропетровский пластик','ABS пластик',2),('Chinese Nylon','Нейлон',3),('EasyPlastic','PVA пластик',4),('Wood Imitation','LAYWOOD-3D',5);
/*!40000 ALTER TABLE `provider` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `provider_deliver`
--

DROP TABLE IF EXISTS `provider_deliver`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `provider_deliver` (
  `provider_id` int(11) NOT NULL,
  `contract_number` int(11) NOT NULL,
  PRIMARY KEY (`provider_id`,`contract_number`),
  KEY `DeliveryProvider_DeliverFK_idx` (`contract_number`),
  CONSTRAINT `Delivery_ProviderDeliverFK` FOREIGN KEY (`contract_number`) REFERENCES `delivery` (`contract_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Provider_ProviderDeliverFK` FOREIGN KEY (`provider_id`) REFERENCES `provider` (`provider_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider_deliver`
--

LOCK TABLES `provider_deliver` WRITE;
/*!40000 ALTER TABLE `provider_deliver` DISABLE KEYS */;
INSERT INTO `provider_deliver` VALUES (4,1),(3,2),(1,3),(2,4),(3,5),(1,6),(4,7),(2,8),(1,9),(2,10),(4,11),(1,12),(1,13),(1,14),(1,15),(1,16),(1,17),(1,18),(5,19);
/*!40000 ALTER TABLE `provider_deliver` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rejected_by_employee_order`
--

DROP TABLE IF EXISTS `rejected_by_employee_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `rejected_by_employee_order` VALUES (4,2),(19,2),(18,3),(20,3);
/*!40000 ALTER TABLE `rejected_by_employee_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `request` (
  `request_number` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `order_number` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `amount_of_material` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`request_number`),
  KEY `InfoAboutMaterail_RequestFK` (`material_id`),
  KEY `Order_RequestFK_idx` (`order_number`),
  KEY `RequestStatues_RequestFK_idx` (`status`),
  CONSTRAINT `InfoAboutMaterail_RequestFK` FOREIGN KEY (`material_id`) REFERENCES `information_about_material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_RequestFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RequestStatues_RequestFK` FOREIGN KEY (`status`) REFERENCES `request_statuses` (`status_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'2018-09-12','2018-09-12',1,7,50,5),(2,'2018-09-12','2018-09-12',2,9,90,5),(3,'2018-12-03','2018-12-08',3,10,90,5),(4,'2018-12-03','2018-12-03',4,8,90,4),(5,'2018-12-03','2018-12-03',5,12,90,4),(6,'2018-12-03','2018-12-10',6,14,90,5),(7,'2018-12-04','2018-12-10',7,15,90,5),(8,'2018-12-04','2018-12-10',8,16,90,5),(9,'2018-12-04','2018-12-10',9,17,90,5),(10,'2018-12-04','2018-12-10',10,18,90,5),(11,'2018-12-04','2018-12-10',11,12,90,5),(12,'2018-12-05','2018-12-12',12,9,90,4),(13,'2018-12-05','2018-12-12',13,24,90,4),(14,'2018-12-05','2018-12-12',14,19,50,4),(15,'2018-12-05','2018-12-12',15,19,50,4),(16,'2018-12-05','2018-12-12',16,20,90,3),(17,'2018-12-05','2018-12-12',17,19,90,4);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `request_BEFORE_INSERT` BEFORE INSERT ON `request` FOR EACH ROW BEGIN
if(new.`end_date`<new.`start_date`)
then
signal sqlstate '45000'
SET MESSAGE_TEXT ="Check dates";
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `request_employee`
--

DROP TABLE IF EXISTS `request_employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `request_employee` VALUES (1,1),(2,1),(1,2),(3,2),(1,3),(2,3),(1,4),(3,4),(1,5),(3,5),(1,6),(2,6),(1,7),(2,7),(1,8),(2,8),(1,9),(3,9),(1,10),(3,10),(1,11),(3,11),(1,12),(2,12),(1,13),(2,13),(1,14),(2,14),(1,15),(2,15),(1,16),(3,16),(1,17),(3,17);
/*!40000 ALTER TABLE `request_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_statuses`
--

DROP TABLE IF EXISTS `request_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `request_statuses` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_statuses`
--

LOCK TABLES `request_statuses` WRITE;
/*!40000 ALTER TABLE `request_statuses` DISABLE KEYS */;
INSERT INTO `request_statuses` VALUES (1,'Ожидание ответа со стороны снабженца'),(2,'Заявка обрабатывается'),(3,'Ожидание материалов'),(4,'Материалы отправлены'),(5,'Заявка выполнена');
/*!40000 ALTER TABLE `request_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `statuses` (
  `status_id` int(11) NOT NULL AUTO_INCREMENT,
  `status_name` varchar(75) NOT NULL,
  PRIMARY KEY (`status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;
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
 SET character_set_client = utf8mb4 ;
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
INSERT INTO `store_material` VALUES (7,150),(8,110),(9,20),(10,210),(11,200),(12,20),(13,100),(14,300),(15,210),(16,210),(17,210),(18,210),(19,110),(20,0),(21,300),(22,300),(23,300),(24,210);
/*!40000 ALTER TABLE `store_material` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `store_material_BEFORE_DELETE` BEFORE DELETE ON `store_material` FOR EACH ROW BEGIN
if ((select `amount` from `store_material` where `material_id`=old.`material_id`)>0)
then
signal sqlstate '45000'
SET MESSAGE_TEXT = "You're trying to delete material, which is exists in the store.";
end if;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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

-- Dump completed on 2018-12-21  1:00:23
