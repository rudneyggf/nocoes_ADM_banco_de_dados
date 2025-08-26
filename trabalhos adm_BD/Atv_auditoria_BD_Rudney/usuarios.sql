

SELECT User, Host FROM mysql.user;

-- criação de usuários
CREATE USER 'A' IDENTIFIED BY 'User_A';
CREATE USER 'B' IDENTIFIED BY 'User_B';
CREATE USER 'C' IDENTIFIED BY 'User_C';
show grants for 'A';

CREATE ROLE 'permissao_ERP';


GRANT SELECT, UPDATE ,INSERT,DELETE
ON erp_corporativo.clientes TO 'permissao_ERP';

GRANT SELECT, UPDATE ,INSERT,DELETE
ON erp_corporativo.contas TO 'permissao_ERP';

GRANT SELECT, UPDATE ,INSERT,DELETE
ON erp_corporativo.transacoes TO 'permissao_ERP';

GRANT 'permissao_ERP' to 'A';
SET DEFAULT ROLE 'permissao_ERP' TO 'A';

GRANT 'permissao_ERP' to 'B';
SET DEFAULT ROLE 'permissao_ERP' TO 'B';

GRANT 'permissao_ERP' to 'C';
SET DEFAULT ROLE 'permissao_ERP' TO 'C';