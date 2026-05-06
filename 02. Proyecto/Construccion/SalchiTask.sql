/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-5-5
Descripción: Creacion la base de datos.
*/

CREATE TABLE Empleados(
    id NUMBER(5) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono NUMBER(10),
    direccionResidencia VARCHAR(100) NOT NULL,
    correo VARCHAR(30),
    EPS VARCHAR(30) NOT NULL,
    aseguradora VARCHAR(30) NOT NULL,
    salario NUMBER(20) NOT NULL,
    fechaIngreso DATE NOT NULL);
    
CREATE TABLE Cajeros(
    idEmpleado NUMBER(5) NOT NULL,
    turnoCaja VARCHAR(10) NOT NULL,
    clientesAtendidos NUMBER(5) NOT NULL);
    
CREATE TABLE Domiciliarios(
    idEmpleado NUMBER(5) NOT NULL,
    pedidosEntregados NUMBER(5) NOT NULL,
    placaVehiculo VARCHAR(6),
    disponiblidad NUMBER(1) NOT NULL);
    
CREATE TABLE Meseros(
    idEmpleado NUMBER(5) NOT NULL,
    propinas NUMBER(20) NOT NULL,
    mesasAtendidas NUMBER(5) NOT NULL);
    
CREATE TABLE Clientes(
    id NUMBER(5) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono NUMBER(10),
    direccion VARCHAR(100) NOT NULL,
    clienteFiel NUMBER(1) NOT NULL,
    reseña VARCHAR(300),
    idMesero NUMBER(5) NOT NULL);
    
CREATE TABLE Productos(
    id NUMBER(5) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    precio NUMBER(20) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    stock NUMBER(5) NOT NULL,
    idMenu NUMBER(5) NOT NULL);
    
CREATE TABLE Salchipapas(
    idProducto NUMBER(5) NOT NULL,
    tipoSalchipapa VARCHAR(30) NOT NULL,
    tamaño VARCHAR(10) NOT NULL);
    
CREATE TABLE Bebidas(
    idProducto NUMBER(5) NOT NULL,
    tipoBebida VARCHAR(30) NOT NULL);
    
CREATE TABLE Ingredientes(
    idProducto NUMBER(5) NOT NULL,
    ingrediente  VARCHAR(30) NOT NULL);
    
CREATE TABLE Menu(
    id NUMBER(5) NOT NULL,
    activo NUMBER(1) NOT NULL);
    
CREATE TABLE Facturas(
    id VARCHAR(15) NOT NULL,
    fechaExpedicion DATE NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    estadoFactura VARCHAR(10) NOT NULL,
    propina NUMBER(20),
    precio NUMBER(20) NOT NULL,
    idCliente NUMBER(5) NOT NULL,
    idPedido NUMBER(5) NOT NULL);
    
CREATE TABLE Descuentos(
    idFactura VARCHAR(15) NOT NULL,
    descuento NUMBER(20) NOT NULL);
    
CREATE TABLE Paga(
    idCliente NUMBER(5) NOT NULL,
    idFactura VARCHAR(15) NOT NULL,
    metodoPago VARCHAR(50) NOT NULL,
    estadoPago VARCHAR(10) NOT NULL);
    
CREATE TABLE Pedidos(
    id NUMBER(5) NOT NULL,
    estado VARCHAR(10) NOT NULL,
    precio NUMBER(20) NOT NULL,
    idCliente NUMBER(5) NOT NULL);
    
CREATE TABLE SeComponenDe(
    idPedido NUMBER(5) NOT NULL,
    idProducto NUMBER(5) NOT NULL,
    cantidad NUMBER(5) NOT NULL);

-- primarias

ALTER TABLE Empleados
ADD CONSTRAINT PK_EMPLEADOS PRIMARY KEY (id);

ALTER TABLE Cajeros
ADD CONSTRAINT PK_CAJEROS PRIMARY KEY (idEmpleado);

ALTER TABLE Domiciliarios
ADD CONSTRAINT PK_DOMICILIARIOS PRIMARY KEY (idEmpleado);

ALTER TABLE Meseros
ADD CONSTRAINT PK_MESEROS PRIMARY KEY (idEmpleado);

ALTER TABLE Clientes
ADD CONSTRAINT PK_CLIENTES PRIMARY KEY (id);

ALTER TABLE Productos
ADD CONSTRAINT PK_PRODUCTOS PRIMARY KEY (id);

ALTER TABLE Salchipapas
ADD CONSTRAINT PK_SALCHIPAPAS PRIMARY KEY (idProducto);

ALTER TABLE Bebidas
ADD CONSTRAINT PK_BEBIDAS PRIMARY KEY (idProducto);

ALTER TABLE Ingredientes
ADD CONSTRAINT PK_INGREDIENTES PRIMARY KEY (idProducto, ingrediente);

ALTER TABLE Menu
ADD CONSTRAINT PK_MENU PRIMARY KEY (id);

ALTER TABLE Facturas
ADD CONSTRAINT PK_FACTURAS PRIMARY KEY (id);

ALTER TABLE Descuentos
ADD CONSTRAINT PK_DESCUENTOS PRIMARY KEY (idFactura, descuento);

ALTER TABLE Paga
ADD CONSTRAINT PK_PAGA PRIMARY KEY (idCliente, idFactura);

ALTER TABLE Pedidos
ADD CONSTRAINT PK_PEDIDOS PRIMARY KEY (id);

ALTER TABLE SeComponenDe
ADD CONSTRAINT PK_SECOMPONENDE PRIMARY KEY (idPedido, idProducto);

-- unicas

ALTER TABLE Empleados
ADD CONSTRAINT UK_EMPLEADOS_TELEFONO UNIQUE (telefono);

ALTER TABLE Empleados
ADD CONSTRAINT UK_EMPLEADOS_CORREO UNIQUE (correo);

ALTER TABLE Domiciliarios
ADD CONSTRAINT UK_DOMICILIARIOS_PLACA_VEHICULO UNIQUE (placaVehiculo);

ALTER TABLE Clientes
ADD CONSTRAINT UK_CLIENTES_TELEFONO UNIQUE (telefono);

-- foraneas

ALTER TABLE Cajeros ADD CONSTRAINT FK_CAJERO_EMPLEADO 
FOREIGN KEY (idEmpleado) REFERENCES Empleados (id) ON DELETE CASCADE;

ALTER TABLE Meseros ADD CONSTRAINT FK_MESERO_EMPLEADO 
FOREIGN KEY (idEmpleado) REFERENCES Empleados (id) ON DELETE CASCADE;

ALTER TABLE Domiciliarios ADD CONSTRAINT FK_DOMICILIARIO_EMPLEADO 
FOREIGN KEY (idEmpleado) REFERENCES Empleados (id) ON DELETE CASCADE;

ALTER TABLE Clientes ADD CONSTRAINT FK_CLIENTE_MESERO 
FOREIGN KEY (idMesero) REFERENCES Meseros (idEmpleado);

ALTER TABLE Facturas ADD CONSTRAINT FK_FACTURAS_CLIENTE 
FOREIGN KEY (idCliente) REFERENCES Clientes (id);

ALTER TABLE Facturas ADD CONSTRAINT FK_FACTURAS_PEDIDOS 
FOREIGN KEY (idPedido) REFERENCES Pedidos (id);

ALTER TABLE Descuentos ADD CONSTRAINT FK_DESCUENTOS_FACTURAS 
FOREIGN KEY (idFactura) REFERENCES Facturas (id) ON DELETE CASCADE;

ALTER TABLE Paga ADD CONSTRAINT FK_PAGA_CLIENTES 
FOREIGN KEY (idCliente) REFERENCES Clientes (id) ON DELETE CASCADE;

ALTER TABLE Paga ADD CONSTRAINT FK_PAGA_FACTURAS 
FOREIGN KEY (idFactura) REFERENCES Facturas (id) ON DELETE CASCADE;

ALTER TABLE Pedidos ADD CONSTRAINT FK_PEDIDOS_CLIENTES 
FOREIGN KEY (idCliente) REFERENCES Clientes (id);

ALTER TABLE SeComponenDe ADD CONSTRAINT FK_SE_COMPONE_DE_PEDIDOS 
FOREIGN KEY (idPedido) REFERENCES Pedidos (id) ON DELETE CASCADE;

ALTER TABLE SeComponenDe ADD CONSTRAINT FK_SE_COMPONE_DE_PRODUCTOS 
FOREIGN KEY (idProducto) REFERENCES Productos (id) ON DELETE CASCADE;

ALTER TABLE Productos ADD CONSTRAINT FK_PRODUCTOS_MENU 
FOREIGN KEY (idMenu) REFERENCES Menu (id);

ALTER TABLE Bebidas ADD CONSTRAINT FK_BEBIDAS_PRODUCTOS 
FOREIGN KEY (idProducto) REFERENCES Productos (id) ON DELETE CASCADE;

ALTER TABLE Salchipapas ADD CONSTRAINT FK_SALCHIPAPAS_PRODUCTOS 
FOREIGN KEY (idProducto) REFERENCES Productos (id) ON DELETE CASCADE;

ALTER TABLE Ingredientes ADD CONSTRAINT FK_INGREDIENTES_SALCHIPAPAS 
FOREIGN KEY (idProducto) REFERENCES Salchipapas (idProducto) ON DELETE CASCADE;

/* Parte de integridad
 * - Restricciones de atributo, de tupla y disparadores 
*/

ALTER TABLE Empleados ADD CONSTRAINT CK_ID_VALIDO_EMPLEADO
CHECK (id BETWEEN 1 AND 99999);

ALTER TABLE Clientes ADD CONSTRAINT CK_ID_VALIDO_CLIENTE
CHECK (id BETWEEN 1 AND 99999);

ALTER TABLE Pedidos ADD CONSTRAINT CK_ID_VALIDO_PEDIDO
CHECK (id BETWEEN 1 AND 99999);

ALTER TABLE Productos ADD CONSTRAINT CK_ID_VALIDO_PRODUCTO
CHECK (id BETWEEN 1 AND 99999);

ALTER TABLE Menu ADD CONSTRAINT CK_ID_VALIDO_MENU
CHECK (id BETWEEN 1 AND 99999);

-- TTelefono
ALTER TABLE Empleados ADD CONSTRAINT CK_TELEFONO_VALIDO_EMPLEADO
CHECK (telefono LIKE '3%________' AND LENGTH(telefono) = 10);

ALTER TABLE Clientes ADD CONSTRAINT CK_TELEFONO_VALIDO_CLIENTE
CHECK (telefono LIKE '3%________' AND LENGTH(telefono) = 10);

-- TDireccion
ALTER TABLE Empleados ADD CONSTRAINT CK_DIRECCION_VALIDA_EMPLEADO 
CHECK (direccionResidencia LIKE 'Calle %' OR direccionResidencia 
        LIKE 'Carrera %' OR direccionResidencia LIKE 'Diagonal %' 
        OR direccionResidencia LIKE 'Transversal %');

ALTER TABLE Facturas ADD CONSTRAINT CK_DIRECCION_VALIDA_FACTURA
CHECK (direccion LIKE 'Calle %' OR direccion LIKE 'Carrera %' 
        OR direccion LIKE 'Diagonal %' OR direccion LIKE 'Transversal %');

ALTER TABLE Clientes ADD CONSTRAINT CK_DIRECCION_VALIDA_CLIENTE
CHECK (direccion LIKE 'Calle %' OR direccion LIKE 'Carrera %' 
        OR direccion LIKE 'Diagonal %' OR direccion LIKE 'Transversal %');

-- TCorreo
ALTER TABLE Empleados ADD CONSTRAINT CK_CORREO_VALIDO_EMPLEADO
CHECK (correo LIKE '%_@_%._%');

-- TMonedaCOP
ALTER TABLE Empleados ADD CONSTRAINT CK_PLATA_COP 
CHECK (salario >= 0);

ALTER TABLE Meseros ADD CONSTRAINT CK_PLATA_COP_PROPINA
CHECK (propinas >= 0);

ALTER TABLE Descuentos ADD CONSTRAINT CK_PLATA_COP_DESCUENTO
CHECK (descuento >= 0);

ALTER TABLE Facturas ADD CONSTRAINT CK_PLATA_COP_PROPINAF
CHECK (propina >= 0);

ALTER TABLE Facturas ADD CONSTRAINT CK_PLATA_COP_PRECIO
CHECK (precio >= 0);

ALTER TABLE Pedidos ADD CONSTRAINT CK_PLATA_COP_PEDIDO
CHECK (precio >= 0);

ALTER TABLE Productos ADD CONSTRAINT CK_PLATA_COP_PRODUCTO
CHECK (precio >= 0);

-- TTurnoCaja
ALTER TABLE Cajeros ADD CONSTRAINT CK_TURNO_VALIDO 
CHECK (turnoCaja IN ('Mañana', 'Tarde', 'Noche'));

-- TMetodoPago
ALTER TABLE Paga ADD CONSTRAINT CK_METODO_PAGO_VALIDO 
CHECK (metodoPago IN ('Efectivo', 'Tarjeta de crédito', 'Tarjeta de débito', 'Transferencia'));

-- TEstadoPago
ALTER TABLE Paga ADD CONSTRAINT CK_ESTADO_VALIDO 
CHECK (estadoPago IN ('Pendiente', 'Aceptado', 'Rechazado'));

--TnumeroFactura
ALTER TABLE Facturas ADD CONSTRAINT CK_FACTURA_VALIDA
CHECK (
    LENGTH(id) = 15
    AND SUBSTR(id, 1, 1) = 'A'
    AND SUBSTR(id, 2, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 3, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 4, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 5, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 6, 1) = '-'
    AND SUBSTR(id, 7, 2) BETWEEN '01' AND '12'
    AND SUBSTR(id, 9, 1) = '-'
    AND SUBSTR(id, 10, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 11, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 12, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 13, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 14, 1) BETWEEN '0' AND '9'
    AND SUBSTR(id, 15, 1) BETWEEN '0' AND '9'
);

--TEstadoFactura
ALTER TABLE Facturas ADD CONSTRAINT CK_ESTADO_FACTURA
CHECK (estadoFactura IN ('Emitida', 'Anulada', 'Pagada'));

--TEstadoEntrega
ALTER TABLE Pedidos ADD CONSTRAINT CK_ESTADO_PEDIDO
CHECK (estado IN ('Pendiente', 'En camino', 'Entregado'));

--TTamaño
ALTER TABLE Salchipapas ADD CONSTRAINT CK_TAMAÑO_SALCHIPAPA
CHECK (tamaño IN ('Personal', 'Mediano', 'Familiar', 'XXL'));

/*El salario de un empleado debe ser igual o mayor al salario minimo*/
ALTER TABLE Empleados ADD CONSTRAINT CK_SALARIO_DECENTE
CHECK (salario >= 1750905);

/*El stock de un producto no puede ser negativo*/
ALTER TABLE Productos ADD CONSTRAINT CK_STOCK_POSITIVO
CHECK (NOT(stock < 0));

/*El stock de cualquier producto debe ser mayor a cero*/
ALTER TABLE SeComponenDe ADD CONSTRAINT CK_CANTIDAD_POSITIVA
CHECK (cantidad > 0);

-- Tuplas

/*La propina no puede ser mayor al 20 porciento del costo total*/
ALTER TABLE Facturas ADD CONSTRAINT CK_PROPINA_REAL
CHECK (NOT(propina > 0.20 * precio));

-- Disparadores

CREATE OR REPLACE TRIGGER DP_CLIENTES_BI_adicionar_cliente
BEFORE INSERT ON Clientes
FOR EACH ROW
DECLARE
    conteo NUMBER(10);
BEGIN
    SELECT COUNT(*) INTO conteo FROM Clientes;
    :NEW.id := LPAD(conteo + 1, 5, 0);
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