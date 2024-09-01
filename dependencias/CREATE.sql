
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
NOME VARCHAR(20),
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



INSERT INTO conta (ID, PROPRIETARIO, DATADECRIACAO) VALUES (11, 'robinson fidalgo', TO_DATE('2022-01-15', 'YYYY-MM-DD'));
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


INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('robison', 11, 'http://example.com/photos/henrique.jpg', 'Moderador');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('vovo do robinson', 11, 'http://example.com/photos/isabela.jpg', 'Usuário');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('tataravo de robinson', 11, 'http://example.com/photos/joao.jpg', 'Administrador');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Alice Martins', 1, 'http://example.com/photos/alice.jpg', 'Administrador');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Bob Silva', 2, 'http://example.com/photos/bob.jpg', 'Usuário');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Carlos Souza', 3, 'http://example.com/photos/carlos.jpg', 'Editor');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Diana Oliveira', 4, 'http://example.com/photos/diana.jpg', 'Moderador');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Eva Santos', 5, 'http://example.com/photos/eva.jpg', 'Usuário');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Fernando Lima', 6, 'http://example.com/photos/fernando.jpg', 'Administrador');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Gabriela Costa', 7, 'http://example.com/photos/gabriela.jpg', 'Editor');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Henrique Almeida', 8, 'http://example.com/photos/henrique.jpg', 'Moderador');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('Isabela Pereira', 9, 'http://example.com/photos/isabela.jpg', 'Usuário');
INSERT INTO perfil (NOME, ID, FOTO, TIPO) VALUES ('João Rodrigues', 10, 'http://example.com/photos/joao.jpg', 'Administrador');





INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (1, 12, 'Um herói solitário enfrenta desafios épicos para salvar o mundo.', TO_DATE('2024-01-15', 'YYYY-MM-DD'), 'http://example.com/trailers/hero.mp4', 'O Herói');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (2, 16, 'Uma comédia leve sobre as desventuras de um grupo de amigos.', TO_DATE('2024-02-20', 'YYYY-MM-DD'), 'http://example.com/trailers/friends.mp4', 'Amigos Atrapalhados');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (3, 14, 'Um suspense psicológico que explora os limites da mente humana.', TO_DATE('2024-03-10', 'YYYY-MM-DD'), 'http://example.com/trailers/suspense.mp4', 'A Mente');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (4, 18, 'Uma aventura intergaláctica cheia de açã impressionantes.', TO_DATE('2024-04-05', 'YYYY-MM-DD'), 'http://example.com/trailers/space.mp4', 'Exploradores');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (5, 10, 'Um drama intenso que aborda questões sociais contemporâneas.', TO_DATE('2024-05-15', 'YYYY-MM-DD'), 'http://example.com/trailers/drama.mp4', 'Sociedade em Crise');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (6, 12, 'Uma animação mágica que encanta crianças e adultos.', TO_DATE('2024-06-20', 'YYYY-MM-DD'), 'http://example.com/trailers/animation.mp4', 'Mundo Encantado');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (7, 14, 'Um thriller cheio de mistérios e reviravoltas inesperadas.', TO_DATE('2024-07-25', 'YYYY-MM-DD'), 'http://example.com/trailers/thriller.mp4', 'Noite de Mistérios');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (8, 16, 'Uma série de comédia romântica que acompanha a vida de um casal improvável.', TO_DATE('2024-08-30', 'YYYY-MM-DD'), 'http://example.com/trailers/romance.mp4', 'Improvável');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (9, 18, 'Uma obra-prima do terror que vai fazer você pular da cadeira.', TO_DATE('2024-09-15', 'YYYY-MM-DD'), 'http://example.com/trailers/horror.mp4', 'A Noite do Medo');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (10, 20, 'Um documentário fascinante sobre a vida selvagem.', TO_DATE('2024-10-10', 'YYYY-MM-DD'), 'http://example.com/trailers/wildlife.mp4', 'Beleza Selvagem');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (11, 12, 'Um épico histórico baseado em eventos reais.', TO_DATE('2024-11-05', 'YYYY-MM-DD'), 'http://example.com/trailers/epic.mp4', 'História em Grande');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (12, 16, 'Uma comédia musical animada com canções cativantes.', TO_DATE('2024-12-20', 'YYYY-MM-DD'), 'http://example.com/trailers/musical.mp4', 'Melodia e Riso');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (13, 14, 'Um drama romântico sobre duas almas gêmeas.', TO_DATE('2024-01-10', 'YYYY-MM-DD'), 'http://example.com/trailers/romantic.mp4', 'Encontro de Almas');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (14, 18, 'Um thriller de espionagem com cenas de ação eletrizantes.', TO_DATE('2024-02-25', 'YYYY-MM-DD'), 'http://example.com/trailers/spy.mp4', 'Espião de Elite');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (15, 10, 'Uma sátira política mordaz e cheia de humor.', TO_DATE('2024-03-15', 'YYYY-MM-DD'), 'http://example.com/trailers/satire.mp4', 'Política e Risos');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (16, 12, 'Uma animação divertida com um grupo de animais em uma jornada.', TO_DATE('2024-04-10', 'YYYY-MM-DD'), 'http://example.com/trailers/animals.mp4', 'Aventura Animal');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (17, 14, 'Um drama intenso sobre a luta por justiça.', TO_DATE('2024-05-25', 'YYYY-MM-DD'), 'http://example.com/trailers/justice.mp4', 'Luta Pela Verdade');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (18, 16, 'Uma série de comédia sobre um grupo de colegas de trabalho.', TO_DATE('2024-06-15', 'YYYY-MM-DD'), 'http://example.com/trailers/work.mp4', 'Trabalho e Diversão');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (19, 18, 'Um suspense psicológico com uma trama intrigante.', TO_DATE('2024-07-30', 'YYYY-MM-DD'), 'http://example.com/trailers/psychological.mp4', 'A Verdade Oculta');
INSERT INTO conteudo (ID, CLASSIFICACAOINDICATIVA, SINOPSE, DATADELANCAMENTO, TRAILER, TITULO) VALUES (20, 20, 'Um documentário sobre as maravilhas do oceano.', TO_DATE('2024-08-20', 'YYYY-MM-DD'), 'http://example.com/trailers/ocean.mp4', 'Mares Profundos');



INSERT INTO genero (ID, GENERO) VALUES (1, 'Ação');
INSERT INTO genero (ID, GENERO) VALUES (2, 'Comédia');
INSERT INTO genero (ID, GENERO) VALUES (3, 'Suspense');
INSERT INTO genero (ID, GENERO) VALUES (4, 'Aventura');
INSERT INTO genero (ID, GENERO) VALUES (5, 'Drama');
INSERT INTO genero (ID, GENERO) VALUES (6, 'Animação');
INSERT INTO genero (ID, GENERO) VALUES (7, 'Thriller');
INSERT INTO genero (ID, GENERO) VALUES (8, 'Romance');
INSERT INTO genero (ID, GENERO) VALUES (9, 'Terror');
INSERT INTO genero (ID, GENERO) VALUES (10, 'Documentário');
INSERT INTO genero (ID, GENERO) VALUES (11, 'Comédia');
INSERT INTO genero (ID, GENERO) VALUES (12, 'Musical');
INSERT INTO genero (ID, GENERO) VALUES (13, 'Romance');
INSERT INTO genero (ID, GENERO) VALUES (14, 'Drama');
INSERT INTO genero (ID, GENERO) VALUES (15, 'Ficção Científica');
INSERT INTO genero (ID, GENERO) VALUES (16, 'Documentário');
INSERT INTO genero (ID, GENERO) VALUES (17, 'Animação');
INSERT INTO genero (ID, GENERO) VALUES (18, 'Thriller');
INSERT INTO genero (ID, GENERO) VALUES (19, 'Mistério');
INSERT INTO genero (ID, GENERO) VALUES (20, 'Natureza');


INSERT INTO review (ID, NOTA) VALUES (1, 5);
INSERT INTO review (ID, NOTA) VALUES (2, 4);
INSERT INTO review (ID, NOTA) VALUES (3, 3);
INSERT INTO review (ID, NOTA) VALUES (4, 2);
INSERT INTO review (ID, NOTA) VALUES (5, 1);
INSERT INTO review (ID, NOTA) VALUES (6, 0);
INSERT INTO review (ID, NOTA) VALUES (7, 5);
INSERT INTO review (ID, NOTA) VALUES (8, 4);
INSERT INTO review (ID, NOTA) VALUES (9, 3);
INSERT INTO review (ID, NOTA) VALUES (10, 2);

INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (1, 1, 'Alice Martins', 1);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (2, 2, 'Bob Silva', 2);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (3, 3, 'Carlos Souza', 3);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (4, 4, 'Diana Oliveira', 4);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (5, 5, 'Eva Santos', 5);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (6, 6, 'Fernando Lima', 6);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (7, 7, 'Gabriela Costa', 7);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (8, 8, 'Henrique Almeida', 8);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (9, 9, 'Isabela Pereira', 9);
INSERT INTO assiste (ID_CONTEUDO, ID_CONTA, NOME, ID_REVIEW) VALUES (10, 10, 'João Rodrigues', 10);


INSERT INTO filmes (ID, DURACAO) VALUES (1, 85);   
INSERT INTO filmes (ID, DURACAO) VALUES (2, 120);  
INSERT INTO filmes (ID, DURACAO) VALUES (3, 110);  
INSERT INTO filmes (ID, DURACAO) VALUES (4, 115);  
INSERT INTO filmes (ID, DURACAO) VALUES (5, 105);
INSERT INTO filmes (ID, DURACAO) VALUES (6, 85);   
INSERT INTO filmes (ID, DURACAO) VALUES (7, 120);  
INSERT INTO filmes (ID, DURACAO) VALUES (8, 110);  
INSERT INTO filmes (ID, DURACAO) VALUES (9, 115);  
INSERT INTO filmes (ID, DURACAO) VALUES (10, 105);
INSERT INTO filmes (ID, DURACAO) VALUES (11, 85);   
INSERT INTO filmes (ID, DURACAO) VALUES (12, 120);  
INSERT INTO filmes (ID, DURACAO) VALUES (13, 110);  
INSERT INTO filmes (ID, DURACAO) VALUES (14, 115);  
INSERT INTO filmes (ID, DURACAO) VALUES (15, 105);


INSERT INTO serie (ID) VALUES (16);
INSERT INTO serie (ID) VALUES (17); 
INSERT INTO serie (ID) VALUES (18); 
INSERT INTO serie (ID) VALUES (19); 
INSERT INTO serie (ID) VALUES (20); 


INSERT INTO temporada (ID, TITULO, ID_SERIE) VALUES (1, 'Temporada 1 Série 1', 16);
INSERT INTO temporada (ID, TITULO, ID_SERIE) VALUES (2, 'Temporada 2 Série 1', 16);
INSERT INTO temporada (ID, TITULO, ID_SERIE) VALUES (3, 'Temporada 1 Série 2', 17);
INSERT INTO temporada (ID, TITULO, ID_SERIE) VALUES (4, 'Temporada 1 Série 3', 18);
INSERT INTO temporada (ID, TITULO, ID_SERIE) VALUES (5, 'Temporada 2 Série 3', 18);
INSERT INTO temporada (ID, TITULO, ID_SERIE) VALUES (6, 'Temporada 1 Série 4', 19);
INSERT INTO temporada (ID, TITULO, ID_SERIE) VALUES (7, 'Temporada 1 Série 5', 20);
INSERT INTO temporada (ID, TITULO, ID_SERIE) VALUES (8, 'Temporada 2 Série 5', 20);

-- Inserções para a Temporada 1 da Série 1
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (1, 'Episódio 1 Temporada 1 Série 1', 45, 1);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (2, 'Episódio 2 Temporada 1 Série 1', 50, 1);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (3, 'Episódio 3 Temporada 1 Série 1', 40, 1);

-- Inserções para a Temporada 2 da Série 1
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (4, 'Episódio 1 Temporada 2 Série 1', 55, 2);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (5, 'Episódio 2 Temporada 2 Série 1', 60, 2);

-- Inserções para a Temporada 1 da Série 2
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (6, 'Episódio 1 Temporada 1 Série 2', 35, 3);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (7, 'Episódio 2 Temporada 1 Série 2', 40, 3);

-- Inserções para a Temporada 1 da Série 3
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (8, 'Episódio 1 Temporada 1 Série 3', 50, 4);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (9, 'Episódio 2 Temporada 1 Série 3', 55, 4);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (10, 'Episódio 3 Temporada 1 Série 3', 60, 4);

-- Inserções para a Temporada 2 da Série 3
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (11, 'Episódio 1 Temporada 2 Série 3', 45, 5);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (12, 'Episódio 2 Temporada 2 Série 3', 50, 5);

-- Inserções para a Temporada 1 da Série 4
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (13, 'Episódio 1 Temporada 1 Série 4', 30, 6);

-- Inserções para a Temporada 1 da Série 5
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (14, 'Episódio 1 Temporada 1 Série 5', 60, 7);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (15, 'Episódio 2 Temporada 1 Série 5', 55, 7);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (16, 'Episódio 3 Temporada 1 Série 5', 50, 7);

-- Inserções para a Temporada 2 da Série 5
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (17, 'Episódio 1 Temporada 2 Série 5', 45, 8);
INSERT INTO episodio (ID, TITULO, DURACAO, ID_TEMPORADA) VALUES (18, 'Episódio 2 Temporada 2 Série 5', 50, 8);



INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (1, 'João', 'Silva');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (2, 'Maria', 'Oliveira');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (3, 'Pedro', 'Santos');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (4, 'Ana', 'Costa');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (5, 'Lucas', 'Ferreira');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (6, 'Juliana', 'Pereira');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (7, 'Ricardo', 'Mendes');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (8, 'Camila', 'Ribeiro');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (9, 'Gabriel', 'Martins');
INSERT INTO artista (DRT, PRIMEIRO_NOME, SOBRENOME) VALUES (10, 'Fernanda', 'Alves');

-- Inserções na tabela diretores
-- Diretores sem chefe (ou seja, diretores principais)
INSERT INTO diretores (ID, ID_CHEFE, NOME) VALUES (1, NULL, 'Alice');
INSERT INTO diretores (ID, ID_CHEFE, NOME) VALUES (2, NULL, 'Carlos');

-- Diretores com chefe
INSERT INTO diretores (ID, ID_CHEFE, NOME) VALUES (3, 1, 'João');    
INSERT INTO diretores (ID, ID_CHEFE, NOME) VALUES (4, 1, 'Fernanda');
INSERT INTO diretores (ID, ID_CHEFE, NOME) VALUES (5, 2, 'Lucas'); 


-- Inserções na tabela participa
-- Conteúdo 1 (O Herói)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (1, 1, 1); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (2, 1, 2); 

-- Conteúdo 2 (Amigos Atrapalhados)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (3, 2, 3); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (4, 2, 4); 

-- Conteúdo 3 (A Mente)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (5, 3, 1); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (6, 3, 2); 

-- Conteúdo 4 (Exploradores Espaciais)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (7, 4, 3); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (8, 4, 4); 

-- Conteúdo 5 (Sociedade em Crise)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (9, 5, 1); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (10, 5, 2); 

-- Conteúdo 6 (Mundo Encantado)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (11, 6, 3); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (12, 6, 4); 

-- Conteúdo 7 (Noite de Mistérios)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (13, 7, 1); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (14, 7, 2); 

-- Conteúdo 8 (Amor Improvável)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (15, 8, 3); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (16, 8, 4); 

-- Conteúdo 9 (A Noite do Medo)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (17, 9, 1); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (18, 9, 2); 

-- Conteúdo 10 (Beleza Selvagem)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (19, 10, 3);
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (20, 10, 4);

-- Conteúdo 11 (História em Grande)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (1, 11, 1); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (2, 11, 2); 

-- Conteúdo 12 (Melodia e Riso)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (3, 12, 3); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (4, 12, 4); 

-- Conteúdo 13 (Encontro de Almas)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (5, 13, 1); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (6, 13, 2); 

-- Conteúdo 14 (Espião de Elite)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (7, 14, 3); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (8, 14, 4); 

-- Conteúdo 15 (Política e Risos)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (9, 15, 1); 
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (1, 15, 2);

-- Conteúdo 16 (Aventura Animal)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (1, 16, 3);
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (2, 16, 4);

-- Conteúdo 17 (Luta Pela Verdade)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (3, 17, 1);
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (1, 17, 2);

-- Conteúdo 18 (Trabalho e Diversão)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (5, 18, 3);
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (6, 18, 4);

-- Conteúdo 19 (A Verdade Oculta)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (7, 19, 1);
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (8, 19, 2);

-- Conteúdo 20 (Mares Profundos)
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (9, 20, 3);
INSERT INTO participa (DRT, ID_CONTEUDO, ID_DIRETORES) VALUES (2, 20, 4);



SELECT c.proprietario, sub.qtd
FROM conta c
INNER JOIN (
    SELECT r.ID_CONTA, COUNT(*) AS qtd
    FROM realiza r
    GROUP BY r.ID_CONTA
) sub ON c.ID = sub.ID_CONTA
ORDER BY sub.qtd DESC;










