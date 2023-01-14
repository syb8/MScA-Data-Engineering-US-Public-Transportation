SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ALLOW_INVALID_DATES';
SET SQL_SAFE_UPDATES=0; 

CREATE SCHEMA IF NOT EXISTS `APTA` DEFAULT CHARACTER SET utf8mb4 ;
USE `APTA` ;

CREATE TABLE IF NOT EXISTS `APTA`.`Agency` (
	`NTD_ID` VARCHAR(200) NOT NULL,
    `AgencyName` VARCHAR(200) NOT NULL,
    `City` VARCHAR(200) NOT NULL,
    `State` VARCHAR(200) NOT NULL,
    `OrganizationType` VARCHAR(200) NOT NULL,
    `ReporterType` VARCHAR(200) NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`NTD_ID`)
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `APTA`.`AgencyStats` (
	`NTD_ID` VARCHAR(200) NOT NULL,
    `AgencyStats_ID` INT NOT NULL AUTO_INCREMENT,
    `PrimaryUZAPopulation` INT NOT NULL,
    `AgencyVOMS` VARCHAR(200) NOT NULL,
    `Year` INT NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`AgencyStats_ID`),
    CONSTRAINT `fk_AgencyStats_Agency` FOREIGN KEY (`NTD_ID`)
        REFERENCES `APTA`.`Agency` (`NTD_ID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `APTA`.`Opex` (
	`NTD_ID` VARCHAR(200) NOT NULL,
    `Opex_ID` INT NOT NULL AUTO_INCREMENT,
    `OpexType` VARCHAR(200) NOT NULL,
    `OpexAmount` BIGINT NULL,
    `Year` INT NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`Opex_ID`),
    CONSTRAINT `fk_Opex_Agency` FOREIGN KEY (`NTD_ID`)
        REFERENCES `APTA`.`Agency` (`NTD_ID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `APTA`.`Capex` (
	`NTD_ID` VARCHAR(200) NOT NULL,
	`Capex_ID` INT NOT NULL AUTO_INCREMENT,
    `CapexType` VARCHAR(200) NOT NULL,
    `CapexAmount` BIGINT NULL,
    `Year` INT NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`Capex_ID`),
    CONSTRAINT `fk_Capex_Agency` FOREIGN KEY (`NTD_ID`)
        REFERENCES `APTA`.`Agency` (`NTD_ID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `APTA`.`Funding` (
	`NTD_ID` VARCHAR(200) NOT NULL,
    `Funding_ID` INT NOT NULL AUTO_INCREMENT,
    `FundingType` VARCHAR(200) NOT NULL,
    `FundingAmount` BIGINT NULL,
    `Year` INT NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`Funding_ID`),
    CONSTRAINT `fk_Funding_Agency` FOREIGN KEY (`NTD_ID`)
        REFERENCES `APTA`.`Agency` (`NTD_ID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `APTA`.`LaborHours` (
	`NTD_ID` VARCHAR(200) NOT NULL,
    `LaborHours_ID` INT NOT NULL AUTO_INCREMENT,
    `LaborHoursType` VARCHAR(200) NOT NULL,
    `LaborHoursAmount` INT NULL,
    `Year` INT NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`LaborHours_ID`),
    CONSTRAINT `fk_LaborHours_Agency` FOREIGN KEY (`NTD_ID`)
        REFERENCES `APTA`.`Agency` (`NTD_ID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `APTA`.`Headcount` (
	`NTD_ID` VARCHAR(200) NOT NULL,
    `Headcount_ID` INT NOT NULL AUTO_INCREMENT,
    `HeadcountType` VARCHAR(200) NOT NULL,
    `HeadcountAmount` INT NULL,
    `Year` INT NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`Headcount_ID`),
    CONSTRAINT `fk_Headcount_Agency` FOREIGN KEY (`NTD_ID`)
        REFERENCES `APTA`.`Agency` (`NTD_ID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `APTA`.`HourlyWages` (
	`NTD_ID` VARCHAR(200) NOT NULL,
	`HourlyWages_ID` INT NOT NULL AUTO_INCREMENT,
    `HourlyWagesType` VARCHAR(200) NOT NULL,
    `HourlyWagesAmount` INT NULL,
    `Year` INT NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`HourlyWages_ID`),
    CONSTRAINT `fk_HourlyWages_Agency` FOREIGN KEY (`NTD_ID`)
        REFERENCES `APTA`.`Agency` (`NTD_ID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

CREATE TABLE IF NOT EXISTS `APTA`.`FuelEnergy` (
	`NTD_ID` VARCHAR(200) NOT NULL,
    `FuelEnergy_ID` INT NOT NULL AUTO_INCREMENT,
    `Vehicle_ID` INT NOT NULL,
    `VehicleMode` VARCHAR(200) NOT NULL,
    `VehicleCount` INT NOT NULL,
    `FuelEnergyType` VARCHAR(200) NOT NULL,
    `FuelEnergyUse_gal` INT NULL,
    `FuelEnergyUse_kwh` INT NULL,
    `MilesTraveled` INT NULL,
    `Year` INT NOT NULL,
    `Last_Update` TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    PRIMARY KEY (`FuelEnergy_ID`),
    CONSTRAINT `fk_FuelEnergy_Agency` FOREIGN KEY (`NTD_ID`)
        REFERENCES `APTA`.`Agency` (`NTD_ID`)
        ON DELETE NO ACTION ON UPDATE NO ACTION
)  ENGINE=INNODB DEFAULT CHARACTER SET=utf8mb4;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;