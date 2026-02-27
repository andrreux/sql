--ELIMINACIONES DE TABLA - DEBIL A FUERTE
DROP TABLE if exists detalle_pedido;
DROP TABLE if exists pro_ped;
DROP TABLE if exists pedidos;
DROP TABLE if exists correo;
DROP TABLE if exists producto;
DROP TABLE if exists cliente;


-- creacion de tablas -- fuerte a debil

create table cliente( 
identificacion VARCHAR(10),
nombre VARCHAR (100) NOT NULL,
fecha_nacimento DATE NOT NULL,
edad INT2 null,
direccion VARCHAR (150) NOT NULL,
constraint pk_cliente primary key (identificacion)
);

create table pedidos(
numero serial4,
estado boolean not null,   
fecha_pedido date not null,
fecha_entrega date null,
identificacion VARCHAR(10) not null,
constraint pk_pedidos primary key (numero)
);

alter table pedidos
ADD CONSTRAINT fa_cli_ped foreign key (identificacion)
references cliente (identificacion)
on delete restrict
on update cascade;
