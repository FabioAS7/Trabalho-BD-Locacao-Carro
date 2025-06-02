/*
CREATE DATABASE aluguel_carros
GO
USE aluguel_carros
GO


USE master
GO
DROP DATABASE aluguel_carros

DROP TABLE aluguel_de_carro;
DROP TABLE reparo;
DROP TABLE locatario;
DROP TABLE endereco;
DROP TABLE carro;
DROP TABLE categoria;
GO
*/
GO

-------------------------------------------------------------------------- CRIACAO/INSERCAO DAS TABLEs --------------------------------------------------------------------------- 

CREATE TABLE categoria(
id INT PRIMARY KEY NOT NULL,
nome VARCHAR(80) NOT NULL,
valor_diaria DECIMAL(7,2) NOT NULL
)
GO
CREATE TABLE carro(
placa CHAR(8) PRIMARY KEY NOT NULL,
marca VARCHAR(100) NOT NULL,
modelo VARCHAR(100) NOT NULL,
cor VARCHAR(80) NOT NULL,
ano DATE NOT NULL,
tipo_combustivel VARCHAR(80) NOT NULL,
litros_combustivel DECIMAL(5,2) NOT NULL,
km_rodados DECIMAL(10,1) NOT NULL,
tipo_cambio VARCHAR(50) NOT NULL,
status_carro VARCHAR(50) NOT NULL,
categoria_id INT NOT NULL,
FOREIGN KEY (categoria_id) REFERENCES categoria(id)
)
GO
CREATE TABLE reparo(
id INT PRIMARY KEY NOT NULL,
dia_entrada DATE NOT NULL,
quant_dias_reparo INT NOT NULL,
descricao_problema VARCHAR(255) NOT NULL,
valor_reparo DECIMAL(9,2) NOT NULL,
carro_placa CHAR(8) NOT NULL,
FOREIGN KEY (carro_placa) REFERENCES carro(placa)
)
GO
CREATE TABLE endereco(
id INT PRIMARY KEY NOT NULL,
logradouro_endereco VARCHAR(100) NOT NULL,
logradouro_num VARCHAR(100) NOT NULL,
logradouro_cep VARCHAR(100) NOT NULL,
logradouro_cidade VARCHAR(100) NOT NULL
)
GO
CREATE TABLE locatario(
cpf CHAR(11) PRIMARY KEY NOT NULL,
nome VARCHAR(90) NOT NULL,
num_habilitacao CHAR(11) NOT NULL,
data_nascimento DATE,
endereco_id INT NOT NULL,
FOREIGN KEY (endereco_id) REFERENCES endereco(id)
)
GO
CREATE TABLE aluguel_de_carro(
id INT PRIMARY KEY NOT NULL,
carro_placa CHAR(8) NOT NULL,
locatario_cpf CHAR(11) NOT NULL,
data_retirada DATE NOT NULL,
data_devolucao DATE NOT NULL,
status_aluguel VARCHAR(50) NOT NULL,
FOREIGN KEY (carro_placa) REFERENCES carro(placa),
FOREIGN KEY (locatario_cpf) REFERENCES locatario(cpf)
)
GO


INSERT INTO categoria VALUES
(1, 'Econômico', 120.00),
(2, 'Intermediário', 180.00),
(3, 'SUV', 250.00),
(4, 'Luxo', 400.00);
GO
INSERT INTO endereco VALUES
(1, 'Rua das Flores', '123', '01001-000', 'São Paulo'),
(2, 'Av. Paulista', '1000', '01310-000', 'São Paulo'),
(3, 'Rua da Consolação', '250', '01302-000', 'São Paulo'),
(4, 'Rua Augusta', '501', '01413-000', 'São Paulo'),
(5, 'Av. Brasil', '100', '20040-010', 'Rio de Janeiro'),
(6, 'Rua das Acácias', '77', '20041-020', 'Rio de Janeiro'),
(7, 'Av. Central', '300', '30120-010', 'Belo Horizonte'),
(8, 'Rua das Palmeiras', '400', '30120-011', 'Belo Horizonte'),
(9, 'Rua das Orquídeas', '500', '04014-020', 'Curitiba'),
(10, 'Av. Sete de Setembro', '700', '04014-021', 'Curitiba'),
(11, 'Rua das Laranjeiras', '150', '01002-000', 'São Paulo'),
(12, 'Rua dos Pinheiros', '203', '01311-000', 'São Paulo'),
(13, 'Av. Brasil', '125', '20042-010', 'Rio de Janeiro'),
(14, 'Rua do Ouro', '88', '30121-010', 'Belo Horizonte'),
(15, 'Rua do Rosário', '333', '04015-020', 'Curitiba'),
(100, 'Rua das Hortênsias', '90', '01050-000', 'São Paulo');
GO
INSERT INTO locatario VALUES
('12345678901', 'Ana Silva', 'AB123456789', '1985-04-15', 1),
('23456789012', 'Bruno Souza', 'BC234567890', '1990-07-22', 2),
('34567890123', 'Carlos Pereira', 'CD345678901', '1982-01-10', 3),
('45678901234', 'Daniela Rocha', 'DE456789012', '1995-12-05', 4),
('56789012345', 'Eduardo Lima', 'EF567890123', '1988-03-18', 5),
('67890123456', 'Fabiana Costa', 'FG678901234', '1993-06-30', 6),
('78901234567', 'Gabriel Alves', 'GH789012345', '1980-08-21', 7),
('89012345678', 'Helena Martins', 'HI890123456', '1987-11-02', 8),
('90123456789', 'Igor Fernandes', 'IJ901234567', '1992-09-14', 9),
('01234567890', 'Júlia Santos', 'JK012345678', '1984-05-29', 10),
('11122233344', 'Lucas Oliveira', 'LM111222333', '1986-01-20', 11),
('22233344455', 'Mariana Gomes', 'MN222333444', '1991-07-11', 12),
('33344455566', 'Nicolas Barbosa', 'NO333444555', '1983-03-03', 13),
('44455566677', 'Olívia Ribeiro', 'OP444555666', '1994-10-15', 14),
('55566677788', 'Paulo Castro', 'PQ555666777', '1989-12-28', 15);
GO
INSERT INTO carro VALUES
('AAA1234B', 'Volkswagen', 'Gol', 'Prata', '2015-01-01', 'Gasolina', 50.0, 120000.0, 'Manual', 'Disponível', 1),
('BBB2345C', 'Chevrolet', 'Onix', 'Preto', '2018-01-01', 'Flex', 45.0, 80000.0, 'Automático', 'Alugado', 2),
('CCC3456D', 'Ford', 'EcoSport', 'Branco', '2020-01-01', 'Flex', 60.0, 50000.0, 'Automático', 'Disponível', 3),
('DDD4567E', 'BMW', 'X3', 'Azul', '2021-01-01', 'Diesel', 65.0, 30000.0, 'Automático', 'Em reparo', 4),
('EEE5678F', 'Honda', 'Civic', 'Vermelho', '2019-01-01', 'Gasolina', 55.0, 70000.0, 'Manual', 'Disponível', 2),
('FFF6789G', 'Toyota', 'Corolla', 'Prata', '2017-01-01', 'Flex', 58.0, 90000.0, 'Automático', 'Disponível', 2),
('GGG7890H', 'Jeep', 'Renegade', 'Verde', '2018-01-01', 'Flex', 60.0, 60000.0, 'Manual', 'Alugado', 3),
('HHH8901I', 'Audi', 'A4', 'Branco', '2020-01-01', 'Gasolina', 55.0, 40000.0, 'Automático', 'Disponível', 4),
('III9012J', 'Renault', 'Duster', 'Preto', '2016-01-01', 'Diesel', 65.0, 110000.0, 'Manual', 'Disponível', 3),
('JJJ0123K', 'Fiat', 'Uno', 'Azul', '2014-01-01', 'Flex', 40.0, 130000.0, 'Manual', 'Alugado', 1),
('KKK1234L', 'Volkswagen', 'Polo', 'Prata', '2018-01-01', 'Flex', 45.0, 75000.0, 'Automático', 'Disponível', 2),
('LLL2345M', 'Chevrolet', 'Cruze', 'Vermelho', '2019-01-01', 'Gasolina', 50.0, 60000.0, 'Manual', 'Disponível', 2),
('MMM3456N', 'Ford', 'Focus', 'Preto', '2017-01-01', 'Flex', 55.0, 85000.0, 'Automático', 'Alugado', 2),
('NNN4567O', 'BMW', 'X1', 'Branco', '2020-01-01', 'Diesel', 60.0, 40000.0, 'Automático', 'Disponível', 4);
GO
INSERT INTO aluguel_de_carro VALUES
(1, 'AAA1234B', '12345678901', '2025-05-01', '2025-05-10', 'Finalizado'),
(2, 'BBB2345C', '23456789012', '2025-05-01', '2025-05-08', 'Finalizado'),
(3, 'CCC3456D', '34567890123', '2025-05-01', '2025-05-05', 'Finalizado'),
(4, 'DDD4567E', '45678901234', '2025-05-02', '2025-05-09', 'Em andamento'),
(5, 'EEE5678F', '56789012345', '2025-05-02', '2025-05-07', 'Finalizado'),
(6, 'FFF6789G', '67890123456', '2025-05-03', '2025-05-10', 'Finalizado'),
(7, 'GGG7890H', '78901234567', '2025-05-03', '2025-05-06', 'Finalizado'),
(8, 'HHH8901I', '89012345678', '2025-05-04', '2025-05-08', 'Finalizado'),
(9, 'III9012J', '90123456789', '2025-05-04', '2025-05-10', 'Finalizado'),
(10, 'JJJ0123K', '01234567890', '2025-05-05', '2025-05-15', 'Em andamento'),
(11, 'AAA1234B', '11122233344', '2025-05-11', '2025-05-20', 'Finalizado'),
(12, 'BBB2345C', '22233344455', '2025-05-11', '2025-05-19', 'Finalizado'),
(13, 'CCC3456D', '33344455566', '2025-05-12', '2025-05-18', 'Finalizado'),
(14, 'DDD4567E', '44455566677', '2025-05-12', '2025-05-17', 'Em andamento'),
(15, 'EEE5678F', '55566677788', '2025-05-13', '2025-05-22', 'Finalizado'),
(300, 'MMM3456N', '01234567890', '2025-06-15', '2025-06-25', 'Finalizado');
GO
INSERT INTO reparo VALUES
(1, '2025-04-01', 3, 'Troca de óleo e filtro', 350.00, 'AAA1234B'),
(2, '2025-04-10', 5, 'Problema no sistema de freios', 1200.00, 'BBB2345C'),
(3, '2025-04-15', 2, 'Troca de pneus', 800.00, 'CCC3456D'),
(4, '2025-05-01', 7, 'Reparo na transmissão', 3500.00, 'DDD4567E'),
(5, '2025-05-05', 1, 'Substituição da bateria', 400.00, 'EEE5678F'),
(6, '2025-05-10', 4, 'Reparo no sistema de ar-condicionado', 1500.00, 'FFF6789G'),
(7, '2025-05-12', 3, 'Revisão geral do motor', 2300.00, 'GGG7890H'),
(8, '2025-05-15', 6, 'Pintura da lataria', 1800.00, 'HHH8901I'),
(9, '2025-05-18', 2, 'Troca de amortecedores', 1200.00, 'III9012J'),
(10, '2025-05-20', 5, 'Alinhamento e balanceamento', 600.00, 'JJJ0123K'),
(50, '2025-06-01', 3, 'Reparo do sistema elétrico', 1000.00, 'MMM3456N');
GO


-------------------------------------------------------------------------- CRIACAO DOS TRIGGERs / PROCEDUREs / FUNCTIONs --------------------------------------------------------------------------- 
-- FUNCAO que retorna carro disponiveis para a locacao
CREATE FUNCTION func_carros_disponiveis() RETURNS @carros_disponiveis TABLE(
placa CHAR(8) NOT NULL,
marca VARCHAR(100) NOT NULL,
modelo VARCHAR(100) NOT NULL,
cor VARCHAR(80) NOT NULL,
ano DATE NOT NULL,
tipo_combustivel VARCHAR(80) NOT NULL,
litros_combustivel DECIMAL(5,2) NOT NULL,
km_rodados DECIMAL(10,1) NOT NULL,
tipo_cambio VARCHAR(50) NOT NULL,
status_carro VARCHAR(50) NOT NULL,
categoria_id INT NOT NULL
) AS
BEGIN
	
	DECLARE @placa AS CHAR(8)
	DECLARE @status AS VARCHAR(50)

	DECLARE c CURSOR
	FOR SELECT placa, status_carro FROM carro
	OPEN c

	FETCH NEXT FROM c INTO @placa, @status

	WHILE @@FETCH_STATUS = 0 BEGIN

		IF ( LOWER (@status COLLATE Latin1_General_CI_AI) = 'disponivel' ) BEGIN
			INSERT INTO @carros_disponiveis VALUES(
				@placa,
				(SELECT marca FROM carro WHERE placa = @placa),
				(SELECT modelo FROM carro WHERE placa = @placa),
				(SELECT cor FROM carro WHERE placa = @placa),
				(SELECT ano FROM carro WHERE placa = @placa),
				(SELECT tipo_combustivel FROM carro WHERE placa = @placa),
				(SELECT litros_combustivel FROM carro WHERE placa = @placa),
				(SELECT km_rodados FROM carro WHERE placa = @placa),
				(SELECT tipo_cambio FROM carro WHERE placa = @placa),
				(SELECT status_carro FROM carro WHERE placa = @placa),
				(SELECT categoria_id FROM carro WHERE placa = @placa)
			)
		END
		FETCH NEXT FROM c INTO @placa, @status

	END

    CLOSE c
    DEALLOCATE c
    RETURN

END
GO

-- FUNCAO que retorna um relatorio sobre um aluguel em um dia especifico
/*
RELATORIO GERAL? do carro?
Deve-se poder gerar um relatório em PDF com os dados do veículo, além do nome, 
do CPF do locatário e a quantidade de dias fora dos carros alugados no dia. 
*/
CREATE FUNCTION func_relatorio_alugados_do_dia(@dia_pesquisa_inicial DATE) RETURNS @relatorio_do_dia TABLE(
nome VARCHAR(90) NOT NULL,
cpf CHAR(11) NOT NULL,

placa CHAR(8) NOT NULL,
marca VARCHAR(100) NOT NULL,
modelo VARCHAR(100) NOT NULL,
cor VARCHAR(80) NOT NULL,
ano DATE NOT NULL,
tipo_combustivel VARCHAR(80) NOT NULL,
litros_combustivel DECIMAL(5,2) NOT NULL,
km_rodados DECIMAL(10,1) NOT NULL,
tipo_cambio VARCHAR(50) NOT NULL,
status_carro VARCHAR(50) NOT NULL,
categoria_id INT NOT NULL,

status_aluguel VARCHAR(50) NOT NULL
) AS 
BEGIN
	
	DECLARE @id AS INT
	DECLARE @carro_placa AS CHAR(8)
	DECLARE @locatario_cpf AS CHAR(11)
	DECLARE @data_retirada DATE

	DECLARE c CURSOR
	FOR SELECT id, carro_placa, locatario_cpf, data_retirada FROM aluguel_de_carro
	OPEN c

	FETCH NEXT FROM c INTO @id, @carro_placa, @locatario_cpf, @data_retirada

	WHILE @@FETCH_STATUS = 0 BEGIN
		
		IF(@dia_pesquisa_inicial = @data_retirada) BEGIN
			
			INSERT INTO @relatorio_do_dia VALUES(
			(SELECT nome FROM locatario WHERE cpf = @locatario_cpf),
			@locatario_cpf,

			@carro_placa,
			(SELECT marca FROM carro WHERE placa = @carro_placa),
			(SELECT modelo FROM carro WHERE placa = @carro_placa),
			(SELECT cor FROM carro WHERE placa = @carro_placa),
			(SELECT ano FROM carro WHERE placa = @carro_placa),
			(SELECT tipo_combustivel FROM carro WHERE placa = @carro_placa),
			(SELECT litros_combustivel FROM carro WHERE placa = @carro_placa),
			(SELECT km_rodados FROM carro WHERE placa = @carro_placa),
			(SELECT tipo_cambio FROM carro WHERE placa = @carro_placa),
			(SELECT status_carro FROM carro WHERE placa = @carro_placa),
			(SELECT categoria_id FROM carro WHERE placa = @carro_placa),

			(SELECT status_aluguel FROM aluguel_de_carro WHERE id = @id)
			)

		END

		FETCH NEXT FROM c INTO @id, @carro_placa, @locatario_cpf, @data_retirada
	END

	CLOSE c
    DEALLOCATE c
    RETURN
END
GO



CREATE TRIGGER trig_status_reparo ON reparo
FOR INSERT, UPDATE, DELETE AS
BEGIN	
	
	DECLARE @carro_placa CHAR(8)
	DECLARE @status_carro VARCHAR(50)
	DECLARE @cont_ins INT
	DECLARE @cont_del INT

	SET @cont_ins = (SELECT COUNT(id) FROM inserted)
	SET @cont_del = (SELECT COUNT(id) FROM deleted)

	SET @carro_placa = (SELECT status_carro FROM carro WHERE placa = (SELECT placa FROM inserted))


	IF((@cont_ins = 1) AND (@cont_del = 1)) BEGIN --UPDATE
		print ('nao sei o q fazer')
	END
	ELSE BEGIN
		
		SET @status_carro = (SELECT status_carro FROM carro WHERE placa = @carro_placa)

		IF (LOWER(@status_carro COLLATE Latin1_General_CI_AI) != 'Disponivel') BEGIN
			RAISERROR('Nao ', 16, 1)
			ROLLBACK TRANSACTION
			CLOSE c
			DEALLOCATE c
			RETURN
		END

		IF((@cont_ins = 1) AND (@cont_del = 0)) BEGIN -- INSERT

		END
		ELSE BEGIN --DELETE

		END
	END

END
GO

CREATE TRIGGER trig_status_alugado ON aluguel_de_carro
FOR INSERT, UPDATE, DELETE AS
BEGIN

	DECLARE @cont_ins INT,
	DECLARE @cont_del INT

	SET @cont_ins = (SELECT COUNT(id) FROM inserted)
	SET @cont_del = (SELECT COUNT(id) FROM deleted)


	IF((@cont_ins = 1) AND (@cont_del = 1)) BEGIN --UPDATE

	END
	ELSE BEGIN
		IF((@cont_ins = 1) AND (@cont_del = 0)) BEGIN -- INSERT

		END
		ELSE BEGIN --DELETE

		END
	END

END
GO


SELECT * FROM categoria
SELECT * FROM carro
SELECT * FROM reparo
SELECT * FROM locatario
SELECT * FROM endereco
SELECT * FROM aluguel_de_carro
SELECT * FROM func_carros_disponiveis()
SELECT * FROM func_relatorio_alugados_do_dia('2025-05-01')
GO








/*
RELATORIO ESPECIFICO?
Deve-se poder gerar um relatório em PDF com os dados do usuário no cabeçalho, 
dados dos veículos, e dados da locação, do histórico de um determinado cliente. 
*/

/*
REPARO
Deve-se poder gerar um relatório em PDF com os dados do veículo e do reparo, dos 
carros alugados em reparos no dia (Não apenas os que entraram naquele dia).
*/



