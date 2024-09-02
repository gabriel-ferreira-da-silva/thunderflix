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
where (c.CLASSIFICACAOINDICATIVA, c.DataDeLancamento) = (
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
/

CREATE OR REPLACE PROCEDURE GET_TITULOS_MESMA_DATA AS
    v_data_lancamento CONTEUDO.DATADELANCAMENTO%TYPE;
    v_titulo CONTEUDO.TITULO%TYPE;
    c_titulos SYS_REFCURSOR;
BEGIN
    -- Obtém a data de lançamento do conteúdo de ID 1
    SELECT DATADELANCAMENTO
    INTO v_data_lancamento
    FROM CONTEUDO
    WHERE ID = 1;

    -- Abre o cursor para buscar os títulos com a mesma data de lançamento
    OPEN c_titulos FOR
        SELECT C.TITULO
        FROM CONTEUDO C
        WHERE C.DATADELANCAMENTO = v_data_lancamento;

    -- Itera pelos resultados do cursor
    LOOP
        FETCH c_titulos INTO v_titulo;
        EXIT WHEN c_titulos%NOTFOUND;
        DBMS_OUTPUT.PUT_LINE('Titulo: ' || v_titulo);
    END LOOP;

    -- Fecha o cursor
    CLOSE c_titulos;
END;
/

CREATE OR REPLACE TRIGGER trg_after_insert_serie
AFTER INSERT ON SERIE
FOR EACH ROW
BEGIN
  INSERT INTO TEMPORADA (ID_SERIE, TITULO)
  VALUES (:NEW.ID, 'Temporada 1');
  INSERT INTO EPISODIO (ID_TEMPORADA, TITULO)
  VALUES (:NEW.ID, 'Piloto');
END;
/

CREATE OR REPLACE TRIGGER update_data_pgto
AFTER INSERT ON pagamento
FOR EACH ROW
BEGIN
    UPDATE realiza
    SET DATA_PGTO = SYSDATE
    WHERE ID_PAGAMENTO = :NEW.ID;
END;
/
