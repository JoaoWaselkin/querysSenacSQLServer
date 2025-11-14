CREATE DATABASE atv_procedure;
GO 
USE atv_procedure;
GO

CREATE TABLE tbl_livros (
id_livro INT PRIMARY KEY IDENTITY,
titulo_livro VARCHAR(100),
autor_livro VARCHAR(100),
ano_publicacao INT,
genero_livro VARCHAR(50),
disponivel BIT, --BOOLEAN
qtd_livro INT
);
GO
CREATE TABLE tbl_clientes (
id_cliente INT PRIMARY KEY IDENTITY,
nome_cliente VARCHAR(100),
telefone_cliente VARCHAR(20),
email_cliente VARCHAR(20)
);
 
GO
CREATE TABLE tbl_emprestimos (
id_emprestimo INT PRIMARY KEY IDENTITY,
id_livro_fk INT,
id_cliente_fk INT,
data_emprestimo DATE,
data_devolucao DATE,
qtd_livros_alugados INT,
possui_livro_alugado BIT,
data_previsao_devolucao DATE,
FOREIGN KEY (id_livro_fk) REFERENCES tbl_livros (id_livro),
FOREIGN KEY (id_cliente_fk) REFERENCES tbl_clientes (id_cliente)
);
GO

