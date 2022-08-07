	-- Atualizando dados --
    
    -- tipos_produto --
SELECT * FROM tipos_produto;
UPDATE tipos_produto SET tipo = 'bijouterias' WHERE id = 4;

	-- produtos --
SELECT * FROM produtos;
UPDATE produtos SET preco_venda = 4.15, id_tipo_produto = 1, id_fabricante = 3 WHERE id = 2;