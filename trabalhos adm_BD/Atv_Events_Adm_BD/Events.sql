use vendasdb;

delimiter $$

-- questão 1
CREATE EVENT atualizacao_status_produto
ON SCHEDULE EVERY 1 MONTH
STARTS CURRENT_TIMESTAMP
DO BEGIN 
    UPDATE product set isdiscontinued = 1 where unitprice < 1 and NOT EXISTS (SELECT * FROM vendasdb.orderitem
    JOIN vendasdb.order ON vendasdb.order.id = vendasdb.orderitem.orderid  WHERE product.id= vendasdb.orderitem.productid AND orderdate >= DATE_SUB(CURDATE(), INTERVAL 30 DAY));
END $$


-- questão 2
CREATE EVENT reajuste_preco 
ON SCHEDULE EVERY 1 MONTH 
STARTS CURRENT_TIMESTAMP
DO BEGIN
	UPDATE product set unitprice = unitprice * 1.05 where supplierid in (select id from supplier where country = 'Brazil'); 
END $$  

-- questão 3

CREATE EVENT relatorio_vendas 
ON SCHEDULE EVERY 1 DAY
STARTS '2024-12-28  23:59:00' 
DO BEGIN
	INSERT INTO relatorio_de_vendas_diarias (data, quantidade_total_pedidos, valor_total_vendas) SELECT 
		CURDATE() AS data, count(id) AS quantidade_total_pedidos, sum(totalamount) AS valor_total_vendas 
    FROM vendasdb.order WHERE orderdate = CURDATE(); 
END $$

-- questão 4
CREATE EVENT relatorio_semanal_produtos_mais_vendidos 
ON SCHEDULE EVERY 1 WEEK 
STARTS CURRENT_TIMESTAMP
DO BEGIN
		INSERT INTO produtos_top_semanais(id, product_name,quantity) SELECT 
			productid as id, productname AS product_name, sum(quantity) AS quantity 
        FROM vendasdb.order JOIN vendasdb.orderitem ON vendasdb.order.id=vendasdb.orderitem.orderid
        JOIN product ON vendasdb.orderitem.productid = product.id WHERE orderdate >= DATE_SUB(CURDATE(),INTERVAL 1 WEEK) GROUP BY vendasdb.orderitem.productid;
END $$

-- questão 5 
CREATE EVENT remover_pedidos_antigos 
ON SCHEDULE EVERY 1 MONTH 
STARTS CURRENT_TIMESTAMP
DO BEGIN 
	DELETE FROM vendasdb.orderitem WHERE orderid IN (SELECT id FROM vendasdb.order where orderdate < DATE_SUB(CURDATE(), INTERVAL 5 YEAR));
    DELETE FROM vendasdb.order WHERE orderdate < DATE_SUB(CURDATE(),INTERVAL 5 YEAR);
END $$


-- questão 6
CREATE EVENT alertar_produtos_estoque_baixo 
ON SCHEDULE EVERY 1 DAY
STARTS CURRENT_TIMESTAMP 
DO BEGIN
	INSERT INTO alerta_estoque_baixo SELECT * 
    FROM product WHERE estoque<5;
END $$

-- questão 7
CREATE EVENT inserir_vendas_por_pais
ON SCHEDULE EVERY 1 MONTH
STARTS '2025-01-01'
DO BEGIN
	INSERT INTO vendas_por_pais(country, month, total_sales) SELECT
    country as country,
    DATE_FORMAT(NOW(),'%M') AS month,
    count(vendasdb.order.id) AS total_sales
    FROM customer JOIN vendasdb.order ON customer.id = vendasdb.order.customerid where orderdate >= DATE_SUB(CURDATE(),INTERVAL 30 DAY) GROUP BY country; 
END $$

delimiter ;

SHOW EVENTS FROM vendasdb;



