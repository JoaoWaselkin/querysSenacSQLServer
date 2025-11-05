CREATE DATABASE transaction_produtos2;
GO

USE transaction_produtos2;
GO

CREATE TABLE tbl_produtos (
id_prod INT PRIMARY KEY IDENTITY,
nome_prod VARCHAR(255),
valor_prod DECIMAL(10,2),
qtd_estoque INT
);
GO
 
CREATE TABLE tbl_clientes (
id_cliente INT PRIMARY KEY IDENTITY,
nome_cliente VARCHAR(255),
);
GO
 
CREATE TABLE tbl_vendas (
id_venda INT PRIMARY KEY IDENTITY,
id_prod_fk INT,
FOREIGN KEY (id_prod_fk) REFERENCES tbl_produtos(id_prod),
id_cliente_fk INT,
FOREIGN KEY (id_cliente_fk) REFERENCES tbl_clientes(id_cliente)
);
GO
 
INSERT INTO tbl_produtos (nome_prod, valor_prod, qtd_estoque) VALUES
('Notebook Gamer X', 5500.00, 15),
('Smartphone Ultra', 3200.50, 45),
('Smart TV 50" 4K', 2899.99, 22),
('Fone de Ouvido Bluetooth', 180.00, 150),
('Mouse Sem Fio Ergonômico', 59.90, 80),
('Teclado Mecânico RGB', 349.00, 30),
('Monitor LED 27"', 1199.00, 18),
('Webcam Full HD', 95.50, 65),
('Roteador Wi-Fi 6', 220.00, 40),
('Câmera de Segurança Dome', 150.00, 55),
('Impressora Multifuncional', 450.00, 28),
('HD Externo 1TB', 380.00, 35),
('SSD 500GB', 299.90, 50),
('Pendrive 64GB', 45.00, 120),
('Caixa de Som Portátil', 125.00, 75),
('Bateria Externa Powerbank', 85.00, 90),
('Cabo HDMI 2m', 25.00, 200),
('Mesa Digitalizadora', 620.00, 12),
('Ring Light LED', 110.00, 60),
('Kit Ferramentas Eletrônica', 75.00, 100);
GO
 
INSERT INTO tbl_clientes (nome_cliente) VALUES
('Ana Clara Silva'),
('Bruno Eduardo Souza'),
('Carla Renata Oliveira'),
('Daniel Felipe Santos'),
('Eliana Cristina Costa'),
('Fernando Gomes Lima'),
('Giovana Almeida Rocha'),
('Hugo Ricardo Pereira'),
('Isabela Lins Mendes'),
('João Vitor Cardoso'),
('Karina Ferreira Barbosa'),
('Luís Guilherme Castro'),
('Marta Helena Ribeiro'),
('Nuno Miguel Fernandes'),
('Patrícia Neves Martins'),
('Rafael Teixeira Pinto'),
('Sofia Beatriz Alves'),
('Thiago Henrique Nunes'),
('Viviane Xavier Correia'),
('Wellington Rocha Dantas');
GO
 
BEGIN TRAN;
INSERT INTO tbl_vendas (id_prod_fk, id_cliente_fk) VALUES
(10, 1),  -- Câmera de Segurança para Ana Clara
(5, 2),   -- Mouse para Bruno Eduardo
(1, 3),   -- Notebook para Carla Renata
(7, 4),   -- Monitor para Daniel Felipe
(15, 5),  -- Caixa de Som para Eliana Cristina
(12, 6),  -- HD Externo para Fernando Gomes
(4, 7),   -- Fone de Ouvido para Giovana Almeida
(10, 1),  -- Câmera de Segurança para Ana Clara (segunda compra)
(13, 8),  -- SSD para Hugo Ricardo
(2, 9),   -- Smartphone para Isabela Lins
(7, 10),  -- Monitor para João Vitor
(18, 11), -- Mesa Digitalizadora para Karina Ferreira
(6, 12),  -- Teclado Mecânico para Luís Guilherme
(3, 13),  -- Smart TV para Marta Helena
(17, 14), -- Cabo HDMI para Nuno Miguel
(19, 15), -- Ring Light para Patrícia Neves
(5, 16),  -- Mouse para Rafael Teixeira
(2, 17),  -- Smartphone para Sofia Beatriz
(11, 18), -- Impressora para Thiago Henrique
(14, 19); -- Pendrive para Viviane Xavier
GO
 
DECLARE @ClienteId INT = 10;
DECLARE @Produto1Id INT = 5;
DECLARE @Qtd1 INT = 5;
DECLARE @Produto2Id INT = 7;
DECLARE @Qtd2 INT = 20;
 
IF EXISTS (
	SELECT 1 FROM tbl_vendas 
	INNER JOIN tbl_produtos ON tbl_produtos.id_prod = tbl_vendas.id_prod_fk 
	INNER JOIN tbl_clientes ON tbl_clientes.id_cliente = tbl_vendas.id_cliente_fk
	WHERE tbl_produtos.id_prod = @Produto1Id AND tbl_produtos.qtd_estoque < @Qtd1
	UNION ALL
	SELECT 1 FROM tbl_vendas 
	INNER JOIN tbl_produtos ON tbl_produtos.id_prod = tbl_vendas.id_prod_fk 
	INNER JOIN tbl_clientes ON tbl_clientes.id_cliente = tbl_vendas.id_cliente_fk
	WHERE tbl_produtos.id_prod = @Produto2Id AND tbl_produtos.qtd_estoque < @Qtd2
)
BEGIN
	PRINT('Estoque insuficiente! Transação cancelada')
	ROLLBACK;
END
 
ELSE
BEGIN
	UPDATE tbl_produtos
	SET qtd_estoque = qtd_estoque - @Qtd1
	WHERE id_prod = @Produto1Id
	UPDATE tbl_produtos
	SET qtd_estoque = qtd_estoque - @Qtd2
	WHERE id_prod = @Produto2Id
	COMMIT;
	PRINT ('Pedido Realizado Com Sucesso');
END
 
 
SELECT * FROM tbl_produtos
 
 
UPDATE tbl_produtos
SET qtd_estoque = 100
WHERE id_prod = 5