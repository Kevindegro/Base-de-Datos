drop database if exist ventas;
create database ventas;
use ventas;
create table clientes(
    id_cliente int(3) not null auto_increment primary key,
    Nombre varchar(50) not null,
    Apellido varchar(60)not null,
    F_Nac date,
    telef int(10)
);
create table productos(
    id_Prod int (4)not null auto_increment primary key,
    Nombre varchar (50)not null,
    Descrip varchar (100)not null,
    Precio int (13),
    Fecha date
);
create table pedidos(
    id_Pedido int (4) not null auto_increment primary key,
    Fecha date,
    Cantidad int (3)not null,
    cliente int (3)not null,
    id_Producto int (4),
    foreign key (cliente) REFERENCES clientes(id_cliente),
    foreign key (id_Producto) REFERENCES productos(id_Prod)
);


ALTER TABLE clientes
CHANGE telef celu int (11);

ALTER TABLE clientes
ADD COLUMN DNI varchar(10) not null;

ALTER TABLE clientes
DROP COLUMN F_Nac;


INSERT INTO clientes(nombre,apellido,celu,DNI)
VALUES('Juan','Perez','11445566','41753011'),
('Aron','kaka','11405531','48749511'),
('Abdul-Rahman','deino','09275566','48306211'),
('Juan','Martines','11409826','48756211'),
('Mauro','coqui','11441092','48795211'),
('Juan','Molina','98735566','48752211'),
('Martin','Pares','11938466','48756121'),
('Maria','casagistan','11447569','49056211'),
('Juan','pipu','57365566','48789621'),
('Juan','Messi','11086466','48757511');


Select * from clientes
WHERE apellido like 'M%';

Delete from clientes
WHERE apellido like 'M%';

Select * from clientes
WHERE Nombre like '%n' and celu like '%5531';

Delete from clientes
WHERE Nombre like '%n' and celu like '%5531';


alter Table clientes
ADD COLUMN Domicilio varchar (10);

Update clientes set 
Domicilio="Lope de Vega 1234"
WHERE id_cliente = 1;

ALTER Table clientes
ADD COLUMN F_Nacimiento date;



INSERT INTO productos(nombre,Descrip,Precio)
VALUES('Heladera','Helader de marca Liliana con un motor de 3 caballos de fuerza capaz de congelar el pollo en 5 minutos','30000'),
('Heladera','Helader de marca Liliana con un motor de 1 caballos de fuerza capaz de congelar el pollo en 10 minutos','10000'),
('Heladera','Helader de marca Liliana con un motor de 3 caballos de fuerza capaz de congelar el pollo en 5 minutos','30000'),
('Heladera','Helader de marca Liliana con un motor de 2 caballos de fuerza capaz de congelar el pollo en 8 minutos','20000'),
('Heladera','Helader de marca Liliana con un motor de 20 caballos de fuerza capaz de congelar el pollo en 1 minutos','130000'),
('Microondas','Microondas color platino con una canidad de 30 voltios','30000'),
('Microondas','Microondas color platino con una canidad de 1.750 voltios','170000'),
('Microondas','Microondas color platino con una canidad de 50 voltios','50000'),
('Microondas','Microondas color platino con una canidad de 50 voltios','50000'),
('Microondas','Microondas color platino con una canidad de 10 voltios','20000'),
('Microondas','Microondas color platino con una canidad de 1.000 voltios','150000'),
('Secador de Pelo','Este secador es unico ya que tiene un sol incorporado dentro para secar a altas velocidades','60000'),
('Secador de Pelo','Este secador es unico ya que tiene un sol incorporado dentro para secar a altas velocidades','10000'),
('Secador de Pelo','Este secador es unico ya que tiene un sol incorporado dentro para secar a altas velocidades','70000'),
('Secador de Pelo','Este secador es unico ya que tiene un sol incorporado dentro para secar a altas velocidades','60000'),
('Secador de Pelo','Este secador es unico ya que tiene un sol incorporado dentro para secar a altas velocidades','100000'),
('Secador de Pelo','Este secador es unico ya que tiene un sol incorporado dentro para secar a altas velocidades','100'),
('Televisor','Con una pantalla de 30k de pulgadas funcional a base de enanos generando energia','70000'),
('Televisor','Con una pantalla de 30k de pulgadas funcional a base de enanos generando energia','70000'),
('Televisor','Con una pantalla de 30k de pulgadas funcional a base de enanos generando energia','70000'),
('Televisor','Con una pantalla de 30k de pulgadas funcional a base de enanos generando energia','70000'),
('Televisor','Con una pantalla de 30k de pulgadas funcional a base de enanos generando energia','70000');

Select * from productos
where precio between 30000 and 100000;
/*
Otra Opcion:
where precio >=30000 and precio <=100000
*/

Select * from clientes
order by id_cliente desc;   

Select * from clientes 
Where Year(F_Nacimiento)>=1974;

Select * from productos
where id_Prod in (3,5,7);

Select nombre min(F_Nacimiento) from clientes;

Select nombre ,F_Nacimiento from clientes Where F_Nacimiento =(Select min(F_Nacimiento) from clientes);

alter Table clientes
add COLUMN Localidad varchar (10);

Update clientes set
Localidad="CABA";

Select count(id_cliente)as 'clientes de CABA' from clientes
Where Localidad="CABA";

Select Nombre,Precio from productos WHERE Precio =(Select Max(Precio) from productos);

Select Nombre,Precio from productos WHERE Precio =(Select Min(Precio) from productos);

Select AVG(Precio) from productos;

Select SUM(Precio) from productos;

INSERT INTO pedidos(fecha,cantidad,cliente,id_Producto) 
VALUES('2023-08-01','1','1','1'),
('2023-08-02','3','3','5'),
('2023-08-03','6','7','22'),
('2023-08-04','1','5','16');

Select P.id_Pedido, P.cliente, C.nombre, P.id_Producto, PR.id_Prod,PR.precio,P.Fecha,P.Cantidad
from pedidos P, clientes C, productos PR
WHERE P.cliente = C.id_cliente and P.id_Producto = PR.id_Prod
order by nombre desc;

Select P.id_Pedido, P.cliente, C.nombre,P.Fecha,P.Cantidad
from pedidos P, clientes C
WHERE P.cliente = C.id_cliente; 

Select P.id_Producto, PR.id_Prod,PR.precio,P.Fecha,P.Cantidad
from pedidos P, productos PR
WHERE  P.id_Producto = PR.id_Prod;


/*
       Apuntes:

drop database if exist "nombre";
create database "nombre"
use "nombre de la tabla"
create table "nombre"
foreign key (Atributo) REFERENCES entidad ("Atributo de Entidad")
desc= ordena de forma decendente
    -Min=Minimo
    -Max=Maximo
    -Count=Contar
    -Sum=Suma
    -AVG=Promedio
mysql -u root 


DDL:-create-BD
           -Table
           -user
-alter
-drop-BD
     -tabla

DML:-Select     (consultar)
    -Delete     (Borrar Registros)
    -Update     (Modificar)

DCL:-Grant
    -Revoke
*/