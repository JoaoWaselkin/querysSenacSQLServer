USE atv_procedure
CREATE PROCEDURE P_DELECAO (
	@Id_cliente INT
)
AS
	BEGIN 
	SET NOCOUNT ON
		BEGIN TRANSACTION
		IF EXISTS (
			SELECT 1
			FROM tbl_emprestimos
			WHERE possui_livro_alugado = 1 AND id_cliente_fk = @Id_cliente
		)
		BEGIN
			PRINT 'O USUÁRIO NÃO PODE SER DELETADO POIS POSSUI LIVRO ALUGADO ATIVO.'
			ROLLBACK;
		END
 
		ELSE
		BEGIN
			DELETE FROM tbl_emprestimos
			WHERE id_cliente_fk = @Id_cliente; 
               
			DELETE FROM tbl_clientes
			WHERE id_cliente = @Id_cliente;
			
			COMMIT;
		END
	END
GO

EXEC P_DELECAO 4

DROP PROCEDURE P_DELECAO;
GO
 