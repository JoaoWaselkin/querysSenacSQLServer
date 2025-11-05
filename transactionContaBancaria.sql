CREATE DATABASE transaction_contaBancaria;
GO

USE transaction_contaBancaria;
GO
 
--2
CREATE TABLE contas_bancarias(
id INT PRIMARY KEY IDENTITY,
titular VARCHAR(255),
saldo DECIMAL (10,2),
);
 
 
INSERT INTO contas_bancarias (titular, saldo) VALUES
('Ana Silva', 1500.50),
('Carlos Souza', 3200.00),
('Beatriz Costa', 850.75),
('Rafael Oliveira', 5600.20),
('Juliana Santos', 1230.45),
('Fernando Lima', 9800.00),
('Mariana Rocha', 450.10),
('Lucas Gomes', 7100.99),
('Aline Pereira', 2340.60),
('Pedro Alencar', 670.30),
('Joao Ferreira', 10500.00),
('Maria Laura', 7890.55),
('Guilherme Neves', 210.00),
('Isabela Mendes', 3890.70),
('Daniel Rodrigues', 11200.80),
('Carolina Alves', 500.00),
('Mateus Barros', 490.99),
('Larissa Dias', 1600.25),
('Vitor Barbosa', 990.15),
('Sofia Ribeiro', 8200.40),
('Diego Castro', 300.50),
('Camila Martins', 5100.00),
('Felipe Xavier', 270.75),
('Gabriela Nunes', 1450.20),
('Eduardo Pinto', 6300.45),
('Patricia Sousa', 910.10),
('Ricardo Vieira', 7400.99),
('Teresa Freitas', 2050.60),
('Bruno Moraes', 880.30),
('Renata Teixeira', 4000.00);
 
 
BEGIN TRAN
 
DECLARE @Pagador INT SET @Pagador =  11
DECLARE @Recebedor INT SET @Recebedor =  12
DECLARE @Valor INT SET @Valor =  200
 
		IF EXISTS(
			SELECT 1
			FROM contas_bancarias
			WHERE id = @Pagador AND saldo >= @Valor
		)
	BEGIN
		update contas_bancarias
		set saldo = saldo - @Valor
		where id = @Pagador
 
		update contas_bancarias
		set saldo = saldo + @Valor
		where id = @Recebedor
 
		PRINT('Saldo Atulizado Com Sucesso!')
		COMMIT;
		SELECT * FROM contas_bancarias
 
END
 
ELSE
	BEGIN
		PRINT('Saldo Insuficiente');
		ROLLBACK;
		SELECT * FROM contas_bancarias
 
END