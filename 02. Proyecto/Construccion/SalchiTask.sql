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
    disponibilidad NUMBER(1) NOT NULL);
    
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
FOREIGN KEY (idCliente) REFERENCES Clientes (id) ON DELETE CASCADE;

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
    :NEW.estado := 'Pendiente';
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

-- indices

CREATE INDEX indice_nombre_apellido_empleados
    ON Empleados (nombres, apellidos);

CREATE INDEX indice_fechaExpedicion_factura
    ON Facturas (fechaExpedicion);

CREATE INDEX indice_estadoPedido_cliente
    ON Pedidos (idCliente, estado);

CREATE UNIQUE INDEX indice_nombre_productos
    ON Productos (nombre);

CREATE INDEX indice_nombre_apellido_clientes
    ON Clientes (nombres, apellidos);

CREATE INDEX indice_direccion_clientes
    ON Clientes (direccion);
    
-- vistas

CREATE OR REPLACE VIEW datos_empleado AS
    SELECT id, nombres, apellidos
    FROM Empleados;

CREATE OR REPLACE VIEW datos_cliente AS
    SELECT id, nombres, apellidos
    FROM Clientes;

CREATE OR REPLACE VIEW datos_pedido AS
    SELECT p.id            AS idPedido,
           p.precio        AS Total,
           p.estado        AS Estado,
           c.id            AS idCliente,
           c.nombres       AS Nombre,
           c.apellidos     AS Apellido,
           f.fechaExpedicion AS Fecha
    FROM Pedidos p
    JOIN Clientes c  ON p.idCliente = c.id
    LEFT JOIN Facturas f ON f.idPedido = p.id;

CREATE OR REPLACE VIEW productos_mas_vendidos AS
    SELECT p.id              AS idProducto,
           p.nombre          AS Nombre,
           SUM(sc.cantidad)  AS totalVendidos,
           SUM(sc.cantidad * p.precio) AS totalGanancias
    FROM SeComponenDe sc
    JOIN Productos p ON sc.idProducto = p.id
    GROUP BY p.id, p.nombre;
    
-- CRUDE

CREATE OR REPLACE PACKAGE PC_TRABAJADOR AS
    PROCEDURE registrarEmpleado(
        xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR,
        xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR, xEPS IN VARCHAR,
        xAseguradora IN VARCHAR, xSalario IN NUMBER, xFechaIngreso IN DATE);
    PROCEDURE actualizarEmpleado(
        xId IN NUMBER, xNombres IN VARCHAR, xApellidos IN VARCHAR,
        xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR,
        xEPS IN VARCHAR, xAseguradora IN VARCHAR, xSalario IN NUMBER, xFechaIngreso IN DATE);
    PROCEDURE eliminarEmpleado(xId IN NUMBER);
    FUNCTION  consultarEmpleado(xId IN NUMBER) RETURN SYS_REFCURSOR;
    PROCEDURE registrarCajero(xIdEmpleado IN NUMBER, xTurnoCaja IN VARCHAR);
    PROCEDURE actualizarCajero(xIdEmpleado IN NUMBER, xTurnoCaja IN VARCHAR, xClientesAtendidos IN NUMBER);
    PROCEDURE registrarMesero(xIdEmpleado IN NUMBER);
    PROCEDURE actualizarMesero(xIdEmpleado IN NUMBER, xPropinas IN NUMBER, xMesasAtendidas IN NUMBER);
    PROCEDURE registrarDomiciliario(xIdEmpleado IN NUMBER, xPlacaVehiculo IN VARCHAR);
    PROCEDURE actualizarDomiciliario(xIdEmpleado IN NUMBER, xPlacaVehiculo IN VARCHAR,
        xDisponibilidad IN NUMBER, xPedidosEntregados IN NUMBER);
END PC_TRABAJADOR;
/

CREATE OR REPLACE PACKAGE PC_CLIENTE AS
    PROCEDURE registrarCliente(
        xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR,
        xDireccion IN VARCHAR, xIdMesero IN NUMBER);
    PROCEDURE actualizarCliente(
        xId IN NUMBER, xNombres IN VARCHAR, xApellidos IN VARCHAR,
        xTelefono IN VARCHAR, xDireccion IN VARCHAR);
    PROCEDURE eliminarCliente(xId IN NUMBER);
    FUNCTION  consultarCliente(xId IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION  consultarTodosLosClientes RETURN SYS_REFCURSOR;
    PROCEDURE clienteFiel(xId IN NUMBER);
    PROCEDURE registrarReseña(xId IN NUMBER, xReseña IN VARCHAR);
END PC_CLIENTE;
/

CREATE OR REPLACE PACKAGE PC_VENTA AS
    PROCEDURE registrarPedido(xEstado IN VARCHAR, xPrecio IN NUMBER, xIdCliente IN NUMBER);
    PROCEDURE actualizarPedido(xId IN NUMBER, xEstado IN VARCHAR, xPrecio IN NUMBER);
    PROCEDURE eliminarPedido(xId IN NUMBER);
    FUNCTION  consultarPedido(xId IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION  consultarTodosLosPedidos RETURN SYS_REFCURSOR;
    PROCEDURE registrarFactura(
        xDireccion IN VARCHAR, xEstadoFactura IN VARCHAR, xPropina IN NUMBER,
        xPrecio IN NUMBER, xIdCliente IN NUMBER, xIdPedido IN NUMBER);
    PROCEDURE actualizarFactura(xId IN VARCHAR, xEstadoFactura IN VARCHAR, xPropina IN NUMBER);
    PROCEDURE eliminarFactura(xId IN VARCHAR);
    FUNCTION  consultarFactura(xId IN VARCHAR) RETURN SYS_REFCURSOR;
    PROCEDURE registrarDescuento(xIdFactura IN VARCHAR, xDescuento IN NUMBER);
    FUNCTION  consultarDescuento(xIdFactura IN VARCHAR) RETURN SYS_REFCURSOR;
    PROCEDURE registrarPago(
        xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
        xMetodoPago IN VARCHAR, xEstadoPago IN VARCHAR);
    PROCEDURE actualizarPago(xIdCliente IN NUMBER, xIdFactura IN VARCHAR, xEstadoPago IN VARCHAR);
    FUNCTION  consultarPago(xIdFactura IN VARCHAR) RETURN SYS_REFCURSOR;
END PC_VENTA;
/

CREATE OR REPLACE PACKAGE PC_OFERTA AS
    PROCEDURE registrarMenu(xActivo IN NUMBER);
    PROCEDURE actualizarMenu(xId IN NUMBER, xActivo IN NUMBER);
    PROCEDURE eliminarMenu(xId IN NUMBER);
    FUNCTION  consultarMenu(xId IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION  consultarTodosLosMenus RETURN SYS_REFCURSOR;
    PROCEDURE registrarProducto(
        xNombre IN VARCHAR, xPrecio IN NUMBER, xDescripcion IN VARCHAR,
        xStock IN NUMBER, xIdMenu IN NUMBER);
    PROCEDURE actualizarProducto(
        xId IN NUMBER, xNombre IN VARCHAR, xPrecio IN NUMBER,
        xDescripcion IN VARCHAR, xStock IN NUMBER, xIdMenu IN NUMBER);
    PROCEDURE eliminarProducto(xId IN NUMBER);
    FUNCTION  consultarProducto(xId IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION  consultarTodosLosProductos RETURN SYS_REFCURSOR;
    PROCEDURE registrarBebida(xIdProducto IN NUMBER, xTipoBebida IN VARCHAR);
    PROCEDURE actualizarBebida(xIdProducto IN NUMBER, xTipoBebida IN VARCHAR);
    PROCEDURE registrarSalchipapa(
        xIdProducto IN NUMBER, xTipoSalchipapa IN VARCHAR, xTamaño IN VARCHAR);
    PROCEDURE actualizarSalchipapa(
        xIdProducto IN NUMBER, xTipoSalchipapa IN VARCHAR, xTamaño IN VARCHAR);
    PROCEDURE registrarIngrediente(xIdProducto IN NUMBER, xIngrediente IN VARCHAR);
    PROCEDURE actualizarIngrediente(xIdProducto IN NUMBER, xIngrediente IN VARCHAR);
    FUNCTION  consultarIngredientes(xIdProducto IN NUMBER) RETURN SYS_REFCURSOR;
END PC_OFERTA;
/

-- CRUDI

CREATE OR REPLACE PACKAGE BODY PC_TRABAJADOR AS

    PROCEDURE registrarEmpleado(
        xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR,
        xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR, xEPS IN VARCHAR,
        xAseguradora IN VARCHAR, xSalario IN NUMBER, xFechaIngreso IN DATE)
    IS BEGIN
        INSERT INTO Empleados(nombres, apellidos, telefono, direccionResidencia,
            correo, EPS, aseguradora, salario, fechaIngreso)
        VALUES(xNombres, xApellidos, xTelefono, xDireccionResidencia,
            xCorreo, xEPS, xAseguradora, xSalario, xFechaIngreso);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20001, 'Error al registrar empleado: ' || SQLERRM);
    END;

    PROCEDURE actualizarEmpleado(
        xId IN NUMBER, xNombres IN VARCHAR, xApellidos IN VARCHAR,
        xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR,
        xEPS IN VARCHAR, xAseguradora IN VARCHAR, xSalario IN NUMBER, xFechaIngreso IN DATE)
    IS BEGIN
        UPDATE Empleados
        SET nombres = xNombres, apellidos = xApellidos, telefono = xTelefono,
            direccionResidencia = xDireccionResidencia, correo = xCorreo,
            EPS = xEPS, aseguradora = xAseguradora, salario = xSalario,
            fechaIngreso = xFechaIngreso
        WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20002, 'Empleado no encontrado: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20003, 'Error al actualizar empleado: ' || SQLERRM);
    END;

    PROCEDURE eliminarEmpleado(xId IN NUMBER)
    IS BEGIN
        DELETE FROM Empleados WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20004, 'El empleado no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20005, 'Error al eliminar empleado: ' || SQLERRM);
    END;

    FUNCTION consultarEmpleado(xId IN NUMBER) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, nombres, apellidos, telefono, direccionResidencia,
                   correo, EPS, aseguradora, salario, fechaIngreso
            FROM Empleados WHERE id = xId;
        RETURN xResultado;
    END;

    PROCEDURE registrarCajero(xIdEmpleado IN NUMBER, xTurnoCaja IN VARCHAR)
    IS BEGIN
        INSERT INTO Cajeros(idEmpleado, turnoCaja, clientesAtendidos)
        VALUES(xIdEmpleado, xTurnoCaja, 0);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20006, 'Error al registrar cajero: ' || SQLERRM);
    END;

    PROCEDURE actualizarCajero(xIdEmpleado IN NUMBER, xTurnoCaja IN VARCHAR, xClientesAtendidos IN NUMBER)
    IS BEGIN
        UPDATE Cajeros SET turnoCaja = xTurnoCaja, clientesAtendidos = xClientesAtendidos
        WHERE idEmpleado = xIdEmpleado;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20007, 'El cajero no existe: ' || xIdEmpleado);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20008, 'Error al actualizar cajero: ' || SQLERRM);
    END;

    PROCEDURE registrarMesero(xIdEmpleado IN NUMBER)
    IS BEGIN
        INSERT INTO Meseros(idEmpleado, propinas, mesasAtendidas)
        VALUES(xIdEmpleado, 0, 0);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20009, 'Error al registrar mesero: ' || SQLERRM);
    END;

    PROCEDURE actualizarMesero(xIdEmpleado IN NUMBER, xPropinas IN NUMBER, xMesasAtendidas IN NUMBER)
    IS BEGIN
        UPDATE Meseros SET propinas = xPropinas, mesasAtendidas = xMesasAtendidas
        WHERE idEmpleado = xIdEmpleado;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20010, 'El mesero no existe: ' || xIdEmpleado);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20011, 'Error al actualizar mesero: ' || SQLERRM);
    END;

    PROCEDURE registrarDomiciliario(xIdEmpleado IN NUMBER, xPlacaVehiculo IN VARCHAR)
    IS BEGIN
        INSERT INTO Domiciliarios(idEmpleado, placaVehiculo, disponibilidad, pedidosEntregados)
        VALUES(xIdEmpleado, xPlacaVehiculo, 1, 0);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20012, 'Error al registrar domiciliario: ' || SQLERRM);
    END;

    PROCEDURE actualizarDomiciliario(
        xIdEmpleado IN NUMBER, xPlacaVehiculo IN VARCHAR,
        xDisponibilidad IN NUMBER, xPedidosEntregados IN NUMBER)
    IS BEGIN
        UPDATE Domiciliarios
        SET placaVehiculo = xPlacaVehiculo, disponibilidad = xDisponibilidad,
            pedidosEntregados = xPedidosEntregados
        WHERE idEmpleado = xIdEmpleado;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20013, 'El domiciliario no existe: ' || xIdEmpleado);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20014, 'Error al actualizar domiciliario: ' || SQLERRM);
    END;

END PC_TRABAJADOR;
/

-- Implementación PC_CLIENTE
CREATE OR REPLACE PACKAGE BODY PC_CLIENTE AS

    PROCEDURE registrarCliente(
        xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR,
        xDireccion IN VARCHAR, xIdMesero IN NUMBER)
    IS BEGIN
        INSERT INTO Clientes(nombres, apellidos, telefono, direccion, clienteFiel, idMesero)
        VALUES(xNombres, xApellidos, xTelefono, xDireccion, 0, xIdMesero);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20015, 'Error al registrar cliente: ' || SQLERRM);
    END;

    PROCEDURE actualizarCliente(
        xId IN NUMBER, xNombres IN VARCHAR, xApellidos IN VARCHAR,
        xTelefono IN VARCHAR, xDireccion IN VARCHAR)
    IS BEGIN
        UPDATE Clientes
        SET nombres = xNombres, apellidos = xApellidos,
            telefono = xTelefono, direccion = xDireccion
        WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20016, 'El cliente no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20017, 'Error al actualizar cliente: ' || SQLERRM);
    END;

    PROCEDURE eliminarCliente(xId IN NUMBER)
    IS BEGIN
        DELETE FROM Clientes WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20018, 'El cliente no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20019, 'Error al eliminar cliente: ' || SQLERRM);
    END;

    FUNCTION consultarCliente(xId IN NUMBER) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, nombres, apellidos, telefono, direccion,
                   clienteFiel, reseña, idMesero
            FROM Clientes WHERE id = xId;
        RETURN xResultado;
    END;

    FUNCTION consultarTodosLosClientes RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, nombres, apellidos, telefono, direccion, clienteFiel, idMesero
            FROM Clientes ORDER BY apellidos, nombres;
        RETURN xResultado;
    END;

    PROCEDURE clienteFiel(xId IN NUMBER)
    IS BEGIN
        UPDATE Clientes SET clienteFiel = 1 WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20020, 'El cliente no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20021, 'Error al marcar cliente fiel: ' || SQLERRM);
    END;

    PROCEDURE registrarReseña(xId IN NUMBER, xReseña IN VARCHAR)
    IS BEGIN
        UPDATE Clientes SET reseña = xReseña WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20022, 'El cliente no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20023, 'Error al registrar reseña: ' || SQLERRM);
    END;

END PC_CLIENTE;
/

-- Implementación PC_VENTA
CREATE OR REPLACE PACKAGE BODY PC_VENTA IS

    PROCEDURE registrarPedido(xEstado IN VARCHAR, xPrecio IN NUMBER, xIdCliente IN NUMBER)
    IS BEGIN
        INSERT INTO Pedidos(estado, precio, idCliente)
        VALUES(xEstado, xPrecio, xIdCliente);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20024, 'Error al registrar pedido: ' || SQLERRM);
    END;

    PROCEDURE actualizarPedido(xId IN NUMBER, xEstado IN VARCHAR, xPrecio IN NUMBER)
    IS BEGIN
        UPDATE Pedidos SET estado = xEstado, precio = xPrecio WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20025, 'El pedido no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20026, 'Error al actualizar pedido: ' || SQLERRM);
    END;

    PROCEDURE eliminarPedido(xId IN NUMBER)
    IS BEGIN
        DELETE FROM Pedidos WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20027, 'El pedido no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20028, 'Error al eliminar pedido: ' || SQLERRM);
    END;

    FUNCTION consultarPedido(xId IN NUMBER) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, estado, precio, idCliente FROM Pedidos WHERE id = xId;
        RETURN xResultado;
    END;

    FUNCTION consultarTodosLosPedidos RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, estado, precio, idCliente FROM Pedidos ORDER BY id;
        RETURN xResultado;
    END;

    PROCEDURE registrarFactura(
        xDireccion IN VARCHAR, xEstadoFactura IN VARCHAR, xPropina IN NUMBER,
        xPrecio IN NUMBER, xIdCliente IN NUMBER, xIdPedido IN NUMBER)
    IS
        xIdGenerado VARCHAR(15);
        xPrefijo    VARCHAR(10);
        xConteo     NUMBER;
    BEGIN
        xPrefijo    := 'A' || TO_CHAR(SYSDATE, 'YYYY-MM') || '-';
        SELECT COUNT(*) + 1 INTO xConteo FROM Facturas;
        xIdGenerado := xPrefijo || LPAD(xConteo, 6, '0');

        INSERT INTO Facturas(id, fechaExpedicion, direccion, estadoFactura,
                             propina, precio, idCliente, idPedido)
        VALUES(xIdGenerado, SYSDATE, xDireccion, xEstadoFactura,
               xPropina, xPrecio, xIdCliente, xIdPedido);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20029, 'Error al registrar factura: ' || SQLERRM);
    END;

    PROCEDURE actualizarFactura(xId IN VARCHAR, xEstadoFactura IN VARCHAR, xPropina IN NUMBER)
    IS BEGIN
        UPDATE Facturas SET estadoFactura = xEstadoFactura, propina = xPropina WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20030, 'La factura no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20031, 'Error al actualizar factura: ' || SQLERRM);
    END;

    PROCEDURE eliminarFactura(xId IN VARCHAR)
    IS BEGIN
        DELETE FROM Facturas WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20032, 'La factura no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20033, 'Error al eliminar factura: ' || SQLERRM);
    END;

    FUNCTION consultarFactura(xId IN VARCHAR) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, fechaExpedicion, direccion, estadoFactura, propina,
                   precio, idCliente, idPedido
            FROM Facturas WHERE id = xId;
        RETURN xResultado;
    END;

    PROCEDURE registrarDescuento(xIdFactura IN VARCHAR, xDescuento IN NUMBER)
    IS BEGIN
        INSERT INTO Descuentos(idFactura, descuento) VALUES(xIdFactura, xDescuento);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20034, 'Error al registrar descuento: ' || SQLERRM);
    END;

    FUNCTION consultarDescuento(xIdFactura IN VARCHAR) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT idFactura, descuento FROM Descuentos WHERE idFactura = xIdFactura;
        RETURN xResultado;
    END;

    PROCEDURE registrarPago(
        xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
        xMetodoPago IN VARCHAR, xEstadoPago IN VARCHAR)
    IS BEGIN
        INSERT INTO Paga(idCliente, idFactura, metodoPago, estadoPago)
        VALUES(xIdCliente, xIdFactura, xMetodoPago, xEstadoPago);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20035, 'Error al registrar pago: ' || SQLERRM);
    END;

    PROCEDURE actualizarPago(xIdCliente IN NUMBER, xIdFactura IN VARCHAR, xEstadoPago IN VARCHAR)
    IS BEGIN
        UPDATE Paga SET estadoPago = xEstadoPago
        WHERE idCliente = xIdCliente AND idFactura = xIdFactura;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20036, 'El pago no existe para cliente/factura indicados.');
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20100, 'Error al actualizar pago: ' || SQLERRM);
    END;

    FUNCTION consultarPago(xIdFactura IN VARCHAR) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT idCliente, idFactura, metodoPago, estadoPago
            FROM Paga WHERE idFactura = xIdFactura;
        RETURN xResultado;
    END;

END PC_VENTA;
/

-- Implementación PC_OFERTA
CREATE OR REPLACE PACKAGE BODY PC_OFERTA AS

    PROCEDURE registrarMenu(xActivo IN NUMBER)
    IS BEGIN
        INSERT INTO Menu(activo) VALUES(xActivo);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20037, 'Error al registrar menú: ' || SQLERRM);
    END;

    PROCEDURE actualizarMenu(xId IN NUMBER, xActivo IN NUMBER)
    IS BEGIN
        UPDATE Menu SET activo = xActivo WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20038, 'El menú no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20039, 'Error al actualizar menú: ' || SQLERRM);
    END;

    PROCEDURE eliminarMenu(xId IN NUMBER)
    IS BEGIN
        DELETE FROM Menu WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20040, 'El menú no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20041, 'Error al eliminar menú: ' || SQLERRM);
    END;

    FUNCTION consultarMenu(xId IN NUMBER) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR SELECT id, activo FROM Menu WHERE id = xId;
        RETURN xResultado;
    END;

    FUNCTION consultarTodosLosMenus RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR SELECT id, activo FROM Menu ORDER BY id;
        RETURN xResultado;
    END;

    PROCEDURE registrarProducto(
        xNombre IN VARCHAR, xPrecio IN NUMBER, xDescripcion IN VARCHAR,
        xStock IN NUMBER, xIdMenu IN NUMBER)
    IS BEGIN
        INSERT INTO Productos(nombre, precio, descripcion, stock, idMenu)
        VALUES(xNombre, xPrecio, xDescripcion, xStock, xIdMenu);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20042, 'Error al registrar producto: ' || SQLERRM);
    END;

    PROCEDURE actualizarProducto(
        xId IN NUMBER, xNombre IN VARCHAR, xPrecio IN NUMBER,
        xDescripcion IN VARCHAR, xStock IN NUMBER, xIdMenu IN NUMBER)
    IS BEGIN
        UPDATE Productos
        SET nombre = xNombre, precio = xPrecio, descripcion = xDescripcion,
            stock = xStock, idMenu = xIdMenu
        WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20043, 'El producto no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20044, 'Error al actualizar producto: ' || SQLERRM);
    END;

    PROCEDURE eliminarProducto(xId IN NUMBER)
    IS BEGIN
        DELETE FROM Productos WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20045, 'El producto no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20046, 'Error al eliminar producto: ' || SQLERRM);
    END;

    FUNCTION consultarProducto(xId IN NUMBER) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, nombre, precio, descripcion, stock, idMenu
            FROM Productos WHERE id = xId;
        RETURN xResultado;
    END;

    FUNCTION consultarTodosLosProductos RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, nombre, precio, descripcion, stock, idMenu
            FROM Productos ORDER BY nombre;
        RETURN xResultado;
    END;

    PROCEDURE registrarBebida(xIdProducto IN NUMBER, xTipoBebida IN VARCHAR)
    IS BEGIN
        INSERT INTO Bebidas(idProducto, tipoBebida) VALUES(xIdProducto, xTipoBebida);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20047, 'Error al registrar bebida: ' || SQLERRM);
    END;

    PROCEDURE actualizarBebida(xIdProducto IN NUMBER, xTipoBebida IN VARCHAR)
    IS BEGIN
        UPDATE Bebidas SET tipoBebida = xTipoBebida WHERE idProducto = xIdProducto;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20048, 'La bebida no existe: ' || xIdProducto);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20049, 'Error al actualizar bebida: ' || SQLERRM);
    END;

    PROCEDURE registrarSalchipapa(
        xIdProducto IN NUMBER, xTipoSalchipapa IN VARCHAR, xTamaño IN VARCHAR)
    IS BEGIN
        INSERT INTO Salchipapas(idProducto, tipoSalchipapa, tamaño)
        VALUES(xIdProducto, xTipoSalchipapa, xTamaño);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20050, 'Error al registrar salchipapa: ' || SQLERRM);
    END;

    PROCEDURE actualizarSalchipapa(
        xIdProducto IN NUMBER, xTipoSalchipapa IN VARCHAR, xTamaño IN VARCHAR)
    IS BEGIN
        UPDATE Salchipapas SET tipoSalchipapa = xTipoSalchipapa, tamaño = xTamaño
        WHERE idProducto = xIdProducto;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20051, 'La salchipapa no existe: ' || xIdProducto);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20052, 'Error al actualizar salchipapa: ' || SQLERRM);
    END;

    PROCEDURE registrarIngrediente(xIdProducto IN NUMBER, xIngrediente IN VARCHAR)
    IS BEGIN
        INSERT INTO Ingredientes(idProducto, ingrediente) VALUES(xIdProducto, xIngrediente);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20053, 'Error al registrar ingrediente: ' || SQLERRM);
    END;

    PROCEDURE actualizarIngrediente(xIdProducto IN NUMBER, xIngrediente IN VARCHAR)
    IS BEGIN
        UPDATE Ingredientes SET ingrediente = xIngrediente WHERE idProducto = xIdProducto;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20054, 'El ingrediente no existe para el producto: ' || xIdProducto);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20055, 'Error al actualizar ingrediente: ' || SQLERRM);
    END;

    FUNCTION consultarIngredientes(xIdProducto IN NUMBER) RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT idProducto, ingrediente FROM Ingredientes WHERE idProducto = xIdProducto;
        RETURN xResultado;
    END;

END PC_OFERTA;
/

-- ActoresE

-- Especificación PK_CAJERO
CREATE OR REPLACE PACKAGE PK_CAJERO IS
    PROCEDURE clienteAdicionar(xNombres IN VARCHAR, xApellidos IN VARCHAR,
                               xTelefono IN VARCHAR, xDireccion IN VARCHAR,
                               xIdMesero IN NUMBER);
    PROCEDURE clienteModificar(xId IN NUMBER, xNombres IN VARCHAR,
                               xApellidos IN VARCHAR, xTelefono IN VARCHAR,
                               xDireccion IN VARCHAR);
    PROCEDURE clienteEliminar(xId IN NUMBER);
    FUNCTION  clienteConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR;
    PROCEDURE pagoAdicionar(xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
                            xMetodoPago IN VARCHAR, xEstadoPago IN VARCHAR);
    PROCEDURE pagoModificar(xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
                            xEstadoPago IN VARCHAR);
    FUNCTION  pagoConsultar(xIdFactura IN VARCHAR) RETURN SYS_REFCURSOR;
    PROCEDURE facturaAdicionar(xDireccion IN VARCHAR, xEstadoFactura IN VARCHAR,
                               xPropina IN NUMBER, xPrecio IN NUMBER,
                               xIdCliente IN NUMBER, xIdPedido IN NUMBER);
    PROCEDURE facturaModificar(xId IN VARCHAR, xEstadoFactura IN VARCHAR,
                               xPropina IN NUMBER);
    PROCEDURE facturaEliminar(xId IN VARCHAR);
    FUNCTION  facturaConsultar(xId IN VARCHAR) RETURN SYS_REFCURSOR;
    PROCEDURE pedidoAdicionar(xEstado IN VARCHAR, xPrecio IN NUMBER,
                              xIdCliente IN NUMBER);
    PROCEDURE pedidoModificar(xId IN NUMBER, xEstado IN VARCHAR, xPrecio IN NUMBER);
    FUNCTION  pedidoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR;
    FUNCTION  preciosProductos RETURN SYS_REFCURSOR;
END PK_CAJERO;
/

-- Especificación PK_ADMINISTRADOR
CREATE OR REPLACE PACKAGE PK_ADMINISTRADOR IS
    PROCEDURE productoAdicionar(xNombre IN VARCHAR, xPrecio IN NUMBER,
                                xDescripcion IN VARCHAR, xStock IN NUMBER,
                                xIdMenu IN NUMBER);
    PROCEDURE productoModificar(xId IN NUMBER, xNombre IN VARCHAR,
                                xPrecio IN NUMBER, xDescripcion IN VARCHAR,
                                xStock IN NUMBER, xIdMenu IN NUMBER);
    PROCEDURE productoEliminar(xId IN NUMBER);
    FUNCTION  productoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR;
    PROCEDURE empleadoAdicionar(xNombres IN VARCHAR, xApellidos IN VARCHAR,
                                xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR,
                                xCorreo IN VARCHAR, xEPS IN VARCHAR,
                                xAseguradora IN VARCHAR, xSalario IN NUMBER,
                                xFechaIngreso IN DATE);
    PROCEDURE empleadoModificar(xId IN NUMBER, xNombres IN VARCHAR,
                                xApellidos IN VARCHAR, xTelefono IN VARCHAR,
                                xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR,
                                xEPS IN VARCHAR, xAseguradora IN VARCHAR,
                                xSalario IN NUMBER, xFechaIngreso IN DATE);
    PROCEDURE empleadoEliminar(xId IN NUMBER);
    FUNCTION  empleadoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR;
END PK_ADMINISTRADOR;
/

-- Especificación PK_GERENTE
CREATE OR REPLACE PACKAGE PK_GERENTE IS
    FUNCTION productosMasApetecidos RETURN SYS_REFCURSOR;
    FUNCTION sugerencias RETURN SYS_REFCURSOR;
END PK_GERENTE;
/

-- ActoresI

-- Implementación PK_CAJERO
CREATE OR REPLACE PACKAGE BODY PK_CAJERO IS

    PROCEDURE clienteAdicionar(xNombres IN VARCHAR, xApellidos IN VARCHAR,
                               xTelefono IN VARCHAR, xDireccion IN VARCHAR,
                               xIdMesero IN NUMBER)
    IS BEGIN
        PC_CLIENTE.registrarCliente(xNombres, xApellidos, xTelefono, xDireccion, xIdMesero);
    END;

    PROCEDURE clienteModificar(xId IN NUMBER, xNombres IN VARCHAR,
                               xApellidos IN VARCHAR, xTelefono IN VARCHAR,
                               xDireccion IN VARCHAR)
    IS BEGIN
        PC_CLIENTE.actualizarCliente(xId, xNombres, xApellidos, xTelefono, xDireccion);
    END;

    PROCEDURE clienteEliminar(xId IN NUMBER)
    IS BEGIN
        PC_CLIENTE.eliminarCliente(xId);
    END;

    FUNCTION clienteConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR
    IS BEGIN
        RETURN PC_CLIENTE.consultarCliente(xId);
    END;

    PROCEDURE pagoAdicionar(xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
                            xMetodoPago IN VARCHAR, xEstadoPago IN VARCHAR)
    IS BEGIN
        PC_VENTA.registrarPago(xIdCliente, xIdFactura, xMetodoPago, xEstadoPago);
    END;

    PROCEDURE pagoModificar(xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
                            xEstadoPago IN VARCHAR)
    IS BEGIN
        PC_VENTA.actualizarPago(xIdCliente, xIdFactura, xEstadoPago);
    END;

    FUNCTION pagoConsultar(xIdFactura IN VARCHAR) RETURN SYS_REFCURSOR
    IS BEGIN
        RETURN PC_VENTA.consultarPago(xIdFactura);
    END;

    PROCEDURE facturaAdicionar(xDireccion IN VARCHAR, xEstadoFactura IN VARCHAR,
                               xPropina IN NUMBER, xPrecio IN NUMBER,
                               xIdCliente IN NUMBER, xIdPedido IN NUMBER)
    IS BEGIN
        PC_VENTA.registrarFactura(xDireccion, xEstadoFactura, xPropina,
                                  xPrecio, xIdCliente, xIdPedido);
    END;

    PROCEDURE facturaModificar(xId IN VARCHAR, xEstadoFactura IN VARCHAR,
                               xPropina IN NUMBER)
    IS BEGIN
        PC_VENTA.actualizarFactura(xId, xEstadoFactura, xPropina);
    END;

    PROCEDURE facturaEliminar(xId IN VARCHAR)
    IS BEGIN
        PC_VENTA.eliminarFactura(xId);
    END;

    FUNCTION facturaConsultar(xId IN VARCHAR) RETURN SYS_REFCURSOR
    IS BEGIN
        RETURN PC_VENTA.consultarFactura(xId);
    END;

    PROCEDURE pedidoAdicionar(xEstado IN VARCHAR, xPrecio IN NUMBER,
                              xIdCliente IN NUMBER)
    IS BEGIN
        PC_VENTA.registrarPedido(xEstado, xPrecio, xIdCliente);
    END;

    PROCEDURE pedidoModificar(xId IN NUMBER, xEstado IN VARCHAR, xPrecio IN NUMBER)
    IS BEGIN
        PC_VENTA.actualizarPedido(xId, xEstado, xPrecio);
    END;

    FUNCTION pedidoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR
    IS BEGIN
        RETURN PC_VENTA.consultarPedido(xId);
    END;

    FUNCTION preciosProductos RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT nombre, precio FROM Productos ORDER BY nombre;
        RETURN xResultado;
    END;

END PK_CAJERO;
/

-- Implementación PK_ADMINISTRADOR
CREATE OR REPLACE PACKAGE BODY PK_ADMINISTRADOR IS

    PROCEDURE productoAdicionar(xNombre IN VARCHAR, xPrecio IN NUMBER,
                                xDescripcion IN VARCHAR, xStock IN NUMBER,
                                xIdMenu IN NUMBER)
    IS BEGIN
        PC_OFERTA.registrarProducto(xNombre, xPrecio, xDescripcion, xStock, xIdMenu);
    END;

    PROCEDURE productoModificar(xId IN NUMBER, xNombre IN VARCHAR,
                                xPrecio IN NUMBER, xDescripcion IN VARCHAR,
                                xStock IN NUMBER, xIdMenu IN NUMBER)
    IS BEGIN
        PC_OFERTA.actualizarProducto(xId, xNombre, xPrecio, xDescripcion, xStock, xIdMenu);
    END;

    PROCEDURE productoEliminar(xId IN NUMBER)
    IS BEGIN
        PC_OFERTA.eliminarProducto(xId);
    END;

    FUNCTION productoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR
    IS BEGIN
        RETURN PC_OFERTA.consultarProducto(xId);
    END;

    PROCEDURE empleadoAdicionar(xNombres IN VARCHAR, xApellidos IN VARCHAR,
                                xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR,
                                xCorreo IN VARCHAR, xEPS IN VARCHAR,
                                xAseguradora IN VARCHAR, xSalario IN NUMBER,
                                xFechaIngreso IN DATE)
    IS BEGIN
        PC_TRABAJADOR.registrarEmpleado(xNombres, xApellidos, xTelefono,
            xDireccionResidencia, xCorreo, xEPS, xAseguradora, xSalario, xFechaIngreso);
    END;

    PROCEDURE empleadoModificar(xId IN NUMBER, xNombres IN VARCHAR,
                                xApellidos IN VARCHAR, xTelefono IN VARCHAR,
                                xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR,
                                xEPS IN VARCHAR, xAseguradora IN VARCHAR,
                                xSalario IN NUMBER, xFechaIngreso IN DATE)
    IS BEGIN
        PC_TRABAJADOR.actualizarEmpleado(xId, xNombres, xApellidos, xTelefono,
            xDireccionResidencia, xCorreo, xEPS, xAseguradora, xSalario, xFechaIngreso);
    END;

    PROCEDURE empleadoEliminar(xId IN NUMBER)
    IS BEGIN
        PC_TRABAJADOR.eliminarEmpleado(xId);
    END;

    FUNCTION empleadoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR
    IS BEGIN
        RETURN PC_TRABAJADOR.consultarEmpleado(xId);
    END;

END PK_ADMINISTRADOR;
/

-- Implementación PK_GERENTE
CREATE OR REPLACE PACKAGE BODY PK_GERENTE IS

    FUNCTION productosMasApetecidos RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT p.nombre, COUNT(*) AS totalPedidos
            FROM SeComponenDe s
            JOIN Productos p ON s.idProducto = p.id
            GROUP BY p.nombre
            ORDER BY totalPedidos DESC;
        RETURN xResultado;
    END;

    FUNCTION sugerencias RETURN SYS_REFCURSOR IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT nombres, apellidos, reseña
            FROM Clientes
            WHERE reseña IS NOT NULL;
        RETURN xResultado;
    END;

END PK_GERENTE;
/

-- Seguridad

CREATE ROLE role_cajero_salchitask;
CREATE ROLE role_administrador_salchitask;
CREATE ROLE role_gerente_salchitask;

CREATE USER cajero1 IDENTIFIED BY 1234;
CREATE USER administrador1 IDENTIFIED BY 1234;
CREATE USER gerente IDENTIFIED BY 1234;

GRANT role_cajero_salchitask TO cajero1;
GRANT role_administrador_salchitask TO administrador1;
GRANT role_gerente_salchitask TO gerente;

GRANT CREATE SESSION TO cajero1;
GRANT CREATE SESSION TO administrador1;
GRANT CREATE SESSION TO gerente;

GRANT EXECUTE ON PK_CAJERO TO role_cajero_salchitask;
GRANT EXECUTE ON PK_ADMINISTRADOR TO role_administrador_salchitask;
GRANT EXECUTE ON PK_GERENTE TO role_gerente_salchitask;