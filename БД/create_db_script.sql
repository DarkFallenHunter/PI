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
  PRIMARY KEY (`order_number`),
  INDEX `idmodel_idx` (`model_id` ASC) VISIBLE,
  INDEX `idclient_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `ModelOrderFK`
    FOREIGN KEY (`model_id`)
    REFERENCES `CRMPI`.`3d_model` (`model_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CloeintOrderFK`
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
  CONSTRAINT `OrderModificationFK`
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
  INDEX `material_materialorderFK_idx` (`material_id` ASC) VISIBLE,
  CONSTRAINT `OrderOrdermaterialFK`
    FOREIGN KEY (`order_number`)
    REFERENCES `CRMPI`.`order` (`order_number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MaterialOrdermaterialFK`
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
  INDEX `request_employeerequestFK_idx` (`request_number` ASC) VISIBLE,
  CONSTRAINT `EmployeeRequestemployeeFK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `CRMPI`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `RequestRequestempoyeeFK`
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
  INDEX `employee_orderemployeeFK_idx` (`employee_id` ASC) VISIBLE,
  CONSTRAINT `EmployeeOrderemployeeFK`
    FOREIGN KEY (`employee_id`)
    REFERENCES `CRMPI`.`employee` (`employee_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderOrderemployeeFK`
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
  CONSTRAINT `EmployeeAccessFK`
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
  CONSTRAINT `EmpoyeeDeliveryFK`
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
  CONSTRAINT `OrderExtrainfoFK`
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
  CONSTRAINT `InfoaboutmaterailAmountofmaterialFK`
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
  INDEX `request_materialrequestFK_idx` (`request_number` ASC) VISIBLE,
  CONSTRAINT `AmounrodmaterialRequestmaterialFK`
    FOREIGN KEY (`material_id`)
    REFERENCES `CRMPI`.`amount_of_material` (`material_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `RequestRequestmaterialFK`
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
  CONSTRAINT `InfoaboutmaterialStorematerialFK`
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
  INDEX `deliveryprovider_deliverFK_idx` (`contract_number` ASC) VISIBLE,
  CONSTRAINT `ProviderProviderdeliverFK`
    FOREIGN KEY (`provider_id`)
    REFERENCES `CRMPI`.`provider` (`provider_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DeliveryProviderdeliverFK`
    FOREIGN KEY (`contract_number`)
    REFERENCES `CRMPI`.`delivery` (`contract_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
