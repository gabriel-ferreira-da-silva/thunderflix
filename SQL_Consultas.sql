








--Group by/Having
--projetar o nome dos perfis que assistiram mais de 2 conteúdos
select p.NOME, count(*)
from perfil p inner join assiste a on p.ID = a.ID_CONTA and p.NOME = a.NOME inner join conteudo c on a.ID_CONTEUDO = c.ID
group by p.NOME having count(c.TITULO) > 2;


--Junção interna
--projetar o valor das transações realizadas via débito junto do id da conta que realizou a transação
select c.ID, p.VALOR
from pagamento p inner join realiza r on p.ID = r.ID_PAGAMENTO inner join conta c on c.ID = r.ID_CONTA
where r.tipo_pgto = 'Débito';


--Junção externa
--projetar os diretores que chefiam ninguém
select d1.NOME
from diretores d1 left outer join diretores d2 on d1.ID = d2.ID_CHEFE
where d2.ID is null; 


--Semi junção
--projetar os diretores que chefiam alguém (subconsulta correlacionada)
select d1.NOME
from diretores d1
where exists
	(select *
	from diretores d2
	where d1.ID = d2.ID_CHEFE);


--Anti-junção
--projetar o título dos conteúdos sem elenco- (subconsulta correlacionada)
select c.TITULO
from conteudo c
where not exists
	(select *
	from participa p, artista a
	where c.ID = p.ID_CONTEUDO and p.DRT = a.DRT);

-- Subconsulta escalar: Retorno o titulo do conteúdo que tem a mesma data de lancamento que o de ID 1
SELECT C.TITULO
FROM CONTEUDO C
WHERE C.DATADELANCAMENTO = (
     SELECT DATADELANCAMENTO
      FROM CONTEUDO
    WHERE ID = 1
);


-- Subconsulta do tipo linha
-- retorna o titulo dos conteudos de  mesma classificação indicativa e datadelancamento do conteudo de id "26"
select c.titulo
from conteudo c
where (c.CLASSIFICACAOINDICATIVA, c.DataDeLancamento) in (
    select c.CLASSIFICACAOINDICATIVA, c.DataDeLancamento
    from conteudo c
    where c.id = 26
);

-- Subconsulta do tipo tabela: Projetar os nomes dos proprietários que pagaram no crédito
SELECT C.PROPRIETARIO 
FROM CONTA C
WHERE C.ID IN (
     SELECT R.ID_CONTA
     FROM REALIZA R
    WHERE R.TIPO_PGTO = 'Crédito'
);


--Operação de conjunto
--Projeto o nome completo dos artistas e o nome do proprietário das contas
SELECT PRIMEIRO_NOME, SOBRENOME
FROM ARTISTA
UNION
SELECT PROPRIETARIO AS PRIMEIRO_NOME, NULL AS SOBRENOME
FROM CONTA;



