
--IV

--1. Liste os �ltimos 10 utilizadores que alugaram um determinado show, listando tamb�m o
--t�tulo e o c�digo do pa�s.

SELECT Top (10) U.Nome, A.DataAluguer, S.Titulo, S.CodPais, COUNT(*) Nome
	FROM Utilizador U, Fazer F, Aluguer A, Show S, Disponibilizar D
	WHERE U.NCartao=F.NCartao 
	and F.CodAluguer=A.CodAluguer
	and A.CodAluguer=d.CodAluguer
	and D.CodShow=S.CodShow
	GROUP BY U.Nome,A.DataAluguer,S.Titulo,S.CodPais
	ORDER BY U.Nome DESC


--2. Liste os shows que ainda n�o tiveram qualquer avalia��o;

SELECT S.*
FROM Show S
WHERE S.CodShow 
NOT IN (
		SELECT DISTINCT A.CodShow
		FROM Avaliar A )


--3--Crie uma consulta para listar o n�mero de utilizadores que fizeram mais avalia��es.

SELECT COUNT (U.Nome) 'Utilizadores que fizeram mais avalia��es'
	FROM Utilizador U, Classificar C, Avaliacao A
	Where U.Ncartao=C.NCartao
	AND C.CodAva=A.CodAva

--4. Crie uma consulta para listar os Shows com melhor avalia��o. Considere como crit�rio, a m�dia das avalia��es.

SELECT AVG (CAST(Estrelas AS INT)) AS 'Media Avalia��es',S.Titulo, A.Estrelas, Count ('Estrelas') Contagem
	FROM Show S, Avaliar, Avaliacao A
	WHERE S.CodShow=Avaliar.CodShow
	AND Avaliar.CodAva=A.CodAva
	GROUP BY S.Titulo, A.Estrelas
	Order By 1 DESC

--5. Crie uma consulta que permita listar o n�mero de utilizadores que usam cart�o de d�bito e cr�dito;

SELECT DISTINCT FormaPagamento, Count (FormaPagamento) AS NVezes
	FROM Aluguer
	Group By FormaPagamento

--6. Liste os shows por ordem decrescente do n�mero de alugueres.

SELECT S.Titulo, A.DataAluguer, COUNT ('Titulo') AS Alugueres
FROM Show S, Disponibilizar D, Aluguer A
WHERE S.CodShow=D.CodShow
AND D.CodAluguer=A.CodAluguer
GROUP BY S.Titulo,A.DataAluguer
Order BY Titulo DESC