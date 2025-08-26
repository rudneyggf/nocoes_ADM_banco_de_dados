use vendasdb;

-- Inserção de novos registros na tabela product com o usuário gerente_vendas.
INSERT INTO Product (Id,ProductName,SupplierId,UnitPrice,Package,IsDiscontinued)VALUES(79,'Lasanha',1,30.00,'10 boxes x 20 bags',0);
SELECT * FROM Product where id=79;

-- Consulta de dados na tabela customer com o usuário atendente_vendas.
SELECT * FROM vendasdb.customer where firstname like 'R%';

-- Tentativa de exclusão na tabela supplier com o usuário atendente_vendas (espera-se  que ocorra erro).
DELETE FROM vendasdb.supplier where id=1;