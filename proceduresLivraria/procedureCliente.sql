USE atv_procedure
CREATE PROCEDURE P_ATV_PROCEDURE_CLIENTE
(
	@Nome_cliente VARCHAR(100),
	@Telefone_cliente VARCHAR(20),
	@Email_cliente VARCHAR(20)
)
AS
BEGIN
	SET NOCOUNT ON
		INSERT INTO tbl_clientes(Nome_cliente, Telefone_cliente, Email_cliente)
		VALUES (@Nome_cliente, @Telefone_cliente, @Email_cliente)
END
GO
 
EXEC P_ATV_PROCEDURE_CLIENTE'João Silva', '(11) 9999-8888' , 'joao@email.com'
EXEC P_ATV_PROCEDURE_CLIENTE 'Amanda Xavier', '(11) 98765-4321', 'amanda.x@novoemail.com';
EXEC P_ATV_PROCEDURE_CLIENTE 'Bernardo Costa', '(21) 97654-3210', 'bernardo.c@rjmail.com';
EXEC P_ATV_PROCEDURE_CLIENTE 'Cecília Dias', '(31) 96543-2109', 'cecilia.d@minasnet.br';
EXEC P_ATV_PROCEDURE_CLIENTE 'Daniel Rocha', '(41) 95432-1098', 'daniel.r@prtele.net';
EXEC P_ATV_PROCEDURE_CLIENTE 'Elisa Ferreira', '(51) 94321-0987', 'elisa.f@sulmail.org';
EXEC P_ATV_PROCEDURE_CLIENTE 'Felipe Guedes', '(61) 93210-9876', 'felipe.g@bsb.com';
EXEC P_ATV_PROCEDURE_CLIENTE 'Giovana Haru', '(71) 92109-8765', 'giovana.h@bahia.com.br';
EXEC P_ATV_PROCEDURE_CLIENTE 'Heitor Ibanez', '(81) 91098-7654', 'heitor.i@pernambuco.net';
EXEC P_ATV_PROCEDURE_CLIENTE 'Isadora Jesus', '(85) 90987-6543', 'isadora.j@ceara.org';
EXEC P_ATV_PROCEDURE_CLIENTE 'Jorge Leal', '(92) 89876-5432', 'jorge.l@amzmail.com';
EXEC P_ATV_PROCEDURE_CLIENTE 'Larissa Matos', '(19) 88765-4321', 'larissa.m@campinas.br';
EXEC P_ATV_PROCEDURE_CLIENTE 'Miguel Nóbrega', '(16) 87654-3210', 'miguel.n@sertao.net';
EXEC P_ATV_PROCEDURE_CLIENTE 'Natália Oliveira', '(27) 86543-2109', 'natalia.o@esnet.com.br';
EXEC P_ATV_PROCEDURE_CLIENTE 'Otávio Pimentel', '(62) 85432-1098', 'otavio.p@goias.org';
EXEC P_ATV_PROCEDURE_CLIENTE 'Quésia Ramos', '(91) 84321-0987', 'quesia.r@para.com';
EXEC P_ATV_PROCEDURE_CLIENTE 'Rodrigo Santos', '(48) 83210-9876', 'rodrigo.s@florianet.net';
EXEC P_ATV_PROCEDURE_CLIENTE 'Tainá Uchoa', '(12) 82109-8765', 'taina.u@vale.com';
EXEC P_ATV_PROCEDURE_CLIENTE 'Vitor Vasconcelos', '(34) 81098-7654', 'vitor.v@udi.br';
EXEC P_ATV_PROCEDURE_CLIENTE 'Wallace Yamada', '(79) 80987-6543', 'wallace.y@sergipe.net';
EXEC P_ATV_PROCEDURE_CLIENTE 'Xuxa Zimer', '(47) 79876-5432', 'xuxa.z@blumenau.com';
