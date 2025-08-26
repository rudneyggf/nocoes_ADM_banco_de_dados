CREATE USER 'admin_vendas' IDENTIFIED BY 'admin';
CREATE USER 'gerente_vendas' IDENTIFIED BY 'gerente';
CREATE USER 'atendente_vendas' IDENTIFIED BY 'atendente';

GRANT 'role_admin' TO 'admin_vendas';
SET DEFAULT ROLE 'role_admin' TO 'admin_vendas';
SHOW GRANTS FOR 'admin_vendas';

GRANT 'role_gerente' TO 'gerente_vendas';
SET DEFAULT ROLE 'role_gerente' TO 'gerente_vendas';
SHOW GRANTS FOR 'gerente_vendas';

GRANT 'role_atendente' TO 'atendente_vendas'; 
SET DEFAULT ROLE 'role_atendente' TO 'atendente_vendas';
SHOW GRANTS FOR 'atendente_vendas';
