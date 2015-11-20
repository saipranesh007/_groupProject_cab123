SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `uber` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `uber` ;

-- -----------------------------------------------------
-- Table `uber`.`Driver`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uber`.`Driver` (
  `DriverID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Address` VARCHAR(80) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZipCode` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(80) NULL,
  `CarType` VARCHAR(45) NULL,
  `isActive` INT NOT NULL,
  `Latitude` DECIMAL(10,8) NOT NULL,
  `Longitude` DECIMAL(11,8) NOT NULL,
  PRIMARY KEY (`DriverID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uber`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uber`.`Customer` (
  `CustomerID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Address` VARCHAR(80) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZipCode` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(80) NULL,
  `CreditCard` VARCHAR(45) NULL,
  `isActive` INT NOT NULL,
  `Latitude` DECIMAL(10,8) NOT NULL,
  `Longitude` DECIMAL(11,8) NOT NULL,
  PRIMARY KEY (`CustomerID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uber`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uber`.`Admin` (
  `AdminID` INT NOT NULL,
  `FirstName` VARCHAR(45) NULL,
  `LastName` VARCHAR(45) NULL,
  `Address` VARCHAR(80) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `ZipCode` VARCHAR(45) NULL,
  `PhoneNumber` VARCHAR(45) NULL,
  `Email` VARCHAR(80) NULL,
  PRIMARY KEY (`AdminID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uber`.`Bills`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uber`.`Bills` (
  `BillingID` INT NOT NULL,
  `Date` DATETIME NULL,
  `PickupTime` TIMESTAMP NULL,
  `DropoffTime` TIMESTAMP NULL,
  `Distance` INT NULL,
  `Amount` FLOAT NULL,
  `SrcLocation` VARCHAR(45) NULL,
  `SrcLatitude` DECIMAL(10,8) NOT NULL,
  `SrcLongitude` DECIMAL(11,8) NOT NULL,
  `DestLatitude` DECIMAL(10,8) NOT NULL,
  `DestLongitude` DECIMAL(11,8) NOT NULL,
  `DriverID` INT NULL,
  `CustomerID` INT NULL,
  `isActive` INT NOT NULL,
  PRIMARY KEY (`BillingID`),
  INDEX `DriverID_idx` (`DriverID` ASC),
  INDEX `CustomerID_idx` (`CustomerID` ASC),
  CONSTRAINT `DriverID`
    FOREIGN KEY (`DriverID`)
    REFERENCES `uber`.`Driver` (`DriverID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `CustomerID`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `uber`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uber`.`Rides`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uber`.`Rides` (
  `RideID` INT NOT NULL,
  `PickupLocation` VARCHAR(45) NULL,
  `DropoffLocation` VARCHAR(45) NULL,
  `PickupLatitude` DECIMAL(10,8) NOT NULL,
  `PickupLongitude` DECIMAL(11,8) NOT NULL,
  `DropoffLatitude` DECIMAL(10,8) NOT NULL,
  `DropoffLongitude` DECIMAL(11,8) NOT NULL,
  `RideDate` DATETIME NULL,
  `CustomerID` INT NULL,
  `DriverID` INT NULL,
  `isActive` INT NOT NULL,
  PRIMARY KEY (`RideID`),
  INDEX `CustomerID_idx` (`CustomerID` ASC),
  INDEX `DriverID_idx` (`DriverID` ASC),
  CONSTRAINT `CustomerIDRides`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `uber`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `DriverIDRides`
    FOREIGN KEY (`DriverID`)
    REFERENCES `uber`.`Driver` (`DriverID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uber`.`CustomerReviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uber`.`CustomerReviews` (
  `CustomerID` INT NOT NULL,
  `ReviewerID` INT NOT NULL,
  `Rating` INT NULL,
  `Review` VARCHAR(100) NULL,
  PRIMARY KEY (`CustomerID`, `ReviewerID`),
  INDEX `ReviewerID_idx` (`ReviewerID` ASC),
  CONSTRAINT `CustomerIDCustomerReview`
    FOREIGN KEY (`CustomerID`)
    REFERENCES `uber`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ReviewerIDCustomerReview`
    FOREIGN KEY (`ReviewerID`)
    REFERENCES `uber`.`Driver` (`DriverID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `uber`.`DriverReviews`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `uber`.`DriverReviews` (
  `DriverID` INT NOT NULL,
  `ReviewerID` INT NOT NULL,
  `Rating` INT NULL,
  `Review` VARCHAR(100) NULL,
  PRIMARY KEY (`DriverID`, `ReviewerID`),
  INDEX `ReviewerID_idx` (`ReviewerID` ASC),
  CONSTRAINT `DriverIDDriverReview`
    FOREIGN KEY (`DriverID`)
    REFERENCES `uber`.`Driver` (`DriverID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `ReviewerIDDriverReview`
    FOREIGN KEY (`ReviewerID`)
    REFERENCES `uber`.`Customer` (`CustomerID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
