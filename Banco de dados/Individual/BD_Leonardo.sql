CREATE DATABASE mushroom;
USE mushroom;

CREATE TABLE cadastro(
idCadastro INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(50),
cpf VARCHAR(14),
email VARCHAR(40),
senha VARCHAR(20),
dtNasc DATE,
celular VARCHAR(15),
cep CHAR(8),
logradouro VARCHAR(60));

CREATE TABLE sensores(
idSensor INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(30),
funcao VARCHAR(15),
temperaturaIdeal CHAR(2),
intervaloHorario VARCHAR(5),
statsIdeal VARCHAR(15),
usoSensor VARCHAR(20));

CREATE TABLE cogumelos(
idCogumelo INT PRIMARY KEY AUTO_INCREMENT,
nome VARCHAR(20),
qtdBloco VARCHAR(4),
peso VARCHAR(3),
tempIdeal CHAR(2),
umidadeIdeal CHAR(2),
luminosidadeIdeal VARCHAR(5));
