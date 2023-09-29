create database Centro_Cultural;
use Centro_Cultural;

create table Epoca(
Nombre
Caracteristicas
P_inicio
P_final
);

create table Genero(
Nombre
Caracteristicas
Origen
Instrumento
Epoca
);

create table Musico(
Nombre
F_nacmiento
F_muerte
Historia
Genero
);

create table Instrumento(
Nombre
Foto
U_creacion
Creador
Tipo
Material
);

create table Obras_Famosas(
Nombre
F_creacion
Partitura
Genero
);
