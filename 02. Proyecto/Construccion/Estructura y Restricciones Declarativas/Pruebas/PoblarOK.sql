/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-03-22
Descripción: Ingreso de datos correctos. (Sin automatización) CICLO1
*/

INSERT INTO Empleados VALUES (1,'Juan Jose','Perez Torres',3001234567,'Calle 10A 5 20','juanito@gmail.com','Sura','SegurosBolivar','2000000',DATE '2023-01-10');
INSERT INTO Empleados VALUES (2,'Cristian Camilo','Ortiz Sanchez',3144790157,'Diagonal 4B BIS 29 23','camilin@gmail.com','Coosalud','SegurosBolivar','1600000',DATE '2022-06-15');
INSERT INTO Empleados VALUES (3,'Carlos LLeras','Restrepo',3015557788,'Calle 25 7 33','carlos32@gmail.com','Famisanar','SegurosBolivar','1400000',DATE '2024-02-20');
INSERT INTO Empleados VALUES (4,'Shakira','Mebarak',3131112233,'Carrera 20B 79 150','shakira425@gmail.com','Famisanar','Allianz','1300000',DATE '2020-01-15');
INSERT INTO Empleados VALUES (5,'Juan Esteban','Salazar',3002223344,'Calle 10 43 21','juanes5643@gmail.com','Famisanar','SegurosBolivar','1200000',DATE '2025-03-10');
INSERT INTO Empleados VALUES (6,'James','Rodriguez',3113334455,'Calle 100 11B 27','james65@gmail.com','NuevaEPS','SegurosBolivar','1200000',DATE '2021-07-20');
INSERT INTO Empleados VALUES (7,'Yaneth','Sanchez Castillo',3214445566,'Carrera 70 #45-12','yaneths027@gmail.com','Coosalud','Allianz','1200000',DATE '2026-02-18');
INSERT INTO Empleados VALUES (8,'Juan','Arias',3335556677,'Calle 12 #34-56','maluma345@gmail.com','Sura','SegurosBolivar','1200000',DATE '2021-11-05');

INSERT INTO Cajeros VALUES (1,'Mañana',120);
INSERT INTO Cajeros VALUES (7,'Tarde',95);
INSERT INTO Cajeros VALUES (6,'Noche',80);

INSERT INTO Domiciliarios VALUES (4,40,'ABC12H',1);
INSERT INTO Domiciliarios VALUES (3,35,'SKX45D',1);
INSERT INTO Domiciliarios VALUES (2,50,'IZN10F',0);

INSERT INTO Meseros VALUES (5,200000,60);
INSERT INTO Meseros VALUES (8,150000,45);

INSERT INTO Clientes VALUES (1,'Pedro','Navaja',3101112233,'Calle 50C 10 12',1,NULL,5);
INSERT INTO Clientes VALUES (2,'Julio Mario','Domingo',3104445566,'Diagonal 15A 20 30',0,'Muy buen servicio, especialmente del mesero, muy amable el muchacho.',8);
INSERT INTO Clientes VALUES (3,'Gabriel Garcia','Marquez',3117778899,'Calle 80 5 40',1,'Las mejores salchipapas y a un buen precio y... y ya',8);

INSERT INTO Menu VALUES (1,1);
INSERT INTO Menu VALUES (2,1);

INSERT INTO Productos VALUES (1,'La Nuclear Clásica',13000,'Porción grande de papas fritas con salchicha, queso cheddar y salsa de la casa',12,1);
INSERT INTO Productos VALUES (2,'ECI',15000,'Porción de papas para aquellos capaces de pasar MYSD',15,1);
INSERT INTO Productos VALUES (3,'Apocaliptica',22000,'Meteoritos de papa y salchicha sobre papas bañadas en queso',10,1);
INSERT INTO Productos VALUES (4,'Halloween',18000,'Papas con queso fundido, salchicha doble y salsa verde experimental con temática de zombies',14,2);
INSERT INTO Productos VALUES (5,'La Demoníaca',23000,'Papas con tres quesos, salchicha brutal y salsa super picante',9,2);
INSERT INTO Productos VALUES (6,'Cola y Pola',3000,'Refajo de la marca Postobon',7,2);
INSERT INTO Productos VALUES (7,'Limonada',4000,'Bebida de limon natural fría y refrescante',25,2);
INSERT INTO Productos VALUES (8,'CocaCola',3000,'Bebida gaseosa fria de la marca CocaCola',30,1);
INSERT INTO Productos VALUES (9,'Juguito Hit',4000,'Simplemente un juguito hit de mora :)',22,1);

INSERT INTO Salchipapas VALUES (1,'Normal','XXL');
INSERT INTO Salchipapas VALUES (2,'Chismosa','Personal');
INSERT INTO Salchipapas VALUES (3,'Picante','Familiar');
INSERT INTO Salchipapas VALUES (4,'Picante','Mediano');
INSERT INTO Salchipapas VALUES (5,'Normal','Mediano');

INSERT INTO Bebidas VALUES (6,'Refajo');
INSERT INTO Bebidas VALUES (7,'Bebida natural');
INSERT INTO Bebidas VALUES (8,'Cola');
INSERT INTO Bebidas VALUES (9,'Jugo');

INSERT INTO Ingredientes VALUES (1,'Papa');
INSERT INTO Ingredientes VALUES (1,'Salchicha');
INSERT INTO Ingredientes VALUES (1,'Queso Cheddar');
INSERT INTO Ingredientes VALUES (1,'Salsa de la casa');
INSERT INTO Ingredientes VALUES (2,'Papa');
INSERT INTO Ingredientes VALUES (2,'Salchicha');
INSERT INTO Ingredientes VALUES (3,'Papa');
INSERT INTO Ingredientes VALUES (3,'Salchicha');
INSERT INTO Ingredientes VALUES (3,'Queso');
INSERT INTO Ingredientes VALUES (3,'Salsa verde experimental');
INSERT INTO Ingredientes VALUES (4,'Papa');
INSERT INTO Ingredientes VALUES (4,'Salchicha');
INSERT INTO Ingredientes VALUES (4,'Queso');
INSERT INTO Ingredientes VALUES (5,'Papa');
INSERT INTO Ingredientes VALUES (5,'Salchicha');
INSERT INTO Ingredientes VALUES (5,'Queso Cheddar');
INSERT INTO Ingredientes VALUES (5,'Queso Farmesano');
INSERT INTO Ingredientes VALUES (5,'Queso Azul');
INSERT INTO Ingredientes VALUES (5,'Salsa picante');

INSERT INTO Pedidos VALUES (1,'Entregado',18000,1);
INSERT INTO Pedidos VALUES (2,'Entregado',19000,2);
INSERT INTO Pedidos VALUES (3,'Entregado',22000,3);

INSERT INTO Facturas VALUES ('A2026-05-000001',DATE '2026-05-10','Carrera 8 7 26','Pagada',NULL,18000,1,1);
INSERT INTO Facturas VALUES ('A2026-05-000002',DATE '2026-05-11','Carrera 8 7 26','Pagada',1500,22500,2,2);
INSERT INTO Facturas VALUES ('A2026-05-000003',DATE '2026-05-12','Carrera 8 7 26','Emitida',NULL,22000,3,3);

INSERT INTO Descuentos VALUES ('A2026-05-000002',1000);

INSERT INTO Paga VALUES (1,'A2026-05-000001','Efectivo','Aceptado');
INSERT INTO Paga VALUES (2,'A2026-05-000002','Tarjeta de crédito','Aceptado');
INSERT INTO Paga VALUES (3,'A2026-05-000003','Transferencia Bancolombia','Pendiente');

INSERT INTO SeComponenDe VALUES (1,1,4);
INSERT INTO SeComponenDe VALUES (2,2,1);
INSERT INTO SeComponenDe VALUES (2,9,1);
INSERT INTO SeComponenDe VALUES (2,8,1);
INSERT INTO SeComponenDe VALUES (3,3,1);