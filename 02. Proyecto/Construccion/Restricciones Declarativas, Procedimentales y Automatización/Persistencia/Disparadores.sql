/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-04-11
Descripción: Creacion de disparadores CICLO1
*/
/* 
 * TRIGGER para adicionar un cliente.
 * El número se asigna automáticamente. Cliente fiel se inicia como 
 * 0 de manera predeterminada
 */
CREATE OR REPLACE TRIGGER DP_CLIENTES_BI_adicionar_cliente
BEFORE INSERT ON Clientes
FOR EACH ROW
DECLARE
    xConteo NUMBER(10);
BEGIN
    SELECT COUNT(*) INTO xConteo FROM Clientes;
    :NEW.id := LPAD(xConteo + 1, 5, 0);
    :NEW.clienteFiel := 0;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20010, 'Error al insertar cliente: ' || SQLERRM);
END;
/

/* 
 * TRIGGER para modificar un cliente.
 * Los únicos datos que se pueden modificar son la dirección, 
 * el campo de cliente fiel y el telefono.
 */
CREATE OR REPLACE TRIGGER DP_CLIENTES_BU_modificar_cliente
BEFORE UPDATE ON Clientes
FOR EACH ROW
BEGIN
    :NEW.id        := :OLD.id;
    :NEW.nombres   := :OLD.nombres;
    :NEW.apellidos := :OLD.apellidos;
    :NEW.idMesero  := :OLD.idMesero;
    :NEW.reseña    := :OLD.reseña;
END;
/

/* 
 * TRIGGER para adicionar un pago.
 * El estado de pago se inicia en 'Pendiente' por defecto :)
 */
CREATE OR REPLACE TRIGGER DP_PAGA_BI_adicionar_pago
BEFORE INSERT ON Paga
FOR EACH ROW
BEGIN
    :NEW.estadoPago := 'Pendiente';
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20010, 'Error al adicionar pago: ' || SQLERRM);
END;
/

/* 
 * TRIGGER para modificar un pago.
 * Los únicos datos que se pueden modificar son el estado de pago 
 * y el método de pago.
 */
CREATE OR REPLACE TRIGGER DP_PAGA_BU_modificar_pago
BEFORE UPDATE ON Paga
FOR EACH ROW
BEGIN
    :NEW.idCliente := :OLD.idCliente;
    :NEW.idFactura := :OLD.idFactura;
END;
/

/* 
 * TRIGGER para crear una factura.
 * Genera de manera automática el id de la factura con 
 * el formato AYYYY-MM-######.
 */
CREATE OR REPLACE TRIGGER DP_FACTURAS_BI_crear_factura
BEFORE INSERT ON Facturas
FOR EACH ROW
DECLARE
    xConteo NUMBER;
    xPrefijo VARCHAR(10);
BEGIN
    :NEW.fechaExpedicion := SYSDATE;
    xPrefijo := 'A' || TO_CHAR(SYSDATE, 'YYYY-MM') || '-';

    SELECT COUNT(*) + 1 INTO xConteo FROM Facturas;
    :NEW.id := xPrefijo || LPAD(xConteo, 6, '0');
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20020, 'Error al crear factura: ' || SQLERRM);
END;
/

/* 
 * TRIGGER para modificar una factura.
 * El único dato que se puede modificar es el estado.
 */
CREATE OR REPLACE TRIGGER DP_FACTURAS_BU_modificar_factura
BEFORE UPDATE ON Facturas
FOR EACH ROW
BEGIN
    :NEW.id              := :OLD.id;
    :NEW.fechaExpedicion := :OLD.fechaExpedicion;
    :NEW.direccion       := :OLD.direccion;
    :NEW.propina         := :OLD.propina;
    :NEW.precio          := :OLD.precio;
    :NEW.idCliente       := :OLD.idCliente;
    :NEW.idPedido        := :OLD.idPedido;
END;
/

/* 
 * TRIGGER para disminuir el stock.
 * Verifica que haya stock suficiente y disminuye el stock
 * del producto de acuerdo a la cantidad pedida.
 */
CREATE OR REPLACE TRIGGER DP_SE_COMPONEN_DE_BI_disminuir_stock
BEFORE INSERT ON SeComponenDe
FOR EACH ROW
DECLARE
    xStock NUMBER;
BEGIN
    SELECT stock INTO xStock FROM Productos
    WHERE id = :NEW.idProducto;

    IF xStock < :NEW.cantidad THEN
        RAISE_APPLICATION_ERROR(-20001, 'Stock insuficiente');
    END IF;

    UPDATE Productos
    SET stock = stock - :NEW.cantidad
    WHERE id = :NEW.idProducto;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20003, 'Error al actualizar stock: ' || SQLERRM);
END;
/

/* 
 * TRIGGER para adicionar un pedido.
 * El id se asigna de manera automática.
 * El estado de entrega se inicia en 'Pendiente' por defecto :)
 */
CREATE OR REPLACE TRIGGER DP_PEDIDOS_BI_adicionar_pedido
BEFORE INSERT ON Pedidos
FOR EACH ROW
DECLARE
    xConteo NUMBER(10);
BEGIN
    SELECT COUNT(*) INTO xConteo FROM Pedidos;
    :NEW.id := LPAD(xConteo + 1, 5, 0);
    :NEW.estadoEntrega := 'Pendiente';
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20010, 'Error al adicionar pedido: ' || SQLERRM);
END;
/

/* 
 * TRIGGER para modificar un pedido.
 * El único dato que se puede modificar es el estado.
 */
CREATE OR REPLACE TRIGGER DP_PEDIDOS_BU_modificar_pedido
BEFORE UPDATE ON Pedidos
FOR EACH ROW
BEGIN
    :NEW.id         := :OLD.id;
    :NEW.precio     := :OLD.precio;
    :NEW.idCliente  := :OLD.idCliente;
END;
/

/* 
 * TRIGGER para adicionar un producto.
 * El id se asigna de manera automática.
 */
CREATE OR REPLACE TRIGGER DP_PRODUCTO_BI_adicionar_producto
BEFORE INSERT ON Productos
FOR EACH ROW
DECLARE
    xConteo NUMBER(10);
BEGIN
    SELECT COUNT(*) INTO xConteo FROM Productos;
    :NEW.id := LPAD(xConteo + 1, 5, 0);
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20010, 'Error al adicionar Producto: ' || SQLERRM);
END;
/

/* 
 * TRIGGER para modificar un producto.
 * Los únicos datos que se pueden modificar son el precio, la descripción y el stock.
 */
CREATE OR REPLACE TRIGGER DP_PRODUCTO_BU_modificar_producto
BEFORE UPDATE ON Productos
FOR EACH ROW
BEGIN
    :NEW.id         := :OLD.id;
    :NEW.nombre     := :OLD.nombre;
    :NEW.idMenu     := :OLD.idMenu;
END;
/

/* 
 * TRIGGER para adicionar un empleado.
 * El id se asigna de manera automática así como la fecha de ingreso.
 */
CREATE OR REPLACE TRIGGER DP_EMPLEADOS_BI_adicionar_empleado
BEFORE INSERT ON Empleados
FOR EACH ROW
DECLARE
    xConteo NUMBER(10);
BEGIN
    SELECT COUNT(*) INTO xConteo FROM Empleados;
    :NEW.id := LPAD(xConteo + 1, 5, 0);
    :NEW.fechaIngreso := SYSDATE;
EXCEPTION
    WHEN OTHERS THEN
        RAISE_APPLICATION_ERROR(-20010, 'Error al adicionar Empleado: ' || SQLERRM);
END;
/

/* 
 * TRIGGER para modificar un empleado.
 * Los únicos datos que se pueden modificar son la dirección, el campo de cliente fiel, 
 * el salario, el telefono y el correo.
 */
CREATE OR REPLACE TRIGGER DP_EMPLEADOS_BU_modificar_empleado
BEFORE UPDATE ON Empleados
FOR EACH ROW
BEGIN
    :NEW.id          := :OLD.id;
    :NEW.nombres     := :OLD.nombres;
    :NEW.apellidos   := :OLD.apellidos;
    :NEW.EPS         := :OLD.EPS;
    :NEW.aseguradora := :OLD.aseguradora;
END;
/