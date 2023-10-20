drop database Agencia_de_viajes;
create database Agencia_de_viajes;
use Agencia_de_viajes;

CREATE TABLE AgenciaViajes (
    CodigoAgencia INT PRIMARY KEY,
    FechaInicioActividades DATE,
    Ciudad VARCHAR(255)
);

CREATE TABLE PaqueteTuristico (
    CodigoPaquete INT PRIMARY KEY,
    CodigoAgencia INT,
    Precio DECIMAL(10, 2),
    FOREIGN KEY (CodigoAgencia) REFERENCES AgenciaViajes(CodigoAgencia)
);

CREATE TABLE Destino (
    CodigoDestino INT PRIMARY KEY,
    NombrePais VARCHAR(255)
);

CREATE TABLE ComboPaquete (
    CodigoCombo INT PRIMARY KEY,
    CodigoPaquetePrincipal INT,
    CodigoPaqueteRelacionado INT,
    FOREIGN KEY (CodigoPaquetePrincipal) REFERENCES PaqueteTuristico(CodigoPaquete),
    FOREIGN KEY (CodigoPaqueteRelacionado) REFERENCES PaqueteTuristico(CodigoPaquete)
);

CREATE TABLE Cliente (
    DNI INT PRIMARY KEY,
    Nombre VARCHAR(255),
    Domicilio VARCHAR(255)
);

CREATE TABLE Pago (
    IDPago INT PRIMARY KEY,
    DNI INT,
    TipoPago VARCHAR(50),
    Monto DECIMAL(10, 2),
    FOREIGN KEY (DNI) REFERENCES Cliente(DNI)
);

CREATE TABLE MedioPago (
    NombreUnico VARCHAR(50) PRIMARY KEY,
    Sucursal VARCHAR(255),
    FechaValidez DATE
);



INSERT INTO AgenciaViajes (CodigoAgencia, FechaInicioActividades, Ciudad)
VALUES
    (1, '2020-01-15', 'Buenos Aires'),
    (2, '2018-03-10', 'CABA'),
    (3, '2019-06-25', 'Cordoba');

INSERT INTO PaqueteTuristico (CodigoPaquete, CodigoAgencia, Precio)
VALUES
    (101, 1, 450000),
    (102, 2, 380000),
    (103, 3, 420000);

INSERT INTO Destino (CodigoDestino, NombrePais)
VALUES
    (1, 'Argentina'),
    (2, 'Brasil'),
    (3, 'Chile');

INSERT INTO ComboPaquete (CodigoCombo, CodigoPaquetePrincipal, CodigoPaqueteRelacionado)
VALUES
    (1, 101, 102),
    (2, 102, 103);

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

INSERT INTO MedioPago (NombreUnico, Sucursal, FechaValidez)
VALUES
    ('Banco A', 'Sucursal 1', '2023-12-31'),
    ('Banco B', 'Sucursal 2', '2024-06-30'),
    ('Banco C', 'Sucursal 3', '2024-09-30');