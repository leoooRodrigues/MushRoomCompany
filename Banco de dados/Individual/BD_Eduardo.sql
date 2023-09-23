CREATE DATABASE mushroom;
USE mushroom;

CREATE TABLE cadastro(
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50) not null,
cpf VARCHAR(25) default 'Cadastro com CNPJ',
cnpj varchar(25) default 'Cadastro com CPF',
email VARCHAR(40) not null,
senha VARCHAR(20) not null,
celular VARCHAR(15),
cep CHAR(8) not null,
logradouro VARCHAR(60));

CREATE TABLE sensores(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
funcao VARCHAR(15),
temperatura CHAR(4),
umidade CHAR (2),
ultima_att datetime default current_timestamp
);

CREATE TABLE cogumelos(
idCogumelo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(20),
qtdBloco VARCHAR(4),
peso VARCHAR(3),
tempIdeal CHAR(2),
umidadeIdeal CHAR(2)
);

