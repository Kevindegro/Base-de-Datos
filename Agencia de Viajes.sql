drop database Agencia_de_viajes;
create database Agencia_de_viajes;
use Agencia_de_viajes;

CREATE TABLE AgenciaViajes (
    CodigoAgencia INT PRIMARY KEY,
    FechaInicioActividades DATE,
    Ciudad VARCHAR(255)
);

CREATE TABLE PaqueteTuristico (
    CodigoPaquete INT (5) PRIMARY KEY,
    CodigoAgencia INT,
    NombrePais VARCHAR(255),
    Precio DECIMAL(10, 2),
    FOREIGN KEY (CodigoAgencia) REFERENCES AgenciaViajes(CodigoAgencia)
);

CREATE TABLE Banco (
    Nombre VARCHAR(50) PRIMARY KEY,
    Sucursal VARCHAR(255),
    FechaValidez DATE
);

CREATE TABLE Pago (
    IDPago INT (5) PRIMARY KEY,
    TipoPago VARCHAR(50),
    Monto INT(10),
    Banco VARCHAR (50),
    FOREIGN KEY (Banco) REFERENCES Banco(Nombre)
);


CREATE TABLE Cliente (
    DNI INT PRIMARY KEY not null,
    Nombre VARCHAR(255),
    Domicilio VARCHAR(255),
    CodigoPaquete INT (5),
    IDPago INT (5),
    FOREIGN KEY (CodigoPaquete) REFERENCES PaqueteTuristico(CodigoPaquete),
    FOREIGN KEY (IDPago) REFERENCES Pago(IDPago)
);





INSERT INTO AgenciaViajes (CodigoAgencia, FechaInicioActividades, Ciudad)
VALUES
    (1, '2020-01-15', 'Buenos Aires'),
    (2, '2018-03-10', 'CABA'),
    (3, '2019-06-25', 'Cordoba');

INSERT INTO PaqueteTuristico (CodigoPaquete, CodigoAgencia, Precio, NombrePais)
VALUES
    (101, 1, 450000, 'Argentina'),
    (102, 2, 380000, 'Brasil'),
    (103, 3, 420000, 'Chile');


INSERT INTO Cliente (DNI, Nombre, Domicilio)
VALUES
    (1001, 'Juan Perez', 'Av. Rivadavia 123'),
    (1002, 'Ana Lopez', 'Calle 4 567'),
    (1003, 'Pedro Gonzalez', 'Av. San Martin 789');

INSERT INTO Pago (IDPago, DNI, TipoPago, Monto)
VALUES
    (201, 1001, 'Tarjeta', 450000),
    (202, 1002, 'Efectivo', 380000),
    (203, 1003, 'Tarjeta', 420000);

INSERT INTO MedioPago (Nombre, Sucursal, FechaValidez)
VALUES
    ('A.Banco', 'Sucursal 1', '2023-12-31'),
    ('B.Banco', 'Sucursal 2', '2024-06-30'),
    ('C.Banco', 'Sucursal 3', '2024-09-30');    

--1
Select PT.CodigoPaquete, PT.Precio, PT.NombrePais, AV.Ciudad 
From PaqueteTuristico PT
join AgenciaViajes AV on PT.CodigoAgencia = AV.CodigoAgencia;

--2
Select C.DNI, C.Nombre
From Cliente C
Where C.DNI in(Select Distinct P.DNI from Pago P);

--3
Select
From Cliente C

--4


--5


--6


--7


--8


--9


--10
