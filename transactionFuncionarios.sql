CREATE DATABASE exTransaction_pabloJao;
GO
USE exTransaction_pabloJao;
GO
 
 
 
--1
CREATE TABLE tbl_funcionarios(
id INT PRIMARY KEY IDENTITY,
nome VARCHAR(55),
cargo VARCHAR(255),
salario DECIMAL(10,2),
);
GO
 
INSERT INTO tbl_funcionarios (nome, cargo, salario) VALUES
('João Silva', 'Gerente de Projetos', 8500.00),
('Maria Souza', 'Desenvolvedora Sênior', 9200.00),
('Pedro Santos', 'Analista de RH Pleno', 4500.00),
('Ana Costa', 'Designer Gráfico Júnior', 3200.00),
('Carlos Oliveira', 'Vendedor Externo', 3800.00),
('Fernanda Lima', 'Contadora Chefe', 10500.00),
('Ricardo Almeida', 'Técnico de Suporte I', 2900.00),
('Mariana Rocha', 'Coordenadora de Marketing', 7100.00),
('Gustavo Pereira', 'Engenheiro de Software', 8800.00),
('Patrícia Gomes', 'Recepcionista', 2500.00),
('Felipe Mendes', 'Supervisor de Vendas', 6300.00),
('Camila Nunes', 'Assistente Administrativo', 3100.00),
('Bruno Ferreira', 'Especialista em Dados', 11500.00),
('Laura Vieira', 'Estagiária de Comunicação', 1800.00),
('Rafael Barbosa', 'Diretor Executivo', 25000.00),
('Aline Dias', 'Analista Financeiro Sênior', 7600.00),
('Marcelo Castro', 'Motorista', 2800.00),
('Juliana Morais', 'Advogada Empresarial', 9800.00),
('Diego Pires', 'Técnico de Segurança do Trabalho', 4200.00),
('Vitoria Silveira', 'Analista de Suprimentos', 5400.00),
('Henrique Lins', 'Auditor Interno', 12000.00),
('Isabela Martins', 'UX/UI Designer Pleno', 5800.00),
('Lucas Rodrigues', 'Cientista de Dados', 10900.00),
('Gabriela Santos', 'Secretária Executiva', 4900.00),
('André Teixeira', 'Operador de Máquinas', 3000.00),
('Helena Vaz', 'Gerente Financeiro', 15000.00),
('Eduardo Xavier', 'Consultor Comercial', 6800.00),
('Beatriz Neves', 'Psicóloga Organizacional', 5100.00),
('Thiago Cordeiro', 'Eletricista de Manutenção', 3500.00),
('Sofia Queiroz', 'Assistente de RH Júnior', 2700.00);
 
BEGIN TRAN 
UPDATE tbl_funcionarios
SET salario = 5000
ROLLBACK;
print('Salario atualizado para a normalidade com sucesso!');
 
 
SELECT * FROM tbl_funcionarios;