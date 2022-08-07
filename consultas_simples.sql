# Realizando consultas simples

	-- tipos produto --
SELECT * FROM tipos_produto;
SELECT id, tipo FROM tipos_produto;
SELECT id,tipo FROM tipos_produto ORDER BY id DESC;

	 -- fabricantes --
SELECT * FROM fabricantes;

	-- medicos --
SELECT * FROM medicos;
SELECT id, nome, crm FROM medicos ORDER BY crm DESC;

	-- clientes --
SELECT * FROM clientes;

	-- compras --
SELECT * FROM compras;
SELECT compras.id, nome, data FROM compras, clientes WHERE clientes.id = compras.id_cliente;