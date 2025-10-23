CREATE DATABASE pizzaria_jaopablo3;
GO

USE pizzaria_jaopablo3;
GO

CREATE TABLE endereco(
    cep INT PRIMARY KEY,
    logradouro VARCHAR(200),
    bairro VARCHAR(100),
    cidade VARCHAR(50),
    estado VARCHAR(50)
);
GO

CREATE TABLE categoria(
    id_categoria INT IDENTITY PRIMARY KEY,
    tipo VARCHAR(255)
);
GO

CREATE TABLE autenticacao_cadastro(
    id_autenticacao_cadastro INT IDENTITY PRIMARY KEY,
    email VARCHAR(255) UNIQUE,
    usuario VARCHAR(255) UNIQUE,
    senha_hash VARCHAR(255),
    tipo_usuario VARCHAR(50)
);
GO

CREATE TABLE usuario(
    id_usuario INT IDENTITY PRIMARY KEY,
    nome VARCHAR(255),
    cpf BIGINT,
    telefone CHAR(11),
    numero INT,
    complemento VARCHAR(255),
    cep_cliente INT,
    FOREIGN KEY (cep_cliente) REFERENCES endereco(cep)
);
GO

CREATE TABLE produtos(
    id_produto INT IDENTITY PRIMARY KEY,
    nome_produto VARCHAR(255),
    preco DECIMAL(10,2),
    validade_produto DATE
);
GO

CREATE TABLE pizzas(
    id_pizza INT IDENTITY PRIMARY KEY,
    sabor VARCHAR(255),
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
GO

CREATE TABLE pizzaria(
    id_pizzaria INT IDENTITY PRIMARY KEY,
    nome_pizzaria VARCHAR(255),
    cnpj CHAR(14),
    cep_pizzaria INT,
    FOREIGN KEY (cep_pizzaria) REFERENCES endereco(cep),
    id_pizzas INT,
    FOREIGN KEY (id_pizzas) REFERENCES pizzas(id_pizza)
);
GO

CREATE TABLE fornecedores(
    id_fornecedor INT IDENTITY PRIMARY KEY,
    nome_fornecedor VARCHAR(255),
    cep_fornecedor INT,
    FOREIGN KEY (cep_fornecedor) REFERENCES endereco(cep),
    categoria INT,
    FOREIGN KEY (categoria) REFERENCES categoria(id_categoria),
    id_pizzas INT,
    FOREIGN KEY (id_pizzas) REFERENCES pizzas(id_pizza)
);
GO

CREATE TABLE categoria_fornecedores(
    id_categoria_fornecedores INT IDENTITY PRIMARY KEY,
    id_fornecedor INT,
    FOREIGN KEY (id_fornecedor) REFERENCES fornecedores(id_fornecedor),
    id_categoria INT,
    FOREIGN KEY (id_categoria) REFERENCES categoria(id_categoria)
);
GO

ALTER TABLE produtos
ADD id_categoria_fornecedor INT,
    CONSTRAINT fk_produtos_categoria_fornecedores
    FOREIGN KEY (id_categoria_fornecedor) REFERENCES categoria_fornecedores(id_categoria_fornecedores);
GO

CREATE TABLE funcionarios(
    id_funcionario INT IDENTITY PRIMARY KEY,
    salario DECIMAL(10,2),
    cargo VARCHAR(255),
    cep_funcionario INT,
    FOREIGN KEY (cep_funcionario) REFERENCES endereco(cep),
    id_usuario INT,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario),
    id_autenticacao_cadastro INT,
    FOREIGN KEY (id_autenticacao_cadastro) REFERENCES autenticacao_cadastro(id_autenticacao_cadastro)
);
GO

CREATE TABLE pedidos(
    id_pedido INT IDENTITY PRIMARY KEY,
    id_cliente INT,
    FOREIGN KEY (id_cliente) REFERENCES usuario(id_usuario),
    id_produto INT,
    FOREIGN KEY (id_produto) REFERENCES produtos(id_produto)
);
GO

CREATE TABLE pedidos_pizzas(
    id_pedido_pizza INT IDENTITY PRIMARY KEY,
    id_pedido INT,
    FOREIGN KEY (id_pedido) REFERENCES pedidos(id_pedido),
    id_pizza INT,
    FOREIGN KEY (id_pizza) REFERENCES pizzas(id_pizza),
    data_pedido DATETIME
);
GO

-- 1. ENDEREÇOS
INSERT INTO endereco (cep, logradouro, bairro, cidade, estado)
VALUES 
(10001,'Rua A','Centro','São Paulo','SP'),
(10002,'Rua B','Jardim','Rio de Janeiro','RJ'),
(10003,'Rua C','Bela Vista','Campinas','SP'),
(10004,'Rua D','Copacabana','Rio de Janeiro','RJ'),
(10005,'Rua E','Centro','São Paulo','SP'),
(10006,'Rua F','Santa Cecília','São Paulo','SP'),
(10007,'Rua G','Leblon','Rio de Janeiro','RJ'),
(10008,'Rua H','Boa Vista','Recife','PE'),
(10009,'Rua I','Centro','Belo Horizonte','MG'),
(10010,'Rua J','Trindade','Florianópolis','SC'),
(10011,'Rua K','Pinheiros','São Paulo','SP'),
(10012,'Rua L','Copacabana','Rio de Janeiro','RJ'),
(10013,'Rua M','Aldeota','Fortaleza','CE'),
(10014,'Rua N','Savassi','Belo Horizonte','MG'),
(10015,'Rua O','Moema','São Paulo','SP');
GO

-- 2. CATEGORIAS
INSERT INTO categoria (tipo)
VALUES
('Molhos'),
('Queijos'),
('Carnes'),
('Vegetais'),
('Massas'),
('Bebidas'),
('Doces'),
('Embalagens'),
('Condimentos'),
('Temperos'),
('Utensílios'),
('Higiene'),
('Sobremesas'),
('Congelados'),
('Verduras');
GO

-- 3. AUTENTICAÇÃO
INSERT INTO autenticacao_cadastro (email, usuario, senha_hash, tipo_usuario)
VALUES
('ana@email.com','ana1','hash1','cliente'),
('carlos@email.com','carlos1','hash2','cliente'),
('mariana@email.com','mariana1','hash3','cliente'),
('lucas@email.com','lucas1','hash4','cliente'),
('fernanda@email.com','fernanda1','hash5','cliente'),
('joao@email.com','joaop','hash6','cliente'),
('patricia@email.com','paty','hash7','cliente'),
('rafael@email.com','rafaelg','hash8','cliente'),
('camila@email.com','camilat','hash9','cliente'),
('juliana@email.com','julianac','hash10','cliente'),
('felipe@email.com','felipea','hash11','cliente'),
('bia@email.com','bial','hash12','cliente'),
('rodrigo@email.com','rodrigon','hash13','cliente'),
('larissa@email.com','lari','hash14','cliente'),
('gustavo@email.com','gustavof','hash15','cliente');
GO

-- 4. USUÁRIOS
INSERT INTO usuario (nome, cpf, telefone, numero, complemento, cep_cliente)
VALUES
('Ana Silva',12345678901,'11988887777',10,'Ap 101',10001),
('Carlos Lima',23456789012,'11999996666',45,'Casa',10002),
('Mariana Souza',34567890123,'21999995555',88,'Fundos',10003),
('Lucas Rocha',45678901234,'21988884444',22,'Ap 202',10004),
('Fernanda Dias',56789012345,'11977778888',55,'Casa',10005),
('João Pereira',67890123456,'11987654321',101,'Casa',10006),
('Patrícia Alves',78901234567,'21987654322',12,'Ap 301',10007),
('Rafael Gomes',89012345678,'81987654323',33,'Casa',10008),
('Camila Torres',90123456789,'31987654324',99,'Fundos',10009),
('Juliana Costa',11223344556,'48987654325',45,'Ap 402',10010),
('Felipe Araújo',22334455667,'11987654326',17,'Casa',10011),
('Beatriz Lima',33445566778,'21987654327',88,'Casa',10012),
('Rodrigo Nunes',44556677889,'85987654328',56,'Ap 102',10013),
('Larissa Rocha',55667788990,'31987654329',32,'Ap 203',10014),
('Gustavo Ferreira',66778899001,'11987654330',74,'Casa',10015);
GO

-- 5. FUNCIONÁRIOS
INSERT INTO funcionarios (salario, cargo, cep_funcionario, id_usuario, id_autenticacao_cadastro)
VALUES
(2500,'Atendente',10001,1,1),
(3000,'Pizzaiolo',10002,2,2),
(3200,'Gerente',10003,3,3),
(2800,'Caixa',10004,4,4),
(2700,'Entregador',10005,5,5),
(2600,'Atendente',10006,6,6),
(3500,'Pizzaiolo',10007,7,7),
(3700,'Gerente',10008,8,8),
(2900,'Caixa',10009,9,9),
(2750,'Entregador',10010,10,10),
(3100,'Supervisor',10011,11,11),
(3300,'Chef de Cozinha',10012,12,12),
(2600,'Atendente',10013,13,13),
(2700,'Entregador',10014,14,14),
(2850,'Caixa',10015,15,15);
GO

-- 6. FORNECEDORES
INSERT INTO fornecedores (nome_fornecedor, cep_fornecedor, categoria)
VALUES
('Fornecedor A',10001,1),
('Fornecedor B',10002,2),
('Fornecedor C',10003,3),
('Fornecedor D',10004,4),
('Fornecedor E',10005,5),
('Fornecedor F',10006,6),
('Fornecedor G',10007,7),
('Fornecedor H',10008,8),
('Fornecedor I',10009,9),
('Fornecedor J',10010,10),
('Fornecedor K',10011,11),
('Fornecedor L',10012,12),
('Fornecedor M',10013,13),
('Fornecedor N',10014,14),
('Fornecedor O',10015,15);
GO

-- 7. CATEGORIA_FORNECEDORES
INSERT INTO categoria_fornecedores (id_fornecedor, id_categoria)
VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15);
GO

-- 8. PRODUTOS
INSERT INTO produtos (nome_produto, preco, validade_produto, id_categoria_fornecedor)
VALUES
('Molho de Tomate',10.00,'2025-12-31',1),
('Queijo Mussarela',20.00,'2025-12-31',2),
('Calabresa',30.00,'2025-12-31',3),
('Tomate',5.00,'2025-12-31',4),
('Massa de Pizza',15.00,'2025-12-31',5),
('Refrigerante Cola',8.00,'2026-01-31',6),
('Chocolate',12.50,'2026-03-15',7),
('Caixa de Embalagens',30.00,'2030-01-01',8),
('Molho Barbecue',18.00,'2026-06-30',9),
('Pimenta do Reino',5.50,'2027-02-20',10),
('Guardanapos',6.00,'2030-12-31',11),
('Queijo Parmesão',25.00,'2025-12-31',12),
('Presunto',22.00,'2025-12-31',13),
('Azeitonas',10.00,'2025-12-31',14),
('Farinha de Trigo',14.00,'2026-12-31',15);
GO

-- 9. PIZZAS
INSERT INTO pizzas (sabor, id_produto)
VALUES
('Calabresa',3),
('Mussarela',2),
('Marguerita',4),
('Chocolate',7),
('Presunto e Queijo',13),
('Portuguesa',14),
('Quatro Queijos',12),
('Frango com Catupiry',5),
('Vegetariana',4),
('Romeu e Julieta',7),
('Barbecue',9),
('Napolitana',2),
('Bacon',3),
('Doce de Leite',7),
('Peperoni',3);
GO

-- 10. PIZZARIA
INSERT INTO pizzaria (nome_pizzaria, cnpj, cep_pizzaria, id_pizzas)
VALUES
('Pizzaria Alpha','12345678000101',10001,1),
('Pizzaria Beta','12345678000102',10002,2),
('Pizzaria Gama','12345678000103',10003,3),
('Pizzaria Delta','12345678000104',10004,4),
('Pizzaria Epsilon','12345678000105',10005,5),
('Pizzaria Omega','12345678000106',10006,6),
('Pizzaria Sigma','12345678000107',10007,7),
('Pizzaria Zeta','12345678000108',10008,8),
('Pizzaria Theta','12345678000109',10009,9),
('Pizzaria Lambda','12345678000110',10010,10),
('Pizzaria Kappa','12345678000111',10011,11),
('Pizzaria Omicron','12345678000112',10012,12),
('Pizzaria Phi','12345678000113',10013,13),
('Pizzaria Chi','12345678000114',10014,14),
('Pizzaria Psi','12345678000115',10015,15);
GO

-- 11. PEDIDOS
INSERT INTO pedidos (id_cliente, id_produto)
VALUES
(1,1),(2,2),(3,3),(4,4),(5,5),
(6,6),(7,7),(8,8),(9,9),(10,10),
(11,11),(12,12),(13,13),(14,14),(15,15);
GO

-- 12. PEDIDOS_PIZZAS
INSERT INTO pedidos_pizzas (id_pedido, id_pizza, data_pedido)
VALUES
(1,1,GETDATE()),
(2,2,GETDATE()),
(3,3,GETDATE()),
(4,4,GETDATE()),
(5,5,GETDATE()),
(6,6,GETDATE()),
(7,7,GETDATE()),
(8,8,GETDATE()),
(9,9,GETDATE()),
(10,10,GETDATE()),
(11,11,GETDATE()),
(12,12,GETDATE()),
(13,13,GETDATE()),
(14,14,GETDATE()),
(15,15,GETDATE());
GO

--SELECTS
-- 1. Produtos e Categoria_Fornecedores
SELECT produtos.nome_produto, produtos.id_categoria_fornecedor 
FROM produtos 
INNER JOIN categoria_fornecedores
ON produtos.id_categoria_fornecedor = categoria_fornecedores.id_categoria_fornecedores;

-- 2. Pedidos_Pizzas, Pizzas e Produtos
SELECT pedidos_pizzas.id_pedido, pizzas.id_pizza, produtos.nome_produto, pedidos_pizzas.data_pedido
FROM pedidos_pizzas
INNER JOIN pizzas ON pedidos_pizzas.id_pizza = pizzas.id_pizza
INNER JOIN produtos ON pizzas.id_produto = produtos.id_produto;

-- 3. Autenticação, Funcionários e Usuário
SELECT autenticacao_cadastro.id_autenticacao_cadastro, usuario.nome, autenticacao_cadastro.tipo_usuario
FROM autenticacao_cadastro
INNER JOIN funcionarios ON autenticacao_cadastro.id_autenticacao_cadastro = funcionarios.id_autenticacao_cadastro
INNER JOIN usuario ON funcionarios.id_usuario = usuario.id_usuario;

-- 4. Funcionários e Usuário
SELECT funcionarios.id_funcionario, usuario.nome, funcionarios.salario, funcionarios.cargo
FROM funcionarios
INNER JOIN usuario ON funcionarios.id_usuario = usuario.id_usuario;

-- 5. Pizzaria e Endereço
SELECT pizzaria.id_pizzaria, pizzaria.nome_pizzaria, endereco.*
FROM pizzaria 
INNER JOIN endereco ON pizzaria.cep_pizzaria = endereco.cep;

-- 6. Fornecedores e Endereço
SELECT fornecedores.id_fornecedor, fornecedores.nome_fornecedor, endereco.*
FROM fornecedores 
INNER JOIN endereco ON fornecedores.cep_fornecedor = endereco.cep;

-- 7. Produtos com validade futura
SELECT produtos.nome_produto, produtos.preco, produtos.validade_produto 
FROM produtos 
WHERE validade_produto > '2025-12-31';

-- 8. Produtos e Categoria (via Categoria_Fornecedores)
SELECT produtos.id_produto, produtos.nome_produto, categoria.tipo, produtos.validade_produto
FROM produtos
INNER JOIN categoria_fornecedores ON produtos.id_categoria_fornecedor = categoria_fornecedores.id_categoria_fornecedores
INNER JOIN categoria ON categoria_fornecedores.id_categoria = categoria.id_categoria;

-- 9. Listagem simples de produtos
SELECT id_produto, nome_produto, preco FROM produtos;

-- 10. Total de pedidos por cliente
SELECT pedidos.id_pedido, usuario.nome AS cliente, SUM(produtos.preco) AS total_pedido
FROM pedidos
INNER JOIN usuario ON pedidos.id_cliente = usuario.id_usuario
INNER JOIN produtos ON pedidos.id_produto = produtos.id_produto
GROUP BY pedidos.id_pedido, usuario.nome
ORDER BY total_pedido DESC;
