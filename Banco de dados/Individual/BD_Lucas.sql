CREATE DATABASE tabela;

USE tabela;

CREATE TABLE telaInicial (
idUsuario INT PRIMARY KEY auto_increment,
nome varchar(40),
email UNIQUE varchar(40),
senha varchar(40),
empresa varchar(40)
);

CREATE TABLE telaSecundaria(
idTempera INT PRIMARY KEY auto_increment,
idUmidade varchar(40),
data DATETIME current_timestamp
);

CREATE TABLE comparaçaoTempEumidade(
idEspecie INT PRIMARY KEY auto_increment,
tempMax varchar(40),
tempMin varchar(40),
umiMax varchar(40),
umiMin varchar(40),
data DATETIME current_timestamp
);
