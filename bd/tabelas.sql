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
fkleilao int,
foreign key (fkleilao) references leilao(idleilao),
primary key (idferrari,fkleilao,fkproprietario)
)auto_increment=50;

create table leilao(
idleilao int auto_increment,
fkproprietario int,
foreign key (fkproprietario) references usuario(idusuario),
primary key(idleilao,fkproprietario),
valorInicial decimal(13,2),
fkvencedor int,
foreign key (fkvencedor) references usuario(idusuario),
lancefinal decimal(13,2)
) auto_increment=100;

insert into usuario values
(null,'João Penna','joao.penna@sptech.school','senha1'),
(null,'Fernanda Caramico','fernanda.caramico@sptech.school','senha2');
select*from usuario;

insert into ferrari values
(null,'f40','rosso-corsa',1991,10,104),
(null,'laferari','rosso-corsa',2014,11,105);
select*from ferrari;

insert into leilao values
(null,10,12000000,null,null),
(null,11,14000000,null,null);
select*from leilao;

insert into endereco values
(null,10,08780600,'rua fausto prezes','60'),
(null,11,01140001,'rua haddock lobo','595');
select*from endereco;

select*from leilao join ferrari on fkferrari = idferrari;
select*from usuario join leilao where idusuario = fkproprietario;
select*from usuario join leilao on idusuario = fkproprietario;
select*from usuario join endereco on idusuario=fkusuario;


select 
u.idusuario,
u.nome,
u.email,
u.senha,
l.idleilao,
l.fkproprietario,
l.valorinicial,
l.lancefinal,
l.fkvencedor
from usuario u inner join leilao l 
on l.fkvencedor = u.idusuario;

