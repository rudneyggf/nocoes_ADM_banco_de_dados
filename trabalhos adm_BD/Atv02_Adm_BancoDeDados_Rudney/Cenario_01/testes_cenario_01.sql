use cenario_01;
-- teste usuário A
SELECT * FROM dependente;
SELECT * FROM funcionario; 

DESC trabalha_em;
select * from trabalha_em;

-- teste usuário B
SELECT Cpf from funcionario;
SELECT Salario from funcionario;

-- testes usuário C
UPDATE trabalha_em set Horas = 30 where Projeto_Projnumero=102 and Fcpf='11122233344';
SELECT Salario FROM funcionario;
SELECT * from projeto;

-- testes usuário D
UPDATE funcionario SET salario=0 WHERE Cpf='12345678900';
SELECT * FROM dependente;
SELECT * FROM funcionario;

-- testes usuário E
SELECT * FROM funcionario where Dnr=1;
