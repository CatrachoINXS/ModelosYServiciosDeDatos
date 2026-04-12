/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-04-11
Descripción: Creacion de disparadores CICLO1
*/

CREATE OR REPLACE TRIGGER DP_CLIENTES_BI_adicionar_cliente
BEFORE INSERT ON Clientes
FOR EACH ROW
DECLARE
    conteo NUMBER(10);
BEGIN
    SELECT COUNT(*) INTO conteo FROM Clientes;
    :NEW.id := LPAD(conteo + 1, 5, '0');
    :NEW.clienteFiel := 0;
END;
/

CREATE OR REPLACE TRIGGER DP_CLIENTES_BU_modificar_cliente
BEFORE UPDATE ON Clientes
FOR EACH ROW
BEGIN
    :NEW.id       := :OLD.id;
    :NEW.nombres  := :OLD.nombres;
    :NEW.apellidos := :OLD.apellidos;
    :NEW.idMesero := :OLD.idMesero;
    :NEW.reseña   := :OLD.reseña;
END;
/

CREATE OR REPLACE TRIGGER DP_FACTURAS_BI_crear_factura
BEFORE INSERT ON Facturas
FOR EACH ROW
DECLARE
    conteo NUMBER;
    prefijo VARCHAR(10);
BEGIN
    :NEW.fechaExpedicion := SYSDATE;
    
    prefijo := 'A' || TO_CHAR(SYSDATE, 'YYYY-MM') || '-';
    SELECT COUNT(*) + 1 INTO conteo FROM Facturas;
    :NEW.id := prefijo || LPAD(conteo, 6, '0');
END;
/

CREATE OR REPLACE TRIGGER DP_FACTURAS_BU_modificar_factura
BEFORE UPDATE ON Facturas
FOR EACH ROW
BEGIN
    :NEW.id := :OLD.id;
    :NEW.fechaExpedicion := :OLD.fechaExpedicion;
    :NEW.direccion := :OLD.direccion;
    :NEW.propina := :OLD.propina;
    :NEW.precio := :OLD.precio;
    :NEW.idCliente := :OLD.idCliente;
    :NEW.idPedido := :OLD.idPedido;

END;
/

/*Se debe descontar el stock de los productos de un pedido*/
CREATE OR REPLACE TRIGGER DP_PEDIDOS_AI_disminuir_stock
AFTER INSERT ON Pedidos 
FOR EACH ROW
BEGIN 
    UPDATE Productos
    SET stock = stock - 1
    WHERE id = :NEW.idProducto;
END;
/