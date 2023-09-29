create database Centro_Cultural;
use Centro_Cultural;

create table Epoca(
Nombre varchar (20) not null primary key,
Caracteristicas varchar (100) null,
A_inicio int (4) not null,
A_final int (4) not null
);

create table Genero(
Nombre varchar (20) not null primary key,
Caracteristicas varchar (100) null,
Origen varchar (200) NULL,
Instrumento varchar (100) not nullm
Epoca varchar (20) not null,
foreign key (Epoca) REFERENCES Epoca (Nombre)
);

create table Musico(
Nombre varchar (20) not null primary key,
F_nacmiento date not null,
F_muerte date null,
Historia varchar (200) null,
Genero varchar (20) not null,
foreign key (Genero) REFERENCES Genero(Nombre)
);

create table Instrumento(
Nombre varchar (20) not null primary key,
Foto varchar (1) null,
U_creacion varchar (40) not null,
Creador varchar (20) not null,
Tipo varchar (20) not null,
Material varchar (20) null
);

create table Obras_Famosas(
Nombre varchar (20) not null primary key,
F_creacion int (4) not null,
Partitura varchar (200) null,
Genero varchar (20) not null,
foreign key (Genero) REFERENCES Genero(Nombre)
);

