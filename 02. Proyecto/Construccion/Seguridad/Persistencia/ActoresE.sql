/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-05-05
Descripción: Especificación de los paquetes de actores CICLO1
*/

/*
 * Paquete PK_Cajero
 */

CREATE OR REPLACE PACKAGE PK_CAJERO IS

    PROCEDURE clienteAdicionar(xCliId IN NUMBER);
    PROCEDURE clienteModificar(xCliId IN NUMBER);
    PROCEDURE clienteEliminar(xCliId IN NUMBER);
    FUNCTION clienteConsultar(xCliId IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE pagoAdicionar(xCliId IN NUMBER, xFacId IN NUMBER);
    PROCEDURE pagoModificar(xCliId IN NUMBER, xFacId IN NUMBER);
    FUNCTION pagoConsultar(xCliId IN NUMBER, xFacId IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE facturaAdicionar(xFacId IN NUMBER);
    PROCEDURE facturaModificar(xFacId IN NUMBER);
    PROCEDURE facturaEliminar(xFacId IN NUMBER);
    FUNCTION facturaConsultar(xFacId IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE pedidoAdicionar(xPedId IN NUMBER);
    PROCEDURE pedidoModificar(xPedId IN NUMBER);
    FUNCTION pedidoConsultar(xPedId IN NUMBER) RETURN SYS_REFCURSOR;

    FUNCTION preciosProductos RETURN SYS_REFCURSOR;

END PK_CAJERO;
/

CREATE OR REPLACE PACKAGE PK_ADMINISTRADOR IS

    PROCEDURE productoAdicionar(xCliId IN NUMBER);
    PROCEDURE productoModificar(xCliId IN NUMBER);
    PROCEDURE productoEliminar(xCliId IN NUMBER);
    FUNCTION productoConsultar(xCliId IN NUMBER) RETURN SYS_REFCURSOR;

    PROCEDURE empleadoAdicionar(xFacId IN NUMBER);
    PROCEDURE empleadoModificar(xFacId IN NUMBER);
    PROCEDURE empleadoEliminar(xFacId IN NUMBER);
    FUNCTION empleadoConsultar(xFacId IN NUMBER) RETURN SYS_REFCURSOR;

END PK_ADMINISTRADOR;
/

CREATE OR REPLACE PACKAGE PK_GERENTE IS

    FUNCTION productosMasApetecidos RETURN SYS_REFCURSOR;
    FUNCTION sugerencias RETURN SYS_REFCURSOR;

END PK_GERENTE;
/