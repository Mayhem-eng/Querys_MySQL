CREATE DATABASE Farmacia;

USE Farmacia;

CREATE TABLE clientes(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    endereco VARCHAR(100) NOT NULL,
    telefone VARCHAR(14) NOT NULL,
    cep VARCHAR(15) NOT NULL,
    localidade VARCHAR(50) NOT NULL,
    cpf VARCHAR(15) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE compras(
	id INT NOT NULL AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    data DATE,
    PRIMARY KEY(id),
    FOREIGN KEY (id_cliente) REFERENCES clientes(id)
);

CREATE TABLE tipos_produto(
	id INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE fabricantes(
	id INT NOT NULL AUTO_INCREMENT,
    fabricante VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE produtos(
	id INT NOT NULL AUTO_INCREMENT,
    produto VARCHAR(50),
    designacao VARCHAR(200),
    composicao VARCHAR(200),
    preco_venda DECIMAL(8, 2),
    id_tipo_produto INT NOT NULL,
    id_fabricante INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_tipo_produto) REFERENCES tipos_produto(id),
    FOREIGN KEY (id_fabricante) REFERENCES fabricantes(id)
);

CREATE TABLE produtos_compras(
	id INT NOT NULL AUTO_INCREMENT,
    quantidade INT NOT NULL,
    id_compra INT NOT NULL,
    id_produto INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_compra) REFERENCES compras(id),
    FOREIGN KEY (id_produto) REFERENCES produtos(id)
);

CREATE TABLE medicos(
	id INT NOT NULL AUTO_INCREMENT,
    nome VARCHAR(50) NOT NULL,
    crm VARCHAR(50) NOT NULL,
    PRIMARY KEY(id)
);

CREATE TABLE receitas_medicas(
	id INT NOT NULL AUTO_INCREMENT,
    receita VARCHAR(50) NOT NULL,
    id_produtos_compras INT NOT NULL,
    id_medicos INT NOT NULL,
    PRIMARY KEY(id),
    FOREIGN KEY (id_produtos_compras) REFERENCES produtos_compras(id),
    FOREIGN KEY (id_medicos) REFERENCES medicos(id)
);

-- INSERINDO DADOS - DML --

	-- tipos_produtos --
INSERT INTO tipos_produto (tipo) VALUES ('remedios');
INSERT INTO tipos_produto (tipo) VALUES  ('cosmeticos');
INSERT INTO tipos_produto (tipo) VALUES ('infantil');

	-- fabricantes --
INSERT INTO fabricantes (fabricante) VALUES ('Roche');
INSERT INTO fabricantes (fabricante) VALUES ('Jhonson');
INSERT INTO fabricantes (fabricante) VALUES ('Neo Quimica');

	-- medicos --
INSERT INTO medicos (nome, crm) VALUES ('Alfredo Muniz', '1234617P');
INSERT INTO medicos (nome, crm) VALUES ('Fernanda Alvez', '1276255M');
INSERT INTO medicos (nome, crm) VALUES ('Juliana Freitas', '566464MG');

	-- clientes --
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Joao Carlos', 'Rua da Paz, 468', '(11) 2345-6566', '45-7653-890', 'Santos', '465-654-890-87');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Ana Carla', 'Rua Moana, 32A', '(37) 6789-8966', '54-6454-674', 'Belo Horizonte', '433-644-643-22');
INSERT INTO clientes (nome, endereco, telefone, cep, localidade, cpf) 
	VALUES ('Julia Freitas', 'Rua Santana, 8', '(11) 4674-2357', '90-5455-544', 'São Jose dos Campos', '876-656-754-55');

	-- produtos --

INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) 
	VALUES ('dipirona', 'dores em geral', 'metiparabeno', 12.44, 1, 1);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) 
	VALUES ('Sabonete', 'limpeza', 'Corantes naturais', 3.56, 2, 2);
INSERT INTO produtos (produto, designacao, composicao, preco_venda, id_tipo_produto, id_fabricante) 
	VALUES ('Protetor Solar', 'Protecao solar', 'oxinbezona', 25.50, 2, 1);

-- compras --
	INSERT INTO compras (id_cliente, data) VALUES (1, '2022-05-13');
	INSERT INTO compras (id_cliente, data) VALUES (3, '2020-01-22');
	INSERT INTO compras (id_cliente, data) VALUES (1, '2019-02-10');
    
-- produtos compras --
	INSERT INTO produtos_compras (quantidade, id_compra, id_produto) VALUES (3, 2, 3);
    INSERT INTO produtos_compras (quantidade, id_compra, id_produto) VALUES (2, 3, 2);
    INSERT INTO produtos_compras (quantidade, id_compra, id_produto) VALUES (5, 1, 1);
    
-- receitas medicas --
	INSERT INTO receitas_medicas (receita, id_produtos_compras, id_medicos) VALUES ('receita.pdf1', 1, 2);
    INSERT INTO receitas_medicas (receita, id_produtos_compras, id_medicos) VALUES ('receita.pdf1', 3, 1);
    

