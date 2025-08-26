-- indice para a consulta 1
CREATE INDEX idx_sistemaVendas_pagamentos on pagamentos(status);

-- indice para a consulta 2 e 3
CREATE INDEX idx_sistemaVendas_estoqueMovimentacao on estoque_movimentacao(produto_id);

-- indice para a consulta 3
CREATE INDEX idx_estoque_movimentacao_produto_data ON estoque_movimentacao (produto_id, data_movimentacao);

-- indices para a consulta 4
CREATE INDEX idx_itens_pedido_produto_quantidade_preco ON itens_pedido (produto_id, quantidade, preco_unitario);

