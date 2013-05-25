SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `gymcontrol` DEFAULT CHARACTER SET utf8 ;
USE `gymcontrol` ;

-- -----------------------------------------------------
-- Table `gymcontrol`.`employees`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gymcontrol`.`employees` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(80) NOT NULL ,
  `phone` VARCHAR(11) NULL ,
  `cellphone` VARCHAR(45) NOT NULL ,
  `cpf` VARCHAR(45) NOT NULL ,
  `email` VARCHAR(60) NULL ,
  `street` VARCHAR(70) NULL ,
  `house_number` INT(6) NULL ,
  `neighborhood` VARCHAR(45) NULL ,
  `cep` CHAR(8) NULL ,
  `city` VARCHAR(45) NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gymcontrol`.`customer`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gymcontrol`.`customer` (
  `id` INT(9) UNSIGNED NOT NULL AUTO_INCREMENT ,
  `register` TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP ,
  `cpf` CHAR(11) NOT NULL ,
  `name` VARCHAR(80) NOT NULL ,
  `gender` ENUM('male','female') NOT NULL ,
  `birthday` DATE NULL ,
  `phone` VARCHAR(11) NULL ,
  `cellphone` VARCHAR(11) NOT NULL ,
  `email` VARCHAR(60) NOT NULL ,
  `street` VARCHAR(70) NULL ,
  `house_number` INT(6) NULL ,
  `neighborhood` VARCHAR(45) NULL ,
  `cep` CHAR(8) NULL ,
  `city` VARCHAR(45) NOT NULL ,
  `status` ENUM('active', 'inactive') NOT NULL DEFAULT 'inactive' ,
  `monthly_payment` DECIMAL(5,2) NOT NULL ,
  `maturity` INT(2) NOT NULL ,
  `notes` TEXT NULL ,
  PRIMARY KEY (`id`) ,
  UNIQUE INDEX `cpf_UNIQUE` (`cpf` ASC) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gymcontrol`.`payment`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gymcontrol`.`payment` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT ,
  `customer` INT(9) UNSIGNED NOT NULL ,
  `date` DATETIME NOT NULL ,
  `value` DECIMAL(5,2) NOT NULL DEFAULT 0 ,
  `description` VARCHAR(50) NULL ,
  `open` ENUM('yes','no') NOT NULL DEFAULT 'yes' ,
  PRIMARY KEY (`id`) ,
  INDEX `fgk_customer_idx` (`customer` ASC) ,
  CONSTRAINT `fgk_customer`
    FOREIGN KEY (`customer` )
    REFERENCES `gymcontrol`.`customer` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `gymcontrol`.`user`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `gymcontrol`.`user` (
  `employees` INT UNSIGNED NOT NULL ,
  `password` BINARY(20) NULL ,
  INDEX `fgk_employess_idx` (`employees` ASC) ,
  PRIMARY KEY (`employees`) ,
  CONSTRAINT `fgk_employess`
    FOREIGN KEY (`employees` )
    REFERENCES `gymcontrol`.`employees` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `gymcontrol` ;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
