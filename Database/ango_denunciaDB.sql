CREATE TABLE utilizadores(
	codigo_assembleia int not null auto_increment,
    nome_utilizador varchar(20),
    palavra_passe varchar(50),
    tipo char(1),
    telemovel varchar(13),
    email varchar(32),
    foto varchar(32),
    PRIMARY KEY (codigo_assembleia)
);

CREATE TABLE ocorrencias(
    codigo_ocorrencias int not null auto_increment,
    titulo int,
    descricao text,
    foto varchar (32),
    data_hora datetime,
    codigo_tipo int,
    codigo_utilizador int,
    codig_bairro int,
    codigo_rua int,
    PRIMARY KEY (codigo_ocorrencias),
    FOREIGN KEY (codigo_utilizador) REFERENCES utilizadores(codigo_utilizador)
    FOREIGN KEY (codig_bairro) REFERENCES bairros(codig_bairro)
    FOREIGN KEY (codigo_rua) REFERENCES ruas(codigo_rua)
);

CREATE TABLE tipos_ocorrencias(
    codigo_tipos_ocorrencia int not null auto_increment,
    descricao text,
    PRIMARY KEY (codigo_tipos_ocorrencias),
);

CREATE TABLE provincias(
    codigo_provincia int not null auto_increment,
    descricao text,
    PRIMARY KEY (codigo_PR_candidato),
);

CREATE TABLE municipios(
    codigo_municipio int not null auto_increment,
    descricao text,
    PRIMARY KEY (codigo_partido),
    FOREIGN KEY (codigo_provincia) REFERENCES provincias(codigo_provincia)
);

CREATE TABLE bairros(
    codigo_bairro int not null auto_increment,
    descricao text,
    PRIMARY KEY (codigo_partido),
    FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio)
);

CREATE TABLE ruas(
    codigo_rua int not null auto_increment,
    descricao text,
    PRIMARY KEY (codigo_rua),
    FOREIGN KEY (codigo_municipio) REFERENCES municipios(codigo_municipio)
);