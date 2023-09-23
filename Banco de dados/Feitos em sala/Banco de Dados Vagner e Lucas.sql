create database MushRoom;
use MushRoom;

create table usuario (
idUsuario int primary key auto_increment,
instituição varchar(40),
username varchar(40),
senha varchar(40),
email varchar(80));
create table sensores (
idTemperatura int primary key auto_increment,
instituição varchar(40),
temperatura varchar(40),
umidade varchar(40),
luminosidade varchar(40),
dia datetime);

create table ideal (
idUmidade int primary key auto_increment,
especie varchar(40),
temperaturaMin varchar(40),
temperaturaMax varchar(40),
umidadeMin varchar(40),
umidadeMax varchar(40),
luminosidadeMax varchar(40),
dia datetime);

describe sensores
