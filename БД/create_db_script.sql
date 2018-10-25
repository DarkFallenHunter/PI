-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema CRMPI
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema CRMPI
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `CRMPI` DEFAULT CHARACTER SET utf8 ;
USE `CRMPI` ;

-- -----------------------------------------------------
-- Table `CRMPI`.`3d_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`3d_model` (
  `model_id` INT NOT NULL,
  `model_file` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`model_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`client` (
  `surname` VARCHAR(30) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `patronymic` VARCHAR(45) NOT NULL,
  `telephone_number` VARCHAR(16) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `client_id` INT NOT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`order` (
  `status` VARCHAR(45) NOT NULL,
  `order_number` INT NOT NULL,
  `price` DECIMAL(8,2) NOT NULL,
  `client_id` INT NOT NULL,
  `model_id` INT NOT NULL,
  `short_description` VARCHAR(100) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`order_number`),
  INDEX `idmodel_idx` (`model_id` ASC) VISIBLE,
  INDEX `idclient_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `Model_OrderFK`
    FOREIGN KEY (`model_id`)
    REFERENCES `CRMPI`.`3d_model` (`model_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Client_OrderFK`
    FOREIGN KEY (`client_id`)
    REFERENCES `CRMPI`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`order_modification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`order_modification` (
  `order_number` INT NOT NULL,
  `mark` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`order_number`),
  CONSTRAINT `Order_OrderMmodificationFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `CRMPI`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`material` (
  `type` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `material_id` INT NOT NULL,
  PRIMARY KEY (`material_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`order_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`order_material` (
  `order_number` INT NOT NULL,
  `material_id` INT NOT NULL,
  PRIMARY KEY (`order_number`, `material_id`),
  INDEX `Material_MaterialOrderFK_idx` (`material_id` ASC) VISIBLE,
  CONSTRAINT `Order_OrderMaterialFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `CRMPI`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Material_OrderMaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `CRMPI`.`material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`employee` (
  `employee_id` INT NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `patronymic` VARCHAR(45) NOT NULL,
  `status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`request` (
  `request_number` INT NOT NULL,
  PRIMARY KEY (`request_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`request_employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`request_employee` (
  `employee_id` INT NOT NULL,
  `request_number` INT NOT NULL,
  PRIMARY KEY (`employee_id`, `request_number`),
  INDEX `Request_EmployeeRequestFK_idx` (`request_number` ASC) VISIBLE,
  CONSTRAINT `Employee_RequestEmployeeFK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `CRMPI`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Request_RequestEmployeeFK`
    FOREIGN KEY (`request_number`)
    REFERENCES `CRMPI`.`request` (`request_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`order_employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`order_employee` (
  `order_number` INT NOT NULL,
  `employee_id` INT NOT NULL,
  PRIMARY KEY (`order_number`, `employee_id`),
  INDEX `Employee_OrderEmployeeFK_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `Employee_OrderEmployeeFK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `CRMPI`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Order_OrderEmployeeFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `CRMPI`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`access`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`access` (
  `employee_id` INT NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `Employee_AccessFK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `CRMPI`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`delivery` (
  `supplier_id` INT NOT NULL,
  `contract_number` INT NOT NULL,
  PRIMARY KEY (`contract_number`),
  CONSTRAINT `Empoyee_DeliveryFK`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `CRMPI`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`provider` (
  `company_name` VARCHAR(45) NOT NULL,
  `product` VARCHAR(45) NOT NULL,
  `provider_id` INT NOT NULL,
  PRIMARY KEY (`provider_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`extra_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`extra_information` (
  `order_number` INT NOT NULL,
  `info` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`order_number`),
  CONSTRAINT `Order_ExtraInfoFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `CRMPI`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`information_about_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`information_about_material` (
  `material_id` INT NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `diameter_of_the_strand` INT NOT NULL,
  PRIMARY KEY (`material_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`amount_of_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`amount_of_material` (
  `material_id` INT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`material_id`),
  CONSTRAINT `InfoAboutMaterail_AmountOfMaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `CRMPI`.`information_about_material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`request_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`request_material` (
  `material_id` INT NOT NULL,
  `request_number` INT NOT NULL,
  PRIMARY KEY (`material_id`, `request_number`),
  INDEX `Request_MaterialRequestFK_idx` (`request_number` ASC) VISIBLE,
  CONSTRAINT `AmountOfMaterial_RequestMaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `CRMPI`.`amount_of_material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Request_RequestMaterialFK`
    FOREIGN KEY (`request_number`)
    REFERENCES `CRMPI`.`request` (`request_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`store_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`store_material` (
  `material_id` INT NOT NULL,
  `amount` INT NOT NULL,
  PRIMARY KEY (`material_id`),
  CONSTRAINT `InfoAboutMaterial_StoreMaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `CRMPI`.`information_about_material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`provider_deliver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`provider_deliver` (
  `provider_id` INT NOT NULL,
  `contract_number` INT NOT NULL,
  PRIMARY KEY (`provider_id`, `contract_number`),
  INDEX `DeliveryProvider_DeliverFK_idx` (`contract_number` ASC) VISIBLE,
  CONSTRAINT `Provider_ProviderDeliverFK`
    FOREIGN KEY (`provider_id`)
    REFERENCES `CRMPI`.`provider` (`provider_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `Delivery_ProviderDeliverFK`
    FOREIGN KEY (`contract_number`)
    REFERENCES `CRMPI`.`delivery` (`contract_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `CRMPI`.`3d_model`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`3d_model` (`model_id`, `model_file`) VALUES (1, 'somewhere.txt');
INSERT INTO `CRMPI`.`3d_model` (`model_id`, `model_file`) VALUES (2, 'neverwhere.doc');
INSERT INTO `CRMPI`.`3d_model` (`model_id`, `model_file`) VALUES (3, 'extra.txt');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`client`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`client` (`surname`, `name`, `patronymic`, `telephone_number`, `email`, `client_id`) VALUES ('Борзых', 'Никита', 'Юрьевич', '+7-999-888-32-32', 'allyru@gmail.com', 1);
INSERT INTO `CRMPI`.`client` (`surname`, `name`, `patronymic`, `telephone_number`, `email`, `client_id`) VALUES ('Крилл', 'Кирилл', 'Кирильевич', '+7-000-111-22-33', 'shadyguy@mail.ru', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`order`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`order` (`status`, `order_number`, `price`, `client_id`, `model_id`, `short_description`, `date`) VALUES ('Обработка', 1, 1000.00, 1, 1, 'Клиенту номер один нужен 1 зеленый кролик', '2018.10.24');
INSERT INTO `CRMPI`.`order` (`status`, `order_number`, `price`, `client_id`, `model_id`, `short_description`, `date`) VALUES ('Заказ дополнительных материалов', 2, 2.00, 2, 2, 'Клиенту 2 нужен красный еж', '2018.10.20');
INSERT INTO `CRMPI`.`order` (`status`, `order_number`, `price`, `client_id`, `model_id`, `short_description`, `date`) VALUES ('Закончено', 3, 529.00, 2, 3, 'Клиенту 2 нужен зеленый пингвин', '2018.10.20');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`order_modification`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`order_modification` (`order_number`, `mark`) VALUES (1, 'Добавить уши зеленому кролику');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`material`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`material` (`type`, `color`, `material_id`) VALUES ('ABS пластик', 'Зеленый', 1);
INSERT INTO `CRMPI`.`material` (`type`, `color`, `material_id`) VALUES ('PLA пластик', 'Красный', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`order_material`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`order_material` (`order_number`, `material_id`) VALUES (1, 1);
INSERT INTO `CRMPI`.`order_material` (`order_number`, `material_id`) VALUES (2, 2);
INSERT INTO `CRMPI`.`order_material` (`order_number`, `material_id`) VALUES (3, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`employee` (`employee_id`, `surname`, `name`, `patronymic`, `status`) VALUES (2, 'Равилев', 'Равиль', 'Равильевич', 'Работник');
INSERT INTO `CRMPI`.`employee` (`employee_id`, `surname`, `name`, `patronymic`, `status`) VALUES (3, 'Радомиров', 'Радомир', 'Радомирович', 'Работник');
INSERT INTO `CRMPI`.`employee` (`employee_id`, `surname`, `name`, `patronymic`, `status`) VALUES (1, 'Михайлов', 'Михаил', 'Михайлович', 'Менеджер');
INSERT INTO `CRMPI`.`employee` (`employee_id`, `surname`, `name`, `patronymic`, `status`) VALUES (4, 'Святов', 'Святослав', 'Святославович', 'Снабженец');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`request`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`request` (`request_number`) VALUES (11);
INSERT INTO `CRMPI`.`request` (`request_number`) VALUES (22);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`request_employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`request_employee` (`employee_id`, `request_number`) VALUES (4, 11);
INSERT INTO `CRMPI`.`request_employee` (`employee_id`, `request_number`) VALUES (4, 22);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`order_employee`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`order_employee` (`order_number`, `employee_id`) VALUES (1, 1);
INSERT INTO `CRMPI`.`order_employee` (`order_number`, `employee_id`) VALUES (1, 2);
INSERT INTO `CRMPI`.`order_employee` (`order_number`, `employee_id`) VALUES (2, 1);
INSERT INTO `CRMPI`.`order_employee` (`order_number`, `employee_id`) VALUES (2, 3);
INSERT INTO `CRMPI`.`order_employee` (`order_number`, `employee_id`) VALUES (3, 1);
INSERT INTO `CRMPI`.`order_employee` (`order_number`, `employee_id`) VALUES (3, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`access`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`access` (`employee_id`, `login`, `password`) VALUES (1, 'num1', '012345');
INSERT INTO `CRMPI`.`access` (`employee_id`, `login`, `password`) VALUES (2, 'num2', '121212');
INSERT INTO `CRMPI`.`access` (`employee_id`, `login`, `password`) VALUES (3, 'num3', '123123');
INSERT INTO `CRMPI`.`access` (`employee_id`, `login`, `password`) VALUES (4, 'num4', '12341234');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`delivery`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`delivery` (`supplier_id`, `contract_number`) VALUES (4, 1);
INSERT INTO `CRMPI`.`delivery` (`supplier_id`, `contract_number`) VALUES (4, 2);
INSERT INTO `CRMPI`.`delivery` (`supplier_id`, `contract_number`) VALUES (4, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`provider`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`provider` (`company_name`, `product`, `provider_id`) VALUES ('Компания Номер Один в России', 'PLA пластик', 1);
INSERT INTO `CRMPI`.`provider` (`company_name`, `product`, `provider_id`) VALUES ('Днепропетровский пластик', 'ABS пластик', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`extra_information`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`extra_information` (`order_number`, `info`) VALUES (1, 'Сформировать кролика');
INSERT INTO `CRMPI`.`extra_information` (`order_number`, `info`) VALUES (2, 'Сформировать ежа после получения материалов');

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`information_about_material`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`information_about_material` (`material_id`, `color`, `type`, `diameter_of_the_strand`) VALUES (7, 'Синий', 'PVA пластик', 17);
INSERT INTO `CRMPI`.`information_about_material` (`material_id`, `color`, `type`, `diameter_of_the_strand`) VALUES (8, 'Оранжевый', 'Нейлон', 18);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`amount_of_material`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`amount_of_material` (`material_id`, `amount`) VALUES (7, 111);
INSERT INTO `CRMPI`.`amount_of_material` (`material_id`, `amount`) VALUES (8, 222);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`request_material`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`request_material` (`material_id`, `request_number`) VALUES (7, 11);
INSERT INTO `CRMPI`.`request_material` (`material_id`, `request_number`) VALUES (8, 22);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`store_material`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`store_material` (`material_id`, `amount`) VALUES (7, 77);
INSERT INTO `CRMPI`.`store_material` (`material_id`, `amount`) VALUES (8, 88);

COMMIT;


-- -----------------------------------------------------
-- Data for table `CRMPI`.`provider_deliver`
-- -----------------------------------------------------
START TRANSACTION;
USE `CRMPI`;
INSERT INTO `CRMPI`.`provider_deliver` (`provider_id`, `contract_number`) VALUES (1, 1);
INSERT INTO `CRMPI`.`provider_deliver` (`provider_id`, `contract_number`) VALUES (2, 2);
INSERT INTO `CRMPI`.`provider_deliver` (`provider_id`, `contract_number`) VALUES (1, 3);

COMMIT;

