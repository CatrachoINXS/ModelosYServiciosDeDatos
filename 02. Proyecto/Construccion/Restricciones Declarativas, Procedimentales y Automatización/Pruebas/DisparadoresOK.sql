/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-04-11
Descripción: DisparadoresOK CICLO1
*/

/*
 * Pruebas del TRIGGER para adicionar un cliente.
 */
INSERT INTO Clientes (nombres, apellidos, telefono, direccion, idMesero)
VALUES ('Cristian', 'Ortiz', '3101232332', 'Calle 100', 1);

INSERT INTO Clientes (nombres, apellidos, telefono, direccion, idMesero)
VALUES ('Juan Jose', 'Perez', '3204562332', 'Carrera 7', 1);

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