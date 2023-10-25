create database mushroom;
use mushroom;

create table Empresa (
idEmpresa int primary key auto_increment ,
nome varchar(45),
cnpj char(18),
email varchar (45),
telefoneCelular char (15));

create table usuarios(
idUsuario int auto_increment,
tipoUser varchar(20),
nomeUser varchar(50),
cpf char(14),
senha varchar(20),
fkEmpresa int, 
constraint empresaFkuser foreign key (fkEmpresa)
references Empresa(idEmpresa),
primary key (idUsuario, fkEmpresa)
);

create table setor(
idSetor int auto_increment,
NomeSetor varchar (45),
fkEmpresa int,
constraint empresafkSetor foreign key (fkEmpresa)
references empresa(idEmpresa),
primary key (idSetor,fkEmpresa));


create table cogumelo (
idCogumelo int auto_increment ,
nome varchar(45), 
fkSetor int,
constraint setorfkCogumelo foreign key (fkSetor)
references setor(idSetor),
primary key (idCogumelo,fkSetor)
);

create table fase (
idFase int auto_increment,
faseCogumelo varchar(45),
tempMin int,
TempMax int,
UmiMin int,
UmiMax int,
fkCogumelo int, 
constraint cogumeloFkFase foreign key (fkCogumelo)
references cogumelo(idCogumelo),
primary key(idFase,fkCogumelo)
);


create table Sensor(
idSensor int, 
statensor tinyint,
nomeSensor varchar(30),
fkSetor int,
constraint setorFkEmpresa foreign key (fkSetor) 
references setor(idsetor),
primary key (idSensor, fkSetor));


create table registros(
idRegistros int,
dataHora datetime,
dadoSensorTemp int,
dadoSensorUmi int, 
fkSensor int, 
constraint Sensorfk foreign key (fkSensor)
references Sensor(idSensor),
primary key(idRegistros,fkSensor));

select * from Usuarios;
select * from empresa;
select * from cogumelo;
select * from sensor; 
select * from registros;

insert into empresa(nome,email,cnpj,telefoneCelular) values 
	('Vendetta Cogu','vendetta.cogu@gmail.com','15.634.778/0001-02','(31) 93529-8167'),
    ('Delicias Cogumelos','cogu.delicias@gmail.com','37.134.751/0001-00','(95) 92641-6617'),
    ('Cogumelos Domingues','domi.cogumelos@outlook.com','75.860.814/0001-03','(82) 92384-9974');

insert into usuarios(tipoUser,nomeUser,cpf,senha,fkEmpresa) values
	('SuperADM', 'Carlos', '046.736.000-61', '**************',1),
    ('ADM', 'Paulo', '453.545.030-78', '*****',2),
    ('Normal', 'João', '673.865.700-58', '*********',3);
    
insert into setor(nomeSetor,fkEmpresa) values
	('setor 1',1),
    ('setor 2',1),
    ('setor 3',1),
    ('setor 1',2),
    ('setor 2',2),
    ('setor 1',3),
    ('setor 2',3),
    ('setor 3',3),
    ('setor 4',3);
    
insert into cogumelo(nome,fkSetor) values
	('Shiitake',1),
	('Shimeji',1),
	('Champignon de Paris',2);
    
insert into fase(faseCogumelo,UmiMin,umiMax,minTem,TempMax) values
(


