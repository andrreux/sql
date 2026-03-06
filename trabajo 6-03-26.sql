DROP TABLE if exists interpreta;
DROP TABLE if exists observacion;
DROP TABLE if exists cancion;
DROP TABLE if exists playlist;
DROP TABLE if exists album;
DROP TABLE if exists artista;

-- creacion de tablas--
create table artista(
num_art VARCHAR(10),
nombre varchar (100) not null,
nacionalidad varchar(100) not null,
fecha_nacimiento date not null,
agencia varchar not null,
altura decimal (3,2) null,
constraint pk_artista primary key(num_art)
);

create table album(
codigo_alb varchar(100),
titulo varchar(10) not null,
fecha_lanz date not null,
caratula varchar (100) not null,
constraint pk_album primary key(codigo_alb)
);

create table playlist (
num_play varchar (100),
nombre_play varchar(100) not null,
privado boolean not null,
caratula_play varchar (100) not null,
constraint pk_playlist primary key (num_play)
);

create table cancion (
numero_can varchar(100),
titulo_can varchar(100) not null,
duracion varchar (100)not null,
codigo_alb varchar(100) not null,
constraint pk_cancion primary key (numero_can)
);

alter table cancion
ADD CONSTRAINT not_canboom_alb foreign key (codigo_alb)
references album(codigo_alb)
on delete restrict
on update cascade;

create table observacion (
num_alb varchar (100),
observacion varchar (100) not null,
numero_can varchar(100) not null,
constraint pk_observacion primary key (num_alb)
);

alter table observacion
ADD CONSTRAINT not_obsboom_can foreign key (numero_can)
references cancion (numero_can)
on delete restrict
on update cascade;

create table interpreta(
num_art VARCHAR(10) not null,
numero_can varchar(100)not null
);

alter table interpreta
ADD CONSTRAINT not_intboom_art foreign key (num_art)
references artista(num_art)
on delete restrict
on update cascade;

alter table interpreta
ADD CONSTRAINT not_intboom_can foreign key (numero_can)
references cancion (numero_can)
on delete restrict
on update cascade;