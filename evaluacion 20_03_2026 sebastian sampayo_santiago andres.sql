drop table if exists detalle;
drop table if exists pedido;
drop table if exists libro;
drop table if exists categoria_libro;
drop table if exists cliente;

create table cliente(
id_cliente varchar(20),
documento varchar (20) not null,
nombre varchar (10)not null,
apellido varchar (10) null,
correo varchar (10) null,
fecha_registro date not null,
tipo_cliente varchar(20)not null,
activo boolean not null,
CONSTRAINT pk_cliente PRIMARY KEY (id_cliente)
);

create table categoria_libro(
id_categoria varchar(10),
nombre varchar(10)not null,
descripcion varchar(10)null,
estado varchar (10)not null,
constraint pk_categoria_libro primary key (id_categoria)
);
create table libro(
id_libro varchar(10),
isbn varchar(10)not null,
titulo varchar(10)not null,
autor varchar(20)not null,
editorial varchar(10)null,
anio_publicacion DATE null,
preio_venta varchar(10)not null,
stock varchar(10) not null,
formato varchar(10)not null,
id_categoria varchar(10)not null,
constraint pk_libro primary key (id_libro)
);
ALTER TABLE IF EXISTS libro
    ADD CONSTRAINT fk_lib_cor FOREIGN KEY (id_categoria)
    REFERENCES categoria (id_categoria) 
    ON UPDATE CASCADE
    ON DELETE RESTRICT;

create table pedido(
id_pedido varchar(10),
fecha_pedido date not null,
tipo_pedido varchar(10)not null,
estado varchar(10)not null,
observacion varchar(100)null,
total varchar(20)not null,
id_cliente varchar(20)not null,
constraint pk_pedido primary key (id_pedido)
);
alter table if exists pedido
add constraint fk_ped_notb foreign key (id_cliente)
references cliente (id_cliente)
on update cascade
on delete restrict;

create table detalle(
id_detalle varchar(10),
id_pedido varchar(10) not null,
id_libro varchar(10) not null,
cantidad varchar(10) not null,
precio_unitario varchar(10)not null,
descuento varchar(10)not null,
subtotal varchar(10)not null,
constraint pk_detalle primary key (id_detalle)
);
alter table if exists detalle
add constraint fk_det_notb foreign key (id_pedido)
references pedido (id_pedido)
on update cascade
on delete restrict;
alter table if exists detalle
add constraint fk_det_lib_notb foreign key (id_libro)
references libro (id_libro)
on update cascade
on delete restrict;
--"trabajo de sebastian sampayo y santiago lagos"
