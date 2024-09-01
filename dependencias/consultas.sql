
-- group by / having

select a.primeiro_nome, qtd
from artista a 
inner join (
    select p.drt, count(*) as qtd
    from participa p
    group by p.drt
    having count(*) > 3
) subquery on subquery.drt = a.drt



--Junção interna
-- lista de proprietarios e numero de pagamentos realizados ordenado por numero de pagamentos
select c.PROPRIETARIO, qtd
from conta c inner join (

	select r.id_conta, count(*) as qtd
	from realiza r
	group by r.id_conta
	
	) sub on c.id = sub.id_conta
order by qtd desc



--Junção externa
-- id dos diretores e titulo do seus filmes seus conteudos que participou
select p.id_diretores as id, c.titulo
from participa p full outer join  conteudo c on p.id_diretores = c.id




--Semi junção
-- nome dos artistas que participaram de filmes

select a.primeiro_nome
from artista a
where exists (
    select 1
    from participa p
    where p.drt = a.drt
);

--Anti-junção
--nome dos diretores que nunca participaram com artistas
SELECT DISTINCT d.nome
FROM diretores d
LEFT JOIN participa p ON p.id_diretores = d.id
WHERE p.id_diretores IS NULL;




-- Subconsulta do tipo escalar
-- seleciona os epidoios com duração acima da media 
select titulo, duracao
from episodio
where duracao > (
	select avg(duracao)
	from episodio
	)

-- Subconsulta do tipo linha
-- retorna o titulo dos conteudos de  mesma classificação indicativa e datadelancamento do conteudo de id "111"
select c.titulo
from conteudo c
where (c.CLASSIFICACAOINDICATIVA, c.DataDeLancamento) in (
    select c.CLASSIFICACAOINDICATIVA, c.DataDeLancamento
    from conteudo c
    where c.id = 111
);


-- Subconsulta do tipo tabela
-- titulo de filmes assistidos
select distinct c.titulo
from conteudo c
where (c.id) in (

	select a.id_conteudo
	from assiste a

	)


--Operação de conjunto
-- projetar nomes comums entre atores e diretores

select primeiro_nome
from artista
intersect
select nome
from diretores


-- RETORNA
-- retorna o valor total pago
CREATE OR REPLACE FUNCTION get_payments_total
RETURN NUMBER
IS
    total NUMBER(10);
BEGIN
    SELECT SUM(valor) INTO total
    FROM pagamento;
    
    RETURN total;
END;

CREATE OR REPLACE FUNCTION get_payment_by_count(count_id NUMBER)
RETURN NUMBER
IS
    total NUMBER(10, 2);
BEGIN
    SELECT SUM(valor) INTO total
    FROM realiza
    INNER JOIN pagamento ON realiza.id_conta = pagamento.id
    WHERE realiza.id_conta = count_id;
    
    RETURN total;
END;


CREATE TRIGGER update_employee_timestamp
BEFORE UPDATE ON employees
FOR EACH ROW
BEGIN
    SET NEW.last_updated = NOW();
END 

CREATE OR REPLACE TRIGGER update_data_pgto
AFTER INSERT ON pagamento
FOR EACH ROW
BEGIN
    UPDATE realiza
    SET DATA_PGTO = SYSDATE
    WHERE ID_PAGAMENTO = :NEW.ID;
END;






