
-- comandos auxiliares para a questão 1
INSERT INTO product (id,productname,supplierid,unitprice,package,isdiscontinued) VALUES
(79,'Teste_rotina1',3,0.5,'550ml bottle',0);

SELECT * FROM product WHERE id = 79;

-- consulta auxiliar para a questão 2
SELECT product.id, productname, unitprice, supplierid,country FROM product JOIN supplier ON product.supplierid=supplier.id where country = 'Brazil';

-- comandos auxiliares para a questão 3
INSERT INTO vendasdb.order (id,orderdate,ordernumber,customerid,totalamount) VALUES 
(28,CURDATE(),542405,15,500);
INSERT INTO vendasdb.order (id,orderdate,ordernumber,customerid,totalamount) VALUES 
(29,CURDATE(),542406,20,1000);
SELECT * FROM vendasdb.order where orderdate=CURDATE();
SELECT * FROM vendasdb.relatorio_de_vendas_diarias;

-- comandos auxiliares para a questão 4
INSERT INTO orderitem (id,orderid,productid,unitprice,quantity) VALUES
(70,28,3,10,60),
(71,29,70,15,60);
SELECT * FROM vendasdb.produtos_top_semanais;

-- comandos auxiliares para a questão 6
ALTER TABLE product ADD estoque INT NOT NULL;
UPDATE product set estoque = 4 where id=1;
UPDATE product
SET estoque = FLOOR(RAND() * 101)
WHERE id>1 AND  id <= 79;


-- consultas auxilares para a questão 5
SELECT * FROM vendasdb.order;
SELECT * FROM vendasdb.orderitem;
SELECT id FROM vendasdb.order where orderdate > DATE_SUB(CURDATE(), INTERVAL 5 YEAR);

-- consulta auxiliar para a questão 7
SELECT * FROM vendasdb.vendas_por_pais;
