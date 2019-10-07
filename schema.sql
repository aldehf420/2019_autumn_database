-- MySQL Script generated by MySQL Workbench
-- Mon Oct  7 20:18:11 2019
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Movie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Movie` (
  `Movie_number` INT NOT NULL,
  `Movie_name` VARCHAR(45) NULL DEFAULT NULL,
  `Movie_accumulation` INT NULL DEFAULT NULL COMMENT '현재까지 누적관객수',
  `Movie_day` INT NULL DEFAULT NULL COMMENT '일일관객수',
  `Movie_open` DATETIME NULL DEFAULT NULL COMMENT '영화개봉일\\n',
  `Movie_close` DATETIME NULL DEFAULT NULL COMMENT '영화 상영종료일',
  `Movie_runningtime` INT NULL DEFAULT NULL COMMENT '영화 러닝타임',
  PRIMARY KEY (`Movie_number`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Reservation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Reservation` (
  `reservation_code` VARCHAR(30) NOT NULL,
  `Movie_Movie_number` INT NOT NULL,
  PRIMARY KEY (`reservation_code`),
  INDEX `fk_Reservation_Movie1_idx` (`Movie_Movie_number` ASC) VISIBLE,
  CONSTRAINT `fk_Reservation_Movie1`
    FOREIGN KEY (`Movie_Movie_number`)
    REFERENCES `mydb`.`Movie` (`Movie_number`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer` (
  `user_id` VARCHAR(20) NOT NULL,
  `user_pw` VARCHAR(20) NOT NULL,
  `signup_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `user_idnum` INT NOT NULL AUTO_INCREMENT,
  `mileage` INT NULL DEFAULT 0,
  `class` INT NULL DEFAULT 0,
  `user_email` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`user_idnum`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer_privacy`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer_privacy` (
  `Customer_user_idnum` INT NOT NULL,
  `user_firstname` CHAR(10) NOT NULL,
  `user_lastname` CHAR(10) NOT NULL,
  `user_birthday` DATE NOT NULL,
  `user_phone_number` CHAR(13) NOT NULL,
  `user_sex` BINARY NOT NULL,
  `user_address_do` CHAR(10) NULL,
  `user_address_si` CHAR(10) NULL,
  `user_address_gu` CHAR(10) NULL,
  `user_address_ro` CHAR(10) NULL,
  INDEX `fk_Customer_privacy_Customer1_idx` (`Customer_user_idnum` ASC) VISIBLE,
  CONSTRAINT `fk_Customer_privacy_Customer1`
    FOREIGN KEY (`Customer_user_idnum`)
    REFERENCES `mydb`.`Customer` (`user_idnum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customer_Purchase_History`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customer_Purchase_History` (
  `Customer_user_idnum` INT NOT NULL,
  `purchase_date` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `Customer_Purchase_number` INT NOT NULL,
  INDEX `fk_Customer_Purchase_History_Customer_idx` (`Customer_user_idnum` ASC) VISIBLE,
  PRIMARY KEY (`Customer_Purchase_number`),
  CONSTRAINT `fk_Customer_Purchase_History_Customer`
    FOREIGN KEY (`Customer_user_idnum`)
    REFERENCES `mydb`.`Customer` (`user_idnum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Food`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Food` (
  `Food_id` INT NOT NULL,
  `Food_name` VARCHAR(45) NULL DEFAULT NULL,
  `Stock` INT NULL DEFAULT NULL COMMENT '현재 남은 재고',
  `Shelf_life` DATETIME NULL DEFAULT NULL COMMENT '유통기한',
  `Price` INT NULL DEFAULT NULL,
  PRIMARY KEY (`Food_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Branch_Office`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Branch_Office` (
  `ID` INT NOT NULL,
  `Location` VARCHAR(45) NULL DEFAULT NULL,
  `Location_map` VARCHAR(45) NULL DEFAULT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `PhoneNumber` VARCHAR(45) NULL DEFAULT NULL,
  `NumScreen` VARCHAR(45) NULL DEFAULT NULL,
  `NumEmployee` VARCHAR(45) NULL DEFAULT NULL,
  `Manager` VARCHAR(45) NULL DEFAULT NULL,
  `Notice` VARCHAR(45) NULL DEFAULT NULL,
  `Parking` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Employee`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Employee` (
  `Id` INT NOT NULL,
  `Phone_number` VARCHAR(45) NULL DEFAULT NULL,
  `Name` VARCHAR(45) NULL DEFAULT NULL,
  `Address` VARCHAR(45) NULL DEFAULT NULL,
  `Department` VARCHAR(45) NULL DEFAULT NULL,
  `Position` VARCHAR(45) NULL DEFAULT NULL,
  `Salary` INT NULL DEFAULT NULL,
  `Sex` VARCHAR(45) NULL DEFAULT NULL,
  `Hire_date` DATETIME NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`Id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Event`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Event` (
  `event_id` INT NOT NULL,
  `title` VARCHAR(45) NULL DEFAULT NULL,
  `term` VARCHAR(45) NULL DEFAULT NULL,
  `descrition` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`event_id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
