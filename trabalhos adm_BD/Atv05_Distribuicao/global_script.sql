-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema global_saude
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema global_saude
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `global_saude` DEFAULT CHARACTER SET utf8 ;
USE `global_saude` ;

-- -----------------------------------------------------
-- Table `global_saude`.`paises`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`paises` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `regiao` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_saude`.`hospitais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`hospitais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `pais_id` INT NOT NULL,
  `endereco` VARCHAR(200) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_Hospitais_Países_idx` (`pais_id` ASC) VISIBLE,
  CONSTRAINT `fk_Hospitais_Países`
    FOREIGN KEY (`pais_id`)
    REFERENCES `global_saude`.`paises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_saude`.`pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`pacientes` (
  `id` CHAR(36) NOT NULL,
  `cpf` VARCHAR(45) NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `data_nascimento` DATE NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_saude`.`registros_medicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`registros_medicos` (
  `id` CHAR(36) NOT NULL,
  `tipo` VARCHAR(45) NOT NULL,
  `criado_em` TIMESTAMP NULL,
  `dados` JSON NOT NULL,
  `hospital_id` INT NOT NULL,
  `paciente_id` CHAR(36) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_registros_medicos_hospitais1_idx` (`hospital_id` ASC) VISIBLE,
  INDEX `fk_registros_medicos_pacientes1_idx` (`paciente_id` ASC) VISIBLE,
  CONSTRAINT `fk_registros_medicos_hospitais1`
    FOREIGN KEY (`hospital_id`)
    REFERENCES `global_saude`.`hospitais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_registros_medicos_pacientes1`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `global_saude`.`pacientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_saude`.`medicamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`medicamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(150) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_saude`.`estoques`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`estoques` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `hospital_id` INT NOT NULL,
  `medicamento_id` INT NOT NULL,
  `quantidade` INT NULL,
  `valor_critico_estoque` INT NOT NULL,
  `ultima_atualizacao` TIMESTAMP NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_estoques_hospitais1_idx` (`hospital_id` ASC) VISIBLE,
  INDEX `fk_estoques_medicamentos1_idx` (`medicamento_id` ASC) VISIBLE,
  CONSTRAINT `fk_estoques_hospitais1`
    FOREIGN KEY (`hospital_id`)
    REFERENCES `global_saude`.`hospitais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_estoques_medicamentos1`
    FOREIGN KEY (`medicamento_id`)
    REFERENCES `global_saude`.`medicamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_saude`.`relatos_epidemologicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`relatos_epidemologicos` (
  `id` INT NOT NULL,
  `pais_id` INT NOT NULL,
  `caso_analisado` VARCHAR(30) NOT NULL,
  `numero_casos` INT NOT NULL,
  `inicio_analise` DATE NOT NULL,
  `fim_analise` DATE NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_relatos_epidemologicos_paises1_idx` (`pais_id` ASC) VISIBLE,
  CONSTRAINT `fk_relatos_epidemologicos_paises1`
    FOREIGN KEY (`pais_id`)
    REFERENCES `global_saude`.`paises` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_saude`.`alertas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`alertas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `menssagem` VARCHAR(100) NOT NULL,
  `criado_em` TIMESTAMP NULL,
  `medicamento_id` INT NOT NULL,
  `hospital_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_alertas_medicamentos1_idx` (`medicamento_id` ASC) VISIBLE,
  INDEX `fk_alertas_hospitais1_idx` (`hospital_id` ASC) VISIBLE,
  CONSTRAINT `fk_alertas_medicamentos1`
    FOREIGN KEY (`medicamento_id`)
    REFERENCES `global_saude`.`medicamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_alertas_hospitais1`
    FOREIGN KEY (`hospital_id`)
    REFERENCES `global_saude`.`hospitais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `global_saude`.`transferencia_pacientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `global_saude`.`transferencia_pacientes` (
  `id` CHAR(36) NOT NULL,
  `motivo` VARCHAR(100) NOT NULL,
  `paciente_id` CHAR(36) NOT NULL,
  `hospital_origem_id` INT NOT NULL,
  `hospital_destino_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transferencia_pacientes_pacientes1_idx` (`paciente_id` ASC) VISIBLE,
  INDEX `fk_transferencia_pacientes_hospitais1_idx` (`hospital_origem_id` ASC) VISIBLE,
  INDEX `fk_transferencia_pacientes_hospitais2_idx` (`hospital_destino_id` ASC) VISIBLE,
  CONSTRAINT `fk_transferencia_pacientes_pacientes1`
    FOREIGN KEY (`paciente_id`)
    REFERENCES `global_saude`.`pacientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transferencia_pacientes_hospitais1`
    FOREIGN KEY (`hospital_origem_id`)
    REFERENCES `global_saude`.`hospitais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_transferencia_pacientes_hospitais2`
    FOREIGN KEY (`hospital_destino_id`)
    REFERENCES `global_saude`.`hospitais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
