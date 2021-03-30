
--IV

--1. Liste os últimos 10 utilizadores que alugaram um determinado show, listando também o
--título e o código do país.

SELECT Top (10) U.Nome, A.DataAluguer, S.Titulo, S.CodPais, COUNT(*) Nome
	FROM Utilizador U, Fazer F, Aluguer A, Show S, Disponibilizar D
	WHERE U.NCartao=F.NCartao 
	and F.CodAluguer=A.CodAluguer
	and A.CodAluguer=d.CodAluguer
	and D.CodShow=S.CodShow
	GROUP BY U.Nome,A.DataAluguer,S.Titulo,S.CodPais
	ORDER BY U.Nome DESC


--2. Liste os shows que ainda não tiveram qualquer avaliação;

SELECT S.*
FROM Show S
WHERE S.CodShow 
NOT IN (
		SELECT DISTINCT A.CodShow
		FROM Avaliar A )


--3--Crie uma consulta para listar o número de utilizadores que fizeram mais avaliações.

SELECT COUNT (U.Nome) 'Utilizadores que fizeram mais avaliações'
	FROM Utilizador U, Classificar C, Avaliacao A
	Where U.Ncartao=C.NCartao
	AND C.CodAva=A.CodAva

--4. Crie uma consulta para listar os Shows com melhor avaliação. Considere como critério, a média das avaliações.

SELECT AVG (CAST(Estrelas AS INT)) AS 'Media Avaliações',S.Titulo, A.Estrelas, Count ('Estrelas') Contagem
	FROM Show S, Avaliar, Avaliacao A
	WHERE S.CodShow=Avaliar.CodShow
	AND Avaliar.CodAva=A.CodAva
	GROUP BY S.Titulo, A.Estrelas
	Order By 1 DESC

--5. Crie uma consulta que permita listar o número de utilizadores que usam cartão de débito e crédito;

SELECT DISTINCT FormaPagamento, Count (FormaPagamento) AS NVezes
	FROM Aluguer
	Group By FormaPagamento

--6. Liste os shows por ordem decrescente do número de alugueres.

SELECT S.Titulo, A.DataAluguer, COUNT ('Titulo') AS Alugueres
FROM Show S, Disponibilizar D, Aluguer A
WHERE S.CodShow=D.CodShow
AND D.CodAluguer=A.CodAluguer
GROUP BY S.Titulo,A.DataAluguer
Order BY Titulo DESC