use erp_corporativo;

delimiter $$

-- clientes

CREATE TRIGGER Insert_cliente
AFTER INSERT ON clientes
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('clientes','insert',USER(),NOW(),JSON_OBJECT('nome',NEW.nome,'email',NEW.email,
    'telefone',NEW.telefone,'data_cadastro',NEW.data_cadastro));
END$$

CREATE TRIGGER update_cliente 
BEFORE UPDATE ON clientes
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('clientes','update',USER(),NOW(),JSON_OBJECT('old_nome',OLD.nome,'new_nome',NEW.nome,
    'old_email',OLD.email,'new_email',NEW.email,'old_telefone',OLD.telefone,'new_telefone',NEW.telefone,'old_data_cadastro',OLD.data_cadastro,'new_data_cadastro',NEW.data_cadastro));
END$$

CREATE TRIGGER delete_cliente 
BEFORE DELETE ON clientes
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('clientes','delete',USER(),NOW(),JSON_OBJECT('nome',OLD.nome,'email',OLD.email,
    'telefone',OLD.telefone,'data_cadastro',OLD.data_cadastro));
END$$

 -- contas
 
CREATE TRIGGER Insert_conta 
AFTER INSERT ON contas
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('contas','insert',USER(),NOW(),JSON_OBJECT('saldo',NEW.saldo,'data_abertura',
    NEW.data_abertura,'cliente_id',NEW.clientes_id));
END$$

CREATE TRIGGER update_conta 
BEFORE UPDATE ON contas
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('contas','update',USER(),NOW(),
    JSON_OBJECT('old_saldo',OLD.saldo,'new_saldo',NEW.saldo,'old_data_abertura',OLD.data_abertura,'new_data_abertura', 
    NEW.data_abertura,'old_cliente_id',OLD.clientes_id,'new_cliente_id',NEW.clientes_id));
END$$

CREATE TRIGGER delete_conta 
BEFORE DELETE ON contas
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('contas','delete',USER(),NOW(),JSON_OBJECT('saldo',OLD.saldo,'data_abertura',
    OLD.data_abertura,'cliente_id',OLD.clientes_id));
END$$

-- transações

CREATE TRIGGER Insert_transacao
AFTER INSERT ON transacoes
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('transacoes','insert',USER(),NOW(),JSON_OBJECT('valor',NEW.valor,'data_transacao',NEW.data_transacao,
    'contas_id',NEW.contas_id));
END$$

CREATE TRIGGER update_transacao
BEFORE UPDATE ON transacoes
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('transacoes','update',USER(),NOW(),
    JSON_OBJECT('old_valor',OLD.valor,'new_valor',NEW.valor,'old_data_transacao',OLD.data_transacao,'new_data_transacao',
    NEW.data_transacao,'old_contas_id',OLD.contas_id,'new_contas_id',NEW.contas_id));
END$$

CREATE TRIGGER delete_transacao 
BEFORE DELETE ON transacoes
FOR EACH ROW
BEGIN
	INSERT INTO logauditoria(tabela_afetada,operacao,usuario,data_hora,detalhes) VALUES('transacoes','delete',USER(),NOW(),JSON_OBJECT('valor',OLD.valor,'data_transacao',OLD.data_transacao,
    'contas_id',OLD.contas_id));
END$$

delimiter ;


show triggers;
