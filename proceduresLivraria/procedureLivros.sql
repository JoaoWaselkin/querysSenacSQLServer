USE atv_procedure
CREATE PROCEDURE P_ATV_PROCEDURE_LIVROS 
(
	@Titulo_livro VARCHAR(100),
	@Autor_livro VARCHAR(100),
	@Ano_publicacao INT,
	@Genero_livro VARCHAR(50),
	@Disponivel BIT --BOOLEAN
)
AS
	BEGIN
		SET NOCOUNT ON
		INSERT INTO tbl_livros (titulo_livro, autor_livro, ano_publicacao, genero_livro, disponivel)
		VALUES	(@Titulo_livro, @Autor_livro, @Ano_publicacao, @Genero_livro, @Disponivel)
	END
 
EXEC P_ATV_PROCEDURE_LIVROS 'O Senhor dos Anéis: A Sociedade do Anel', 'J.R.R. Tolkien', 1954, 'Fantasia', 1
EXEC P_ATV_PROCEDURE_LIVROS 'Dom Casmurro', 'Machado de Assis', 1899, 'Romance', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'O Cortiço', 'Aluísio Azevedo', 1890, 'Romance', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'Memórias Póstumas de Brás Cubas', 'Machado de Assis', 1881, 'Romance', 0;
EXEC P_ATV_PROCEDURE_LIVROS '1984', 'George Orwell', 1949, 'Ficção Científica', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'Admirável Mundo Novo', 'Aldous Huxley', 1932, 'Ficção Científica', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'Fahrenheit 451', 'Ray Bradbury', 1953, 'Ficção Científica', 0;
EXEC P_ATV_PROCEDURE_LIVROS 'Neuromancer', 'William Gibson', 1984, 'Cyberpunk', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'Harry Potter e a Pedra Filosofal', 'J.K. Rowling', 1997, 'Fantasia', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'O Hobbit', 'J.R.R. Tolkien', 1937, 'Fantasia', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'A Culpa é das Estrelas', 'John Green', 2012, 'Romance', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'O Código Da Vinci', 'Dan Brown', 2003, 'Suspense', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'It: A Coisa', 'Stephen King', 1986, 'Terror', 0;
EXEC P_ATV_PROCEDURE_LIVROS 'O Silmarillion', 'J.R.R. Tolkien', 1977, 'Fantasia', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'O Pequeno Príncipe', 'Antoine de Saint-Exupéry', 1943, 'Literatura Infantil', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'A Moreninha', 'Joaquim Manuel de Macedo', 1844, 'Romance', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'O Alienista', 'Machado de Assis', 1882, 'Ficção', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'O Guarani', 'José de Alencar', 1857, 'Romance', 0;
EXEC P_ATV_PROCEDURE_LIVROS 'Iracema', 'José de Alencar', 1865, 'Romance', 1;
EXEC P_ATV_PROCEDURE_LIVROS 'O Mulato', 'Aluísio Azevedo', 1881, 'Romance', 1;

UPDATE tbl_livros
SET qtd_livro = 5

UPDATE tbl_livros
SET qtd_livro = 0, disponivel = 0
WHERE id_livro = 4

UPDATE tbl_livros
SET qtd_livro = 0, disponivel = 0
WHERE id_livro = 7

UPDATE tbl_livros
SET qtd_livro = 0, disponivel = 0
WHERE id_livro = 8

UPDATE tbl_livros
SET qtd_livro = 0, disponivel = 0
WHERE id_livro = 13

UPDATE tbl_livros
SET qtd_livro = 0, disponivel = 0
WHERE id_livro = 14

UPDATE tbl_livros
SET qtd_livro = 0, disponivel = 0
WHERE id_livro = 18

SELECT * FROM tbl_livros;