--Dados Utilizador

INSERT INTO Utilizador (NCartao, NFiscal, Email, Nome)
	VALUES
	('1', 123, 'pedro@mail', 'Pedro Teixeira'),
	('2', 133, 'cavani@mail', 'Edison Cavani'),
	('3', 143, 'pizzi@mail', 'Luis Filipe'),
	('4', 153, 'luisao@mail', 'Luis Carlos'),
	('5', 163, 'rambo@mail', 'John Rambo'),
	('6', 173, 'robocop@mail', 'Alex Murphy'),
	('7', 183, 'mivone@mail', 'Maria Ivone'),
	('8', 193, 'maradona@mail', 'Diego Armando'),
	('9', 223, 'marco@mail', 'Marco Antonio'),
	('10', 623, 'spock@mail', 'Spock')

--Dados Sow

INSERT INTO Show (CodShow, Titulo, Traducao, Data, Info, CodPais)
	VALUES
	('1', 'Maria Ivone', 1,getDate() -500.1,'História Romântica','PT'),
	('2', 'Maria Ivone Na Praia', 1,getDate()-1500.2,'Aventura','PT'),
	('3', 'Rambo', 1,getDate() -100.3,'Porrada à farta','US'),
	('4', 'Robocop', 1,getDate() -1500.78,'Porrada com cyborgs','US'),
	('5', 'Stalinegrado', 1,getDate() -1500.23,'Histórico','US'),
	('6', 'Maria Ivone Voa', 1,getDate() -20.234,'Quotidiano','PT'),
	('7', 'Ivone', 1,getDate() -500.1,'História Romântica','PT'),
	('8', 'Pandemia', 1,getDate() -75.32,'Terror','US'),
	('9', 'Pulp Fiction', 1,getDate() -100.3,'Sangrento','US')


--Insert Dados Aluguer

INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES ('2020-07-23', '2020-07-22','MB');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES ('11-11-2018', '11-9-2018','MB');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)Values ('11-11-2019', '11-9-2019','Credito');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)Values ('11-11-2017', '11-9-2017','Credito');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)Values('11-11-2015', '11-9-2015','Credito');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES('11-11-2014', '11-9-2014','MB');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES('08-08-2018', '07-08-2018','Credito');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES('11-11-2015', '11-9-2015','Credito');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES('11-07-2019',' 11-9-2019','Credito');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES	('11-08-2019',' 11-9-2019','MB');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES	('11-8-2013', '11-9-2013','Credito');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES	('11-8-2015', '11-9-2015','MB');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES	('11-7-2014', '11-9-2014','Credito');
INSERT INTO Aluguer ( DataExpiracao, DataAluguer, FormaPagamento)VALUES	('08-6-2018',' 07-08-2018','MB')


--dados associado
INSERT INTO Associado (CodAluguer, NCartao, NomeAssociado, OutrasAssociacoes)
	VALUES (1, 1, 'João Pestana', 'Nao')
INSERT INTO Associado (CodAluguer, NCartao, NomeAssociado, OutrasAssociacoes)
	VALUES (3, 2, 'Fredy Krugger', 'Nao')


---dados fazer
INSERT INTO Fazer (CodAluguer, NCartao)
	VALUES (3, 2),
			(4,2),
			(1,1)

	INSERT INTO Fazer (CodAluguer, NCartao)VALUES (8, 1);
	INSERT INTO Fazer (CodAluguer, NCartao)VALUES(8, 2);
	INSERT INTO Fazer (CodAluguer, NCartao)VALUES(9,3);
	INSERT INTO Fazer (CodAluguer, NCartao)VALUES(12,5);
	INSERT INTO Fazer (CodAluguer, NCartao)VALUES(11, 4);
	INSERT INTO Fazer (CodAluguer, NCartao)VALUES(10, 7);

--dados avaliacao

INSERT INTO Avaliacao (Estrelas)
	VALUES (2),
			(5),
			(4),
			(5),
			(3),
			(3),
			(5),
			(5),
			(5),
			(4)

INSERT INTO Classificar (CodAva,CodAluguer, NCartao)
VALUES (1,8, 7),
		(2, 8, 8),
		(3,9, 7),
		(4, 10, 9)

INSERT INTO Disponibilizar ( CodShow, CodAluguer)
VALUES (1, 8),
		(2, 8),
		(3,9),
		(4,10)

INSERT INTO Avaliar (CodAva, CodShow)
VALUES (2, 1),
	(3, 2),
	(4,3),
	(5,4)
