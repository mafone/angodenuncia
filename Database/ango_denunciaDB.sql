CREATE TABLE utilizadores(
	codigo_utilizador int auto_increment PRIMARY KEY,
    nome_utilizador varchar(20),
    palavra_passe varchar(50),
    tipo char(1),
    telemovel varchar(12),
    email varchar(50),
    foto varchar(32)
);

CREATE TABLE tipos_ocorrencias(
    codigo_tipo_ocorrencia int auto_increment PRIMARY KEY,
    tipo text
);

CREATE TABLE provincias(
    codigo_provincia int auto_increment PRIMARY KEY,
    nome text
);

CREATE TABLE municipios(
    codigo_municipio int auto_increment PRIMARY KEY,
    nome text,
    codigo_provincia int,
    FOREIGN KEY (codigo_provincia) REFERENCES provincias(codigo_provincia)
);

CREATE TABLE bairros(
    codigo_bairro int auto_increment PRIMARY KEY,
    nome text,
    codigo_municipio int,
    FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio)
);

CREATE TABLE ruas(
    codigo_rua int auto_increment PRIMARY KEY,
    nome text,
    codigo_municipio int,
    FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio)
);

CREATE TABLE ocorrencias(
    codigo_ocorrencias int auto_increment PRIMARY KEY,
    titulo varchar(50),
    descricao text,
    foto varchar (32),
    data_hora datetime,
    codigo_tipo int,
    codigo_utilizador int,
    codigo_bairro int,
    codigo_rua int,
    FOREIGN KEY (codigo_utilizador) REFERENCES utilizadores(codigo_utilizador),
    FOREIGN KEY (codigo_bairro) REFERENCES bairros(codigo_bairro),
    FOREIGN KEY (codigo_rua) REFERENCES ruas(codigo_rua),
    FOREIGN KEY (codigo_tipo) REFERENCES tipos_ocorrencias(codigo_tipo_ocorrencia)
);

/*

Tabelas pendentes... Ideia em análise.

CREATE TABLE nums_emergencias(
    codigo_policia int,
    codigo_bombeiro int,
    codigo_ambulancia int
    PRIMARY KEY (codigo_policia, codigo_bombeiro , codigo_ambulancia)
    FOREIGN KEY (codigo_policia) REFERENCES policias(codigo_policia)
    FOREIGN KEY (codigo_bombeiro) REFERENCES bombeiros(codigo_bombeiro)
    FOREIGN KEY (codigo_ambulancia) REFERENCES ambulancias(codigo_ambulancia)
);

CREATE TABLE policias(
    codigo_policia int,
    nome varchar(50),
    telemovel varchar(13),
    codigo_utilizador int
    FOREIGN KEY (codigo_utilizador) REFERENCES utilizadores(codigo_utilizador)
);

CREATE TABLE bombeiros(
    codigo_bombeiro int,
    nome varchar(50),
    telemovel varchar(13),
    codigo_utilizador int
    FOREIGN KEY (codigo_utilizador) REFERENCES utilizadores(codigo_utilizador)
);

CREATE TABLE ambulancia(
    codigo_ambulancia int,
    nome varchar(50),
    telemovel varchar(13),
    codigo_utilizador int
    FOREIGN KEY (codigo_utilizador) REFERENCES utilizadores(codigo_utilizador)
);

CREATE TABLE pontuacoes(
    codigo_pontuacao int PRIMARY KEY,
    ponto_positivo int,
    ponto_negativo int,
    codigo_utilizador int,
    FOREIGN KEY (codigo_utilizador) REFERENCES gostos(codigo_utilizador)
);

CREATE TABLE comentarios(
    codigo_comentario int PRIMARY KEY,
    comentario text
    FOREIGN KEY (codigo_utilizador) REFERENCES gostos(codigo_utilizador)
);

*/
