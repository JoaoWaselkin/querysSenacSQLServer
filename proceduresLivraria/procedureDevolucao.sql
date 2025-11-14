USE atv_procedure
CREATE PROCEDURE P_REGISTRAR_DEVOLUCAO
(
	@Id_emprestimo INT
)
AS
	BEGIN
		SET NOCOUNT ON
			BEGIN TRANSACTION
				IF EXISTS (
				SELECT 1
				FROM tbl_emprestimos
				WHERE qtd_livros_alugados = 0 AND id_emprestimo = @Id_emprestimo
			)
			BEGIN
				PRINT 'Usuario nao tem livro para devolver.'
				ROLLBACK;
			END
			ELSE
				BEGIN
				UPDATE tbl_emprestimos
				SET data_devolucao = GETDATE()
				WHERE id_emprestimo = @Id_emprestimo;

				UPDATE tbl_livros
				SET qtd_livro = qtd_livro + 1,
					disponivel = 1
				WHERE id_livro = (
					SELECT id_livro_fk
					FROM tbl_emprestimos
					WHERE id_emprestimo = @Id_emprestimo
				);
				UPDATE tbl_emprestimos
				SET qtd_livros_alugados = qtd_livros_alugados - 1
				WHERE id_emprestimo = @Id_emprestimo;
 
				UPDATE tbl_emprestimos
				SET possui_livro_alugado = 0
				WHERE qtd_livros_alugados = 0
 
				COMMIT;
		END
	END
GO
EXEC P_REGISTRAR_DEVOLUCAO 1
EXEC P_REGISTRAR_DEVOLUCAO 2
EXEC P_REGISTRAR_DEVOLUCAO 3
EXEC P_REGISTRAR_DEVOLUCAO 4
EXEC P_REGISTRAR_DEVOLUCAO 5
EXEC P_REGISTRAR_DEVOLUCAO 6
EXEC P_REGISTRAR_DEVOLUCAO 7
EXEC P_REGISTRAR_DEVOLUCAO 8
EXEC P_REGISTRAR_DEVOLUCAO 9
EXEC P_REGISTRAR_DEVOLUCAO 10
EXEC P_REGISTRAR_DEVOLUCAO 11
EXEC P_REGISTRAR_DEVOLUCAO 12
EXEC P_REGISTRAR_DEVOLUCAO 13
EXEC P_REGISTRAR_DEVOLUCAO 14
EXEC P_REGISTRAR_DEVOLUCAO 15
EXEC P_REGISTRAR_DEVOLUCAO 16
EXEC P_REGISTRAR_DEVOLUCAO 17
EXEC P_REGISTRAR_DEVOLUCAO 18
EXEC P_REGISTRAR_DEVOLUCAO 19
EXEC P_REGISTRAR_DEVOLUCAO 20
GO

SELECT * FROM tbl_emprestimos;
SELECT * FROM tbl_livros;
SELECT * FROM tbl_clientes;

TRUNCATE TABLE TBL_EMPRESTIMOS;

DROP PROCEDURE P_REGISTRAR_DEVOLUCAO;
GO
 
UPDATE tbl_livros
SET qtd_livro = 0, disponivel = 0
WHERE id_livro = 14

UPDATE tbl_livros
SET qtd_livro = 5

UPDATE tbl_emprestimos
SET qtd_livros_alugados = 0