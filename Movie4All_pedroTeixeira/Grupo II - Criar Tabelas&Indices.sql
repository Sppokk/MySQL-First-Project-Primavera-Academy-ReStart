--Tabelas e Indices

	/*DROP TABLE Avaliacao
	DROP TABLE Aluguer
	DROP TABLE Ator
	DROP TABLE Utilizador
	DROP TABLE Show
	DROP TABLE Avaliar
	DROP TABLE Entrar
	DROP TABLE Disponibilizar
	DROP TABLE Associado
	DROP TABLE Temporadas
	DROP TABLE Precario
	DROP TABLE Classificar
	DROP TABLE Telemovel*/


--• Avaliacao [CodAva, Estrelas, Avaliacao]
--DROP Table AVAlIACAO
CREATE TABLE Avaliacao(
	
	CodAva  INT IDENTITY (1,1),
	Estrelas CHAR(1) NOT NULL,
	Avaliacao NVARCHAR (512) Null

	CONSTRAINT PK_Avaliacao PRIMARY KEY CLUSTERED (CodAva),
	CONSTRAINT CHK_Avaliacao_Estrelas Check (Estrelas in (1, 2, 3, 4, 5))
)
GO

--Aluguer [CodAluguer, DataExpiracao, DataAluguer]

--DROP TABLE Auguer
CREATE TABLE Aluguer(
	
	CodAluguer INT IDENTITY(1,1),
	DataExpiracao DateTime2(7) NOT NULL,
	DataAluguer DateTime2(7) NOT NULL DEFAULT GetDate(),
	FormaPagamento varchar (7) NOT NULL,

	CONSTRAINT PK_Aluguer PRIMARY KEY CLUSTERED (CodAluguer),
	CONSTRAINT CHK_Aluguer_FormaPagamento Check (FormaPagamento in ('MB','Credito'))
)
GO

--Ator [NickName, NomeAtor]

--DROP TABLE ATOR
CREATE TABLE Ator(
	
	NickName nvarchar (10) PRIMARY KEY,
	NomeAtor nvarchar (100) NOT NULL,

	CONSTRAINT UN_Ator_NomeAtor UNIQUE (NomeAtor)
)
GO

--Utilizador [NCartao, NFiscal, Email, Nome]
-- DROP TABLE UTILIZADOR
CREATE TABLE Utilizador(
	
	NCartao varchar (7) PRIMARY KEY,
	NFiscal varchar (10) NOT NULL,
	Email nvarchar (20) NOT NULL,
	Nome nvarchar (100) NOT NULL,

	CONSTRAINT UN_Utilizador_NFiscal UNIQUE (NFiscal),
)
GO

--Show [CodShow, Titulo, Tipo, Traducao, Data, Info, CodPais]

--DROP TABLE SHOW
CREATE TABLE Show(
	
	CodShow varchar (7) PRIMARY KEY,
	Titulo Nvarchar (20) NOT NULL,
	Tipo varchar (10) NOT NULL CONSTRAINT DF_Show_Tipo DEFAULT 'Filme',
	Traducao char (1) NOT NULL,
	Data DateTime2 (7) NOT NULL,
	Info nvarchar (250) NOT NULL,
	CodPais char(2) NOT NULL,

	CONSTRAINT CHK_Show_Tipo CHECK (Tipo IN ('Filme', 'Documentario', 'Serie')),
	CONSTRAINT CHK_Show_Traducao CHECK ( Traducao IN(0,1)),
	CONSTRAINT UN_Show_Titulo UNIQUE (Titulo)
)
GO
--• Avaliar [CodAva, CodShow]

--DROP TABLE AVALIAR
CREATE TABLE Avaliar(

	CodAva  INT NOT NULL,
	CodShow varchar (7) NOT NULL,

	CONSTRAINT PK_Avaliar PRIMARY KEY CLUSTERED (CodAva, CodShow),
	CONSTRAINT FK_Avaliar_CodAva FOREIGN KEY (CodAva) REFERENCES Avaliacao (CodAva),
	CONSTRAINT FK_Avaliar_CodShow FOREIGN KEY (CodShow) REFERENCES Show (CodShow)
)
GO
--Entrar [CodShow, NickName]

--DROP TABLE ENTRAR
CREATE TABLE Entrar(

	CodShow varchar (7) NOT NULL,
	NickName nvarchar (10) NOT NULL,

	CONSTRAINT PK_Entrar PRIMARY KEY CLUSTERED (NickName, CodShow),
	CONSTRAINT FK_Entrar_CodShow FOREIGN KEY (CodShow) REFERENCES Show (CodShow),
	CONSTRAINT FK_Entrar_NickName FOREIGN KEY (Nickname) REFERENCES Ator (Nickname)
)
GO

--Disponibilizar [CodShow, CodAluguer]

--DROP TABLE DISPONIBILIZAR
CREATE TABLE Disponibilizar(

	CodShow varchar (7) NOT NULL,
	CodAluguer INT NOT NULL,

	CONSTRAINT PK_Disponibilizar PRIMARY KEY CLUSTERED (CodAluguer, CodShow),
	CONSTRAINT FK_Disponibilizar_CodShow FOREIGN KEY (CodShow) REFERENCES Show (CodShow),
	CONSTRAINT FK_Disponibilizar_CodAluguer FOREIGN KEY (CodAluguer) REFERENCES Aluguer (CodAluguer)
)
GO

--Associado [CodAluguer, NCartao, NomeAssociado, OutrasAssociacoes]

--DROP TABLE ASSOCIADO
CREATE TABLE Associado(

	CodAluguer INT NOT NULL,
	NCartao varchar (7) NOT NULL,
	NomeAssociado nvarchar (100) NOT NULL,
	OutrasAssociacoes varchar (10) NOT NULL CONSTRAINT DF_Associado_OutrasAssociacoes DEFAULT 'Nao',

	
	CONSTRAINT PK_Associado PRIMARY KEY CLUSTERED (CodAluguer, NCartao, NomeAssociado),
	CONSTRAINT FK_Associado_CodAluguer FOREIGN KEY (CodAluguer) REFERENCES Aluguer (CodAluguer),
	CONSTRAINT FK_Associado_NCartao FOREIGN KEY (NCartao) REFERENCES Utilizador (NCartao),
	CONSTRAINT CHK_Associado_OutrasAssociacoes CHECK (OutrasAssociacoes IN ('Nao', 'Sim')),
)
GO

--Temporadas [CodTemp, NrEpisodio, NomeEpisodio, InfEpisodio, NrTemporada, InfTemporada, DataEpi, DataTemporada, CodShow]

--DROP TABLE TEMPORADAS
CREATE TABLE Temporadas(

	CodTemp INT IDENTITY(1,1),
	NrEpisodio tinyint NOT NULL,
	NomeEpisodio nvarchar (15) NOT NULL,
	InfEpisodio nvarchar (250) NOT NULL,
	NrTemporada tinyint NOT NULL,
	InfTemporada nvarchar (250) NOT NULL,
	DataEpi dateTime2 (7) Not NULL,
	DataTemporada dateTime2 (7) NOT NULL,
	CodShow varchar (7) NOT NULL,



	CONSTRAINT PK_Temporadas PRIMARY KEY CLUSTERED (CodTemp),
	CONSTRAINT FK_Temporadas_CodShow FOREIGN KEY (CodShow) REFERENCES Show (CodShow),
)
GO

--Precario [CodPreco, TipoShow, Preco, CodAluguer]

--DROP TABLE PRECARIO
CREATE TABLE Precario(

	CodPreco INT IDENTITY(1,1),
	Tipo varchar (10) NOT NULL, 
	Preco tinyint NOT NULL,
	CodAluguer INT NOT NULL,


	CONSTRAINT PK_Precario PRIMARY KEY CLUSTERED (CodPreco),
	CONSTRAINT FK_Precario_CodAluguer FOREIGN KEY (CodAluguer) REFERENCES Aluguer (CodAluguer),
)
GO

--Classificar [CodAva, NCartao,NomeAssociado, Data]

--DROP TABLE CLASSIFICAR
CREATE TABLE Classificar(

	CodAva  INT NOT NULL,
	CodAluguer INT NOT NULL,
	NCartao varchar (7) NOT NULL,
	NomeAssociado nvarchar (100)  NULL,
	Data DateTime2(7) NOT NULL DEFAULT GetDate(), 

	CONSTRAINT PK_Classificar PRIMARY KEY CLUSTERED (CodAva, NCartao),
	CONSTRAINT FK_Classificar_NCartao FOREIGN KEY (NCartao) REFERENCES Utilizador (NCartao),
	CONSTRAINT FK_Classificar_NomeAssociado FOREIGN KEY (CodAluguer, NCartao, NomeAssociado) REFERENCES Associado (CodAluguer, NCartao, NomeAssociado),
	CONSTRAINT Fk_Classificar_CodAva FOREIGN KEY (CodAva) REFERENCES Avaliacao (CodAva)
)
GO

--Fazer [CodAluguer, NCartao,NomeAssociado]
--DROP TABLE Fazer

CREATE TABLE Fazer(

	CodAluguer INT NOT NULL,
	NCartao varchar (7) NOT NULL,
	NomeAssociado nvarchar (100)  NULL,

	CONSTRAINT PK_Fazer PRIMARY KEY CLUSTERED (CodAluguer, NCartao),
	CONSTRAINT FK_Fazer_CodAluguer FOREIGN KEY (CodAluguer) REFERENCES Aluguer (CodAluguer),
	CONSTRAINT FK_Fazer_NomeAssociado FOREIGN KEY (CodAluguer, NCartao, NomeAssociado) REFERENCES Associado (CodAluguer, NCartao, NomeAssociado),
	CONSTRAINT Fk_fazer_NCartao FOREIGN KEY (NCartao) REFERENCES Utilizador (NCartao)
)
GO

--Telemovel [NCartao, Telemovel]

--DROP TABLE TELEMOVEL
CREATE TABLE Telemovel(
	
	NCartao varchar (7) NOT NULL,
	Telemovel char(10) NOT NULL,

	CONSTRAINT PK_Telemovel PRIMARY KEY CLUSTERED (NCartao,Telemovel),
	CONSTRAINT FK_Telemovel_NCartao FOREIGN KEY (NCartao) REFERENCES Utilizador (NCartao)
)
GO
 ---Indices

	CREATE NONCLUSTERED INDEX IDX_Avaliar_CodAva ON Avaliar (CodAva)
	CREATE NONCLUSTERED INDEX IDX_Avaliar_CodShow ON Avaliar (CodShow)
	CREATE NONCLUSTERED INDEX IDX_Entrar_CodShow ON Entrar (CodShow)
	CREATE NONCLUSTERED INDEX IDX_Entrar_NickName ON Entrar (NickName)
	CREATE NONCLUSTERED INDEX IDX_Disponibilizar_CodShow ON Disponibilizar (CodShow)
	CREATE NONCLUSTERED INDEX IDX_Disponibilizar_CodAluguer ON Disponibilizar (CodAluguer)
	CREATE NONCLUSTERED INDEX IDX_Associado_CodAluguer ON Associado (CodAluguer)
	CREATE NONCLUSTERED INDEX IDX_Associado_NCartao ON Associado (NCartao)
	CREATE NONCLUSTERED INDEX IDX_Temporadas_CodShow ON Temporadas (CodShow)
	CREATE NONCLUSTERED INDEX IDX_Precario_CodAluguer ON Precario (CodAluguer)
	CREATE NONCLUSTERED INDEX IDX_Classificar_NCartao ON Classificar (NCartao)
	CREATE NONCLUSTERED INDEX IDX_Classificar_NomeAssociado ON Classificar (NomeAssociado)
	CREATE NONCLUSTERED INDEX IDX_Classificar_CodAva ON Classificar (CodAva)
	CREATE NONCLUSTERED INDEX IDX_Fazer_CodAluguer ON Fazer (CodAluguer)
	CREATE NONCLUSTERED INDEX IDX_Fazer_NomeAssociado ON Fazer (NomeAssociado)
	CREATE NONCLUSTERED INDEX IDX_Fazer_NCartao ON Fazer (Ncartao)
	CREATE NONCLUSTERED INDEX IDX_Telemovel_NCartao ON Telemovel (NCartao)