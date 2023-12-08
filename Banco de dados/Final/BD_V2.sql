create database mushroom;
use mushroom;
drop database mushroom;
describe empresa;

-- Criação das Tabelas
select * from empresa;

create table empresa (
idEmpresa int primary key auto_increment ,
nome varchar(45),
cnpj char(18),
email varchar (45),
telefone char (15),
senha varchar(25))auto_increment=1;

select * from empresa;

delete from empresa where idEmpresa = 2;


create table fase (
idFase int primary key auto_increment,
cogumelo varchar(45),
faseCogumelo varchar(45),
tempMin int,
TempMax int,
UmiMin int,
UmiMax int
)auto_increment=1 ;

create table setor(
idSetor int auto_increment,
Nome varchar (45),
fkEmpresa int,
fkFase int,
constraint FasefkSetor foreign key (fkFase)
references fase(idFase),
constraint empresafkSetor foreign key (fkEmpresa)
references empresa(idEmpresa),
primary key (idSetor,fkEmpresa))auto_increment=10;

create table registros(
idRegistros int auto_increment,
dataHora datetime,
fkSetor int, 
DadosUmi int,
DadosTemp int,
fkEmpresa int,
constraint fkEmpresareg foreign key (fkEmpresa)
references empresa(idempresa),
constraint fkSetorReg foreign key (fkSetor)
references setor(idSetor),
primary key(idRegistros,fkEmpresa,fkSetor))auto_increment=5000;

select * from registros;

select 
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros) FROM registros)
				order by DadosUmi desc)) as hora1,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -1) FROM registros)
				order by DadosUmi desc))as hora2,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -2) FROM registros)
				order by DadosUmi desc))as hora3,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -3) FROM registros)
				order by DadosUmi desc))as hora4,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -4) FROM registros)
				order by DadosUmi desc))as hora5,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -5) FROM registros)
				order by DadosUmi desc))as hora6,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -6) FROM registros)
				order by DadosUmi desc))as hora7,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -7) FROM registros)
				order by DadosUmi desc))as hora8,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -8) FROM registros)
				order by DadosUmi desc))as hora9,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -9) FROM registros)
				order by DadosUmi desc))as hora10,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -10) FROM registros)
				order by DadosUmi desc))as hora12,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -11) FROM registros)
				order by DadosUmi desc))as hora13,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -12) FROM registros)
				order by DadosUmi desc))as hora14,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -13) FROM registros)
				order by DadosUmi desc))as hora15,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -14) FROM registros)
				order by DadosUmi desc))as hora16,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -15) FROM registros)
				order by DadosUmi desc))as hora17,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -16) FROM registros)
				order by DadosUmi desc))as hora18,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -17) FROM registros)
				order by DadosUmi desc))as hora19,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -18) FROM registros)
				order by DadosUmi desc))as hora20,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -19) FROM registros)
				order by DadosUmi desc))as hora21,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -20) FROM registros)
				order by DadosUmi desc))as hora22,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros -21) FROM registros)
				order by DadosUmi desc))as hora23,
	(select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros - 22) FROM registros)
				order by DadosUmi desc))as hora24
from registros where fkEmpresa = 1 limit 1;


SELECT max(idRegistros)  FROM registros;

select DadosUmi from registros where 
		idRegistros = ( SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros) FROM registros)
				order by DadosUmi desc);
                
SELECT idRegistros FROM registros 
			WHERE idRegistros=(SELECT max(idRegistros) FROM registros)
				order by DadosUmi desc;
SELECT * from registros;

SELECT LAST_INSERT_ID;


truncate registros;
-- Inserts nas tabelas 


insert into empresa(nome,email,cnpj,telefone) values 
	('Vendetta Cogu','vendetta.cogu@gmail.com','15.634.778/0001-02','(31) 93529-8167'),
    ('Delicias Cogumelos','cogu.delicias@gmail.com','37.134.751/0001-00','(95) 92641-6617'),
    ('Cogumelos Domingues','domi.cogumelos@outlook.com','75.860.814/0001-03','(82) 92384-9974');

    insert into fase (cogumelo,faseCogumelo,tempMin,tempMax,umiMin,umiMax) values
('Champignom','Inoculação',20,30,50,73),
('Champignom','Colonização',20,30,50,73),
('Champignom','Desenvolvimento',20,30,50,73),
('Shiitake','Inoculação',22,35,50,70),
('Shiitake','colonização',22,35,50,70),
('Shiitake','Desenvolvimento',22,35,50,70),
('Shimeji','Inoculação',20,37,52,70),
('Shimeji','Colonização',20,37,52,70),
('Shimeji','desenvolvimento',20,37,52,70);

    insert into setor (nome,fkEmpresa,fkFase) values
	('setor 1',1,1),
    ('setor 2',1,6),
    ('setor 3',1,1),
    ('setor 1',2,1),
    ('setor 2',2,1),
    ('setor 1',3,1),
    ('setor 2',3,6),
    ('setor 3',3,9),
    ('setor 4',3,9);
    
insert into registros (dataHora, dadosUmi,dadosTemp,fkSetor,fkEmpresa) values
(current_timestamp(),70,25,10,1),
(current_timestamp(),65,25,11,1),
(current_timestamp(),80,26,12,1),
(current_timestamp(),70,28,13,2),
(current_timestamp(),85,27,14,2),
(current_timestamp(),83,25,15,2),
(current_timestamp(),82,27,16,3),
(current_timestamp(),87,24,17,3),
(current_timestamp(),89,25,18,3);


-- Select das tabelas



-- Cada tabela individualmente

select *from registros;
select *from setor;
select *from empresa;
select *from fase;


-- Tabelas com ligação



-- Empresas e Setores 


select empresa.nome as empresa, setor.nome as setor from empresa join setor
on setor.fkEmpresa = empresa.idEmpresa;


-- Determinadas Empresas seus setores com os registros de seus sensor


select empresa.nome as empresa, setor.nome as setor,  registros.dadosUmi, registros.dadosTemp  from empresa join setor on 
setor.fkempresa = empresa.idempresa 	
join registros on registros.fksetor = setor.idsetor
where empresa.nome ='vendetta Cogu';

select empresa.nome as empresa, setor.nome as setor, registros.dadosUmi, registros.dadosTemp  from empresa join setor on 
setor.fkempresa = empresa.idempresa 
join registros on registros.fksetor = setor.idsetor
where empresa.nome ='Delicias Cogumelos';

select empresa.nome as empresa, setor.nome as setor, registros.dadosUmi, registros.dadosTemp  from empresa join setor on 
setor.fkempresa = empresa.idempresa 
join registros on registros.fksetor = setor.idsetor
where empresa.nome ='Cogumelos Domingues';


-- Determinadas Empresas e as fases de cada setor


select empresa.nome as empresa, setor.nome as setor, fase.cogumelo as Cogumelo, fase.fasecogumelo as fase  from empresa join setor
on setor.fkempresa = empresa.idempresa join fase on setor.fkfase = fase.idfase
where empresa.nome ='vendetta Cogu' ;

select empresa.nome as empresa, setor.nome as setor, fase.cogumelo as Cogumelo, fase.fasecogumelo as fase from empresa join setor
on setor.fkempresa = empresa.idempresa join fase on setor.fkfase = fase.idfase
where empresa.nome ='Delicias Cogumelos' ;

select empresa.nome as empresa, setor.nome as setor, fase.cogumelo as Cogumelo, fase.fasecogumelo as fase from empresa join setor
on setor.fkempresa = empresa.idempresa join fase on setor.fkfase = fase.idfase
where empresa.nome ='Cogumelos Domingues' ;

