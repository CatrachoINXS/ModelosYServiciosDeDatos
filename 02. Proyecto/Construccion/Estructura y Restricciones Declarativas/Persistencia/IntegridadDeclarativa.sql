-- TConsecutivo
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
CHECK (direccionResidencia LIKE 'Calle %' OR direccionResidencia LIKE 'Carrera %' OR direccionResidencia LIKE 'Diagonal %' OR direccionResidencia LIKE 'Transversal %');

ALTER TABLE Facturas ADD CONSTRAINT CK_DIRECCION_VALIDA_FACTURA
CHECK (direccion LIKE 'Calle %' OR direccion LIKE 'Carrera %' OR direccion LIKE 'Diagonal %' OR direccion LIKE 'Transversal %');

ALTER TABLE Clientes ADD CONSTRAINT CK_DIRECCION_VALIDA_CLIENTE
CHECK (direccion LIKE 'Calle %' OR direccion LIKE 'Carrera %' OR direccion LIKE 'Diagonal %' OR direccion LIKE 'Transversal %');

-- TCorreo
ALTER TABLE Empleados ADD CONSTRAINT CK_CORREO_VALIDO_EMPLEADO
CHECK (correo LIKE '%_@_%._%');

-- TMonedaCOP
ALTER TABLE Empleados ADD CONSTRAINT CK_PLATA_COP 
CHECK (salario >= 0);

ALTER TABLE Meseros ADD CONSTRAINT CK_PLATA_COP_PROPINA
CHECK (totalPropina >= 0);

ALTER TABLE Facturas ADD CONSTRAINT CK_PLATA_COP_DESCUENTO
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
CHECK (NombreColumna IN ('Mañana', 'Tarde', 'Noche'));

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

/*El descuento no puede ser mayor al precio total*/
ALTER TABLE Facturas ADD CONSTRAINT CK_DESCUENTO_POSITIVO
CHECK (NOT(descuento > precio));



