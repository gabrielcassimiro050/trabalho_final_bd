-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mercearia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mercearia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mercearia` DEFAULT CHARACTER SET utf8 ;
USE `mercearia` ;

-- -----------------------------------------------------
-- Table `mercearia`.`Categorias`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercearia`.`Categorias` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mercearia`.`Produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercearia`.`Produtos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `estoque` INT NULL,
  `preco` FLOAT NULL,
  `idCategoria` INT NOT NULL,
  PRIMARY KEY (`id`, `idCategoria`),
  INDEX `fk_Produtos_Categorias_idx` (`idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Produtos_Categorias`
    FOREIGN KEY (`idCategoria`)
    REFERENCES `mercearia`.`Categorias` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mercearia`.`Fornecedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercearia`.`Fornecedores` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mercearia`.`_Fornece`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercearia`.`_Fornece` (
  `Produtos_id` INT NOT NULL,
  `Produtos_idCategoria` INT NOT NULL,
  `Fornecedores_id` INT NOT NULL,
  PRIMARY KEY (`Produtos_id`, `Produtos_idCategoria`, `Fornecedores_id`),
  INDEX `fk_Produtos_has_Fornecedores_Fornecedores1_idx` (`Fornecedores_id` ASC) VISIBLE,
  INDEX `fk_Produtos_has_Fornecedores_Produtos1_idx` (`Produtos_id` ASC, `Produtos_idCategoria` ASC) VISIBLE,
  CONSTRAINT `fk_Produtos_has_Fornecedores_Produtos1`
    FOREIGN KEY (`Produtos_id` , `Produtos_idCategoria`)
    REFERENCES `mercearia`.`Produtos` (`id` , `idCategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Produtos_has_Fornecedores_Fornecedores1`
    FOREIGN KEY (`Fornecedores_id`)
    REFERENCES `mercearia`.`Fornecedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mercearia`.`Clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercearia`.`Clientes` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mercearia`.`Vendedores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercearia`.`Vendedores` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cpf` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `salario` FLOAT NULL,
  `senha` VARCHAR(64) NULL,
  `status` TINYINT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mercearia`.`Vendas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercearia`.`Vendas` (
  `id` INT NOT NULL,
  `quantidade` VARCHAR(45) NULL,
  `idVendedor` INT NOT NULL,
  `idProduto` INT NOT NULL,
  `Clientes_id` INT NOT NULL,
  `meio` VARCHAR(45) NULL,
  PRIMARY KEY (`id`, `idVendedor`, `idProduto`, `Clientes_id`),
  INDEX `fk_Vendas_Vendedores1_idx` (`idVendedor` ASC) VISIBLE,
  INDEX `fk_Vendas_Produtos1_idx` (`idProduto` ASC) VISIBLE,
  INDEX `fk_Vendas_Clientes1_idx` (`Clientes_id` ASC) VISIBLE,
  CONSTRAINT `fk_Vendas_Vendedores1`
    FOREIGN KEY (`idVendedor`)
    REFERENCES `mercearia`.`Vendedores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_Produtos1`
    FOREIGN KEY (`idProduto`)
    REFERENCES `mercearia`.`Produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Vendas_Clientes1`
    FOREIGN KEY (`Clientes_id`)
    REFERENCES `mercearia`.`Clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mercearia`.`Donos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mercearia`.`Donos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `cnpj` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `endereco` VARCHAR(45) NULL,
  `telefone` VARCHAR(45) NULL,
  `senha` VARCHAR(64) NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

