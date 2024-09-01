-- Group by/Having
-- lista de nome de artistas que participaram em mais de cinco conteudos

select a.primeiro_nome, count(*)
from artista a 
inner join (
    select p.drt
    from participa p
    group by p.drt
    having count(*) > 5
) subquery on subquery.drt = a.drt
group by a.primeiro_nome;



//Junção interna
// lista de proprietarios e numero de pagamentos realizados ordenado por numero de pagamentos
select c.proprietario, qtd
from conta c inner join (

	select r.id, count(*) as qtd
	from realiza r
	group by r.id
	
	) on c.id = r.id
order by qtd desc



//Junção externa
// id dos diretores e titulo do seus filmes seus conteudos que participou
select p.id, c.titulo
from participa p full outer join  conteudo c on p.cod = c.cod



//-Semi junção
// nome dos artistas que participaram de filmes
select distinct a.nome 
from artista a left join participa p on p.drt=artista.drt




//Anti-junção
//nome dos diretores que nunca participaram com artistas
SELECT DISTINCT d.nome
FROM diretor d
LEFT JOIN participa p ON p.cod = d.cod
WHERE p.cod IS NULL;




// Subconsulta do tipo escalar
// seleciona os epidoios com duração acima da media 
select duracao
from episodio
where duracao > (
	select avg(duracao)
	from episodio
	)




// Subconsulta do tipo linha
// retorna o titulo dos conteudos de  mesmo genero e datadelancamento do conteudo de id "111"
select c.titulo
from conteudo c
where (c.genero, c.DataDeLancamento) = (
	select c.genero, c.DataDeLancamento
	from conteudo c
	where c.id=="111")



// Subconsulta do tipo tabela
// titulo de filmes que ganharam premios
select distinct c.nome
from conteudo c
where (c.id) in (

	select g.id
	from ganhou g

	)


// Operação de conjunto
// projetar nomes das pessoas que são diretores e atores ao mesmo tempo

(select nome
from artista)
intersect
(select nome 
from diretores)















