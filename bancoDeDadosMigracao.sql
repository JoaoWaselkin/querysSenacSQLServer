CREATE DATABASE migracao_pabloJao;
GO
USE migracao_pabloJao;
GO
CREATE TABLE tbl_endereco (
id INT,
cep INT PRIMARY KEY,
logradouro VARCHAR(90),
bairro VARCHAR(50),
cidade VARCHAR(50),
estado CHAR(2)
);
GO
CREATE TABLE tbl_produto (
cod_produto INT PRIMARY KEY IDENTITY,
nome_produto VARCHAR(100),
desc_produto VARCHAR(100),
unid_medida VARCHAR(2),
estoque_atual INT,
estoque_min INT,
estoque_max INT,
valor DECIMAL (10,2)
);
GO
CREATE TABLE tbl_cliente (
cod_cliente INT PRIMARY KEY IDENTITY,
nome_cliente VARCHAR(45),
cpf VARCHAR(11),
data_nasc DATE,
cep INT,
numero VARCHAR(10),
complemento VARCHAR(20),
FOREIGN KEY (cep) REFERENCES tbl_endereco(cep)
);
GO
CREATE TABLE tbl_pedido (
cod_pedido INT PRIMARY KEY IDENTITY,
data_pedido DATE,
data_entrega DATE,
cod_cliente INT,
FOREIGN KEY (cod_cliente) REFERENCES tbl_cliente(cod_cliente)
);
GO
CREATE TABLE tbl_itempedido(
qtde INT,
i_cod_pedido INT,
i_cod_produto INT,
i_valor DECIMAL (10,2),
PRIMARY KEY (i_cod_pedido, i_cod_produto),
FOREIGN KEY (i_cod_pedido) REFERENCES tbl_pedido(cod_pedido),
FOREIGN KEY (i_cod_produto) REFERENCES tbl_produto(cod_produto)
);
GO
 
INSERT INTO tbl_endereco (id, cep, logradouro, bairro, cidade, estado) VALUES
(1, 10001000, 'Rua das Flores, 100', 'Jardim Amarelo', 'São Paulo', 'SP'),
(2, 20002000, 'Avenida Principal, 250', 'Centro', 'Rio de Janeiro', 'RJ'),
(3, 30003000, 'Travessa da Saudade, 50', 'Vila Nova', 'Belo Horizonte', 'MG'),
(4, 40004000, 'Praça da Liberdade, 10', 'Redenção', 'Porto Alegre', 'RS'),
(5, 50005000, 'Estrada do Sol, 88', 'Praia Grande', 'Salvador', 'BA'),
(6, 60006000, 'Alameda dos Anjos, 333', 'Paraíso', 'Curitiba', 'PR'),
(7, 70007000, 'Rua Sete de Setembro, 777', 'Independência', 'Recife', 'PE'),
(8, 80008000, 'Avenida das Nações, 1200', 'Global', 'Brasília', 'DF'),
(9, 90009000, 'Rua da Tecnologia, 404', 'Inovação', 'Campinas', 'SP'),
(10, 11001100, 'Largo da Alegria, 5', 'Felicidade', 'Niterói', 'RJ'),
(11, 12001200, 'Rua B, 22', 'Zona Industrial', 'Manaus', 'AM');
GO
 
INSERT INTO tbl_produto (nome_produto, desc_produto, unid_medida, estoque_atual, estoque_min, estoque_max, valor) VALUES
('Notebook Gamer X', 'Laptop de alta performance para jogos', 'UN', 50, 10, 100, 4500.00),
('Mouse Óptico', 'Mouse ergonômico com fio', 'UN', 200, 50, 300, 59.90),
('Monitor LED 27"', 'Tela Full HD com alta taxa de atualização', 'UN', 80, 20, 150, 1200.50),
('Teclado Mecânico', 'Teclado com switches azuis, ABNT2', 'UN', 150, 30, 250, 299.00),
('Webcam HD', 'Câmera para videoconferências 720p', 'UN', 120, 40, 200, 99.90),
('Fone de Ouvido Sem Fio', 'Áudio de alta fidelidade e cancelamento de ruído', 'UN', 180, 50, 280, 450.00),
('HD Externo 1TB', 'Armazenamento portátil USB 3.0', 'UN', 90, 25, 150, 350.75),
('Cabo HDMI 2m', 'Cabo para transmissão digital de áudio e vídeo', 'UN', 300, 100, 500, 35.00),
('Roteador Wi-Fi 6', 'Roteador dual band com alta velocidade', 'UN', 70, 15, 120, 550.00),
('Impressora Multifuncional', 'Impressora, scanner e copiadora a jato de tinta', 'UN', 60, 10, 100, 680.00),
('SSD 512GB', 'Drive de estado sólido para notebooks e desktops', 'UN', 110, 20, 180, 380.00);
GO
 
-- INSERÇÃO ORIGINAL DE CLIENTES
INSERT INTO tbl_cliente (nome_cliente, cpf, data_nasc, cep, numero, complemento) VALUES
('João Silva', '12345678901', '1985-05-15', 10001000, '100', 'Apto 101'),
('Maria Santos', '11122233344', '1990-10-20', 20002000, '250', 'Bloco B'),
('Pedro Souza', '55566677788', '2001-01-01', 30003000, '50', NULL),
('Ana Oliveira', '99988877766', '1975-03-22', 40004000, '10', 'Casa'),
('Carlos Lima', '44433322211', '1995-12-10', 50005000, '88', 'Lote 05'),
('Sofia Costa', '77788899900', '1988-07-30', 60006000, '333', 'Fundos'),
('Lucas Pereira', '22211100099', '2000-04-18', 70007000, '777', 'Sala 02'),
('Laura Rodrigues', '33344455566', '1992-11-25', 80008000, '1200', 'Andar 10'),
('Gabriel Almeida', '66655544433', '1980-02-14', 90009000, '404', 'Loja'),
('Helena Ferreira', '88877766655', '1998-09-05', 11001100, '5', 'Portaria'),
('Rafael Martins', '10110110110', '1993-06-03', 12001200, '22', 'Galpão');
GO
 
-- REPETIÇÃO E VARIAÇÃO DE CLIENTES (Para garantir a diferenciação nas datas)
INSERT INTO tbl_cliente (nome_cliente, cpf, data_nasc, cep, numero, complemento) VALUES
('João Silva Jr', '12345678911', '1985-03-15', 10001000, '100', 'Apto 101'), -- Compartilha 1985-03-15 com Helena e João Silva Original
('Maria Santos Neta', '11122233355', '1990-10-20', 20002000, '250', 'Bloco B'),
('Pedro Souza Sobrinho', '55566677799', '2001-01-01', 30003000, '50', NULL), -- Compartilha 2001-01-01 com Gabriel Almeida
('Ana Oliveira Filha', '99988877777', '1975-03-22', 40004000, '10', 'Casa'),
('Carlos Lima Neto', '44433322222', '1995-12-10', 50005000, '88', 'Lote 05'),
('Sofia Costa Irmã', '77788899911', '1988-07-30', 60006000, '333', 'Fundos'),
('Lucas Pereira Filho', '22211100000', '1992-11-25', 70007000, '777', 'Sala 02'), -- Compartilha 1992-11-25 com Laura Rodrigues
('Laura Rodrigues Prima', '33344455577', '1992-11-25', 80008000, '1200', 'Andar 10'),
('Gabriel Almeida Primo', '66655544444', '2001-01-01', 90009000, '404', 'Loja'),
('Helena Ferreira Prima', '88877766666', '1985-03-15', 11001100, '5', 'Portaria'),
('Rafael Martins Filho', '10110110120', '1993-06-03', 12001200, '22', 'Galpão');
GO
 
-- DADOS DE PEDIDOS (Incluindo os seus dados iniciais e os dados variados)
 
-- PEDIDOS INICIAIS (1 a 10)
INSERT INTO tbl_pedido (data_pedido, data_entrega, cod_cliente) VALUES
('2024-10-01', '2024-10-05', 1),
('2024-10-02', '2024-10-07', 2),
('2024-10-02', '2024-10-08', 3),
('2024-10-03', '2024-10-09', 1),
('2024-10-04', '2024-10-10', 4),
('2024-10-04', '2024-10-11', 5),
('2024-10-05', '2024-10-12', 2),
('2024-10-06', '2024-10-13', 6),
('2024-10-07', '2024-10-14', 3),
('2024-10-08', '2024-10-15', 1);
GO
 
-- PEDIDOS COM CENÁRIOS VARIADOS (11 a 20)
-- Utiliza os novos cod_cliente gerados após a segunda inserção de clientes (a partir do 12)
INSERT INTO tbl_pedido (data_pedido, data_entrega, cod_cliente) VALUES
('2024-11-09', '2024-11-15', 12), -- Cliente 12 (João Silva Jr)
('2024-11-10', '2024-11-10', 16), -- Cliente 16 (Carlos Lima Neto)
('2024-11-11', '2024-11-14', 22), -- Cliente 22 (Rafael Martins Filho)
('2024-11-11', '2024-11-13', 13), -- Cliente 13 (Maria Santos Neta)
('2024-11-12', '2024-11-18', 15), -- Cliente 15 (Ana Oliveira Filha)
('2024-11-13', '2024-11-13', 12), -- Cliente 12 (João Silva Jr - Segunda compra)
('2024-11-14', '2024-11-17', 18), -- Cliente 18 (Lucas Pereira Filho)
('2024-11-14', '2024-11-20', 14), -- Cliente 14 (Pedro Souza Sobrinho)
('2024-11-15', '2024-11-18', 20), -- Cliente 20 (Gabriel Almeida Primo)
('2024-11-15', '2024-11-19', 16); -- Cliente 16 (Carlos Lima Neto - Segunda compra)
GO
 
-- DADOS DE ITENS DE PEDIDO
 
-- ITENS DOS PEDIDOS INICIAIS (1 a 10)
INSERT INTO tbl_itempedido (qtde, i_cod_pedido, i_cod_produto, i_valor) VALUES
(1, 1, 1, 4500.00), -- Pedido 1
(2, 1, 8, 35.00),
(1, 2, 6, 450.00), -- Pedido 2
(1, 2, 7, 350.75),
(5, 3, 2, 59.90), -- Pedido 3
(1, 4, 3, 1200.50), -- Pedido 4
(1, 5, 10, 680.00), -- Pedido 5
(1, 5, 9, 550.00),
(5, 5, 4, 99.90),
(1, 6, 5, 180.00), -- Pedido 6
(3, 6, 8, 35.00),
(2, 7, 2, 59.90), -- Pedido 7
(1, 7, 4, 99.90),
(1, 8, 1, 4600.00), -- Pedido 8
(1, 8, 9, 550.00),
(10, 9, 8, 35.00), -- Pedido 9
(1, 10, 3, 1200.50), -- Pedido 10
(1, 10, 6, 450.00);
GO
 
-- ITENS DOS PEDIDOS COM CENÁRIOS VARIADOS (11 a 20)
INSERT INTO tbl_itempedido (qtde, i_cod_pedido, i_cod_produto, i_valor) VALUES
(1, 11, 1, 4700.00),  -- Pedido 11
(2, 11, 6, 450.00),
(5, 11, 8, 30.00),
(1, 12, 9, 580.00),   -- Pedido 12
(10, 13, 8, 32.00),   -- Pedido 13
(3, 13, 2, 65.00),
(1, 14, 10, 750.00),  -- Pedido 14
(1, 14, 3, 1150.00),
(1, 15, 7, 360.75),   -- Pedido 15
(1, 16, 1, 4600.00),  -- Pedido 16
(2, 17, 4, 110.00),   -- Pedido 17
(1, 17, 5, 190.00),
(1, 18, 3, 1250.00),  -- Pedido 18
(5, 19, 2, 59.90),    -- Pedido 19
(1, 20, 6, 440.00);   -- Pedido 20
GO
 
-- ATIVIDADE 3 (Consultas)
 
SELECT nome_cliente, data_nasc FROM tbl_cliente WHERE data_nasc >= '1960-01-01' and data_nasc <= '1990-12-31';
GO
 
SELECT nome_cliente, data_nasc FROM tbl_cliente ORDER BY data_nasc DESC;
GO
 
--MÊS COM MAIS CLIENTES NASCIDOS
SELECT MONTH(data_nasc) AS Mes_Nascimento, COUNT(*) AS Total_Nascimentos
FROM tbl_cliente
GROUP BY MONTH(data_nasc)
ORDER BY Total_Nascimentos DESC, Mes_Nascimento ASC;
 
-- MÊS COM MAIS PEDIDOS REALIZADOS
SELECT MONTH(data_pedido) as mes_pedido, COUNT(*) AS total_pedidos
FROM tbl_pedido
GROUP BY MONTH(data_pedido)
ORDER BY total_pedidos;
 
--MENOR PRODUTO VENDIDO
 
SELECT TOP 1 i_cod_pedido, SUM(qtde * i_valor) AS total_pedido 
FROM tbl_itempedido
GROUP BY i_cod_pedido
ORDER BY total_pedido ASC
 
--MAIOR PRODUTO VENDIDO
SELECT TOP 1 i_cod_pedido, SUM(qtde * i_valor) AS total_pedido 
FROM tbl_itempedido
GROUP BY i_cod_pedido
ORDER BY total_pedido DESC
 
--TOTAL DO ESTOQUE
SELECT SUM(estoque_atual) AS total_estoque
FROM tbl_produto
ORDER BY total_estoque
 
--MEDIA DO ESTOQUE
SELECT AVG(estoque_atual) AS total_estoque
FROM tbl_produto
ORDER BY total_estoque
 
--TOTAL VALOR DO ESTOQUE
SELECT SUM(valor) AS total_valor_estoque
FROM tbl_produto
ORDER BY total_valor_estoque