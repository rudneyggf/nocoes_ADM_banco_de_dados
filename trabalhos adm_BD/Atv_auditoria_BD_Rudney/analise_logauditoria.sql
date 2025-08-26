use erp_corporativo;

-- quais as tabelas mais afetadas por operaçoões
SELECT tabela_afetada,count(tabela_afetada) AS quantidade_de_operacoes FROM logauditoria GROUP BY tabela_afetada ORDER BY quantidade_de_operacoes DESC ;

-- Quais usuários realizaram mais alterações?
SELECT usuario,count(operacao) AS quantidade_de_ocorrencia FROM logauditoria WHERE operacao="update" OR operacao="delete" OR operacao="insert" 
GROUP BY usuario ORDER BY quantidade_de_ocorrencia DESC;

-- tentativa de exclusão de dados sensiveis
SELECT * FROM logauditoria WHERE operacao = "delete";