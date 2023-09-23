create database MushRoom;
use MushRoom;

create table usuario (
idUsuario int primary key auto_increment,
instituição varchar(40),
username varchar(40),
senha varchar(40),
email varchar(80));

create table sensores (
idSensor int primary key auto_increment,
temperatura varchar(40),
umidade varchar(40),
dia datetime);

create table ideal (
idEspecie int primary key auto_increment,
especie varchar(40),
temperaturaMin varchar(40),
temperaturaMax varchar(40),
umidadeMin varchar(40),
umidadeMax varchar(40));

describe sensores;

insert into ideal (especie, temperaturaMin, temperaturaMax, umidadeMin, umidadeMax) values
('Shimeji','25','30','80','90'),
('Shitake','20','25','75','95'),
('Champignon','12','25','80','90');

select * from ideal


