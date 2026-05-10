/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-05-05
Descripción: Especificación de los paquetes de actores CICLO1
*/

/*
 * Paquete PK_CAJERO
 */
CREATE OR REPLACE PACKAGE PK_CAJERO IS

    PROCEDURE clienteAdicionar(xNombres IN VARCHAR, xApellidos IN VARCHAR,
                            xTelefono IN VARCHAR, xDireccion IN VARCHAR,
                            xIdMesero IN NUMBER);

    PROCEDURE clienteModificar(xId IN NUMBER, xNombres IN VARCHAR,
                            xApellidos IN VARCHAR, xTelefono IN VARCHAR,
                            xDireccion IN VARCHAR);

    PROCEDURE clienteEliminar(xId IN NUMBER);
    
    FUNCTION clienteConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE pagoAdicionar(xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
                            xMetodoPago IN VARCHAR, xEstadoPago IN VARCHAR);

    PROCEDURE pagoModificar(xIdCliente IN NUMBER, xIdFactura IN VARCHAR,
                            xEstadoPago IN VARCHAR);

    FUNCTION pagoConsultar(xIdFactura IN VARCHAR) RETURN SYS_REFCURSOR;

    PROCEDURE facturaAdicionar(xDireccion IN VARCHAR, xEstadoFactura IN VARCHAR,
                            xPropina IN NUMBER, xPrecio IN NUMBER,
                            xIdCliente IN NUMBER,xIdPedido IN NUMBER);

    PROCEDURE facturaModificar(xId IN VARCHAR, xEstadoFactura IN VARCHAR,
                            xPropina IN NUMBER);

    PROCEDURE facturaEliminar(xId IN VARCHAR);

    FUNCTION facturaConsultar(xId IN VARCHAR) RETURN SYS_REFCURSOR;

    PROCEDURE pedidoAdicionar(xEstado IN VARCHAR, xPrecio IN NUMBER,
                            xIdCliente IN NUMBER);

    PROCEDURE pedidoModificar(xId IN NUMBER, xEstado IN VARCHAR,
                            xPrecio IN NUMBER);

    FUNCTION pedidoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR;

    FUNCTION preciosProductos RETURN SYS_REFCURSOR;

END PK_CAJERO;
/

/*
 * Paquete PK_ADMINISTRADOR
 */
CREATE OR REPLACE PACKAGE PK_ADMINISTRADOR IS

    PROCEDURE productoAdicionar(xNombre IN VARCHAR, xPrecio IN NUMBER,
                                xDescripcion IN VARCHAR, xStock IN NUMBER,
                                xIdMenu IN NUMBER);

    PROCEDURE productoModificar(xId IN NUMBER, xNombre IN VARCHAR,
                                xPrecio IN NUMBER, xDescripcion IN VARCHAR,
                                xStock IN NUMBER, xIdMenu IN NUMBER);

    PROCEDURE productoEliminar(xId IN NUMBER);

    FUNCTION productoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR;

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

    FUNCTION empleadoConsultar(xId IN NUMBER) RETURN SYS_REFCURSOR;

END PK_ADMINISTRADOR;
/

/*
 * Paquete PK_GERENTE
 */
CREATE OR REPLACE PACKAGE PK_GERENTE IS

    FUNCTION productosMasApetecidos RETURN SYS_REFCURSOR;
    FUNCTION sugerencias RETURN SYS_REFCURSOR;

END PK_GERENTE;
/