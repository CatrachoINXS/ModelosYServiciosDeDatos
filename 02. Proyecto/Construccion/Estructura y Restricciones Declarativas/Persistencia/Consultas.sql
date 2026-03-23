/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-03-22
Descripción: Consulta SQL CICLO1
*/

--consultar los datos de los clientes
SELECT id, nombres, telefono, direccion, clienteFiel
FROM Clientes;

-- consultar los precios de los productos
SELECT id, nombre, precio
FROM Productos;

--consultar el detalle de las facturas
SELECT id, fechaExpedicion, descuento
FROM Facturas
JOIN Descuentos
ON id = idFactura;