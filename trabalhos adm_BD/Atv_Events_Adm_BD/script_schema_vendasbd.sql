-- -----------------------------------------------------
-- Schema VENDASDB
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `VENDASDB` ;
USE `VENDASDB` ;

-- -----------------------------------------------------
-- Table `CLIENTE`.`Supplier`
-- -----------------------------------------------------
CREATE TABLE  IF NOT EXISTS `VENDASDB`.`supplier` (
  `id` int NOT NULL ,
  `companyname` varchar(40)  NULL,
  `contactname` varchar(50)  NULL,
  `contacttitle` varchar(40) NULL,
  `city` varchar(40)  NULL,
  `country` varchar(40) NULL,
  `phone` varchar(30)  NULL,
  `fax` varchar(30) NULL,
  PRIMARY KEY (`id`)
) ;



-- -----------------------------------------------------
-- Table `CLIENTE`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VENDASDB`.`product` (
  `id` INT NOT NULL ,
  `productname` VARCHAR(50) NULL,
  `supplierid` INT NOT NULL,
  `unitprice` DECIMAL(12,2) NULL,
  `package` VARCHAR(30) NULL,
  `isdiscontinued` BIT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_product_Supplier1_idx` (`supplierid` ASC) VISIBLE,
  CONSTRAINT `fk_product_Supplier1`
    FOREIGN KEY (`supplierid`)
    REFERENCES `VENDASDB`.`Supplier` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);


-- -----------------------------------------------------
-- Table `CLIENTE`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VENDASDB`.`customer` (
  `id` INT NOT NULL ,
  `firstname` VARCHAR(40) NULL,
  `lastname` VARCHAR(40) NULL,
  `city` VARCHAR(40) NULL,
  `country` VARCHAR(40) NULL,
  `phone` VARCHAR(20) NULL,
  PRIMARY KEY (`id`));


-- -----------------------------------------------------
-- Table `CLIENTE`.`order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VENDASDB`.`order` (
  `id` INT NOT NULL ,
  `orderdate` DATETIME NULL,
  `ordernumber` VARCHAR(10) NULL,
  `customerid` INT NOT NULL,
  `totalamount` DECIMAL(12,2) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_order_customer1_idx` (`customerid` ASC) VISIBLE,
  CONSTRAINT `fk_order_customer1`
    FOREIGN KEY (`customerid`)
    REFERENCES `VENDASDB`.`customer` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);


-- -----------------------------------------------------
-- Table `CLIENTE`.`orderitem`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `VENDASDB`.`orderitem` (
  `id` INT NOT NULL ,
  `orderid` INT NOT NULL,
  `productid` INT NOT NULL,
  `unitprice` DECIMAL(12,2) NULL,
  `quantity` INT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_orderitem_product1_idx` (`productid` ASC) VISIBLE,
  INDEX `fk_orderitem_order1_idx` (`orderid` ASC) VISIBLE,
  CONSTRAINT `fk_orderitem_product1`
    FOREIGN KEY (`productid`)
    REFERENCES `VENDASDB`.`product` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT,
  CONSTRAINT `fk_orderitem_order1`
    FOREIGN KEY (`orderid`)
    REFERENCES `VENDASDB`.`order` (`id`)
    ON DELETE RESTRICT
    ON UPDATE RESTRICT);


