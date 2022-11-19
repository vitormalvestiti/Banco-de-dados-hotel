-- PROJETO BANCO DE DADOS HOTEL 
-- create database hotel;
use hotel;

-- tabela quarto 
CREATE TABLE QUARTO (
  numero INT PRIMARY KEY NOT NULL,
  descricao VARCHAR(50) NOT NULL,
  valor_diario DECIMAL(6,2) NOT NULL
);

-- tabela hospede
CREATE TABLE HOSPEDE (
  id_hospede INT PRIMARY KEY NOT NULL,
  nome VARCHAR(45) NOT NULL,
  telefone VARCHAR(13) NOT NULL
);

CREATE TABLE RESERVA (
  id_reserva INT PRIMARY KEY NOT NULL,
  datareserva DATE NOT NULL,
  dataentrada DATE NOT NULL,
  qtddias INT NOT NULL,
  
  -- Chave Estrangeira 
  QUARTO_numero INT NOT NULL,
  HOSPEDE_id_hospede INT NOT NULL,

  FOREIGN KEY (QUARTO_numero) REFERENCES QUARTO (numero),
  FOREIGN KEY (HOSPEDE_id_hospede) REFERENCES HOSPEDE (id_hospede)
);

CREATE TABLE HOSPEDAGEM (
  id_hospedagem INT PRIMARY KEY NOT NULL,
  dataentrada DATE NOT NULL,
  datasaida DATE NOT NULL,
  
  -- Chave Estrangeira
  RESERVA_id_reserva INT NOT NULL,
  HOSPEDE_id_hospede INT NOT NULL,
  QUARTO_numero INT NOT NULL,
 
  FOREIGN KEY (RESERVA_id_reserva) REFERENCES RESERVA (id_reserva),
  FOREIGN KEY (HOSPEDE_id_hospede) REFERENCES HOSPEDE (id_hospede),
  FOREIGN KEY (QUARTO_numero) REFERENCES QUARTO (numero)
);


CREATE TABLE SERVICOS (
  id_servicos INT PRIMARY KEY NOT NULL,
  descricao VARCHAR(45) NOT NULL,
  valor VARCHAR(45) NOT NULL,
  data DATE NOT NULL,

  -- Chave Estrageira 
  HOSPEDAGEM_id_hospedagem INT NOT NULL,
  FOREIGN KEY (HOSPEDAGEM_id_hospedagem) REFERENCES HOSPEDAGEM (id_hospedagem)
);

CREATE TABLE SERVICOS_TIPO_HOSPEDAGEM (
	-- data_ser = data do serviço. Deixei assim porque o nome data ativando como palavra reservada
    data_ser DATE NOT NULL,
    hora TIME NOT NULL,
    SERVICOS_id_servicos INT NOT NULL,
	HOSPEDAGEM_id_hospedagem INT NOT NULL,
    
    FOREIGN KEY (SERVICOS_id_servicos) REFERENCES SERVICOS (id_servicos),
    FOREIGN KEY (HOSPEDAGEM_id_hospedagem) REFERENCES HOSPEDAGEM (id_hospedagem)
);

-- Inserindo Dados
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (10, 'Quarto Solteiro', 500.00); 
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (20, 'Quarto Casal', 700.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (30, 'Quarto Compartilhado', 100.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (40, 'Dormitórios', 150.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (50, 'Duplo Solteiro', 900.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (60, 'Master confort', 3000.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (70, 'Standard Solteiro', 950.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (80, 'Standard Casal', 1500.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (90, 'Duplex Master', 3500.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (100, 'Quarto Presidêncial',5500.00);
INSERT INTO QUARTO (numero, descricao, valor_diario) VALUES (110, 'Quarto Deluxe', 8000.00);

INSERT INTO HOSPEDE (id_hospede, nome, telefone) VALUES (11, 'Joaõ', '9999-0000');
INSERT INTO HOSPEDE (id_hospede, nome, telefone) VALUES (12, 'Maria', '9955-0005');
INSERT INTO HOSPEDE (id_hospede, nome, telefone) VALUES (13, 'Vitor', '8888-0008');
INSERT INTO HOSPEDE (id_hospede, nome, telefone) VALUES (14, 'Jonas', '7777-0007');
INSERT INTO HOSPEDE (id_hospede, nome, telefone) VALUES (15, 'Carlos', '6666-0006');
INSERT INTO HOSPEDE (id_hospede, nome, telefone) VALUES (16, 'Bianca', '5555-0005');
INSERT INTO HOSPEDE (id_hospede, nome, telefone) VALUES (17, 'Debora', '4444-0004');

INSERT INTO RESERVA (id_reserva, datareserva, dataentrada, qtddias, QUARTO_numero, HOSPEDE_id_hospede) 
VALUES (99, "2020-11-01", "2020-11-10", 6, 20, 11);
INSERT INTO RESERVA (id_reserva, datareserva, dataentrada, qtddias, QUARTO_numero, HOSPEDE_id_hospede) 
VALUES (111, "2021-03-01", "2021-03-05", 3, 60, 12);
INSERT INTO RESERVA (id_reserva, datareserva, dataentrada, qtddias, QUARTO_numero, HOSPEDE_id_hospede) 
VALUES (112, "2020-09-01", "2020-09-10", 7, 30, 13);
INSERT INTO RESERVA (id_reserva, datareserva, dataentrada, qtddias, QUARTO_numero, HOSPEDE_id_hospede) 
VALUES (113, "2021-10-01", "2021-11-10", 03, 100, 14);
INSERT INTO RESERVA (id_reserva, datareserva, dataentrada, qtddias, QUARTO_numero, HOSPEDE_id_hospede) 
VALUES (114, "2019-05-01", "2019-05-10", 2, 10, 15);
INSERT INTO RESERVA (id_reserva, datareserva, dataentrada, qtddias, QUARTO_numero, HOSPEDE_id_hospede) 
VALUES (115, "2019-11-09", "2019-11-15", 5, 40, 16);
INSERT INTO RESERVA (id_reserva, datareserva, dataentrada, qtddias, QUARTO_numero, HOSPEDE_id_hospede) 
VALUES (116, "2020-07-07", "2020-07-10", 4, 50, 17);

INSERT INTO HOSPEDAGEM (id_hospedagem, dataentrada, datasaida, RESERVA_id_reserva, HOSPEDE_id_hospede, QUARTO_numero) 
VALUES (200, "2020-07-10", "2020-07-14", 116, 17, 100);
INSERT INTO HOSPEDAGEM (id_hospedagem, dataentrada, datasaida, RESERVA_id_reserva, HOSPEDE_id_hospede, QUARTO_numero) 
VALUES (210, "2019-11-15", "2019-11-20", 115, 16, 110);
INSERT INTO HOSPEDAGEM (id_hospedagem, dataentrada, datasaida, RESERVA_id_reserva, HOSPEDE_id_hospede, QUARTO_numero) 
VALUES (220, "2019-05-10", "2010-05-12", 114, 15, 90);
INSERT INTO HOSPEDAGEM (id_hospedagem, dataentrada, datasaida, RESERVA_id_reserva, HOSPEDE_id_hospede, QUARTO_numero) 
VALUES (230, "2021-11-10", "2021-11-13", 113, 14, 80);
INSERT INTO HOSPEDAGEM (id_hospedagem, dataentrada, datasaida, RESERVA_id_reserva, HOSPEDE_id_hospede, QUARTO_numero) 
VALUES (240, "2020-09-10", "2020-09-17", 112, 13, 70);
INSERT INTO HOSPEDAGEM (id_hospedagem, dataentrada, datasaida, RESERVA_id_reserva, HOSPEDE_id_hospede, QUARTO_numero) 
VALUES (250, "2021-03-05", "2021-03-08", 111, 12, 60);
INSERT INTO HOSPEDAGEM (id_hospedagem, dataentrada, datasaida, RESERVA_id_reserva, HOSPEDE_id_hospede, QUARTO_numero) 
VALUES (260, "2020-11-10", "2020-11-16", 99, 11, 50);

INSERT INTO SERVICOS (id_servicos, descricao, valor, data, HOSPEDAGEM_id_hospedagem) 
VALUES (300, 'Café da manha', 35.00, '2020-07-10',200);
INSERT INTO SERVICOS (id_servicos, descricao, valor, data, HOSPEDAGEM_id_hospedagem) 
VALUES (310, 'Jantar', 55.00, "2019-11-16",210);
INSERT INTO SERVICOS (id_servicos, descricao, valor, data, HOSPEDAGEM_id_hospedagem) 
VALUES (320, 'Almoço', 35.00, "2019-05-12",220);
INSERT INTO SERVICOS (id_servicos, descricao, valor, data, HOSPEDAGEM_id_hospedagem) 
VALUES (330, 'Café da manha', 35.00, "2021-11-11",230);
INSERT INTO SERVICOS (id_servicos, descricao, valor, data, HOSPEDAGEM_id_hospedagem) 
VALUES (340, 'Cervejas', 15.50, "2020-09-11",240);
INSERT INTO SERVICOS (id_servicos, descricao, valor, data, HOSPEDAGEM_id_hospedagem) 
VALUES (350, 'Café da tarde', 35.00, "2021-03-05",250);
INSERT INTO SERVICOS (id_servicos, descricao, valor, data, HOSPEDAGEM_id_hospedagem) 
VALUES (360, 'Jantar', 55.00, "2020-11-10",260);

INSERT INTO SERVICOS_TIPO_HOSPEDAGEM (data_ser, hora, SERVICOS_id_servicos, HOSPEDAGEM_id_hospedagem) 
VALUES ('2020-07-10', '07:12:00', 300, 200);
INSERT INTO SERVICOS_TIPO_HOSPEDAGEM (data_ser, hora, SERVICOS_id_servicos, HOSPEDAGEM_id_hospedagem) 
VALUES ("2019-11-15", '07:20:00', 310, 210);
INSERT INTO SERVICOS_TIPO_HOSPEDAGEM (data_ser, hora, SERVICOS_id_servicos, HOSPEDAGEM_id_hospedagem) 
VALUES ("2019-05-10", '11:15:00', 320, 220);
INSERT INTO SERVICOS_TIPO_HOSPEDAGEM (data_ser, hora, SERVICOS_id_servicos, HOSPEDAGEM_id_hospedagem) 
VALUES ("2021-11-10", '16:20:00', 330, 230);
INSERT INTO SERVICOS_TIPO_HOSPEDAGEM (data_ser, hora, SERVICOS_id_servicos, HOSPEDAGEM_id_hospedagem) 
VALUES ("2020-09-10", '21:52:00', 340, 240);
INSERT INTO SERVICOS_TIPO_HOSPEDAGEM (data_ser, hora, SERVICOS_id_servicos, HOSPEDAGEM_id_hospedagem) 
VALUES ("2021-03-05", '17:30:00', 350, 250);
INSERT INTO SERVICOS_TIPO_HOSPEDAGEM (data_ser, hora, SERVICOS_id_servicos, HOSPEDAGEM_id_hospedagem) 
VALUES ("2020-11-10", '09:10:00', 360, 260);

-- Consultas das tabelas.
select * from QUARTO;
select * from HOSPEDE;
select * from RESERVA;
select * from HOSPEDAGEM;
select * from SERVICOS;
select * from SERVICOS_TIPO_HOSPEDAGEM;

select descricao, valor from SERVICOS
where id_servicos = 300;

-- Retora as informações do tipo de quarto 
SELECT * FROM QUARTO WHERE descricao = 'Duplo Solteiro';

-- Retorna telefone e nome entre ide 11 e 15
select nome, telefone from HOSPEDE where id_hospede in (11,15);

select descricao, valor from SERVICOS where id_servicos in (300, 340);

-- Retorna os serviços
select descricao, sum(valor) from SERVICOS 
group by descricao;

-- Retorna duas tabelas
SELECT * FROM HOSPEDE, HOSPEDAGEM 
where HOSPEDAGEM.HOSPEDE_id_hospede = HOSPEDE.id_hospede;

-- Retorna nome e id
select id_hospedagem, nome from HOSPEDE
inner join HOSPEDAGEM
on HOSPEDE.id_hospede = HOSPEDAGEM.HOSPEDE_id_hospede;

-- retorna desrição 
select numero, descricao from QUARTO
inner join HOSPEDAGEM 
on QUARTO.numero = HOSPEDAGEM.QUARTO_numero;

-- Retorna nome e id
SELECT nome, id_hospede
FROM HOSPEDE,
	 RESERVA
WHERE
	HOSPEDE.id_hospede = RESERVA.HOSPEDE_id_hospede;
    
select * from SERVICOS, HOSPEDAGEM
where HOSPEDAGEM.id_hospedagem = SERVICOS.HOSPEDAGEM_id_hospedagem;

select descricao, valor from SERVICOS
inner join HOSPEDAGEM
ON HOSPEDAGEM.id_hospedagem = SERVICOS.HOSPEDAGEM_id_hospedagem;


select ho.nome, qua.descricao, hos.dataentrada, hos.datasaida
from HOSPEDE as ho, HOSPEDAGEM as hos, QUARTO AS qua
where ho.id_hospede = hos.HOSPEDE_id_hospede 
and qua.numero = hos.QUARTO_numero; 
-- and qua.numero = 60;

select ser.descricao, sth.hora, ser.valor
from SERVICOS AS ser, HOSPEDAGEM as hos, SERVICOS_TIPO_HOSPEDAGEM AS sth
where ser.id_servicos = sth.SERVICOS_id_servicos
and hos.id_hospedagem = sth.HOSPEDAGEM_id_hospedagem
and hos.id_hospedagem = 250;

select ho.nome, ser.descricao, sth.hora, ser.valor
from SERVICOS AS ser, HOSPEDAGEM as hos, SERVICOS_TIPO_HOSPEDAGEM AS sth, HOSPEDE AS ho
where ser.id_servicos = sth.SERVICOS_id_servicos
and ho.id_hospede = hos.HOSPEDE_id_hospede
and hos.id_hospedagem = sth.HOSPEDAGEM_id_hospedagem 
and ho.nome = 'Maria';

select ho.nome, ser.descricao, ser.valor
from SERVICOS AS ser, HOSPEDAGEM as hos, SERVICOS_TIPO_HOSPEDAGEM AS sth, HOSPEDE AS ho
where ser.id_servicos = sth.SERVICOS_id_servicos
and ho.id_hospede = hos.HOSPEDE_id_hospede
and hos.id_hospedagem = sth.HOSPEDAGEM_id_hospedagem 
and hos.id_hospedagem = 200;

select ho.nome, qua.descricao, hos.dataentrada, qua.valor_diario
from HOSPEDE as ho, HOSPEDAGEM as hos, QUARTO AS qua
where ho.id_hospede = hos.HOSPEDE_id_hospede 
and qua.numero = hos.QUARTO_numero 
and qua.descricao = 'Quarto Presidêncial';

select ho.nome, qua.descricao, hos.dataentrada, qua.valor_diario
from HOSPEDE as ho, HOSPEDAGEM as hos, QUARTO AS qua
where ho.id_hospede = hos.HOSPEDE_id_hospede 
and qua.numero = hos.QUARTO_numero 
and qua.descricao = 'Quarto Deluxe';

select ho.nome, qua.numero, re.qtddias
from HOSPEDE as ho, RESERVA as re, QUARTO AS qua
where ho.id_hospede = re.HOSPEDE_id_hospede
and qua.numero = re.QUARTO_numero
and re.datareserva = '2020-09-01';

select ho.nome, qua.numero, ho.telefone,re.qtddias
from HOSPEDE as ho, RESERVA as re, QUARTO AS qua
where ho.id_hospede = re.HOSPEDE_id_hospede
and qua.numero = re.QUARTO_numero
and re.datareserva = '2020-11-01';

select ho.nome, ho.telefone, qua.numero, qua.descricao, re.qtddias, hos.dataentrada, hos.datasaida
from HOSPEDE as ho, RESERVA as re, QUARTO AS qua, HOSPEDAGEM AS hos
where ho.id_hospede = re.HOSPEDE_id_hospede
and qua.numero = re.QUARTO_numero
and re.id_reserva = hos.RESERVA_id_reserva
and qua.valor_diario = 500.00;












































