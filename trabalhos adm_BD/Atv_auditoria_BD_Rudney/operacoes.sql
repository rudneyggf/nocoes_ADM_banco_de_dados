use erp_corporativo;

-- operações user A
INSERT INTO `clientes` (id, nome, email, telefone, data_cadastro)
VALUES 
(1, 'João Silva', 'joao.silva@gmail.com', '11999999999', NOW()),
(2, 'Maria Oliveira', 'maria.oliveira@gmail.com', '21988888888', NOW()),
(3, 'Carlos Almeida', 'carlos.almeida@gmail.com', '31977777777', NOW()),
(4, 'Ana Santos', 'ana.santos@gmail.com', '41966666666', NOW()),
(5, 'Paulo Sousa', 'paulo.sousa@gmail.com', '51955555555', NOW()),
(6, 'Fernanda Costa', 'fernanda.costa@gmail.com', '61944444444', NOW()),
(7, 'Rafael Rocha', 'rafael.rocha@gmail.com', '71933333333', NOW()),
(8, 'Mariana Ramos', 'mariana.ramos@gmail.com', '81922222222', NOW()),
(9, 'Lucas Nogueira', 'lucas.nogueira@gmail.com', '91911111111', NOW()),
(10, 'Beatriz Vieira', 'beatriz.vieira@gmail.com', '11900000000', NOW()),
(11, 'Thiago Ferreira', 'thiago.ferreira@gmail.com', '22911112222', NOW()),
(12, 'Carla Mendes', 'carla.mendes@gmail.com', '33922223333', NOW()),
(13, 'Gabriel Lima', 'gabriel.lima@gmail.com', '44933334444', NOW()),
(14, 'Letícia Moreira', 'leticia.moreira@gmail.com', '55944445555', NOW()),
(15, 'Pedro Henrique', 'pedro.henrique@gmail.com', '66955556666', NOW()),
(16, 'Camila Borges', 'camila.borges@gmail.com', '77966667777', NOW()),
(17, 'André Martins', 'andre.martins@gmail.com', '88977778888', NOW()),
(18, 'Juliana Souza', 'juliana.souza@gmail.com', '99988889999', NOW()),
(19, 'Fábio Teixeira', 'fabio.teixeira@gmail.com', '10999990000', NOW()),
(20, 'Sabrina Pinto', 'sabrina.pinto@gmail.com', '20900001111', NOW());

-- Operações User B
INSERT INTO `contas` (id,saldo, data_abertura, clientes_id)
VALUES 
(1, 1000, NOW(), 1),
(2, 2000, NOW(), 2),
(3, 1500,  NOW(), 3),
(4, 3000,  NOW(), 4),
(5, 2500,  NOW(), 5),
(6, 1200,  NOW(), 6),
(7, 1700,  NOW(), 7),
(8, 2200,  NOW(), 8),
(9, 1800,  NOW(), 9),
(10, 900,  NOW(), 10),
(11, 1300,  NOW(), 11),
(12, 1900,  NOW(), 12),
(13, 2100,  NOW(), 13),
(14, 3100,  NOW(), 14),
(15, 2300,  NOW(), 15),
(16, 800,  NOW(), 16),
(17, 400,  NOW(), 17),
(18, 700,  NOW(), 18),
(19, 500,  NOW(), 19),
(20, 100,  NOW(), 20);


-- Operações USER C
INSERT INTO `transacoes` (id, valor, data_transacao, tipo_operaca, contas_id)
VALUES
(1, 500.00, NOW(), 'Depósito', 1),
(2, 300.00, NOW(), 'Saque', 2),
(3, 150.00, NOW(), 'Depósito', 3),
(4, 700.00, NOW(), 'Saque', 4),
(5, 200.00, NOW(), 'Depósito', 5),
(6, 400.00, NOW(), 'Transferência', 6),
(7, 100.00, NOW(), 'Depósito', 7),
(8, 600.00, NOW(), 'Saque', 8),
(9, 350.00, NOW(), 'Depósito', 9),
(10, 750.00, NOW(), 'Transferência', 10);


-- User A
-- Atualizando 10 registros na tabela clientes
UPDATE `clientes` SET nome = CONCAT(nome, ' Atualizado') WHERE id <= 10;

-- User B
-- Atualizando 10 registros na tabela contas
UPDATE `contas` SET saldo = saldo + 500 WHERE id <= 10;

-- User C
-- Atualizando 10 registros na tabela transacoes
UPDATE `transacoes` SET valor = valor * 1.1 WHERE id <= 10;

-- Root
-- Deletando 5 registros da tabela transacoes
DELETE FROM `transacoes` WHERE id IN (6, 7, 8, 9, 10);

-- Deletando 2 registros da tabela clientes
DELETE FROM `clientes` WHERE id IN (19, 20);

-- Deletando 3 registros da tabela contas
DELETE FROM `contas` WHERE id IN (18, 19, 20);

SELECT * FROM clientes;
SELECT * FROM  contas;
SELECT * FROM transacoes;
