create table pagamento(
ID number(10) constraint PK_PAGAMENTO primary key,
VALOR number(10) constraint CK_VALOR_PAGAMENTO check (valor > 0)
);

create table conta(
ID number(10) constraint PK_CONTA primary key,
PROPRIETARIO varchar(50),
DATADECRIACAO date
);

create table realiza(
ID_PAGAMENTO number(10),
ID_CONTA number(10),
DATA_PGTO date,
TIPO_PGTO varchar (10),
constraint PK_REALIZA primary key (ID_PAGAMENTO, ID_CONTA, DATA_PGTO),
constraint FK_REALIZA_PAGAMENTO foreign key (ID_PAGAMENTO) references pagamento(ID),
constraint FK_REALIZA_CONTA foreign key (ID_CONTA) references conta(ID)
);

create table perfil(
NOME varchar(50),
ID number(10),
FOTO varchar(200),
TIPO varchar (50),
constraint PK_PERFIL primary key (NOME,ID),
constraint FK_PERFIL_CONTA foreign key (ID) references conta(ID)
);

create table review(
ID number(10) constraint PK_REVIEW primary key,
NOTA number(1) constraint CK_NOTA check (nota between 0 and 5)
);

create table artista(
DRT number(10) constraint PK_ARTISTA primary key,
PRIMEIRO_NOME varchar(20),
SOBRENOME varchar(20)
);

create table diretores(
ID number(10) constraint PK_DIRETORES primary key,
ID_CHEFE number(10),
constraint FK_DIRETORES_CHEFE foreign key(ID_CHEFE) references diretores(ID)
);

create table conteudo(
ID number(10) constraint PK_CONTEUDO primary key,
CLASSIFICACAOINDICATIVA number(2),
SINOPSE varchar(100),
DATADELANCAMENTO date,
--CHECAR SE ESTA CERTO
TRAILER varchar(200),
TITULO varchar (20)
);

create table genero(
ID number(10),
GENERO varchar(20),
constraint PK_GENERO primary key(ID, GENERO),
constraint FK_GENERO foreign key(ID) references conteudo(ID)
);

create table filmes(
ID number(10) constraint PK_FILMES primary key,
constraint FK_FILMES foreign key(ID) references conteudo(ID),
--COLOQUEI DURACAO EM SEGUNDOS
DURACAO number(10)
);

create table serie(
ID number(10) constraint PK_SERIE primary key,
constraint FK_SERIE foreign key(ID) references conteudo(ID)
);

create table assiste(
ID_CONTEUDO number(10),
ID_CONTA number(10),
NOME varchar(50),
ID_REVIEW number(10),
constraint PK_ASSISTE primary key(ID_CONTEUDO, ID_CONTA, NOME),
constraint FK_ID_CONTEUDO_ASSISTE foreign key (ID_CONTEUDO) references conteudo(ID),
constraint FK_ID_CONTA_NOME foreign key(ID_CONTA, NOME) references perfil(ID, NOME),
constraint FK_ID_REVIEW foreign key (ID_REVIEW) references review(ID)
);

create table temporada(
ID number(10) constraint PK_TEMPORADA primary key,
TITULO varchar(50),
ID_SERIE constraint NN_ID_SERIE not null,
constraint FK_ID_SERIE foreign key(ID_SERIE) references serie(ID)
);

create table episodio(
ID number(10) constraint PK_EPISODIO primary key,
TITULO varchar(50),
DURACAO number(10),
ID_TEMPORADA constraint NN_ID_TEMPORADA not null,
constraint FK_ID_TEMPORADA foreign key(ID_TEMPORADA) references temporada(ID)
);

create table premio(
ANO number(4) constraint CK_ANO check(ANO > 0),
VALOR number(10) constraint CK_VALOR_PREMIO check (VALOR > 0),
CATEGORIA varchar(20),
--CHECAR SE ESTA CERTO PARA '[ID]!'
ID number(10) constraint UNIQUE_ID unique not null,
constraint PK_PREMIO primary key(ANO),
constraint FK_ANO foreign key(ANO) references filmes(ID)
);

create table participa(
DRT number(10),
ID_CONTEUDO number(10),
ID_DIRETORES number(10),
constraint PK_PARTICIPA primary key(DRT, ID_CONTEUDO, ID_DIRETORES),
constraint FK_DRT foreign key(DRT) references artista(DRT),
--NAO PODE REPETIR NOME PARA CONSTRAINT
constraint FK_ID_CONTEUDO_PARTICIPA foreign key(ID_CONTEUDO) references conteudo(ID),
constraint FK_ID_DIRETORES foreign key (ID_DIRETORES) references diretores(ID)
);







INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (1, 'João Silva', TO_DATE('2022-01-15', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (2, 'Maria Oliveira', TO_DATE('2022-02-20', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (3, 'Carlos Pereira', TO_DATE('2022-03-25', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (4, 'Ana Souza', TO_DATE('2022-04-10', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (5, 'Pedro Lima', TO_DATE('2022-05-05', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (6, 'Luciana Ferreira', TO_DATE('2022-06-15', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (7, 'Roberto Alves', TO_DATE('2022-07-01', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (8, 'Fernanda Costa', TO_DATE('2022-08-20', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (9, 'Ricardo Santos', TO_DATE('2022-09-10', 'YYYY-MM-DD'));
INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (10, 'Juliana Andrade', TO_DATE('2022-10-05', 'YYYY-MM-DD'));







INSERT INTO pagamento (ID, VALOR) VALUES (1, 100);
INSERT INTO pagamento (ID, VALOR) VALUES (2, 250);
INSERT INTO pagamento (ID, VALOR) VALUES (3, 500);
INSERT INTO pagamento (ID, VALOR) VALUES (4, 750);
INSERT INTO pagamento (ID, VALOR) VALUES (5, 1200);
INSERT INTO pagamento (ID, VALOR) VALUES (6, 850);
INSERT INTO pagamento (ID, VALOR) VALUES (7, 300);
INSERT INTO pagamento (ID, VALOR) VALUES (8, 450);
INSERT INTO pagamento (ID, VALOR) VALUES (9, 1000);
INSERT INTO pagamento (ID, VALOR) VALUES (10, 150);
INSERT INTO pagamento (ID, VALOR) VALUES (11, 200);
INSERT INTO pagamento (ID, VALOR) VALUES (12, 600);
INSERT INTO pagamento (ID, VALOR) VALUES (13, 700);
INSERT INTO pagamento (ID, VALOR) VALUES (14, 1100);
INSERT INTO pagamento (ID, VALOR) VALUES (15, 1250);
INSERT INTO pagamento (ID, VALOR) VALUES (16, 900);
INSERT INTO pagamento (ID, VALOR) VALUES (17, 1350);
INSERT INTO pagamento (ID, VALOR) VALUES (18, 400);
INSERT INTO pagamento (ID, VALOR) VALUES (19, 500);
INSERT INTO pagamento (ID, VALOR) VALUES (20, 1400);
iNSERT INTO pagamento (ID, VALOR) VALUES (21, 1250);
INSERT INTO pagamento (ID, VALOR) VALUES (22, 900);
INSERT INTO pagamento (ID, VALOR) VALUES (23, 1350);
INSERT INTO pagamento (ID, VALOR) VALUES (24, 400);
INSERT INTO pagamento (ID, VALOR) VALUES (25, 500);
INSERT INTO pagamento (ID, VALOR) VALUES (26, 1400);



INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (1, 1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (2, 2, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (3, 3, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (4, 4, TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (5, 5, TO_DATE('2024-05-05', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (6, 6, TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (7, 7, TO_DATE('2024-07-01', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (8, 8, TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (9, 9, TO_DATE('2024-09-10', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (10, 10, TO_DATE('2024-10-05', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (11, 1, TO_DATE('2024-11-10', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (12, 2, TO_DATE('2024-12-15', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (13, 3, TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (14, 4, TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (15, 5, TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (16, 6, TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (17, 7, TO_DATE('2024-05-15', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (18, 8, TO_DATE('2024-06-20', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (19, 9, TO_DATE('2024-07-10', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (20, 10, TO_DATE('2024-08-05', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (21, 1, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (22, 1, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (23, 1, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (24, 2, TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'Crédito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (25, 2, TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'Débito');
INSERT INTO realiza (ID_PAGAMENTO, ID_CONTA, DATA_PGTO, TIPO_PGTO) VALUES (26, 3, TO_DATE('2024-03-25', 'YYYY-MM-DD'), 'Crédito');


SELECT c.proprietario, sub.qtd
FROM conta c
INNER JOIN (
    SELECT r.ID_CONTA, COUNT(*) AS qtd
    FROM realiza r
    GROUP BY r.ID_CONTA
) sub ON c.ID = sub.ID_CONTA
ORDER BY sub.qtd DESC;









