-- cenario 01
use cenario_01;
-- criação de usuários
CREATE USER 'A' IDENTIFIED BY 'User_A';
CREATE USER 'B' IDENTIFIED BY 'User_B';
CREATE USER 'C' IDENTIFIED BY 'User_C';
CREATE USER 'D' IDENTIFIED BY 'User_D';
CREATE USER 'E' IDENTIFIED BY 'User_E';

-- permissões do usuário A 
GRANT SELECT, UPDATE 
ON cenario_01.departamento TO 'A' WITH GRANT OPTION;
GRANT SELECT, UPDATE 
ON cenario_01.funcionario TO 'A' WITH GRANT OPTION;
GRANT SELECT, UPDATE 
ON cenario_01.localicacao_dep TO 'A' WITH GRANT OPTION;
GRANT SELECT, UPDATE 
ON cenario_01.trabalha_em TO 'A' WITH GRANT OPTION;
GRANT SELECT, UPDATE 
ON cenario_01.projeto TO 'A'WITH GRANT OPTION;
SHOW GRANTS FOR 'A';


-- permissões do usuário B 
GRANT SELECT (Dnome,Dnumero) ON cenario_01.departamento  to 'B';
GRANT SELECT (Pnome,Minicial,Unome,Cpf,Datanasc,Endereco,Sexo,Cpf_supervisor,Dnr) on cenario_01.funcionario to 'B';
SHOW GRANTS FOR 'B';

-- permissões do usuário C
GRANT SELECT,UPDATE on cenario_01.trabalha_em to 'C';
GRANT SELECT (Pnome, Minicial, Unome,Cpf) ON cenario_01.funcionario to 'C';
GRANT SELECT (Projnome, Projnumero) ON cenario_01.projeto to 'C';
SHOW GRANTS FOR 'C';

-- permissões do usuário D  
GRANT SELECT,UPDATE ON cenario_01.dependente to 'D';
GRANT SELECT ON cenario_01.funcionario to 'D';
SHOW GRANTS FOR 'D';

-- permissões do usuário E 
CREATE VIEW granularidade_usuario_E AS 
SELECT * FROM cenario_01.funcionario where Dnr=3; 

GRANT SELECT ON granularidade_usuario_E to 'E'; 