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
-- Table `CRMPI`.`3D model`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`3D model` (
  `idModel` INT NOT NULL AUTO_INCREMENT,
  `Model file` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idModel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Client` (
  `Surname` VARCHAR(30) NOT NULL,
  `Name` VARCHAR(30) NOT NULL,
  `Отчество` VARCHAR(45) NOT NULL,
  `Telephone number` VARCHAR(16) NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `idClient` INT NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`idClient`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Order` (
  `Status of the order` VARCHAR(45) NOT NULL,
  `Order number` INT NOT NULL AUTO_INCREMENT,
  `Price` DECIMAL(8,2) NOT NULL,
  `idClient` INT NOT NULL,
  `idModel` INT NOT NULL,
  `Short description` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`Order number`),
  INDEX `idМодели_idx` (`idModel` ASC) VISIBLE,
  INDEX `idКлиента_idx` (`idClient` ASC) VISIBLE,
  CONSTRAINT `ModelOrderFK`
    FOREIGN KEY (`idModel`)
    REFERENCES `CRMPI`.`3D model` (`idModel`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `CloeintOrderFK`
    FOREIGN KEY (`idClient`)
    REFERENCES `CRMPI`.`Client` (`idClient`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Order modification`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Order modification` (
  `Order number` INT NOT NULL AUTO_INCREMENT,
  `What needs a modification` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`Order number`),
  CONSTRAINT `OrderModificationFK`
    FOREIGN KEY (`Order number`)
    REFERENCES `CRMPI`.`Order` (`Order number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Material` (
  `Type` VARCHAR(45) NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `idMaterial` INT NOT NULL,
  PRIMARY KEY (`idMaterial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Order material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Order material` (
  `Order number` INT NOT NULL,
  `idMaterial` INT NOT NULL,
  PRIMARY KEY (`Order number`, `idMaterial`),
  INDEX `МатериалМатериалзаказаFK_idx` (`idMaterial` ASC) VISIBLE,
  CONSTRAINT `OrderOrdermaterialFK`
    FOREIGN KEY (`Order number`)
    REFERENCES `CRMPI`.`Order` (`Order number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `MaterialOrdermaterialFK`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `CRMPI`.`Material` (`idMaterial`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Employee` (
  `idEmployee` INT NOT NULL,
  `Surname` VARCHAR(45) NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Middle name` VARCHAR(45) NOT NULL,
  `Status` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmployee`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Request`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Request` (
  `Request number` INT NOT NULL,
  PRIMARY KEY (`Request number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Request employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Request employee` (
  `idEmployee` INT NOT NULL,
  `Request number` INT NOT NULL,
  PRIMARY KEY (`idEmployee`, `Request number`),
  INDEX `ЗаявкаСотрзаявкиFK_idx` (`Request number` ASC) VISIBLE,
  CONSTRAINT `EmployeeRequestemployeeFK`
    FOREIGN KEY (`idEmployee`)
    REFERENCES `CRMPI`.`Employee` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `RequestRequestempoyeeFK`
    FOREIGN KEY (`Request number`)
    REFERENCES `CRMPI`.`Request` (`Request number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Order employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Order employee` (
  `Order number` INT NOT NULL,
  `idEmployee` INT NOT NULL,
  PRIMARY KEY (`Order number`, `idEmployee`),
  INDEX `СотрудникиСотрузаказаFK_idx` (`idEmployee` ASC) VISIBLE,
  CONSTRAINT `EmployeeOrderemployeeFK`
    FOREIGN KEY (`idEmployee`)
    REFERENCES `CRMPI`.`Employee` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `OrderOrderemployeeFK`
    FOREIGN KEY (`Order number`)
    REFERENCES `CRMPI`.`Order` (`Order number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Access`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Access` (
  `idEmployee` INT NOT NULL,
  `Login` VARCHAR(45) NOT NULL,
  `Password` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idEmployee`),
  CONSTRAINT `EmployeeAccessFK`
    FOREIGN KEY (`idEmployee`)
    REFERENCES `CRMPI`.`Employee` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Provider`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Provider` (
  `Company name` VARCHAR(45) NOT NULL,
  `Product` VARCHAR(45) NOT NULL,
  `idProvider` INT NOT NULL,
  PRIMARY KEY (`idProvider`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Delivery`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Delivery` (
  `idSupplier` INT NOT NULL,
  `idProvider` INT NOT NULL,
  `Contract number` INT NOT NULL,
  PRIMARY KEY (`idSupplier`, `idProvider`),
  INDEX `ПоставщикПоставкиFK_idx` (`idProvider` ASC) VISIBLE,
  CONSTRAINT `ProviderDeliveryFK`
    FOREIGN KEY (`idProvider`)
    REFERENCES `CRMPI`.`Provider` (`idProvider`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `EmpoyeeDeliveryFK`
    FOREIGN KEY (`idSupplier`)
    REFERENCES `CRMPI`.`Employee` (`idEmployee`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Extra information`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Extra information` (
  `idOrder` INT NOT NULL,
  `Extra information about the order` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idOrder`),
  CONSTRAINT `OrderExtrainfoFK`
    FOREIGN KEY (`idOrder`)
    REFERENCES `CRMPI`.`Order` (`Order number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Infomation about materials`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Infomation about materials` (
  `idMaterial` INT NOT NULL,
  `Color` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NOT NULL,
  `Diameter of the strand` INT NOT NULL,
  PRIMARY KEY (`idMaterial`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Amount of material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Amount of material` (
  `idMaterial` INT NOT NULL,
  `Amount` INT NOT NULL,
  PRIMARY KEY (`idMaterial`),
  CONSTRAINT `InfoaboutmaterailAmountofmaterialFK`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `CRMPI`.`Infomation about materials` (`idMaterial`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Request material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Request material` (
  `idMaterial` INT NOT NULL,
  `Request number` INT NOT NULL,
  `Amount` INT NOT NULL,
  PRIMARY KEY (`idMaterial`, `Request number`),
  INDEX `ЗаявкаМатзаявкиFK_idx` (`Request number` ASC) VISIBLE,
  CONSTRAINT `AmounrodmaterialRequestmaterialFK`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `CRMPI`.`Amount of material` (`idMaterial`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `RequestRequestmaterialFK`
    FOREIGN KEY (`Request number`)
    REFERENCES `CRMPI`.`Request` (`Request number`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `CRMPI`.`Store material`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `CRMPI`.`Store material` (
  `idMaterial` INT NOT NULL,
  `Amount` INT NOT NULL,
  PRIMARY KEY (`idMaterial`),
  CONSTRAINT `InfoaboutmaterialStorematerialFK`
    FOREIGN KEY (`idMaterial`)
    REFERENCES `CRMPI`.`Infomation about materials` (`idMaterial`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
