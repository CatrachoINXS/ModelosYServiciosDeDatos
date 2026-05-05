/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-05-05
Descripción: IndicesVistasOk CICLO1
*/

/*PRUEBAS INDICES*/
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
