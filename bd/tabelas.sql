create database essere;
use essere;

create table usuario(
idusuario int primary key auto_increment,
nome varchar(45),
email varchar(45),
senha char(10),
fkferrari int,
foreign key(fkferrari) references ferrari(idferrari)
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
fkferrari int,
foreign key (fkferrari) references ferrari(idferrari),
valorInicial decimal(10,2)
);