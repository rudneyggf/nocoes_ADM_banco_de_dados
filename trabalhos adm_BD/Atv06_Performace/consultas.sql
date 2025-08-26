use sistema_vendas;

-- consulta 1
-- Verificar pagamentos pendentes
EXPLAIN SELECT * FROM pagamentos WHERE status = 'Pendente';

-- consulta 2
-- Consultar movimentações de estoque de um produto
 EXPLAIN SELECT * FROM estoque_movimentacao WHERE produto_id = 1;

-- consulta 3
-- Analisar a variação de preços de um produto ao longo do tempo
EXPLAIN SELECT em.produto_id, p.nome, em.tipo, em.quantidade,
em.data_movimentacao
FROM estoque_movimentacao em
JOIN produtos p ON em.produto_id = p.id
WHERE em.produto_id = 1
ORDER BY em.data_movimentacao DESC;

-- consulta 4
-- Listar os produtos mais vendidos, incluindo o total de unidades vendidas e
-- receita gerada
EXPLAIN SELECT pr.id, pr.nome, COUNT(ip.id) AS total_vendas,
SUM(ip.quantidade) AS unidades_vendidas,
SUM(ip.quantidade * ip.preco_unitario) AS receita_total
FROM itens_pedido ip
JOIN produtos pr ON ip.produto_id = pr.id
GROUP BY pr.id, pr.nome
ORDER BY receita_total DESC;