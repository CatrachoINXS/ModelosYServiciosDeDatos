/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-05-05
Descripción: Implementación de dichos paquetes. CICLO1
*/

/*
 * Paquete PK_CAJERO
 */
CREATE OR REPLACE PACKAGE BODY PK_CAJERO IS

    PROCEDURE clienteAdicionar(xNombres IN VARCHAR, xApellidos IN VARCHAR,
                               xTelefono IN VARCHAR, xDireccion IN VARCHAR,
                               xIdMesero IN NUMBER)
    IS
    BEGIN
        PC_CLIENTE.registrarCliente(xNombres, xApellidos, xTelefono, xDireccion, xIdMesero);
    END;

    PROCEDURE clienteModificar(xId IN NUMBER, xNombres IN VARCHAR,
                               xApellidos IN VARCHAR, xTelefono IN VARCHAR,
                               xDireccion IN VARCHAR)
    IS
    BEGIN
        PC_CLIENTE.actualizarCliente(xId, xNombres, xApellidos, xTelefono, xDireccion);
    END;

    PROCEDURE clienteEliminar(xId IN NUMBER)
    IS
    BEGIN
        PC_CLIENTE.eliminarCliente(xId);
    END;

    FUNCTION clienteConsultar(xId IN NUMBER)
    RETURN SYS_REFCURSOR
    IS
    BEGIN
        RETURN PC_CLIENTE.consultarCliente(xId);
    END;

    PROCEDURE pagoAdicionar(xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
                            xMetodoPago IN VARCHAR, xEstadoPago IN VARCHAR)
    IS
    BEGIN
        PC_VENTA.registrarPago(xIdCliente, xIdFactura, xMetodoPago, xEstadoPago);
    END;

    PROCEDURE pagoModificar(xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
                            xEstadoPago IN VARCHAR)
    IS
    BEGIN
        PC_VENTA.actualizarPago(xIdCliente, xIdFactura, xEstadoPago);
    END;

    FUNCTION pagoConsultar(xIdFactura IN VARCHAR)
    RETURN SYS_REFCURSOR
    IS
    BEGIN
        RETURN PC_VENTA.consultarPago(xIdFactura);
    END;

    PROCEDURE facturaAdicionar(xDireccion IN VARCHAR, xEstadoFactura IN VARCHAR,
                            xPropina IN NUMBER, xPrecio IN NUMBER,
                            xIdCliente IN NUMBER,xIdPedido IN NUMBER)
    IS
    BEGIN
        PC_VENTA.registrarFactura(xDireccion, xEstadoFactura,
                                  xPropina, xPrecio,
                                  xIdCliente, xIdPedido);
    END;

    PROCEDURE facturaModificar(xId IN VARCHAR, xEstadoFactura IN VARCHAR,
                            xPropina IN NUMBER)
    IS
    BEGIN
        PC_VENTA.actualizarFactura(xId, xEstadoFactura, xPropina);
    END;

    PROCEDURE facturaEliminar(xId IN VARCHAR)
    IS
    BEGIN
        PC_VENTA.eliminarFactura(xId);
    END;

    FUNCTION facturaConsultar(xId IN VARCHAR)
    RETURN SYS_REFCURSOR
    IS
    BEGIN
        RETURN PC_VENTA.consultarFactura(xId);
    END;

    PROCEDURE pedidoAdicionar(xEstado IN VARCHAR, xPrecio IN NUMBER,
                            xIdCliente IN NUMBER)
    IS
    BEGIN
        PC_VENTA.registrarPedido(xEstado, xPrecio, xIdCliente);
    END;

    PROCEDURE pedidoModificar(xId IN NUMBER, xEstado IN VARCHAR,
                            xPrecio IN NUMBER)
    IS
    BEGIN
        PC_VENTA.actualizarPedido(xId, xEstado, xPrecio);
    END;

    FUNCTION pedidoConsultar(xId IN NUMBER)
    RETURN SYS_REFCURSOR
    IS
    BEGIN
        RETURN PC_VENTA.consultarPedido(xId);
    END;

    FUNCTION preciosProductos
    RETURN SYS_REFCURSOR
    IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT nombre, precio
            FROM Productos
            ORDER BY nombre;

        RETURN xResultado;
    END;

END PK_CAJERO;
/

/*
 * Paquete PK_ADMINISTRADOR
 */
CREATE OR REPLACE PACKAGE BODY PK_ADMINISTRADOR IS

    PROCEDURE productoAdicionar(xNombre IN VARCHAR, xPrecio IN NUMBER,
                                xDescripcion IN VARCHAR, xStock IN NUMBER,
                                xIdMenu IN NUMBER)
    IS
    BEGIN
        PC_OFERTA.registrarProducto(xNombre, xPrecio, xDescripcion, xStock, xIdMenu);
    END;

    PROCEDURE productoModificar(xId IN NUMBER, xNombre IN VARCHAR,
                                xPrecio IN NUMBER, xDescripcion IN VARCHAR,
                                xStock IN NUMBER, xIdMenu IN NUMBER)
    IS
    BEGIN
        PC_OFERTA.actualizarProducto(xId, xNombre, xPrecio, xDescripcion, xStock, xIdMenu);
    END;

    PROCEDURE productoEliminar(xId IN NUMBER)
    IS
    BEGIN
        PC_OFERTA.eliminarProducto(xId);
    END;

    FUNCTION productoConsultar(xId IN NUMBER)
    RETURN SYS_REFCURSOR
    IS
    BEGIN
        RETURN PC_OFERTA.consultarProducto(xId);
    END;

    PROCEDURE empleadoAdicionar(xNombres IN VARCHAR, xApellidos IN VARCHAR,
                                xTelefono IN VARCHAR, xDireccionResidencia IN VARCHAR,
                                xCorreo IN VARCHAR, xEPS IN VARCHAR,
                                xAseguradora IN VARCHAR, xSalario IN NUMBER,
                                xFechaIngreso IN DATE)
    IS
    BEGIN
        PC_TRABAJADOR.registrarEmpleado(xNombres, xApellidos, xTelefono,
                                        xDireccionResidencia, xCorreo, xEPS,
                                        xAseguradora, xSalario, xFechaIngreso);
    END;

    PROCEDURE empleadoModificar(xId IN NUMBER, xNombres IN VARCHAR,
                                xApellidos IN VARCHAR, xTelefono IN VARCHAR,
                                xDireccionResidencia IN VARCHAR, xCorreo IN VARCHAR, 
                                xEPS IN VARCHAR, xAseguradora IN VARCHAR, 
                                xSalario IN NUMBER, xFechaIngreso IN DATE)
    IS
    BEGIN
        PC_TRABAJADOR.actualizarEmpleado(xId, xNombres, xApellidos,
                                         xTelefono, xDireccionResidencia, xCorreo,
                                         xEPS, xAseguradora, xSalario, xFechaIngreso);
    END;

    PROCEDURE empleadoEliminar(xId IN NUMBER)
    IS
    BEGIN
        PC_TRABAJADOR.eliminarEmpleado(xId);
    END;

    FUNCTION empleadoConsultar(xId IN NUMBER)
    RETURN SYS_REFCURSOR
    IS
    BEGIN
        RETURN PC_TRABAJADOR.consultarEmpleado(xId);
    END;

END PK_ADMINISTRADOR;
/

/*
 * Paquete PK_GERENTE
 */
CREATE OR REPLACE PACKAGE BODY PK_GERENTE IS

    FUNCTION productosMasApetecidos
    RETURN SYS_REFCURSOR
    IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT p.nombre,
                   COUNT(*) AS totalPedidos
            FROM SeComponenDe s
            JOIN Productos p
            ON s.idProducto = p.id
            GROUP BY p.nombre
            ORDER BY totalPedidos DESC;

        RETURN xResultado;
    END;

    FUNCTION sugerencias
    RETURN SYS_REFCURSOR
    IS
        xResultado SYS_REFCURSOR;
    BEGIN
        OPEN xResultado FOR
            SELECT nombres,
                   apellidos,
                   reseña
            FROM Clientes
            WHERE reseña IS NOT NULL;

        RETURN xResultado;
    END;

END PK_GERENTE;
/