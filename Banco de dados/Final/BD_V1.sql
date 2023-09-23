create database Mush_Room;

use mush_room;

create table empresa(
idEmpresa int primary key auto_increment,
nome varchar (20) not null,
cnpj char (18) not null unique,
email varchar (30) not null,
celular varchar (17) not null
);

create table usuarios(
idUsuario int primary key auto_increment,
tipoUser varchar(20),
constraint chkTipoUser check (tipoUser IN ('ADM','Normal','SuperADM')),
nomeUser varchar(50) not null,
cpf char(14) unique not null,
senha varchar(20) not null
);

create table cogumelo(
idCogumelo int primary key auto_increment,
nomeEspecie varchar(50) not null,
tempMax INT not null,
tempMin INT not null,
umiMax INT not null,
umiMin INT not null
);

create table sensor(
idSensor int primary key auto_increment, 
statSensor boolean not null,
nomeSensor varchar(30) not null
);

create table registros(
idRegistro int primary key auto_increment,
dataHora datetime default current_timestamp, 
dadoSensorTemp int not null,
dadoSensorUmi int not null
);

insert into registros(dadoSensorTemp, dadoSensorUmi) VALUES
	(20, 36),
    (12, 34),
    (70, 30);

insert into sensor(statSensor,nomeSensor) VALUES
	(false, 'Sensor1'),
    (true, 'Sensor2'),
    (true, 'Sensor3');
    
insert into cogumelo(nomeEspecie,tempMax,tempMin,umiMax,umiMin) VALUES
    ('Shimeji','30','25','90','80'),
	('Shitake','25','20','95','75'),
	('Champignon','25','12','90','80');
    
insert into usuarios(tipoUser,nomeUser,cpf,senha) VALUES
	('ADM', 'Paulo', '453.545.030-78', '*****'),
    ('SuperADM', 'Carlos', '046.736.000-61', '**************'),
    ('Normal', 'João', '673.865.700-58', '*********');
    
insert into empresa(nome,cnpj,email,celular) VALUES 
	('Vendetta Cogu','15.634.778/0001-02','vendetta.cogu@gmail.com','(31) 93529-8167'),
    ('Delicias Cogumelos','37.134.751/0001-00','cogu.delicias@gmail.com','(95) 92641-6617'),
    ('Cogumelos Domingues','75.860.814/0001-03','domi.cogumelos@outlook.com','(82) 92384-9974');

select * from cogumelo;
select * from sensor;
select * from usuarios;
select * from registros;
select * from empresa;
    
