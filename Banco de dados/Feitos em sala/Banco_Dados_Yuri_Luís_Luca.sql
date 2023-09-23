CREATE DATABASE Mush_Room;

USE Mush_Room;

CREATE TABLE usuario(

idUsuario INT PRIMARY KEY,
nome VARCHAR(50),
email VARCHAR(50),
senha VARCHAR(20),
cargo int

);

CREATE TABLE cogumelos(

nomeCogu VARCHAR(50),
tempColheita INT,
tempIncubadora INT,
tempIndução INT,
umiColheita INT,
umiIncubadora INT,
umiIndução INT,
ilumiColheita INT,
ilumiIncubadora INT,
ilumiInducao INT

);

CREATE TABLE registros(

idLog int primary key auto_increment,
nomeSensor VARCHAR(30),
tipoSensor VARCHAR(20), 
dadoMin INT,
dadoMed INT,
dadoMax INT,
dataHora datetime

);