/*
SalchiTask Pruebas :)
*/

--PoblarOK
INSERT INTO Empleados VALUES (1,'Juan Jose','Perez Torres',3001234567,'Calle 10A 5 20','juanito@gmail.com','Sura','SegurosBolivar',2000000,DATE '2023-01-10');
INSERT INTO Empleados VALUES (2,'Cristian Camilo','Ortiz Sanchez',3144790157,'Diagonal 4B BIS 29 23','camilin@gmail.com','Coosalud','SegurosBolivar',1750905,DATE '2022-06-15');
INSERT INTO Empleados VALUES (3,'Carlos LLeras','Restrepo',3015557788,'Calle 25 7 33','carlos32@gmail.com','Famisanar','SegurosBolivar',1750905,DATE '2024-02-20');
INSERT INTO Empleados VALUES (4,'Shakira','Mebarak',3131112233,'Carrera 20B 79 150','shakira425@gmail.com','Famisanar','Allianz',1750905,DATE '2020-01-15');
INSERT INTO Empleados VALUES (5,'Juan Esteban','Salazar',3002223344,'Calle 10 43 21','juanes5643@gmail.com','Famisanar','SegurosBolivar',1750905,DATE '2025-03-10');
INSERT INTO Empleados VALUES (6,'James','Rodriguez',3113334455,'Calle 100 11B 27','james65@gmail.com','NuevaEPS','SegurosBolivar',1750905,DATE '2021-07-20');
INSERT INTO Empleados VALUES (7,'Yaneth','Sanchez Castillo',3214445566,'Carrera 70 #45-12','yaneths027@gmail.com','Coosalud','Allianz',1750905,DATE '2026-02-18');
INSERT INTO Empleados VALUES (8,'Juan','Arias',3335556677,'Calle 12 #34-56','maluma345@gmail.com','Sura','SegurosBolivar',1750905,DATE '2021-11-05');

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
INSERT INTO Paga VALUES (3,'A2026-05-000003','Transferencia','Pendiente');

INSERT INTO SeComponenDe VALUES (1,1,4);
INSERT INTO SeComponenDe VALUES (2,2,1);
INSERT INTO SeComponenDe VALUES (2,9,1);
INSERT INTO SeComponenDe VALUES (2,8,1);
INSERT INTO SeComponenDe VALUES (3,3,1);

--PoblarNoOK

--Ingreso protegido por definición de id como PK
INSERT INTO Empleados VALUES (2,'Ramiro', 'Ortiz Florez',3006454567,'Calle 10A 45 20','ortizo@gmail.com','Sura','SegurosBolivar','2000000',DATE '2023-01-10');
INSERT INTO Empleados VALUES (2,'Pepe','Rondaldo',3144790157,'Diagonal 4B BIS 29 23','rolando@gmail.com','Coosalud','SegurosBolivar','1600000',DATE '2022-06-15');
INSERT INTO Salchipapas VALUES (1,'Normal','Mediano');

--Ingreso protegido por definición de tipo VARCHAR
INSERT INTO Productos VALUES (13,'Pepsi','Holap','Bebida gaseosa fría',10,1); --precio
INSERT INTO Clientes VALUES (7,'Gabriel','Marquez','31A7778899','Calle 80 5 40',1,'Nadap',8); --telefono

--Ingreso protegido por longitud de dato definida (teléfono)
INSERT INTO Clientes VALUES (4,'Jeronimo','Ayala',40231481234718293,'Calle 50C 10 12',1,NULL,5);

--Ingreso protegido por definicion de FK (PK no existente)
INSERT INTO Meseros VALUES (213,150000,45);

--Tuplas

INSERT INTO Facturas (id, fechaExpedicion, direccion, estadoFactura, propina, precio, idCliente, idPedido)
VALUES ('A2026-04-000001', DATE '2026-05-10', 'Calle 100 #15-20', 'Emitida', 1000, 10000, 1, 1);

INSERT INTO Facturas (id, fechaExpedicion, direccion, estadoFactura, propina, precio, idCliente, idPedido)
VALUES ('A2026-04-000002', DATE '2026-04-11', 'Carrera 7 #45-10', 'Emitida', 4000, 20000, 2, 2);

INSERT INTO Facturas (id, fechaExpedicion, direccion, estadoFactura, propina, precio, idCliente, idPedido)
VALUES ('A2026-04-000003', DATE '2026-04-11', 'Calle Chile #12-30', 'Emitida', NULL, 15000, 3, 3);

--TuplasNoOk

INSERT INTO Facturas (id, fechaExpedicion, direccion, estadoFactura, propina, precio, idCliente, idPedido)
VALUES ('A2026-04-000004', DATE '2026-04-11', 'Calle 100 #15-20', 'Emitida', 3000, 10000, 1, 1);

INSERT INTO Facturas (id, fechaExpedicion, direccion, estadoFactura, propina, precio, idCliente, idPedido)
VALUES ('A2026-04-000005', DATE '2026-04-11', 'Carrera 7 #45-10', 'Emitida', 5000, 20000, 2, 2);

INSERT INTO Facturas (id, fechaExpedicion, direccion, estadoFactura, propina, precio, idCliente, idPedido)
VALUES ('A2026-04-000006', DATE '2026-04-11', 'Calle Chile #12-30', 'Emitida', 5000, 15000, 3, 3);

--DisparadoresOK


/*
 * Pruebas del TRIGGER para adicionar un cliente.
 */
INSERT INTO Clientes (nombres, apellidos, telefono, direccion, idMesero)
VALUES ('Cristian', 'Ortiz', '3101232332', 'Calle 100', 5);

INSERT INTO Clientes (nombres, apellidos, telefono, direccion, idMesero)
VALUES ('Juan Jose', 'Perez', '3204562332', 'Carrera 7', 8);

SELECT * FROM Clientes;

/* 
 * Pruebas del TRIGGER para modificar un cliente.
 */

UPDATE Clientes SET clienteFiel = 1, telefono = '3213424262' 
WHERE nombres = 'Cristian';

UPDATE Clientes SET clienteFiel = 1, telefono = '3113213123' 
WHERE nombres = 'Juan Jose';

SELECT * FROM Clientes;

/* 
 * Pruebas del TRIGGER para adicionar un pago.
 */

/* 
 * Pruebas del TRIGGER para modificar un pago.
 */

/* 
 * Pruebas del TRIGGER para crear una factura.
 */

/* 
 * Pruebas del TRIGGER para modificar una factura.
 */

/* 
 * Pruebas del TRIGGER para disminuir el stock.
 */

/* 
 * Pruebas del TRIGGER para adicionar un pedido.
 */

/* 
 * Pruebas del TRIGGER para modificar un pedido.
 */

/* 
 * Pruebas del TRIGGER para adicionar un producto.
 */

/* 
 * Pruebas del TRIGGER para modificar un producto.
 */

/* 
 * Pruebas del TRIGGER para adicionar un empleado.
 */

/* 
 * Pruebas del TRIGGER para modificar un empleado.
 */
 
 -- IndicesVistasOK

SELECT * FROM Empleados 
WHERE nombres = 'Juan Jose' AND apellidos = 'Perez Torres';

SELECT * FROM Empleados 
WHERE correo = 'camilin@gmail.com';

SELECT * FROM Facturas 
WHERE fechaExpedicion = DATE '2026-05-10';

SELECT * FROM Pedidos 
WHERE idCliente = 3 AND estado = 'Entregado';

SELECT * FROM Productos 
WHERE nombre = 'La Demoníaca';

SELECT * FROM Clientes 
WHERE nombres = 'Gabriel Garcia' AND apellidos = 'Marquez';

SELECT * FROM Clientes
WHERE telefono = 3104445566;

SELECT * FROM Clientes 
WHERE direccion = 'Calle 50C 10 12';

/*PRUEBAS VISTAS*/

SELECT nombres, apellidos FROM datos_empleado;

SELECT nombres, apellidos FROM datos_cliente;

SELECT Nombre, SUM(Total) AS TotalCompras FROM datos_pedido
GROUP BY Nombre 
ORDER BY TotalCompras DESC;

SELECT Nombre, totalGanancias FROM productos_mas_vendidos
ORDER BY totalGanancias DESC;

-- Pruebas de aceptacion

/*La cajera registra a la familia uno por uno*/

EXECUTE PK_CAJERO.clienteAdicionar('Juan Esteban',  'Colina Tovar', 3001234825, 'Calle 123 #54-90', 5);
EXECUTE PK_CAJERO.clienteAdicionar('Angie Tatiana', 'Colina',       NULL,         'Calle 123 #54-90', 5);
EXECUTE PK_CAJERO.clienteAdicionar('Daniel Alberto','Colina',       NULL,         'Calle 123 #54-90', 5);


/*La cajera consulta que los datos se guardaron*/

VARIABLE rc1 REFCURSOR;
EXECUTE :rc1 := PK_CAJERO.clienteConsultar(6);
PRINT rc1;
VARIABLE rc2 REFCURSOR;
EXECUTE :rc2 := PK_CAJERO.clienteConsultar(7);
PRINT rc2;
VARIABLE rc3 REFCURSOR;
EXECUTE :rc3 := PK_CAJERO.clienteConsultar(8);
PRINT rc3;

--Juan Esteban corrige sus datos
EXECUTE PK_CAJERO.clienteModificar(6, 'Juan Esteban',  'Colina Tovar', 3215783345, 'Calle 123 #80-66');
EXECUTE PK_CAJERO.clienteModificar(7, 'Angie Tatiana', 'Colina',       NULL,         'Calle 123 #80-66');
EXECUTE PK_CAJERO.clienteModificar(8, 'Daniel Alberto','Colina',       NULL,         'Calle 123 #80-66');

/*La cajera consulta nuevamente los datos para verificar que haya guardado bien los datos*/
VARIABLE rc4 REFCURSOR;
EXECUTE :rc4 := PK_CAJERO.clienteConsultar(6);
PRINT rc4;

VARIABLE rc5 REFCURSOR;
EXECUTE :rc5 := PK_CAJERO.clienteConsultar(7);
PRINT rc5;

VARIABLE rc6 REFCURSOR;
EXECUTE :rc6 := PK_CAJERO.clienteConsultar(8);
PRINT rc6;

/*El mesero les muestra los precios de los productos*/
VARIABLE rc7 REFCURSOR;
EXECUTE :rc7 := PK_CAJERO.preciosProductos;
PRINT rc7;

/*El mesero los atiende y los tres deciden pedir la salchipapa Apocaliptica con una bebida natural. Procede a registrar el pedido*/
EXECUTE PK_CAJERO.pedidoAdicionar('Pendiente', 34000, 6);

/*Luego de que Daniel encargara mas queso en la salchipapa, el mesero tuvo que modificar el pedido*/
EXECUTE PK_CAJERO.pedidoModificar(4, 'En camino', 40000);

/*El mesero consulta que se haya modificado correctamente el pedido*/
VARIABLE rc8 REFCURSOR;
EXECUTE :rc8 := PK_CAJERO.pedidoConsultar(4);
PRINT rc8;

/*Luego de comer, la cajera generó la factura*/
EXECUTE PK_CAJERO.facturaAdicionar('Carrera 8 7 26', 'Pagada', NULL, 18000, 1, 1);

/*La cajera se dio cuenta de que habia generado la factura de otro cliente entonces la borró y genero una nueva factura para luego consultarla*/
EXECUTE PK_CAJERO.facturaEliminar('A2026-05-000007');
EXECUTE PK_CAJERO.facturaAdicionar('Calle 123 #80 - 66','Emitida', 2000, 40000, 6, 4);
VARIABLE rc9 REFCURSOR;
EXECUTE :rc9 := PK_CAJERO.facturaConsultar('A2026-05-000007');
PRINT rc9;

/*Juan Esteban procede a hacer el pago*/
EXECUTE PK_CAJERO.pagoAdicionar(6, 'A2026-05-000007', 'Tarjeta de crédito', 'Aceptado');

/*La cajera consulta el pago de Juan y revisa la generosa factura*/
VARIABLE rc10 REFCURSOR;
EXECUTE :rc10 := PK_CAJERO.pagoConsultar('A2026-05-000007');
PRINT rc10;

/*Al cerrar el turno, el gerente revisa los productos mas apetecidos*/
VARIABLE rc11 REFCURSOR;
EXECUTE :rc11 := PK_GERENTE.productosMasApetecidos;
PRINT rc11;

/*Luego, mas tarde, el administrador consultó el inventario, actualizó el stock de la salchipapa Apocaliptica (de 10 a 30) y miró la informacion del personal de turno*/
VARIABLE rc13 REFCURSOR;
EXECUTE :rc13 := PK_ADMINISTRADOR.productoConsultar(3);
PRINT rc13;

EXECUTE PK_ADMINISTRADOR.productoModificar(3,'Apocaliptica',22000,'Meteoritos de papa y salchicha sobre papas bañadas en queso',30,1);

EXECUTE :rc13 := PK_ADMINISTRADOR.productoConsultar(3);
PRINT rc13;

SELECT * FROM PRODUCTOS;

VARIABLE rc14 REFCURSOR;
EXECUTE :rc14 := PK_ADMINISTRADOR.empleadoConsultar(4);
PRINT rc14;

/*Prueba de aceptación 2*/

/*La cajera registra a Camilo y a Daniela*/
EXECUTE PK_CAJERO.clienteAdicionar('Camilo', 'Ríos', 3127709832, 'Carrera cinco 22 - 90', 8);
EXECUTE PK_CAJERO.clienteAdicionar('Daniela', 'Peña', 3215475109, 'Calle 189 #12A 19', 8);

/*La cajera valida que se hayan registrado y les muestra el menú*/
VARIABLE rc15 REFCURSOR;
EXECUTE :rc15 := PK_CAJERO.clienteConsultar(9);
PRINT rc15;
VARIABLE rc16 REFCURSOR;
EXECUTE :rc16 := PK_CAJERO.clienteConsultar(10);
PRINT rc16;

/*El mesero les mostro los precios */
VARIABLE rc17 REFCURSOR;
EXECUTE :rc17 := PK_CAJERO.preciosProductos;
PRINT rc17;

/*El mesero registra el pedido: una salchipapa La Demoníaca y una cocacola*/
EXECUTE PK_CAJERO.pedidoAdicionar('Pendiente', 26000, 9);

/*Verifica que la orden haya sido registrada correctamente*/
VARIABLE rc18 REFCURSOR;
EXECUTE :rc18 := PK_CAJERO.pedidoConsultar(5);
PRINT rc18;

/*La cajera cambia el numero de telefono de Camilo, porque lo habia registrado mal*/
EXECUTE PK_CAJERO.clienteModificar(9, 'Camilo', 'Ríos', 3135709832, 'Carrera 5 22 - 90');

/*Verifica que el cambio se haya guardado correctamente*/
VARIABLE rc19 REFCURSOR;
EXECUTE :rc19 := PK_CAJERO.clienteConsultar(9);
PRINT rc19;

/*La cajera procede a generar la factura*/
EXECUTE PK_CAJERO.facturaAdicionar('Carrera 5 22 - 90', 'Emitida', 3000, 26000, 9, 8);

/*Verifica que haya generado bien la factura*/
VARIABLE rc20 REFCURSOR;
EXECUTE :rc20 := PK_CAJERO.facturaConsultar('A2026-05-000008');
PRINT rc20;

/*Se registra el pago del pedido exitosamente*/
EXECUTE PK_CAJERO.pagoAdicionar(9, 'A2026-05-000008', 'Efectivo', 'Aceptado');

/*La cajera revisa que el pago se vea reflejado en el sistema*/
VARIABLE rc21 REFCURSOR;
EXECUTE :rc21 := PK_CAJERO.pagoConsultar('A2026-05-000008');
PRINT rc21;

/*La cajera registra a Rodrigo*/
EXECUTE PK_CAJERO.clienteAdicionar('Rodrigo', 'Bermúdez', 3218394563, 'Calle comercial Santafe', 8);

/*Revisa que se haya registrado exitosamente*/
VARIABLE rc22 REFCURSOR;
EXECUTE :rc22 := PK_CAJERO.clienteConsultar(11);
PRINT rc22;

/*El mesero registra el pedido de Rodrigo: La Nuclear Clásica y un jugo hit*/
EXECUTE PK_CAJERO.pedidoAdicionar('Pendiente', 17000, 11);

/*Antes de verificar si lo habia registrado correctamente, el mesero tuvo que corregirlo porque Rodrigo cambió de opinión con la bebida*/
EXECUTE PK_CAJERO.pedidoModificar(6, 'En camino', 20000);

/*El mesero verifica que el pedido haya quedado bien registrado*/
VARIABLE rc23 REFCURSOR;
EXECUTE :rc23 := PK_CAJERO.pedidoConsultar(6);
PRINT rc23;

/*La cajera genera la factura de Rodrigo*/
EXECUTE PK_CAJERO.facturaAdicionar('Carrera comercial Santafe', 'Emitida', NULL, 20000, 11, 6);

/*La cajera consulta la factura para verificarla*/
VARIABLE rc24 REFCURSOR;
EXECUTE :rc24 := PK_CAJERO.facturaConsultar('A2026-05-000009');
PRINT rc24;

/*Rodrigo paga a regañadientes*/
EXECUTE PK_CAJERO.pagoAdicionar(11, 'A2026-05-000009', 'Efectivo', 'Pendiente');
EXECUTE PK_CAJERO.pagoModificar(11, 'A2026-05-000009', 'Aceptado');

/*La cajera revisa que el pago quedó registrado*/
VARIABLE rc25 REFCURSOR;
EXECUTE :rc25 := PK_CAJERO.pagoConsultar('A2026-05-000009');
PRINT rc25;

/*Rodrigo se va y publica una reseña grosera insultando al personal por su nombre. El administrador le indica a la cajera que elimine a Rodrigo del sistema*/
EXECUTE PK_CAJERO.clienteEliminar(11);

/*El administrador consulta los datos del mesero para revisar su historial tras el incidente con Rodrigo*/
VARIABLE rc26 REFCURSOR;
EXECUTE :rc26 := PK_ADMINISTRADOR.empleadoConsultar(8);
PRINT rc26;

/*Aprovechando el cierre, el administrador agrega al menú la nueva Salchipapa Caribeña, idea que venía rondando desde hace días*/
EXECUTE PK_ADMINISTRADOR.productoAdicionar('Salchipapa Caribeña', 18000, 'Salchipapa con patacón y hogao', 50, 1);

/*Verifica que el nuevo producto haya quedado bien registrado*/
VARIABLE rc27 REFCURSOR;
EXECUTE :rc27 := PK_ADMINISTRADOR.productoConsultar(10);
PRINT rc27;