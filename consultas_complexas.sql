USE Farmacia;

# Consultas Complexas

	-- compras --
    
    -- Passo 1: Trazer todas as compras --
    SELECT * FROM compras;
    
    -- Passoc 2: Colocas o nome dos clientes nas compras --
    SELECT c.id, cl.nome, c.data AS data_Compra FROM compras AS c, clientes AS cl 
    WHERE c.id_cliente = cl.id;
    
    -- Passo 3: produtos compra; --
    SELECT * FROM produtos_compras;
    
    -- Passo 4: --
    SELECT pc.quantidade,pc.id_compra, p.produto FROM produtos_compras AS pc, produtos AS p
    WHERE pc.id_produto = p.id;
    
    -- Passo 5: Selecioando os dados das compras --
    SELECT pc.id_produto AS Id_do_produto,
		   pc.id_compra AS compra, 
           p.produto,
           p.preco_venda AS preco,
           pc.quantidade 
           FROM produtos_compras AS pc, produtos AS p, clientes AS cl
		   WHERE pc.id_produto = p.id AND pc.id_compra = cl.id;
    
     -- passo 6: Pegando o nome do cliente e o total das suas compras --
     SELECT pcom.id_compra AS venda,
			cli.nome AS cliente, 
            SUM(prod.preco_venda * pcom.quantidade) AS total_compra_produto,
			comp.data AS 'data compra'
			FROM produtos_compras AS pcom, produtos AS prod, clientes AS cli, compras AS comp
			WHERE pcom.id_produto = prod.id AND comp.id = pcom.id_compra AND cli.id = comp.id_cliente
			GROUP BY comp.id;