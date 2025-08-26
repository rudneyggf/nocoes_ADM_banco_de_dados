-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema cenario_01
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema cenario_01
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `cenario_01` DEFAULT CHARACTER SET utf8 ;
USE `cenario_01` ;

-- -----------------------------------------------------
-- Table `cenario_01`.`Departamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cenario_01`.`Departamento` (
  `Dnumero` INT NOT NULL,
  `Dnome` VARCHAR(45) NOT NULL,
  `Data_inicio_gerente` DATE NOT NULL,
  PRIMARY KEY (`Dnumero`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cenario_01`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cenario_01`.`Funcionario` (
  `Pnome` VARCHAR(25) NOT NULL,
  `Minicial` VARCHAR(5) NOT NULL,
  `Unome` VARCHAR(25) NOT NULL,
  `Cpf` VARCHAR(45) NOT NULL,
  `Datanasc` DATE NOT NULL,
  `Endereco` VARCHAR(70) NOT NULL,
  `Sexo` VARCHAR(25) NOT NULL,
  `Salario` DECIMAL(10,2) NOT NULL,
  `Cpf_supervisor` VARCHAR(45) NULL,
  `Dnr` INT NOT NULL,
  PRIMARY KEY (`Cpf`),
  INDEX `fk_Funcionario_Funcionario_idx` (`Cpf_supervisor` ASC) VISIBLE,
  INDEX `fk_Funcionario_Departamento1_idx` (`Dnr` ASC) VISIBLE,
  CONSTRAINT `fk_Funcionario_Funcionario`
    FOREIGN KEY (`Cpf_supervisor`)
    REFERENCES `cenario_01`.`Funcionario` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Funcionario_Departamento1`
    FOREIGN KEY (`Dnr`)
    REFERENCES `cenario_01`.`Departamento` (`Dnumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cenario_01`.`Localicacao_dep`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cenario_01`.`Localicacao_dep` (
  `Dnumero` INT NOT NULL,
  `Dlocal` VARCHAR(45) NOT NULL,
  INDEX `fk_Localicacao_dep_Departamento1_idx` (`Dnumero` ASC) VISIBLE,
  PRIMARY KEY (`Dnumero`, `Dlocal`),
  CONSTRAINT `fk_Localicacao_dep_Departamento1`
    FOREIGN KEY (`Dnumero`)
    REFERENCES `cenario_01`.`Departamento` (`Dnumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cenario_01`.`Projeto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cenario_01`.`Projeto` (
  `Projnome` VARCHAR(45) NOT NULL,
  `Projnumero` INT NOT NULL,
  `Localicacao_dep_Dnumero` INT NOT NULL,
  `Localicacao_dep_Dlocal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Projnumero`),
  INDEX `fk_Projeto_Localicacao_dep1_idx` (`Localicacao_dep_Dnumero` ASC, `Localicacao_dep_Dlocal` ASC) VISIBLE,
  CONSTRAINT `fk_Projeto_Localicacao_dep1`
    FOREIGN KEY (`Localicacao_dep_Dnumero` , `Localicacao_dep_Dlocal`)
    REFERENCES `cenario_01`.`Localicacao_dep` (`Dnumero` , `Dlocal`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cenario_01`.`Trabalha_em`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cenario_01`.`Trabalha_em` (
  `Fcpf` VARCHAR(45) NOT NULL,
  `Projeto_Projnumero` INT NOT NULL,
  `Horas` INT NOT NULL,
  INDEX `fk_Trabalha_em_Funcionario1_idx` (`Fcpf` ASC) VISIBLE,
  PRIMARY KEY (`Fcpf`, `Projeto_Projnumero`),
  INDEX `fk_Trabalha_em_Projeto1_idx` (`Projeto_Projnumero` ASC) VISIBLE,
  CONSTRAINT `fk_Trabalha_em_Funcionario1`
    FOREIGN KEY (`Fcpf`)
    REFERENCES `cenario_01`.`Funcionario` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Trabalha_em_Projeto1`
    FOREIGN KEY (`Projeto_Projnumero`)
    REFERENCES `cenario_01`.`Projeto` (`Projnumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `cenario_01`.`Dependente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `cenario_01`.`Dependente` (
  `Nome_dependente` VARCHAR(60) NOT NULL,
  `Fcpf` VARCHAR(45) NOT NULL,
  `Sexo` VARCHAR(25) NOT NULL,
  `Datanasc` DATE NOT NULL,
  `Parentesco` VARCHAR(45) NULL,
  PRIMARY KEY (`Nome_dependente`, `Fcpf`),
  INDEX `fk_Dependente_Funcionario1_idx` (`Fcpf` ASC) VISIBLE,
  CONSTRAINT `fk_Dependente_Funcionario1`
    FOREIGN KEY (`Fcpf`)
    REFERENCES `cenario_01`.`Funcionario` (`Cpf`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
