create database essere;
use essere;

create table usuario(
idusuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha char(10)
)auto_increment=10;


create table endereco(
idendereco int auto_increment,
fkusuario int,
foreign key (fkusuario) references usuario(idusuario),
cep char(8),
logradouro varchar(45),
complemento varchar(30),
primary key (idendereco,fkusuario)
);

create table ferrari(
idferrari int auto_increment,
modelo varchar(45),
cor varchar(45),
ano int,
fkproprietario int,
foreign key (fkproprietario) references usuario(idusuario),
primary key (idferrari,fkproprietario)
)auto_increment=50;

create table lance(
idlance int auto_increment,
valorlance decimal(13,2),
fkusuario int,
foreign key (fkusuario) references usuario(idusuario),
fkferrari int,
foreign key (fkferrari)references ferrari(idferrari),
primary key(idlance,fkferrari)
) auto_increment=100;

insert into usuario values
(null,'João Penna','joao.penna@sptech.school','senha1'),
(null,'Fernanda Caramico','fernanda.caramico@sptech.school','senha2');
select*from usuario;

insert into ferrari values
(null,'f40','rosso-corsa',1991,10),
(null,'laferari','rosso-corsa',2014,11);
select*from ferrari;

select * from lance;
select*from lance order by idLance desc limit 1;

SELECT l.valorLance as ultimolance FROM lance as l order by idLance desc limit 1;
insert into lance values
(null,13000000,11,50);

insert into endereco values
(null,10,08780600,'rua fausto prezes','60'),
(null,11,01140001,'rua haddock lobo','595');
select*from endereco;

select*from leilao join ferrari on fkferrari = idferrari;
select*from usuario join leilao where idusuario = fkproprietario;
select*from usuario join leilao on idusuario = fkproprietario;
select*from usuario join endereco on idusuario=fkusuario;

select * from lance;

desc lance;



    select 
    u.idusuario,
    u.nome,
    u.email,
    u.senha,
    l.idlance,
    l.valorlance,
    l.fkusuario,
    l.fkferrari
    from usuario u inner join lance l 
    on l.fkusuario = u.idusuario;

insert into lance (valorlance,fkusuario,fkferrari)values (13000000,10,50);

select 
    u.idusuario,
    u.nome,
    u.email,
    u.senha,
    l.idlance,
    l.valorlance,
    l.fkusuario
    from usuario as u inner join lance as l 
    on l.fkusuario = u.idusuario;
