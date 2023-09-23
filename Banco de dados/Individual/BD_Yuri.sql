create database Mush_Room;

use mush_room;

create table usuarios(
idUsuario int primary key auto_increment,
tipoUser varchar(20),
constraint chkTipoUser check (tipoUser IN ('ADM','Normal','SuperADM')),
nomeUser varchar(50) not null,
email varchar(40) not null,
senha varchar(20) not null
);

create table cogumelo(
idCogumelo int primary key auto_increment,
nomeEspecie varchar(50) not null,
tempColheita INT not null,
tempIncubadora INT not null,
tempInducao INT not null,
umiColheita INT not null,
umiIncubadora INT not null,
umiInducao INT not null
);

create table sensor(
idSensor int primary key auto_increment, 
statSensor boolean not null,
nomeSensor varchar(30) not null,
tipoSensor varchar(20),
constraint chkTipoSensor check (tipoSensor IN ('Umidade','Temperatura')),
);

create table registros(
idRegistro int primary key auto_increment,
dataHora timestamp not null default current_timestamp, 
idSensor int,
dadoSensor int not null
);

insert into registros(idSensor,dadoSensor) VALUES
	( 1, 20),
    ( 2, 12),
    ( 3, 70);

insert into sensor(statSensor,nomeSensor,tipoSensor,regiaoSensor) VALUES
	( 0, 'Sensor1', 'Umidade', 'Colheita' ),
    ( 1, 'Sensor2', 'Temperatura', 'Incubação' ),
    ( 1, 'Sensor3', 'Umidade', 'Indução' );
    
insert into cogumelo(nomeEspecie,tempColheita,tempIncubadora,tempInducao,umiColheita,umiIncubadora,umiInducao) VALUES
	('Shimeji', 18, 20, 17, 60, 80, 70 ),
    ('Shitake', 16, 15, 14, 50, 60, 90 ),
    ('Cogumelo do Sol', 25, 20, 22, 40, 50, 70 );
    
insert into usuarios(tipoUser,nomeUser,email,senha) VALUES
	('ADM', 'Paulo', 'paulo.ramalho@terraviva.com', '*****'),
    ('SuperADM', 'Carlos', 'carlos.pinto@terraviva.com', '**************'),
    ('Normal', 'João', 'joão.vieira@terraviva.com', '*********');
    
