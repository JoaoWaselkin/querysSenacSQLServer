CREATE DATABASE bulk_escola;
GO
USE bulk_escola;
GO
 
 
CREATE TABLE tbl_aluno (
id INT PRIMARY KEY IDENTITY,
nome VARCHAR (255),
idade INT,
curso VARCHAR(255)
);
GO
 
 
CREATE TABLE tbl_produtos(
id INT PRIMARY KEY IDENTITY,
nome VARCHAR (255),
quantidade INT,
preco DECIMAL(10,2)
);	
GO
 
 
CREATE TABLE tbl_professores(
id INT PRIMARY KEY IDENTITY,
nome VARCHAR (255),
disciplina VARCHAR (255),
telefone CHAR(11)
);
GO
 
--TBL DE ALUNOS
BULK INSERT tbl_aluno
FROM 'caminhoDoSeuArquivo'
WITH (
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '\n',
		FIRSTROW = 2,
		CODEPAGE = '65001'
);
GO
 
--TBL DE PRODUTOS
BULK INSERT tbl_produtos
FROM 'caminhoDoSeuArquivo'
WITH (
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '\n',
		FIRSTROW = 2,
		CODEPAGE = '65001'
);
GO
 
--TBL DE PROFESSORES
BULK INSERT tbl_professores
FROM 'caminhoDoSeuArquivo'
WITH (
		FIELDTERMINATOR = ';',
		ROWTERMINATOR = '\n',
		FIRSTROW = 2,
		CODEPAGE = '65001'
);
GO
 
SELECT * FROM tbl_aluno;
SELECT * FROM tbl_produtos;
SELECT * FROM tbl_professores;
 
 
TRUNCATE TABLE tbl_aluno
TRUNCATE TABLE tbl_produtos;
TRUNCATE TABLE tbl_professores;