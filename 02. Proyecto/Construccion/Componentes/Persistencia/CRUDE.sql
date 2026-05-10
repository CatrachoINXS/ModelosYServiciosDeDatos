/*CRUDE PC_TRABAJADOR*/
CREATE OR REPLACE PACKAGE PC_TRABAJADOR AS
   PROCEDURE registrarEmpleado(xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR, xEPS IN VARCHAR,
                               xAseguradora IN VARCHAR, xSalario IN NUMBER, xFechaIngreso IN DATE);
   PROCEDURE actualizarEmpleado(xId IN NUMBER, xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR,
                                 xEPS IN VARCHAR, xAseguradora IN VARCHAR, xSalario IN NUMBER, xFechaIngreso IN DATE);
   PROCEDURE eliminarEmpleado(xId IN NUMBER);
   FUNCTION consultarEmpleado (xId IN NUMBER) RETURN SYS_REFCURSOR;
   PROCEDURE registrarCajero(xIdEmpleado IN NUMBER, xTurnoCaja IN VARCHAR);
   PROCEDURE actualizarCajero(xIdEmpleado IN NUMBER, xTurnoCaja IN VARCHAR, xClientesAtendidos IN NUMBER);
   PROCEDURE registrarMesero(xIdEmpleado IN NUMBER);
   PROCEDURE actualizarMesero(xIdEmpleado IN NUMBER, xPropinas IN NUMBER, xMesasAtendidas IN NUMBER);
   PROCEDURE registrarDomiciliario(xIdEmpleado IN NUMBER, xPlacaVehiculo IN VARCHAR);
   PROCEDURE actualizarDomiciliario(xIdEmpleado IN NUMBER, xPlacaVehiculo IN VARCHAR, xDisponibilidad IN NUMBER, xPedidosEntregados IN NUMBER);
END;
/
   
/*CRUDE PC_CLIENTE*/
CREATE OR REPLACE PACKAGE PC_CLIENTE AS
   PROCEDURE registrarCliente(xNombreS IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR, xDireccion IN VARCHAR, xIdMesero IN NUMBER);
   PROCEDURE actualizarCliente(xId IN NUMBER, xNombres IN VARCHAR, xApellidos IN VARCHAR, xTelefono IN VARCHAR, xDireccion IN VARCHAR);
   PROCEDURE eliminarCliente(xId IN NUMBER);
   FUNCTION consultarCliente(xId IN NUMBER) RETURN SYS_REFCURSOR;
   FUNCTION consultarTodosLosClientes RETURN SYS_REFCURSOR;
   PROCEDURE clienteFiel(xId IN NUMBER);
   PROCEDURE registrarReseña(xId IN NUMBER, xReseña IN VARCHAR);
END;
/

/*CRUDE PC_VENTA*/

CREATE OR REPLACE PACKAGE PC_VENTA AS
   PROCEDURE registrarPedido(xEstado IN VARCHAR, xPrecio IN NUMBER, xIdCliente IN NUMBER);
   PROCEDURE actualizarPedido(xId IN NUMBER, xEstado IN VARCHAR, xPrecio IN NUMBER);
   PROCEDURE eliminarPedido(xId IN NUMBER);
   FUNCTION consultarPedido(xId IN NUMBER) RETURN SYS_REFCURSOR;
   FUNCTION consultarTodosLosPedidos RETURN SYS_REFCURSOR;
   PROCEDURE registrarFactura(xDireccion IN VARCHAR, xEstadoFactura IN VARCHAR, xPropina IN NUMBER, xPrecio IN NUMBER, xIdCliente IN NUMBER, xIdPedido IN NUMBER);
   PROCEDURE actualizarFactura(xId IN NUMBER, xEstadoFactura IN VARCHAR, xPropina IN NUMBER);
   PROCEDURE eliminarFactura(xId IN NUMBER);
   FUNCTION consultarFactura(xId IN NUMBER) RETURN SYS_REFCURSOR;
   PROCEDURE registrarDescuento(xIdFactura IN NUMBER, xDescuento IN NUMBER);
   FUNCTION consultarDescuento(xIdFactura IN NUMBER) RETURN SYS_REFCURSOR;
   PROCEDURE registrarPago(xIdCliente IN NUMBER, xIdFactura IN NUMBER, xMetodoPago IN VARCHAR, xEstadoPago IN VARCHAR);
   PROCEDURE actualizarPago(xIdCliente IN NUMBER, xIdFactura IN NUMBER, xEstadoPago IN VARCHAR);
   FUNCTION consultarPago(xIdFactura IN NUMBER) RETURN SYS_REFCURSOR;
END;
/

/*CRUDE PC_OFERTA*/

CREATE OR REPLACE PACKAGE PC_OFERTA AS
   PROCEDURE registrarMenu(xActivo IN NUMBER);
   PROCEDURE actualizarMenu(xId IN NUMBER, xActivo IN NUMBER);
   PROCEDURE eliminarMenu(xId, IN NUMBER) RETURN SYS_REFCURSOR;
   FUNCTION consultarMenu(xId IN NUMBER) RETURN SYS_REFCURSOR;
   FUNCTION consultarTodosLosMenus RETURN SYS_REFCURSOR;
   PROCEDURE registrarProducto(xNombre IN VARCHAR, xPrecio IN NUMBER, xDescripcion IN VARCHAR, xStock IN NUMBER, xIdMenu IN NUMBER);
   PROCEDURE actualizarProducto(xId IN NUMBER, xNombre IN VARCHAR, xPrecio IN NUMBER, xDescripcion IN VARCHAR, xStock IN NUMBER, xIdMenu IN NUMBER);
   PROCEDURE eliminarProducto(xId IN NUMBER);
   FUNCTION consultarProducto(xId IN NUMBER) RETURN SYS_REFCURSOR;
   FUNCTION consultarTodosLosProductos RETURN SYS_REFCURSOR;
   PROCEDURE registrarBebida(xIdProducto IN NUMBER, xTipoBebida IN VARCHAR);
   PROCEDURE actualizarBebida(xIdProducto IN NUMBER, xTipoBebida IN VARCHAR);
   PROCEDURE registrarSalchipapa(xIdProducto IN NUMBER, xTipoSalchipapa IN VARCHAR, xTamaño IN VARCHAR);
   PROCEDURE actualizarSalchipapa(xIdProducto IN NUMBER, tipoSalchipapa IN VARCHAR, tamaño IN NUMBER);
   PROCEDURE registrarIngrediente(xIdProducto IN NUMBER, xIngrediente IN VARCHAR);
   PROCEDURE actualizarIngrediente(xIdProducto IN NUMBER, xIngrediente IN VARCHAR);
   FUNCTION consultarIngredientes(xIdProducto IN NUMBER) RETURN SYS_REFCURSOR;
END;
/
