CREATE DATABASE mushroom;
USE mushroom;

CREATE TABLE cadastro(
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
nomeUser varchar(50) not null,
cpf varchar(40) unique not null,
senha varchar(20) not null,
cnpj varchar(25) not null,
email VARCHAR(40) not null,
celular VARCHAR(15) not null,
cep CHAR(8) not null,
logradouro VARCHAR(60) not null
);

CREATE TABLE sensores(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
funcao VARCHAR(20),
temperatura CHAR(5),
umidade VARCHAR (5),
atualizado_em datetime default current_timestamp
);

CREATE TABLE cogumelos(
idCogumelo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(40),
qtdBloco VARCHAR(6),
peso VARCHAR(6),
tempIdeal VARCHAR(5),
umidadeIdeal VARCHAR(5)
);