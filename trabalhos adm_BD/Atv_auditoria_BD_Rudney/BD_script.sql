-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema ERP_Corporativo
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema ERP_Corporativo
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `ERP_Corporativo` DEFAULT CHARACTER SET utf8 ;
USE `ERP_Corporativo` ;

-- -----------------------------------------------------
-- Table `ERP_Corporativo`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERP_Corporativo`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NULL,
  `email` VARCHAR(100) NULL,
  `telefone` VARCHAR(15) NULL,
  `data_cadastro` DATETIME NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERP_Corporativo`.`contas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERP_Corporativo`.`contas` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `saldo` INT NULL,
  `data_abertura` DATETIME NULL,
  `clientes_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_contas_clientes_idx` (`clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_contas_clientes`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `ERP_Corporativo`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERP_Corporativo`.`transacoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERP_Corporativo`.`transacoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `valor` DECIMAL(15,2) NULL,
  `data_transacao` DATETIME NULL,
  `tipo_operaca` VARCHAR(100) NULL,
  `contas_id` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_transacoes_contas1_idx` (`contas_id` ASC) VISIBLE,
  CONSTRAINT `fk_transacoes_contas1`
    FOREIGN KEY (`contas_id`)
    REFERENCES `ERP_Corporativo`.`contas` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `ERP_Corporativo`.`logauditoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `ERP_Corporativo`.`logauditoria` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tabela_afetada` VARCHAR(60) NULL,
  `operacao` VARCHAR(10) NULL,
  `usuario` VARCHAR(50) NULL,
  `data_hora` DATETIME NULL,
  `detalhes` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
