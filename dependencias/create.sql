create table pagamento(
	ID int (10) constraint PK_PAGAMENTO primary key,
	VALOR float(10) constraint CK_VALOR_PAGAMENTO check (valor > 0)
);


create table conta(
	ID int(10) constraint PK_CONTA primary key,
	PROPRIETARIO varchar(50),
	DATADECRIACAO date
);

create table realiza(
	ID_PAGAMENTO int(10),
	ID_CONTA int(10),
	DATA_PGTO date,
	TIPO_PGTO varchar (10),
	constraint PK_REALIZA primary key (ID_PAGAMENTO, ID_CONTA, DATA_PGTO),
	constraint FK_REALIZA_PAGAMENTO foreign key (ID_PAGAMENTO) references
	pagamento(ID),
	constraint FK_REALIZA_CONTA foreign key (ID_CONTA) references conta(ID)
);


create table perfil(
	NOME varchar(50),
	ID int(10),
	FOTO varchar(200),
	TIPO varchar (50),
	constraint PK_PERFIL primary key (NOME,ID),
	constraint FK_PERFIL_CONTA foreign key (ID) references conta(ID)
);


create table review(
	ID int(10) constraint PK_REVIEW primary key,
	NOTA int(1) constraint CK_NOTA check (nota between 0 and 5)
	);
	create table artista(
	DRT int(10) constraint PK_ARTISTA primary key,
	PRIMEIRO_NOME varchar(20),
	SOBRENOME varchar(20)
);



create table diretores(
	ID int(10) constraint PK_DIRETORES primary key,
	ID_CHEFE int(10),
	constraint FK_DIRETORES_CHEFE foreign key(ID_CHEFE) references diretores(ID)
	);create table conteudo(
	ID int(10) constraint PK_CONTEUDO primary key,
	CLASSIFICACAOINDICATIVA int(2),
	SINOPSE varchar(100),
	DATADELANCAMENTO date,
	--CHECAR SE ESTA CERTO
	TRAILER varchar(200),
	TITULO varchar (20)
);


create table genero(
	ID int(10),
	GENERO varchar(20),
	constraint PK_GENERO primary key(ID, GENERO),
	constraint FK_GENERO foreign key(ID) references conteudo(ID)
);
create table filmes(
	ID int(10) constraint PK_FILMES primary key,
	constraint FK_FILMES foreign key(ID) references conteudo(ID),
	--COLOQUEI DURACAO EM SEGUNDOS
	DURACAO float(10)
);

create table serie(
	ID int(10) constraint PK_SERIE primary key,
	constraint FK_SERIE foreign key(ID) references conteudo(ID)
);


create table assiste(
	ID_CONTEUDO int(10),
	ID_CONTA int(10),
	NOME varchar(50),
	ID_REVIEW int(10),
	constraint PK_ASSISTE primary key(ID_CONTEUDO, ID_CONTA, NOME),
	constraint FK_ID_CONTEUDO_ASSISTE foreign key (ID_CONTEUDO) references
	conteudo(ID),
	constraint FK_ID_CONTA_NOME foreign key(ID_CONTA, NOME) references perfil(ID,
	NOME),
	constraint FK_ID_REVIEW foreign key (ID_REVIEW) references review(ID)
);

create table temporada(
	ID int(10) constraint PK_TEMPORADA primary key,
	TITULO varchar(50),
	ID_SERIE constraint NN_ID_SERIE not null,
	constraint FK_ID_SERIE foreign key(ID_SERIE) references serie(ID)
);


create table episodio(
	ID int(10) constraint PK_EPISODIO primary key,
	TITULO varchar(50),
	DURACAO float(10),
	ID_TEMPORADA constraint NN_ID_TEMPORADA not null,
	constraint FK_ID_TEMPORADA foreign key(ID_TEMPORADA) references temporada(ID)
);


create table premio(
	ANO int(4) constraint CK_ANO check(ANO > 0),
	VALOR float(10) constraint CK_VALOR_PREMIO check (VALOR > 0),
	CATEGORIA varchar(20),
	--CHECAR SE ESTA CERTO PARA '[ID]!'
	ID int(10) constraint UNIQUE_ID unique not null,
	constraint PK_PREMIO primary key(ANO),
	constraint FK_ANO foreign key(ANO) references filmes(ID)
);



create table participa(
	DRT int(10),
	ID_CONTEUDO int(10),
	ID_DIRETORES int(10),
	constraint PK_PARTICIPA primary key(DRT, ID_CONTEUDO, ID_DIRETORES),
	constraint FK_DRT foreign key(DRT) references artista(DRT),
	--NAO PODE REPETIR NOME PARA CONSTRAINT
	constraint FK_ID_CONTEUDO_PARTICIPA foreign key(ID_CONTEUDO) references
	conteudo(ID),
	constraint FK_ID_DIRETORES foreign key (ID_DIRETORES) references diretores(ID)
);
