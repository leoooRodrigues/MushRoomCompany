create database mushroom;

drop database mushroom;

use mushroom;

create table Empresa (
idEmpresa int primary key auto_increment ,
nome varchar(45),
cnpj char(18),
email varchar (45),
telefone char (15));

create table usuarios(
idUsuario int auto_increment,
tipoUser varchar(20),
nomeUser varchar(50),
cpf char(14),
senha varchar(20),
fkEmpresa int, 
email varchar (45),
constraint empresaFkuser foreign key (fkEmpresa)
references Empresa(idEmpresa),
primary key (idUsuario, fkEmpresa)
)auto_increment = 1000;


create table fase (
idFase int primary key auto_increment,
faseCogumelo varchar(45),
tempMin int,
TempMax int,
UmiMin int,
UmiMax int
)auto_increment=1 ;


create table setor(
idSetor int auto_increment,
NomeSetor varchar (45),
fkEmpresa int,
fkFase int,
constraint empresafkSetor foreign key (fkEmpresa)
references empresa(idEmpresa),
constraint faseFkSetor foreign key (fkFase)
references fase(idFase),
primary key (idSetor,fkEmpresa))auto_increment=10;

create table cogumelo (
idCogumelo int auto_increment primary key,
nome varchar(45), 
fkSetor int,
constraint setorfkCogumelo foreign key (fkSetor)
references setor(idSetor)
)auto_increment = 500;

create table Sensor(
idSensor int primary key auto_increment, 
statensor tinyint,
nomeSensor varchar(30),
fkSetor int,
constraint setorFkEmpresa foreign key (fkSetor) 
references setor(idsetor)
)auto_increment=100;


create table registros(
idRegistros int auto_increment,
dataHora datetime,
dadosSensor int,
fkSensor int, 
tipoDado char(4)
constraint chkTipo check(tipoDado in('Umid', 'Temp')),
constraint Sensorfk foreign key (fkSensor)
references Sensor(idSensor),
primary key(idRegistros,fkSensor))auto_increment=5000;

select * from Usuarios;
select * from empresa;
select * from cogumelo;
select * from sensor; 
select * from registros;

insert into empresa(nome,email,cnpj,telefone) values 
	('Vendetta Cogu','vendetta.cogu@gmail.com','15.634.778/0001-02','(31) 93529-8167'),
    ('Delicias Cogumelos','cogu.delicias@gmail.com','37.134.751/0001-00','(95) 92641-6617'),
    ('Cogumelos Domingues','domi.cogumelos@outlook.com','75.860.814/0001-03','(82) 92384-9974');

insert into usuarios values
	(1000,'SuperADM', 'Carlos', '046.736.000-61', '**************',1,'carlos@email.com'),
    (1001,'ADM', 'Paulo', '453.545.030-78', '*****',2,'paulo@email.com'),
    (1002,'Normal', 'João', '673.865.700-58', '*********',3,'joão@email.com');
    
    insert into fase values
(1,'Inoculação',20,30,50,73),
(2,'colonização',22,35,50,70),
(3,'desenvolvimento',20,37,52,70);

insert into setor(nomeSetor,fkEmpresa,fkfase) values
	('setor 1',1,1),
    ('setor 2',1,1),
    ('setor 3',1,2),
    ('setor 1',2,3),
    ('setor 2',2,1),
    ('setor 1',3,3),
    ('setor 2',3,3),
    ('setor 3',3,1),
    ('setor 4',3,2);
    
insert into cogumelo(nome,fkSetor) values
	('Shiitake',11),
	('Shimeji',12),
	('Champignon de Paris',13);
    
    select *from setor;
    
insert into sensor(statensor,nomeSensor,fkSetor) values
(1,'Temperatura',10),
(1,'Umidade',10),
(1,'Temperatura',11),
(1,'Umidade',11);



insert into registros (dataHora, dadosSensor,tipoDado, fkSensor) values
(current_timestamp(),70,'Umid',105),
(current_timestamp(),65,'Umid',107),
(current_timestamp(),23,'Temp',104),
(current_timestamp(),22,'Temp',106);

select *from registros;
select *from sensor;
select *from setor;
select *from cogumelo;
select *from empresa;
select	*from usuarios;
select *from fase;

