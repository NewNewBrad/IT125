-- MySQL Script generated by MySQL Workbench
-- Tue Nov 14 23:49:46 2017
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema Bar_Inventory
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `Bar_Inventory` ;

-- -----------------------------------------------------
-- Schema Bar_Inventory
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Bar_Inventory` DEFAULT CHARACTER SET utf8 ;
USE `Bar_Inventory` ;

-- -----------------------------------------------------
-- Table `Bar_Inventory`.`Distribution`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bar_Inventory`.`Distribution` (
  `DistId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(80) NOT NULL,
  `Address` VARCHAR(45) NOT NULL,
  `City` VARCHAR(20) NOT NULL,
  `State` VARCHAR(20) NOT NULL,
  `ZipCode` CHAR(8) NOT NULL,
  `Phone` CHAR(20) NOT NULL,
  `Email` VARCHAR(100) NULL,
  PRIMARY KEY (`DistId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bar_Inventory`.`SalesRep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bar_Inventory`.`SalesRep` (
  `RepId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(60) NOT NULL,
  `Phone` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(60) NULL,
  PRIMARY KEY (`RepId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bar_Inventory`.`DistroRep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bar_Inventory`.`DistroRep` (
  `DistId` INT NOT NULL,
  `RepId` INT NOT NULL,
  `DateStarted` DATE NULL,
  `DateLeft` DATE NULL,
  PRIMARY KEY (`DistId`, `RepId`),
  INDEX `fk_Distribution_has_SalesRep_SalesRep1_idx` (`RepId` ASC),
  INDEX `fk_Distribution_has_SalesRep_Distribution_idx` (`DistId` ASC),
  CONSTRAINT `fk_Distribution_has_SalesRep_Distribution`
    FOREIGN KEY (`DistId`)
    REFERENCES `Bar_Inventory`.`Distribution` (`DistId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Distribution_has_SalesRep_SalesRep1`
    FOREIGN KEY (`RepId`)
    REFERENCES `Bar_Inventory`.`SalesRep` (`RepId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bar_Inventory`.`Alcohol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bar_Inventory`.`Alcohol` (
  `AlcoholId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(45) NOT NULL,
  `Type` VARCHAR(45) NULL,
  `Size` VARCHAR(10) NOT NULL,
  `PPU` DECIMAL(6,2) NULL,
  `DistId` INT NOT NULL,
  `RepId` INT NOT NULL,
  PRIMARY KEY (`AlcoholId`),
  INDEX `fk_Alcohol_DistroRep1_idx` (`DistId` ASC, `RepId` ASC),
  CONSTRAINT `fk_Alcohol_DistroRep1`
    FOREIGN KEY (`DistId` , `RepId`)
    REFERENCES `Bar_Inventory`.`DistroRep` (`DistId` , `RepId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bar_Inventory`.`DryGoods`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bar_Inventory`.`DryGoods` (
  `DryId` INT NOT NULL AUTO_INCREMENT,
  `Name` VARCHAR(80) NOT NULL,
  `Description` VARCHAR(45) NULL,
  `PPU` DECIMAL(6,2) NULL,
  `DistId` INT NOT NULL,
  `RepId` INT NOT NULL,
  PRIMARY KEY (`DryId`),
  INDEX `fk_DryGoods_DistroRep1_idx` (`DistId` ASC, `RepId` ASC),
  CONSTRAINT `fk_DryGoods_DistroRep1`
    FOREIGN KEY (`DistId` , `RepId`)
    REFERENCES `Bar_Inventory`.`DistroRep` (`DistId` , `RepId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Bar_Inventory`.`Glassware`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bar_Inventory`.`Glassware` (
  `GlassId` INT NOT NULL AUTO_INCREMENT,
  `Style` VARCHAR(45) NULL,
  `PPU` DECIMAL(6,2) NULL,
  `DistId` INT NOT NULL,
  `RepId` INT NOT NULL,
  PRIMARY KEY (`GlassId`),
  INDEX `fk_Glassware_DistroRep1_idx` (`DistId` ASC, `RepId` ASC),
  CONSTRAINT `fk_Glassware_DistroRep1`
    FOREIGN KEY (`DistId` , `RepId`)
    REFERENCES `Bar_Inventory`.`DistroRep` (`DistId` , `RepId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
