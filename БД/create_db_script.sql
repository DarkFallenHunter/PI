-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema crmpi
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema crmpi
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `crmpi` DEFAULT CHARACTER SET utf8 ;
USE `crmpi` ;

-- -----------------------------------------------------
-- Table `crmpi`.`3d_model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`3d_model` (
  `model_id` INT(11) NOT NULL,
  `model_file` VARCHAR(90) NOT NULL,
  PRIMARY KEY (`model_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`occupation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`occupation` (
  `occupation_id` INT(11) NOT NULL,
  `occupation_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`occupation_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`employee` (
  `employee_id` INT(11) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `patronymic` VARCHAR(45) NOT NULL,
  `status` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`),
  INDEX `Occupation_EmployeeFK_idx` (`status` ASC) VISIBLE,
  CONSTRAINT `Occupation_EmployeeFK`
    FOREIGN KEY (`status`)
    REFERENCES `crmpi`.`occupation` (`occupation_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`access`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`access` (
  `employee_id` INT(11) NOT NULL,
  `login` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`employee_id`),
  CONSTRAINT `Employee_AccessFK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `crmpi`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`information_about_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`information_about_material` (
  `material_id` INT(11) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `diameter_of_the_strand` INT(11) NOT NULL,
  PRIMARY KEY (`material_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`amount_of_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`amount_of_material` (
  `material_id` INT(11) NOT NULL,
  `amount` INT(11) NOT NULL,
  PRIMARY KEY (`material_id`),
  CONSTRAINT `InfoAboutMaterail_AmountOfMaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `crmpi`.`information_about_material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`client` (
  `surname` VARCHAR(30) NOT NULL,
  `name` VARCHAR(30) NOT NULL,
  `patronymic` VARCHAR(45) NOT NULL,
  `telephone_number` VARCHAR(16) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `client_id` INT(11) NOT NULL,
  PRIMARY KEY (`client_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`delivery` (
  `supplier_id` INT(11) NOT NULL,
  `contract_number` INT(11) NOT NULL,
  PRIMARY KEY (`contract_number`),
  INDEX `Empoyee_DeliveryFK` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `Empoyee_DeliveryFK`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `crmpi`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`statuses`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`statuses` (
  `status_id` INT(11) NOT NULL,
  `status_name` VARCHAR(75) NOT NULL,
  PRIMARY KEY (`status_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`order` (
  `status` INT(11) NOT NULL,
  `order_number` INT(11) NOT NULL,
  `price` DECIMAL(8,2) NOT NULL,
  `client_id` INT(11) NOT NULL,
  `model_id` INT(11) NOT NULL,
  `short_description` VARCHAR(100) NOT NULL,
  `date` DATE NOT NULL,
  PRIMARY KEY (`order_number`),
  INDEX `idmodel_idx` (`model_id` ASC) VISIBLE,
  INDEX `idclient_idx` (`client_id` ASC) VISIBLE,
  INDEX `Statuses_OrderFK_idx` (`status` ASC) VISIBLE,
  CONSTRAINT `Client_OrderFK`
    FOREIGN KEY (`client_id`)
    REFERENCES `crmpi`.`client` (`client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Model_OrderFK`
    FOREIGN KEY (`model_id`)
    REFERENCES `crmpi`.`3d_model` (`model_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Statuses_OrderFK`
    FOREIGN KEY (`status`)
    REFERENCES `crmpi`.`statuses` (`status_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`extra_information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`extra_information` (
  `order_number` INT(11) NOT NULL,
  `info` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`order_number`),
  CONSTRAINT `Order_ExtraInfoFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `crmpi`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`material` (
  `type` VARCHAR(45) NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  `material_id` INT(11) NOT NULL,
  PRIMARY KEY (`material_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`order_employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`order_employee` (
  `order_number` INT(11) NOT NULL,
  `employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_number`, `employee_id`),
  INDEX `Employee_OrderEmployeeFK_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `Employee_OrderEmployeeFK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `crmpi`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Order_OrderEmployeeFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `crmpi`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`order_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`order_material` (
  `order_number` INT(11) NOT NULL,
  `material_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_number`, `material_id`),
  INDEX `Material_MaterialOrderFK_idx` (`material_id` ASC) VISIBLE,
  CONSTRAINT `Material_OrderMaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `crmpi`.`material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Order_OrderMaterialFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `crmpi`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`order_modification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`order_modification` (
  `order_number` INT(11) NOT NULL,
  `mark` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`order_number`),
  CONSTRAINT `Order_OrderMmodificationFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `crmpi`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`provider` (
  `company_name` VARCHAR(45) NOT NULL,
  `product` VARCHAR(45) NOT NULL,
  `provider_id` INT(11) NOT NULL,
  PRIMARY KEY (`provider_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`provider_deliver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`provider_deliver` (
  `provider_id` INT(11) NOT NULL,
  `contract_number` INT(11) NOT NULL,
  PRIMARY KEY (`provider_id`, `contract_number`),
  INDEX `DeliveryProvider_DeliverFK_idx` (`contract_number` ASC) VISIBLE,
  CONSTRAINT `Delivery_ProviderDeliverFK`
    FOREIGN KEY (`contract_number`)
    REFERENCES `crmpi`.`delivery` (`contract_number`),
  CONSTRAINT `Provider_ProviderDeliverFK`
    FOREIGN KEY (`provider_id`)
    REFERENCES `crmpi`.`provider` (`provider_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`rejected_orders`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`rejected_orders` (
  `order_number` INT(11) NOT NULL,
  `employee_id` INT(11) NOT NULL,
  PRIMARY KEY (`order_number`),
  CONSTRAINT `Orders_RegectedOrdersFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `crmpi`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`request` (
  `request_number` INT(11) NOT NULL,
  `start_date` DATE NOT NULL,
  `end_date` DATE NOT NULL,
  `order_number` INT(11) NOT NULL,
  PRIMARY KEY (`request_number`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`request_employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`request_employee` (
  `employee_id` INT(11) NOT NULL,
  `request_number` INT(11) NOT NULL,
  PRIMARY KEY (`employee_id`, `request_number`),
  INDEX `Request_EmployeeRequestFK_idx` (`request_number` ASC) VISIBLE,
  CONSTRAINT `Employee_RequestEmployeeFK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `crmpi`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Request_RequestEmployeeFK`
    FOREIGN KEY (`request_number`)
    REFERENCES `crmpi`.`request` (`request_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`request_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`request_material` (
  `material_id` INT(11) NOT NULL,
  `request_number` INT(11) NOT NULL,
  PRIMARY KEY (`material_id`, `request_number`),
  INDEX `Request_MaterialRequestFK_idx` (`request_number` ASC) VISIBLE,
  CONSTRAINT `AmountOfMaterial_RequestMaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `crmpi`.`amount_of_material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `Request_RequestMaterialFK`
    FOREIGN KEY (`request_number`)
    REFERENCES `crmpi`.`request` (`request_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `crmpi`.`store_material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `crmpi`.`store_material` (
  `material_id` INT(11) NOT NULL,
  `amount` INT(11) NOT NULL,
  PRIMARY KEY (`material_id`),
  CONSTRAINT `InfoAboutMaterial_StoreMaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `crmpi`.`information_about_material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
