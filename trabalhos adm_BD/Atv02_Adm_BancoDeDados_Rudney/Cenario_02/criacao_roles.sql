CREATE ROLE 'role_admin';
CREATE ROLE 'role_gerente';
CREATE ROLE 'role_atendente';

-- privilégios admin
GRANT ALL PRIVILEGES ON vendasdb.* to 'role_admin';
SHOW GRANTS FOR 'role_admin';

-- privilégios gerente
GRANT SELECT,UPDATE ON vendasdb.supplier to 'role_gerente';
GRANT SELECT, UPDATE ON vendasdb.product to 'role_gerente';
GRANT SELECT, UPDATE ON vendasdb.order to 'role_gerente';
SHOW GRANTS FOR 'role_gerente';

-- privilégios atendente
GRANT SELECT ON vendasdb.customer to 'role_atendente';
GRANT SELECT ON vendasdb.order to 'role_atendente';
SHOW GRANTS FOR 'role_atendente';


 