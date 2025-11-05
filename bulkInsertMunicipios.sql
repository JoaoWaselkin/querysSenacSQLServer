CREATE DATABASE import_bulk;
GO
USE import_bulk;
GO
 
CREATE TABLE tbl_municipios(
posicao VARCHAR(255),
regiao VARCHAR(50),
codigo_ibge INT PRIMARY KEY,
municipio VARCHAR(255),
unidade_federativa VARCHAR(255),
populacao BIGINT,
classificacao VARCHAR(255)
);
GO
 
 
BULK INSERT tbl_municipios
FROM 'caminhoDoSeuArquivo'
WITH (
		FIELDTERMINATOR  = ';',
		ROWTERMINATOR = '\n',
		FIRSTROW = 2,
		CODEPAGE = '65001'
);
GO
 
 
SELECT * FROM tbl_municipios
ORDER BY codigo_ibge;
 
DROP TABLE tbl_municipios
 
TRUNCATE TABLE tbl_municipios;