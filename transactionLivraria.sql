CREATE DATABASE emprestimoLivros_pabloJao;
GO 
USE emprestimoLivros_pabloJao;
GO
 
CREATE TABLE tbl_livros (
id_livro INT PRIMARY KEY IDENTITY,
titulo VARCHAR(255),
autor VARCHAR(255),
qtd_disponivel INT
);
 
GO
 
CREATE TABLE tbl_emprestimos(
id_emprestimo INT PRIMARY KEY IDENTITY,
aluno VARCHAR(255),
id_livro_fk INT,
data_emprestimo DATE
FOREIGN KEY (id_livro_fk) REFERENCES tbl_livros(id_livro)
);
GO
 
 
INSERT INTO tbl_livros (titulo, autor, qtd_disponivel) VALUES 
('A Bússola de Ouro', 'Philip Pullman', 5),
('1984', 'George Orwell', 1),
('O Nome do Vento', 'Patrick Rothfuss', 0),
('Cem Anos de Solidão', 'Gabriel García Márquez', 3),
('Orgulho e Preconceito', 'Jane Austen', 2),
('A Culpa é das Estrelas', 'John Green', 4),
('O Hobbit', 'J.R.R. Tolkien', 6),
('Fahrenheit 451', 'Ray Bradbury', 1);
 
 
 
BEGIN TRAN
 
INSERT INTO tbl_emprestimos (aluno, id_livro_fk, data_emprestimo) VALUES 
('Ana Souza', 1, GETDATE()),
('Bruno Mendes', 2, GETDATE()),
('Carla Dias', 3, GETDATE()),
('Daniel Rocha', 4, GETDATE()),
('Elisa Lima', 5, GETDATE()),
('Felipe Gomes', 6, GETDATE()),
('Giovana Santos', 7, GETDATE()),
('Hugo Oliveira', 8, GETDATE());
 
DECLARE @LivroLocado INT = 3;
DECLARE @NomeLivro VARCHAR = 'A Bússola de Ouro';
DECLARE @Locatario INT = 1;
 
 
IF EXISTS (
	SELECT 1
	FROM tbl_livros INNER JOIN tbl_emprestimos ON tbl_emprestimos.id_livro_fk = tbl_livros.id_livro
	WHERE qtd_disponivel > 0 
)
 
BEGIN
	PRINT('LIVROS INSUFICIENTES');
	ROLLBACK;;
END

 
ELSE
	BEGIN
		PRINT('Emprestimo Realizado com sucesso!');
 
			UPDATE tbl_livros
			SET qtd_disponivel = qtd_disponivel - 1
			WHERE id_livro = @LivroLocado;
 
			SELECT * FROM tbl_livros
 
END
 
----------------------------------------------------
 
BEGIN TRAN
 
DECLARE @LivroLocadoID INT = 4;
 
INSERT INTO tbl_emprestimos (aluno, id_livro_fk, data_emprestimo) VALUES 
('Ana Souza', 1, GETDATE()),
('Bruno Mendes', 2, GETDATE()),
('Carla Dias', @LivroLocadoID, GETDATE()),
('Daniel Rocha', 4, GETDATE()),
('Elisa Lima', 5, GETDATE()),
('Felipe Gomes', 6, GETDATE()),
('Giovana Santos', 7, GETDATE()),
('Hugo Oliveira', 8, GETDATE());
 
IF NOT EXISTS (
    SELECT 1 
    FROM tbl_livros 
    WHERE id_livro = @LivroLocadoID 
    AND qtd_disponivel > 0
)
BEGIN
    PRINT('LIVRO ID ');
    PRINT(@LivroLocadoID); 
    PRINT(' INSUFICIENTE. Empréstimo CANCELADO.');
    ROLLBACK;
END
ELSE
BEGIN
    IF EXISTS (
        SELECT 1
        FROM tbl_livros
        WHERE id_livro = @LivroLocadoID
        AND qtd_disponivel = 1
    )
    BEGIN
        PRINT('Atenção: Este é o ÚLTIMO exemplar do livro ID ');
        PRINT(@LivroLocadoID);
        PRINT(' a ser emprestado!');
    END
    PRINT('Empréstimo Realizado com sucesso!');
 
    UPDATE tbl_livros
    SET qtd_disponivel = qtd_disponivel - 1
    WHERE id_livro = @LivroLocadoID;
    COMMIT;
    SELECT * FROM tbl_livros WHERE id_livro = @LivroLocadoID;
END