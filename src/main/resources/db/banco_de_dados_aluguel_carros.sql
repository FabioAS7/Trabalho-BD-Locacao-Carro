CREATE DATABASE aluguel_carros
GO
USE aluguel_carros
GO

-------------------------------------------------------------------------- CRIACAO/INSERCAO DAS TABLEs --------------------------------------------------------------------------- 
/*
INSERT INTO categoria (nome, valor_diaria) VALUES
('Economico', 89.90),
('SUV', 159.90),
('Sedan', 129.50),
('Luxo', 299.99),
('Picape', 189.75)
GO

INSERT INTO carro (placa, ano, cor, km_rodados, litros_combustivel, marca, modelo, status_carro, tipo_cambio, tipo_combustivel, categoria_id) VALUES
('ABC1234', 2020, 'Branco', 15000.0, 25.50, 'Volkswagen', 'Gol', 'Disponivel', 'Manual', 'Gasolina', 1),
('DEF5678', 2021, 'Preto', 30000.5, 20.75, 'Toyota', 'Corolla', 'Alugado', 'Automatico', 'Flex', 3),
('GHI9012', 2022, 'Prata', 5000.0, 35.00, 'Jeep', 'Renegade', 'Disponivel', 'Automatico', 'Diesel', 2),
('JKL3456', 2019, 'Vermelho', 45000.2, 18.60, 'Chevrolet', 'S10', 'Em manutencao', 'Manual', 'Diesel', 5),
('MNO7890', 2023, 'Azul', 800.0, 40.00, 'BMW', 'X5', 'Disponivel', 'Automatico', 'Gasolina', 4)
GO

INSERT INTO locatario (cpf, data_nascimento, nome, num_habilitacao) VALUES
('12345678901', '1990-04-15', 'Joao Silva', 'ABC12345678'),
('23456789012', '1985-08-22', 'Maria Oliveira', 'DEF98765432'),
('34567890123', '2000-01-30', 'Pedro Santos', 'GHI54321678'),
('45678901234', '1995-12-12', 'Ana Paula', 'JKL78945612'),
('56789012345', '1988-07-19', 'Carlos Lima', 'MNO32165498')
GO

INSERT INTO aluguel_de_carro (data_devolucao, data_retirada, carro_placa, locatario_cpf) VALUES
('2025-06-01', '2025-05-25', 'DEF5678', '12345678901'),
('2025-06-03', '2025-05-29', 'GHI9012', '23456789012'),
('2025-06-06', '2025-06-01', 'MNO7890', '34567890123'),
('2025-06-08', '2025-06-04', 'ABC1234', '45678901234'),
('2025-06-10', '2025-06-06', 'DEF5678', '56789012345')
GO

INSERT INTO reparo (descricao_problema, dia_entrada, quant_dias_reparo, valor_reparo, carro_placa) VALUES
--('Troca de oleo e revisao geral', '2025-05-10', 2, 250.00, 'JKL3456'),
('Substituicao de pneus dianteiros', '2025-05-20', 1, 480.00, 'ABC1234'),
('Reparo no sistema de freios', '2025-05-25', 3, 620.00, 'GHI9012'),
('Alinhamento e balanceamento', '2025-06-01', 1, 150.00, 'DEF5678'),
('Troca do filtro de ar e limpeza', '2025-06-03', 1, 90.00, 'MNO7890')
GO
*/
-------------------------------------------------------------------------- CRIACAO DOS TRIGGERs / PROCEDUREs / FUNCTIONs --------------------------------------------------------------------------- 
-- FUNCAO que retorna carro disponiveis para a locacao
CREATE FUNCTION func_carros_disponiveis() RETURNS @carros_disponiveis TABLE(
placa CHAR(8) NOT NULL,
marca VARCHAR(100) NOT NULL,
modelo VARCHAR(100) NOT NULL,
cor VARCHAR(80) NOT NULL,
ano INT NOT NULL,
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
--TRIGGER QUE COLOCA EM REPARO O STATUS
CREATE TRIGGER trig_status_reparo ON reparo
FOR INSERT, DELETE AS
BEGIN	
	
	DECLARE @carro_placa CHAR(8)
	DECLARE @status_carro VARCHAR(50)
	DECLARE @cont_ins INT
	DECLARE @cont_del INT

	SET @cont_ins = (SELECT COUNT(id) FROM inserted)
	SET @cont_del = (SELECT COUNT(id) FROM deleted)

	IF((@cont_ins = 0) AND (@cont_del >= 1)) BEGIN --DELETE
		SET @carro_placa = (SELECT placa FROM carro WHERE placa = (SELECT carro_placa FROM deleted))
		SET @status_carro = (SELECT status_carro FROM carro WHERE placa = @carro_placa)
		IF(@status_carro LIKE 'A%') BEGIN
			UPDATE carro SET status_carro = 'Alugado' WHERE placa = @carro_placa
		END
		ELSE BEGIN
			UPDATE carro SET status_carro = 'Disponivel' WHERE placa = @carro_placa
		END
	END
	ELSE BEGIN --INSERT
		SET @carro_placa = (SELECT placa FROM carro WHERE placa = (SELECT carro_placa FROM inserted))
		SET @status_carro = (SELECT status_carro FROM carro WHERE placa = @carro_placa)
		IF(@status_carro LIKE 'A%') BEGIN
			UPDATE carro SET status_carro = 'Alugado/Em Reparo' WHERE placa = @carro_placa
		END
		ELSE BEGIN
			UPDATE carro SET status_carro = 'Em Reparo' WHERE placa = @carro_placa
		END
	END
END
GO



--TRIGGER QUE COLOCA EM ALUGADO O STATUS
CREATE TRIGGER trig_status_aluguel ON aluguel_de_carro
FOR INSERT, DELETE AS
BEGIN	
	
	DECLARE @carro_placa CHAR(8)
	DECLARE @status_carro VARCHAR(50)
	DECLARE @cont_ins INT
	DECLARE @cont_del INT

	SET @cont_ins = (SELECT COUNT(id) FROM inserted)
	SET @cont_del = (SELECT COUNT(id) FROM deleted)


	IF((@cont_ins = 0) AND (@cont_del = 1)) BEGIN --DELETE
		SET @carro_placa = (SELECT placa FROM carro WHERE placa = (SELECT carro_placa FROM deleted))
		SET @status_carro = (SELECT status_carro FROM carro WHERE placa = @carro_placa)
		IF(@status_carro LIKE '%Em%') BEGIN
			UPDATE carro SET status_carro = 'Em Reparo' WHERE placa = @carro_placa
		END
		ELSE BEGIN
			UPDATE carro SET status_carro = 'Disponivel' WHERE placa = @carro_placa
		END
	END
	ELSE BEGIN --INSERT
		SET @carro_placa = (SELECT placa FROM carro WHERE placa = (SELECT carro_placa FROM inserted))
		SET @status_carro = (SELECT status_carro FROM carro WHERE placa = @carro_placa)
		UPDATE carro SET status_carro = 'Alugado' WHERE placa = @carro_placa
	END
END
GO
/*
SELECT * FROM categoria
SELECT * FROM carro
SELECT * FROM reparo
SELECT * FROM locatario
SELECT * FROM aluguel_de_carro
SELECT * FROM endereco
SELECT * FROM func_carros_disponiveis()
GO
------------------------------------------SELECTS DO JASPER REPORTS----------------------------------------------------
SELECT c.placa, c.ano, c.cor, c.km_rodados, c.marca, c.modelo,
c.tipo_cambio, c.tipo_combustivel, cat.nome, l.nome, l.cpf,
DATEDIFF(DAY, ac.data_retirada, GETDATE()) as dias_fora FROM carro c 
INNER JOIN aluguel_de_carro ac ON c.placa = ac.carro_placa
INNER JOIN locatario l ON l.cpf = ac.locatario_cpf
INNER JOIN categoria cat ON c.categoria_id = cat.id
WHERE ac.data_retirada = '2025-05-25'

SELECT l.cpf, l.data_nascimento, l.nome, l.num_habilitacao,
c.placa, c.ano, c.cor, c.km_rodados, c.marca, c.modelo,
c.tipo_cambio, c.tipo_combustivel, cat.nome,
ac.data_devolucao, ac.data_retirada FROM locatario l
INNER JOIN aluguel_de_carro ac ON l.cpf = ac.locatario_cpf
INNER JOIN carro c ON c.placa = ac.carro_placa
INNER JOIN categoria cat ON c.categoria_id = cat.id
WHERE l.cpf = '12345678901'

SELECT r.descricao_problema, r.dia_entrada, r.quant_dias_reparo,
r.valor_reparo, c.placa, c.ano, c.cor, c.km_rodados, c.litros_combustivel,
c.marca, c.modelo, c.tipo_cambio, cat.nome FROM reparo r
INNER JOIN carro c ON r.carro_placa = c.placa
INNER JOIN aluguel_de_carro ac ON c.placa = ac.carro_placa
INNER JOIN categoria cat ON c.categoria_id = cat.id
WHERE ac.data_devolucao >= '2025-06-02' AND c.status_carro LIKE 'A%'
/*