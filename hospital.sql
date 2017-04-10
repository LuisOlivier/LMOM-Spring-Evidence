-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema hospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `hospital` DEFAULT CHARACTER SET utf8 ;
USE `hospital` ;

-- -----------------------------------------------------
-- Table `hospital`.`paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`paciente` (
  `Id_Paciente` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Ap_Paterno` VARCHAR(50) NULL DEFAULT NULL,
  `Ap_Materno` VARCHAR(50) NULL DEFAULT NULL,
  `Telefono` INT(15) NULL DEFAULT NULL,
  `Correo` VARCHAR(50) NULL DEFAULT NULL,
  `Direccion` VARCHAR(250) NULL DEFAULT NULL,
  `NSS` VARCHAR(50) NULL DEFAULT NULL,
  `Sexo` VARCHAR(50) NULL DEFAULT NULL,
  `Tipo_Sangre` VARCHAR(50) NULL DEFAULT NULL,
  `Alergia` VARCHAR(250) NULL DEFAULT NULL,
  `Fecha_Nacimiento` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Paciente`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`consultorio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`consultorio` (
  `Id_Consultorio` INT(10) NOT NULL AUTO_INCREMENT,
  `Pizo` INT(10) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Consultorio`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`departamento` (
  `Id_Depto` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Descripcion` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Depto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`especialidad`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`especialidad` (
  `Id_Especialidad` INT(10) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Id_Depto` INT(10) NOT NULL,
  PRIMARY KEY (`Id_Especialidad`),
  INDEX `FKEspecialid773842` (`Id_Depto` ASC),
  CONSTRAINT `FKEspecialid773842`
    FOREIGN KEY (`Id_Depto`)
    REFERENCES `hospital`.`departamento` (`Id_Depto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`medico` (
  `Id_Medico` INT(11) NOT NULL AUTO_INCREMENT,
  `Nombre` VARCHAR(50) NULL DEFAULT NULL,
  `Ap_Paterno` VARCHAR(50) NULL DEFAULT NULL,
  `Ap_Materno` VARCHAR(50) NULL DEFAULT NULL,
  `Direccion` VARCHAR(250) NULL DEFAULT NULL,
  `Telefono` INT(15) NULL DEFAULT NULL,
  `Correo` VARCHAR(50) NULL DEFAULT NULL,
  `Id_Especialidad` INT(10) NOT NULL,
  `Cedula` VARCHAR(50) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Medico`),
  INDEX `FKMedico501689` (`Id_Especialidad` ASC),
  CONSTRAINT `FKMedico501689`
    FOREIGN KEY (`Id_Especialidad`)
    REFERENCES `hospital`.`especialidad` (`Id_Especialidad`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`cita` (
  `Id_Cita` INT(10) NOT NULL AUTO_INCREMENT,
  `Fecha` VARCHAR(50) NULL DEFAULT NULL,
  `Hora` VARCHAR(50) NULL DEFAULT NULL,
  `Id_Paciente` INT(10) NOT NULL,
  `Id_Medico` INT(11) NOT NULL,
  `Id_Consultorio` INT(10) NOT NULL,
  PRIMARY KEY (`Id_Cita`),
  INDEX `FKCita709739` (`Id_Consultorio` ASC),
  INDEX `FKCita81159` (`Id_Medico` ASC),
  INDEX `FKCita622588` (`Id_Paciente` ASC),
  CONSTRAINT `FKCita622588`
    FOREIGN KEY (`Id_Paciente`)
    REFERENCES `hospital`.`paciente` (`Id_Paciente`),
  CONSTRAINT `FKCita709739`
    FOREIGN KEY (`Id_Consultorio`)
    REFERENCES `hospital`.`consultorio` (`Id_Consultorio`),
  CONSTRAINT `FKCita81159`
    FOREIGN KEY (`Id_Medico`)
    REFERENCES `hospital`.`medico` (`Id_Medico`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`historial`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`historial` (
  `Id_Historial` INT(10) NOT NULL AUTO_INCREMENT,
  `Id_Receta` INT(10) NOT NULL,
  PRIMARY KEY (`Id_Historial`),
  INDEX `FKHistorial764210` (`Id_Receta` ASC),
  CONSTRAINT `FKHistorial764210`
    FOREIGN KEY (`Id_Receta`)
    REFERENCES `hospital`.`cita` (`Id_Cita`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `hospital`.`receta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `hospital`.`receta` (
  `Id_Receta` INT(10) NOT NULL AUTO_INCREMENT,
  `Id_Cita` INT(10) NOT NULL,
  `Peso` INT(10) NULL DEFAULT NULL,
  `Presion` INT(10) NULL DEFAULT NULL,
  `Talla` INT(10) NULL DEFAULT NULL,
  `Temperatura` INT(10) NULL DEFAULT NULL,
  `Diagnostico` VARCHAR(250) NULL DEFAULT NULL,
  `Observacion` VARCHAR(250) NULL DEFAULT NULL,
  `Prescripcion` VARCHAR(250) NULL DEFAULT NULL,
  PRIMARY KEY (`Id_Receta`),
  INDEX `FKReceta101483` (`Id_Cita` ASC),
  CONSTRAINT `FKReceta101483`
    FOREIGN KEY (`Id_Cita`)
    REFERENCES `hospital`.`cita` (`Id_Cita`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
