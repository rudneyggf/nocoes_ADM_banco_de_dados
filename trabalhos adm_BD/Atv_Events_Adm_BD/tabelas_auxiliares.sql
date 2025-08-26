use vendasdb;

CREATE TABLE relatorio_de_vendas_diarias (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    quantidade_total_pedidos INT NOT NULL,
    valor_total_vendas DECIMAL(10, 2) NOT NULL
);

CREATE TABLE produtos_top_semanais ( 
	id INT PRIMARY KEY,
    product_name VARCHAR(75) NOT NULL,
    quantity INT
);

CREATE TABLE vendas_por_pais (
	id INT AUTO_INCREMENT PRIMARY KEY,
    country VARCHAR(30) NOT NULL, 
    month VARCHAR(30) NOT NULL,
    total_sales INT NOT NULL
);

CREATE TABLE alerta_estoque_baixo (
	id INT PRIMARY KEY,
   productname VARCHAR(50) NULL,
   supplierid INT NOT NULL,
   unitprice DECIMAL(12,2) NULL,
   package VARCHAR(30) NULL,
   isdiscontinued BIT NULL,
   estoque INT NOT NULL
);
