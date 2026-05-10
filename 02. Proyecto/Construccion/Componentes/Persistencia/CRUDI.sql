/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-05-09
Descripción: CRUDI CICLO1
*/

/*CRUDI PC_TRABAJADOR*/
CREATE OR REPLACE PACKAGE BODY PC_TRABAJADOR AS
   PROCEDURE registrarEmpleado(xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR, xEPS IN VARCHAR, xAseguradora IN VARCHAR, xSalario IN NUMBER, xFechaIngreso IN DATE)
   IS BEGIN
      INSERT INTO Empleados(nombres, apellidos, telefono, direccionResidencia, correo, EPS, aseguradora, salario, fechaIngreso)
      VALUES(xNombres, xApellidos, xTelefono, xDireccionResidencia, xCorreo, xEPS, xAseguradora, xSalario, xFechaIngreso);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN 
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20001, 'Error al registrar empleado: ' || SQLERRM);
   END;

   PROCEDURE actualizarEmpleado(xId IN NUMBER, xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR, xEPS IN VARCHAR, xAseguradora IN VARCHAR, xSalario IN NUMBER, xFechaIngreso IN DATE)
   IS BEGIN 
      UPDATE Empleados SET nombres = xNombres, apellidos = xApellidos, telefono = xTelefono, direccionResidencia = xDireccionResidencia, correo  = xCorreo, EPS = xEPS, aseguradora = xAseguradora, salario = xSalario, fechaIngreso = xFechaIngreso
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

   FUNCTION consultarEmpleado(xId IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR; 
   BEGIN
      OPEN xResultado FOR 
         SELECT id, nombres, apellidos, telefono, direccionResidencia, correo, EPS, aseguradora, salario, fechaIngreso
            FROM Empleados
            WHERE id = xId;
      RETURN xResultado;
   END;

   PROCEDURE registrarCajero(xIdEmpleado IN NUMBER, xTurnoCaja IN VARCHAR)
   IS BEGIN
      INSERT INTO Cajeros(idEmpleado, turnoCaja, clientesAtendidos)
      VALUES (xIdEmpleado, xTurnoCaja, 0);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20006, 'Error al registrar cajero: ' || SQLERRM);
   END;

   PROCEDURE actualizarCajero(xIdEmpleado IN NUMBER, xTurnoCaja IN VARCHAR, xClientesAtendidos IN NUMBER)
   IS BEGIN
      UPDATE Cajeros SET turnoCaja = xTurnoCaja, clientesAtendidos  = xClientesAtendidos
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
      INSERT INTO Meseros (idEmpleado, propinas, mesasAtendidas)
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
      INSERT INTO Domiciliarios (idEmpleado, placaVehiculo, disponibilidad, pedidosEntregados) 
      VALUES (xIdEmpleado, xPlacaVehiculo, 1, 0);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20012, 'Error al registrar domiciliario: ' || SQLERRM);
   END;

   PROCEDURE actualizarDomiciliario(xIdEmpleado IN NUMBER, xPlacaVehiculo IN VARCHAR, xDisponibilidad IN NUMBER, xPedidosEntregados IN NUMBER)
   IS BEGIN
      UPDATE Domiciliarios SET placaVehiculo = xPlacaVehiculo, disponibilidad = xDisponibilidad, pedidosEntregados = xPedidosEntregados
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
END;
/

/*CRUDI PC_CLIENTE*/
CREATE OR REPLACE PACKAGE BODY PC_CLIENTE AS
   PROCEDURE registrarCliente(xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR, xDireccion IN VARCHAR, xIdMesero IN NUMBER)
   IS BEGIN 
      INSERT INTO Clientes (nombres, apellidos, telefono, direccion, clienteFiel, idMesero)
      VALUES (xNombres, xApellidos, xTelefono, xDireccion, 0, xIdMesero);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20015, 'Error al registrar cliente: ' || SQLERRM);
   END;

   PROCEDURE actualizarCliente(xId IN NUMBER, xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR, xDireccion IN VARCHAR)
   IS BEGIN
      UPDATE Clientes SET nombres = xNombres, apellidos  = xApellidos, telefono = xTelefono, direccion = xDireccion
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

    FUNCTION consultarCliente(xId IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
      OPEN xResultado FOR SELECT id, nombres, apellidos, telefono, direccion, clienteFiel, resena, idMesero
                          FROM clientes
                          WHERE id = xId;
      RETURN xResultado;
    END;

    FUNCTION consultarTodosLosClientes RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN 
      OPEN xResultado FOR SELECT id, nombres, apellidos, telefono, direccion, clienteFiel, idMesero
                          FROM clientes
                          ORDER BY apellidos, nombres;
      RETURN xResultado;
    END;

    PROCEDURE clienteFiel(xId IN NUMBER)
    IS BEGIN 
      UPDATE Clientes SET clienteFiel = 1
      WHERE id = xId;
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
END;
/

/*CRUDI PC_VENTA*/
CREATE OR REPLACE PACKAGE BODY PC_VENTA IS
   PROCEDURE registrarPedido(xEstado IN VARCHAR, xPrecio IN NUMBER, xIdCliente IN NUMBER)
   IS BEGIN 
      INSERT INTO Pedidos (estado, precio, idCliente)
      VALUES (xEstado, xPrecio, xIdCliente);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20024, 'Error al registrar pedido: ' || SQLERRM);
   END;

   PROCEDURE actualizarPedido(xId IN NUMBER, xEstado IN VARCHAR, xPrecio IN NUMBER)
   IS BEGIN 
      UPDATE Pedidos SET estado = xEstado, precio = xPrecio
      WHERE id = xId;
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

   FUNCTION consultarPedido(xId IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
   BEGIN
      OPEN xResultado FOR SELECT id, estado, precio, idCliente
                          FROM pedidos
                          WHERE id = xId
                          ORDER BY id DESC;
      RETURN xResultado;
   END;

   FUNCTION consultarTodosLosPedidos RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR; 
   BEGIN
      OPEN xResultado FOR SELECT id, estado, precio, idCliente
                          FROM pedidos
                          ORDER BY id DESC;
      RETURN xResultado;
   END;

   PROCEDURE registrarFactura(xDireccion IN VARCHAR, xEstadoFactura IN VARCHAR, xPropina IN NUMBER, xPrecio IN NUMBER, xIdCliente IN NUMBER, xIdPedido IN NUMBER)
   IS BEGIN
      INSERT INTO Facturas (fechaExpedicion, direccion, estadoFactura, propina, precio, idCliente, idPedido)
      VALUES (SYSDATE, xDireccion, xEstadoFactura, xPropina, xPrecio, xIdCliente, xIdPedido);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20029, 'Error al registrar factura: ' || SQLERRM);
   END;

   PROCEDURE actualizarFactura(xId IN NUMBER, xEstadoFactura IN VARCHAR, xPropina IN NUMBER)
   IS BEGIN
      UPDATE Facturas SET estadoFactura = xEstadoFactura, propina = xPropina
      WHERE id = xId;
      IF SQL%ROWCOUNT = 0 THEN
         RAISE_APPLICATION_ERROR(-20030, 'La factura no existe: ' || xId);
      END IF;
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20031, 'Error al actualizar factura: ' || SQLERRM);
   END;

   PROCEDURE eliminarFactura(xId IN NUMBER)
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

   FUNCTION consultarFactura(xId IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
   BEGIN
      OPEN xResultado FOR SELECT id, fechaExpedicion, direccion, estadoFactura, propina, precio, idCliente, idPedido
                          FROM facturas
                          WHERE id = xId;
      RETURN xResultado;
    END;

   PROCEDURE registrarDescuento(xIdFactura IN NUMBER, xDescuento IN NUMBER)
   IS BEGIN 
      INSERT INTO Descuentos (idFactura, descuento)
      VALUES (xIdFactura, xDescuento);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN 
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20034, 'Error al registrar descuento: ' || SQLERRM);
   END;

   FUNCTION consultarDescuento(xIdFactura IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
   BEGIN
      OPEN xResultado FOR SELECT idFactura, descuento
                          FROM descuentos
                          WHERE idFactura = xIdFactura;
      RETURN xResultado;
   END;

   PROCEDURE registrarPago(xIdCliente IN NUMBER, xIdFactura IN NUMBER, xMetodoPago IN VARCHAR, xEstadoPago IN VARCHAR)
   IS BEGIN
      INSERT INTO Paga (idCliente, idFactura, metodoPago, estadoPago)
      VALUES (xIdCliente, xIdFactura, xMetodoPago, xEstadoPago);
      COMMIT;
   EXCEPTION
      WHEN OTHERS THEN
         ROLLBACK;
         RAISE_APPLICATION_ERROR(-20035, 'Error al registrar pago: ' || SQLERRM);
   END;

   PROCEDURE actualizarPago(xIdCliente IN NUMBER, xIdFactura IN NUMBER, xEstadoPago IN VARCHAR)
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

   FUNCTION consultarPago(xIdFactura IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
   BEGIN
      OPEN xResultado FOR SELECT idCliente, idFactura, metodoPago, estadoPago
                          FROM paga
                          WHERE idFactura = xIdFactura;
      RETURN xResultado;
    END consultarPago;
END;
/

/*CRUDI PC_OFERTA*/
CREATE OR REPLACE PACKAGE BODY PC_OFERTA AS
  
    PROCEDURE registrarMenu(xActivo IN NUMBER) 
    IS BEGIN
        INSERT INTO Menu (activo) 
        VALUES (xActivo);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20037, 'Error al registrar menú: ' || SQLERRM);
    END;

    PROCEDURE actualizarMenu(xId IN NUMBER, xActivo IN NUMBER) 
    IS BEGIN
        UPDATE menu SET activo = xActivo WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20038, 'El menú no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20039, 'Error al actualizar menú: ' || SQLERRM);
    END;

    PROCEDURE eliminarMenu(xId IN NUMBER) IS
    BEGIN
        DELETE FROM menu WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20040, 'El menú no existe: ' || xId);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20041, 'Error al eliminar menú: ' || SQLERRM);
    END;
 
    FUNCTION consultarMenu(xId IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, activo FROM menu 
            WHERE id = xId;
        RETURN xResultado;
    END;

    FUNCTION consultarTodosLosMenus RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, activo 
            FROM menu 
            ORDER BY id;
        RETURN xResultado;
    END;
 
    PROCEDURE registrarProducto(xNombre IN VARCHAR, xPrecio IN NUMBER, xDescripcion IN VARCHAR, xStock IN NUMBER, xIdMenu  IN NUMBER)
    IS BEGIN
        INSERT INTO productos (nombre, precio, descripcion, stock, idMenu)
        VALUES (xNombre, xPrecio, xDescripcion, xStock, xIdMenu);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20042, 'Error al registrar producto: ' || SQLERRM);
    END registrarProducto;
 
    PROCEDURE actualizarProducto(xId IN NUMBER, xNombre IN VARCHAR, xPrecio IN NUMBER, xDescripcion IN VARCHAR, xStock IN NUMBER, xIdMenu IN NUMBER)
    IS BEGIN
        UPDATE productos
        SET nombre = xNombre, precio = xPrecio, descripcion = xDescripcion, stock = xStock, idMenu = xIdMenu
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

    PROCEDURE eliminarProducto(xId IN NUMBER) IS
    BEGIN
        DELETE FROM productos WHERE id = xId;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20045, 'El producto no existe: ' || xId);
        END IF;
        COMMIT; 
    EXCEPTION
        WHEN OTHERS THEN
            RAISE_APPLICATION_ERROR(-20046, 'Error al eliminar producto: ' || SQLERRM);
    END;
 
    FUNCTION consultarProducto(xId IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, nombre, precio, descripcion, stock, idMenu
            FROM productos WHERE id = xId;
        RETURN xResultado;
    END;
 
    FUNCTION consultarTodosLosProductos RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT id, nombre, precio, descripcion, stock, idMenu
            FROM productos ORDER BY nombre;
        RETURN xResultado;
    END;
 
    PROCEDURE registrarBebida(xIdProducto IN NUMBER, xTipoBebida IN VARCHAR) 
    IS BEGIN
        INSERT INTO bebidas (idProducto, tipoBebida)
        VALUES (xIdProducto, xTipoBebida);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20047, 'Error al registrar bebida: ' || SQLERRM);
    END;

    PROCEDURE actualizarBebida(xIdProducto IN NUMBER, xTipoBebida IN VARCHAR) IS
    BEGIN
        UPDATE bebidas SET tipoBebida = xTipoBebida
        WHERE idProducto = xIdProducto;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20048, 'La bebida no existe: ' || xIdProducto);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20049, 'Error al actualizar bebida: ' || SQLERRM);
    END;

    PROCEDURE registrarSalchipapa(xIdProducto IN NUMBER, xTipoSalchipapa IN VARCHAR, xTamano IN VARCHAR2) 
    IS BEGIN
        INSERT INTO salchipapas (idProducto, tipoSalchipapa, tamaÑo)
        VALUES (xIdProducto, xTipoSalchipapa, xTamano);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20050, 'Error al registrar salchipapa: ' || SQLERRM);
    END;

    PROCEDURE actualizarSalchipapa(xIdProducto IN NUMBER, xTipoSalchipapa IN VARCHAR, xTamano IN VARCHAR) 
    IS BEGIN
        UPDATE salchipapas SET tipoSalchipapa = xTipoSalchipapa, tamaño = xTamaño
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
        INSERT INTO ingredientes (idProducto, ingrediente)
        VALUES (xIdProducto, xIngrediente);
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20053, 'Error al registrar ingrediente: ' || SQLERRM);
    END;

    PROCEDURE actualizarIngrediente(xIdProducto IN NUMBER, xIngrediente IN VARCHAR) 
    IS BEGIN
        UPDATE ingredientes SET ingrediente = xIngrediente
        WHERE idProducto = xIdProducto;
        IF SQL%ROWCOUNT = 0 THEN
            RAISE_APPLICATION_ERROR(-20054, 'El ingrediente no existe para el producto: ' || xIdProducto);
        END IF;
        COMMIT;
    EXCEPTION
        WHEN OTHERS THEN
            ROLLBACK;
            RAISE_APPLICATION_ERROR(-20055, 'Error al actualizar ingrediente: ' || SQLERRM);
    END;

    FUNCTION consultarIngredientes(xIdProducto IN NUMBER) RETURN SYS_REFCURSOR IS xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT idProducto, ingrediente
            FROM ingredientes
            WHERE idProducto = xIdProducto;
        RETURN xResultado;
    END ;
END;
/



