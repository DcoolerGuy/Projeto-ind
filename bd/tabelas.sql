create database essere;
use essere;

create table usuario(
idusuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha char(10)
);

select*from usuario;
truncate usuario;


create table ferrari(
idferrari int primary key auto_increment,
modelo varchar(45),
cor varchar(45),
ano int
);

create table leilao(
idleilao int auto_increment,
fkproprietario int,
foreign key (fkproprietario) references usuario(idusuario),
fkferrari int,
foreign key(fkferrari) references ferrari(idferrari),
primary key(idleilao,fkproprietario,fkferrari),
valorInicial decimal(10,2),
fkvencedor int,
foreign key (fkvencedor) references usuario(idusuario)
);
alter table leilao modify column valorinicial decimal(13,2);
alter table leilao modify column lancefinal decimal(13,2);

insert into usuario values
(null,'João Penna','joao.penna@sptech.school','senha1'),
(null,'Fernanda Caramico','fernanda.caramico@sptech.school','senha2');
select*from usuario;

insert into ferrari values
(null,'f40','rosso-corsa',1991),
(null,'laferari','rosso-corsa',2014);
select*from ferrari;

insert into leilao values
(null,1,1,12000000,null,null),
(null,2,2,102000000,null,null);
select*from leilao;



