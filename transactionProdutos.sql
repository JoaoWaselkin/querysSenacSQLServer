CREATE DATABASE transaction_produtos;
GO
USE transaction_produtos;
GO
 
CREATE TABLE tbl_produtos (
id INT PRIMARY KEY IDENTITY,
nome VARCHAR(55),
estoque INT
);
GO
 
INSERT INTO tbl_produtos (nome, estoque) VALUES
('Notebook Gamer X', 5),
('Smartphone Pro 15', 35),
('Monitor UltraWide', 12),
('Mouse Sem Fio RGB', 50),
('Teclado Mecânico TKL', 20),
('Cadeira Gamer Ergonômica', 8),
('Webcam Full HD', 40),
('SSD 1TB NVMe', 25),
('Headset Bluetooth Cancelamento Ruído', 18),
('Roteador Wi-Fi 6 Tri-Band', 10);
 
 
BEGIN TRAN
 
UPDATE tbl_produtos
SET nome = 'Placa de Video'
WHERE id = 5

COMMIT;
 
ROLLBACK; 
 
SELECT * FROM tbl_produtos;