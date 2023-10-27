drop database Ferreteria;
create database Ferreteria;
use Ferreteria;

create table Piezas(
    Codigo int (5) not null primary key,
    Nombre varchar (100) not null
);

create table Proveedores (
    ID char (4) not null primary key,
    Nombre varchar (100)
);

create table Suministra(
    Codigo_Pieza int (5),
    ID_Provedor char (4),
    Precio int (20),
    primary key(Codigo_Pieza, ID_Provedor),
    Foreign key(ID_Provedor) REFERENCES Proveedores (ID),
    Foreign key(Codigo_Pieza) REFERENCES Piezas (Codigo)
);

INSERT INTO Piezas (Codigo, Nombre) 
VALUES
  (1, 'Pieza 1'),
  (2, 'Pieza 2'),
  (3, 'Pieza 3'),
  (4, 'Pieza 4'),
  (5, 'Pieza 5'),
  (6, 'Pieza 6'),
  (7, 'Pieza 7'),
  (8, 'Pieza 8'),
  (9, 'Pieza 9'),
  (10, 'Pieza 10s');

INSERT INTO Proveedores (ID, Nombre) 
VALUES
  ('P1', 'Proveedor 1'),
  ('P2', 'Proveedor 2'),
  ('P3', 'Proveedor 3'),
  ('P4', 'Proveedor 4'),
  ('P5', 'Proveedor 5'),
  ('P6', 'Proveedor 6'),
  ('P7', 'Proveedor 7'),
  ('P8', 'Proveedor 8'),
  ('P9', 'Proveedor 9'),
  ('P10', 'Proveedor 10');

INSERT INTO Suministra (Codigo_Pieza, ID_Provedor, Precio) 
VALUES
  (1, 'P1', 50),
  (2, 'P1', 60),
  (3, 'P2', 45),
  (4, 'P2', 55),
  (5, 'P3', 70),
  (6, 'P3', 75),
  (7, 'P4', 40),
  (8, 'P4', 48),
  (9, 'P5', 52),
  (10, 'P5', 58);

--------(A)--------
Select P.Nombre
from Piezas P;

--------(B)--------
Select *
From Proveedores;

--------(C)--------
Select avg(S.Precio)
From Suministra S;

--------(D)--------
Select P.Nombre
From Piezas P
where P.Nombre like '%s';

--------(E)--------

/*Sin Subconsulta*/
SELECT S.ID_Provedor
FROM Suministra S
INNER JOIN Piezas P ON S.Codigo_Pieza = P.Codigo
where P.Nombre = ('Pieza 1');

/*Con Subconsulta*/
SELECT S.ID_Provedor
FROM Suministra S
INNER JOIN Piezas P ON S.Codigo_Pieza = P.Codigo
and P.Nombre in ('Pieza 1');

--------(F)--------


--------(G)--------
Select
From Suministra S
inner JOIN Pieza ON S.ID_Provedor = Pieza.Nombre 
inner JOIN 

--------(H)--------


--------(I)--------


--------(J)--------


--------(K)--------

