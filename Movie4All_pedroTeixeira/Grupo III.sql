--2. Crie 2 vistas para 2 dos atributos derivados � sua escolha.

--n�mero de utilizadores que fizeram mais avalia��es
CREATE VIEW NumeroUtilizadoresQueFizeramMaisAvaliacoes
AS
	SELECT COUNT (U.Nome) 'Utilizadores que fizeram mais avalia��es'
	FROM Utilizador U, Classificar C, Avaliacao A
		WHERE U.Ncartao=C.NCartao
		AND C.CodAva=A.CodAva
GO

----shows sem avalia��o;
CREATE VIEW ShoesSemAvaliacao
AS	
	SELECT S.*
	FROM Show S
	WHERE S.CodShow 
	NOT IN (
		SELECT DISTINCT A.CodShow
		FROM Avaliar A )
GO


--3. Crie uma fun��o que calcule o valor de aluguer de uma s�rie. Esta deve ter como argumentos o n�mero de epis�dios e o pre�o por epis�dio.


CREATE OR ALTER FUNCTION dbo.CaculoAluguer
(
	@NumeroEpisodio int, 
	@PrecoEpisodio numeric (5,2)
)
RETURNS numeric (5,2)
AS
BEGIN
	DECLARE
		@Aluguer numeric (5,2)
	SET @Aluguer = (@NumeroEpisodio * 3) * @PrecoEpisodio;
	RETURN @Aluguer;
END
GO

--4. Crie um procedimento que devolva o ano atual concatenado com o m�s. O resultado para
--Agosto de 2020 ser� �2020-08�

CREATE OR ALTER PROCEDURE dbo.ConcatDate
AS
BEGIN
	SELECT REPLACE(CONVERT(CHAR(7), GETDATE(), 120), ' ','-') as 'ConcatDate'
END
GO