/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-03-22
Descripción: Intento de ingreso de datos erroneos protegidos por los 
tipos de datos, definición de nulidades y claves primarias, únicas y foraneas. CICLO1
*/

--Ingreso protegido por definición de id como PK
INSERT INTO Empleados VALUES (1,'Ramiro', 'Ortiz Florez',3006454567,'Calle 10A 45 20','ortizo@gmail.com','Sura','SegurosBolivar','2000000',DATE '2023-01-10');
INSERT INTO Empleados VALUES (2,'Pepe','Rondaldo',3144790157,'Diagonal 4B BIS 29 23','rolando@gmail.com','Coosalud','SegurosBolivar','1600000',DATE '2022-06-15');
INSERT INTO Salchipapas VALUES (1,'Normal','Mediano');

--Ingreso protegido por definición de tipo VARCHAR
INSERT INTO Productos VALUES (13,'Pepsi','Holap','Bebida gaseosa fría',10,1); --precio
INSERT INTO Clientes VALUES (7,'Gabriel','Marquez','31A7778899','Calle 80 5 40',1,'Nadap',8); --telefono

--Ingreso protegido por longitud de dato definida (teléfono)
INSERT INTO Clientes VALUES (4,'Jeronimo','Ayala',40231481234718293,'Calle 50C 10 12',1,NULL,5);

--Ingreso protegido por definicion de placaVehiculo como NO NULA
INSERT INTO Domiciliarios VALUES (5,40,NULL,1);

--Ingreso protegido por definicion de FK (PK no existente)
INSERT INTO Meseros VALUES (213,150000,45);

