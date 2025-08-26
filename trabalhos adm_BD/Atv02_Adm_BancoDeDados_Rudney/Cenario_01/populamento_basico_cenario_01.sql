use cenario_01;

INSERT INTO `cenario_01`.`Departamento` (Dnumero, Dnome, Data_inicio_gerente)
VALUES 
(1, 'TI', '2021-05-15');


INSERT INTO `cenario_01`.`Funcionario` (Pnome, Minicial, Unome, Cpf, Datanasc, Endereco, Sexo, Salario, Cpf_supervisor, Dnr)
VALUES 
('João', 'M', 'Silva', '12345678900', '1985-06-15', 'Rua 1, 123', 'Masculino', 5000.00, NULL, 1),
('Maria', 'A', 'Oliveira', '98765432100', '1990-03-22', 'Rua 2, 456', 'Feminino', 4500.00, '12345678900', 1),
('Carlos', 'B', 'Pereira', '11122233344', '1988-09-10', 'Rua 3, 789', 'Masculino', 4800.00, '12345678900', 1);

ALTER TABLE `cenario_01`.`Departamento`
ADD column Cpf_gerente VARCHAR(45) NOT NULL;

Update Departamento set Cpf_gerente='12345678900' where Dnumero=1;

ALTER TABLE `cenario_01`.`Departamento`
ADD CONSTRAINT `fk_Departamento_Funcionario1`
  FOREIGN KEY (Cpf_gerente)
  REFERENCES `cenario_01`.`Funcionario` (Cpf);

INSERT INTO `cenario_01`.`Localicacao_dep` (Dnumero, Dlocal)
VALUES 
(1, 'Bloco B');


INSERT INTO `cenario_01`.`Dependente` (Nome_dependente, Fcpf, Sexo, Datanasc, Parentesco)
VALUES 
('Ana Silva', '12345678900', 'Feminino', '2010-05-10', 'Filha'),
('Pedro Oliveira', '98765432100', 'Masculino', '2015-07-20', 'Filho'),
('Clara Pereira', '11122233344', 'Feminino', '2012-09-15', 'Esposa');

INSERT INTO `cenario_01`.`Projeto` (Projnome, Projnumero, Localicacao_dep_Dnumero, Localicacao_dep_Dlocal)
VALUES 
('Infraestrutura TI', 102, 1, 'Bloco B');


INSERT INTO `cenario_01`.`Trabalha_em` (Fcpf, Projeto_Projnumero, Horas)
VALUES 
('12345678900', 102, 20),
('98765432100', 102, 25),
('11122233344', 102, 15);


