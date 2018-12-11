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
  `model_id` int(11) NOT NULL AUTO_INCREMENT,
  `model_file` varchar(90) NOT NULL,
  PRIMARY KEY (`model_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `3d_model`
--

LOCK TABLES `3d_model` WRITE;
/*!40000 ALTER TABLE `3d_model` DISABLE KEYS */;
INSERT INTO `3d_model` VALUES (1,'dragon.txt'),(2,'tower.txt'),(3,'bird.txt'),(4,'podshipnic.txt'),(5,'death_star.txt');
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
  `client_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`client_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `client`
--

LOCK TABLES `client` WRITE;
/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` VALUES ('Краснов','Кирилл','Карлович','8-999-111-12-12','shade@gmail.com',1),('Смирнова','Дарья','Петровна','8-999-222-23-23','smirnova_d@gmail.com',2),('Брусова','Полина','Сергеевна','8-999-333-34-34','brusova@gmail.com',3),('Вилоусов','Григорий','Павлович','8-912-444-4545','darklord@gmail.com',4);
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
  `contract_number` int(11) NOT NULL AUTO_INCREMENT,
  `material_id` int(11) NOT NULL,
  `color` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `diameter_of_the_strand` int(11) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `start_delivery` date NOT NULL,
  `end_delivery` date NOT NULL,
  PRIMARY KEY (`contract_number`),
  KEY `Empoyee_DeliveryFK` (`supplier_id`),
  KEY `DeliveryStatuses_DeliveryFK_idx` (`status`),
  KEY `InfoAboutMaterial_DeliveryFK_idx` (`material_id`),
  KEY `InfoAboutMaterial_DeliveryFK2_idx` (`color`),
  CONSTRAINT `DeliveryStatuses_DeliveryFK` FOREIGN KEY (`status`) REFERENCES `delivery_statuses` (`del_statuses_id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `Empoyee_DeliveryFK` FOREIGN KEY (`supplier_id`) REFERENCES `employee` (`employee_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `InfoAboutMaterial_DeliveryFK` FOREIGN KEY (`material_id`) REFERENCES `information_about_material` (`material_id`) ON DELETE NO ACTION ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES (4,1,7,'Синий','PVA пластик',12,200,3,'2018-09-10','2018-09-12'),(4,2,8,'Оранжевый','Нейлон',10,200,3,'2018-09-10','2018-09-12'),(4,3,9,'Красный','PLA пластик',3,200,3,'2018-09-10','2018-09-12'),(4,4,10,'Зелёный','ABS пластик',2,200,2,'2018-12-03','2018-12-08'),(4,5,11,'Оранжевый','Нейлон',3,200,3,'2018-09-10','2018-09-12'),(4,6,12,'Черный','PLA пластик',5,200,3,'2018-09-10','2018-09-12'),(4,7,13,'Белый','PVA пластик',5,100,3,'2018-09-10','2018-09-12');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`delivery_BEFORE_INSERT` BEFORE INSERT ON `delivery` FOR EACH ROW
BEGIN
if((new.`color`<>(select `color` from `information_about_material` where `material_id`=new.`material_id`))
or
(new.`type`<>(select `type` from `information_about_material` where `material_id`=new.`material_id`))
or
(new.`diameter_of_the_strand`<>(select `diameter_of_the_strand` from `information_about_material` where `material_id`=new.`material_id`))
)
then
signal sqlstate '45000'
SET MESSAGE_TEXT ="This material doesn't exist in table 'information_about_material'";
end if;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `delivery_statuses` (
  `del_statuses_id` int(11) NOT NULL AUTO_INCREMENT,
  `del_status_namel` varchar(45) NOT NULL,
  PRIMARY KEY (`del_statuses_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery_statuses`
--

LOCK TABLES `delivery_statuses` WRITE;
/*!40000 ALTER TABLE `delivery_statuses` DISABLE KEYS */;
INSERT INTO `delivery_statuses` VALUES (1,'Контракт обрабатывается'),(2,'Доставка в пути'),(3,'Доставка получена');
/*!40000 ALTER TABLE `delivery_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `extra_information` VALUES (1,'Растворимый в воде материал'),(2,'Биоразлагаемый материал'),(3,'Максимально гладкая поверхность, высокая прочность'),(4,'Будет стоять в помещении с высокой влажностью, т.е. необходим материал с высокой гигроскопичностью,  особая прочность и термостойкость'),(5,'Экологические материалы');
/*!40000 ALTER TABLE `extra_information` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `information_about_material`
--

DROP TABLE IF EXISTS `information_about_material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `information_about_material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  `diameter_of_the_strand` int(11) NOT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `information_about_material`
--

LOCK TABLES `information_about_material` WRITE;
/*!40000 ALTER TABLE `information_about_material` DISABLE KEYS */;
INSERT INTO `information_about_material` VALUES (7,'Синий','PVA пластик',12,NULL),(8,'Оранжевый','Нейлон',10,NULL),(9,'Красный','PLA пластик',3,NULL),(10,'Зелёный','ABS пластик',2,NULL),(11,'Оранжевый','Нейлон',3,NULL),(12,'Чёрный','PLA пластик',5,NULL),(13,'Белый','PVA пластик',5,NULL);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`information_about_material_BEFORE_INSERT` BEFORE INSERT ON `information_about_material` FOR EACH ROW
BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`information_about_material_AFTER_INSERT` AFTER INSERT ON `information_about_material` FOR EACH ROW
BEGIN
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
/*!50003 SET character_set_client  = utf8 */ ;
/*!50003 SET character_set_results = utf8 */ ;
/*!50003 SET collation_connection  = utf8_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`information_about_material_BEFORE_UPDATE` BEFORE UPDATE ON `information_about_material` FOR EACH ROW
BEGIN
if 
((select count(*) from  `delivery`where `material_id` = old.`material_id`) > 0)
then

signal sqlstate '45000'
SET MESSAGE_TEXT =`This material is involved in operations (delivery, request, store)`;


else



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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`information_about_material_BEFORE_DELETE` BEFORE DELETE ON `information_about_material` FOR EACH ROW
BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`information_about_material_AFTER_DELETE` AFTER DELETE ON `information_about_material` FOR EACH ROW
BEGIN
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `material` (
  `material_id` int(11) NOT NULL AUTO_INCREMENT,
  `color` varchar(45) NOT NULL,
  `type` varchar(45) NOT NULL,
  PRIMARY KEY (`material_id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
INSERT INTO `material` VALUES (1,'Синий','PVA пластик'),(2,'Красный','PLA пластик'),(3,'Зелёный','ABS пластик'),(4,'Оранжевый','Нейлон'),(5,'Чёрный','PLA пластик'),(6,'Белый','PVA пластик');
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`material_BEFORE_INSERT` BEFORE INSERT ON `material` FOR EACH ROW
BEGIN
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`material_BEFORE_UPDATE` BEFORE UPDATE ON `material` FOR EACH ROW
BEGIN
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
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order` (
  `status` int(11) NOT NULL,
  `order_number` int(11) NOT NULL AUTO_INCREMENT,
  `price` decimal(8,2) NOT NULL,
  `client_id` int(11) NOT NULL,
  `model_id` int(11) NOT NULL,
  `short_description` varchar(100) NOT NULL,
  `date` date NOT NULL,
  `end_date` date NOT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order`
--

LOCK TABLES `order` WRITE;
/*!40000 ALTER TABLE `order` DISABLE KEYS */;
INSERT INTO `order` VALUES (7,1,500.00,1,1,'Синий дракон','2018-09-12','2018-09-15',1),(7,2,1000.00,2,2,'Мини-копия останкинской башни красного цвета','2018-09-12','2018-09-20',2),(5,3,1000.00,3,3,'Зелёная птица','2018-12-03','2018-12-10',3),(3,4,1200.00,3,4,'Подшипник оранжевый','2018-12-03','2018-12-12',4),(5,5,1100.00,4,5,'Мини-копия звезды смерти','2018-12-03','2018-12-15',5);
/*!40000 ALTER TABLE `order` ENABLE KEYS */;
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`order_BEFORE_INSERT` BEFORE INSERT ON `order` FOR EACH ROW
BEGIN
if(new.`end_date`<new.`date`)
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
INSERT INTO `order_employee` VALUES (1,1),(2,1),(3,1),(4,1),(5,1),(1,2),(3,2),(2,3),(4,3),(5,3);
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
INSERT INTO `order_modification` VALUES (1,'Дата окончания: 2018-09-15'),(2,'Дата окончания: 2018-09-20');
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
  `provider_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`provider_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `provider`
--

LOCK TABLES `provider` WRITE;
/*!40000 ALTER TABLE `provider` DISABLE KEYS */;
INSERT INTO `provider` VALUES ('Компания Номер Один в России','PLA пластик',1),('Днепропетровский пластик','ABS пластик',2),('Chinese Nylon','Нейлон',3),('EasyPlastic','PVA пластик',4);
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
INSERT INTO `provider_deliver` VALUES (4,1),(3,2),(1,3),(2,4),(3,5),(1,6),(4,7);
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
INSERT INTO `rejected_by_employee_order` VALUES (4,2);
/*!40000 ALTER TABLE `rejected_by_employee_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request`
--

DROP TABLE IF EXISTS `request`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request` (
  `request_number` int(11) NOT NULL AUTO_INCREMENT,
  `start_date` date NOT NULL,
  `end_date` date NOT NULL,
  `order_number` int(11) NOT NULL,
  `material_id` int(11) NOT NULL,
  `amount_of_material` int(11) NOT NULL,
  `req_status` int(11) NOT NULL,
  PRIMARY KEY (`request_number`),
  KEY `InfoAboutMaterail_RequestFK` (`material_id`),
  KEY `Order_RequestFK_idx` (`order_number`),
  KEY `RequestStatues_RequestFK_idx` (`req_status`),
  CONSTRAINT `InfoAboutMaterail_RequestFK` FOREIGN KEY (`material_id`) REFERENCES `information_about_material` (`material_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `Order_RequestFK` FOREIGN KEY (`order_number`) REFERENCES `order` (`order_number`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `RequestStatues_RequestFK` FOREIGN KEY (`req_status`) REFERENCES `request_statuses` (`req_status_id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request`
--

LOCK TABLES `request` WRITE;
/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` VALUES (1,'2018-09-12','2018-09-12',1,7,50,3),(2,'2018-09-12','2018-09-12',2,9,90,3),(3,'2018-12-03','2018-12-08',3,10,90,2),(4,'2018-12-03','2018-12-03',4,8,90,3),(5,'2018-12-03','2018-12-03',5,12,90,3);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`request_BEFORE_INSERT` BEFORE INSERT ON `request` FOR EACH ROW
BEGIN
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
INSERT INTO `request_employee` VALUES (2,1),(3,2),(2,3),(3,4),(3,5);
/*!40000 ALTER TABLE `request_employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `request_statuses`
--

DROP TABLE IF EXISTS `request_statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `request_statuses` (
  `req_status_id` int(11) NOT NULL AUTO_INCREMENT,
  `req_status_name` varchar(45) NOT NULL,
  PRIMARY KEY (`req_status_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `request_statuses`
--

LOCK TABLES `request_statuses` WRITE;
/*!40000 ALTER TABLE `request_statuses` DISABLE KEYS */;
INSERT INTO `request_statuses` VALUES (1,'Заявка принята'),(2,'Материалов недостаточно'),(3,'Заявка выполнена');
/*!40000 ALTER TABLE `request_statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
INSERT INTO `store_material` VALUES (7,150),(8,110),(9,110),(10,0),(11,200),(12,110),(13,100);
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
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER `crmpi`.`store_material_BEFORE_DELETE` BEFORE DELETE ON `store_material` FOR EACH ROW
BEGIN
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

-- Dump completed on 2018-12-09 18:34:40
