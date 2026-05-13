/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-05-13
Descripción: Pruebas de aceptación CICLO1
*/

/*Prueba de aceptación 1*/

/*La cajera registra a la familia uno por uno*/
EXECUTE PK_CAJERO.clienteAdicionar('Juan Esteban', 'Colina Tovar', 3001234825, 'Calle 123 #54-90', 4);
EXECUTE PK_CAJERO.clienteAdicionar('Angie Tatiana', 'Colina', NULL, 'Calle 123 #54-90', 4);
EXECUTE PK_CAJERO.clienteAdicionar('Juan Esteban', 'Colina Tovar', NULL, 'Calle 123 #54-90', 4);

/*La cajera consulta que los datos se hayan guardado en el sistema*/
VARIABLE rc1 REFCURSOR;
EXECUTE PK_CAJERO.clienteConsultar(4, :rc1);
PRINT rc1;
VARIABLE rc2 REFCURSOR;
EXECUTE PK_CAJERO.clienteConsultar(5, :rc2);
PRINT rc2;
VARIABLE rc3 REFCURSOR;
EXECUTE PK_CAJERO.clienteConsultar(6, :rc3);
PRINT rc3;

/*Juan Esteban indica que dio mal algunos datos y la cajera los corrige*/
EXECUTE PK_CAJERO.clienteModificar(4, 'Juan Esteban', 'Colina Tovar', 3215783349, 'Calle 123 #80 - 66');
EXECUTE PK_CAJERO.clienteModificar(4, 'Angie Tatiana', 'Colina', NULL, 'Calle 123 #80 - 66');
EXECUTE PK_CAJERO.clienteModificar(4, 'Daniel Alberto', 'Colina', NULL, 'Calle 123 #80 - 66');

/*La cajera consulta nuevamente los datos para verificar que haya guardado bien los datos*/
VARIABLE rc4 REFCURSOR;
EXECUTE PK_CAJERO.clienteConsultar(4, :rc4);
PRINT rc4;
VARIABLE rc5 REFCURSOR;
EXECUTE PK_CAJERO.clienteConsultar(5, :rc5);
PRINT rc5;
VARIABLE rc6 REFCURSOR;
EXECUTE PK_CAJERO.clienteConsultar(6, :rc6);
PRINT rc6;

/*El mesero les muestra los precios de los productos*/
VARIABLE rc7 REFCURSOR;
EXECUTE PK_CAJERO.preciosProductos(:rc7);
PRINT rc7;

/*El mesero los atiende y los tres deciden pedir la salchipapa Apocaliptica con una bebida natural. Procede a registrar el pedido*/
EXECUTE PK_CAJERO.pedidoAdicionar('Pendiente', 34000, 4);

/*Luego de que Daniel encargara mas queso en la salchipapa, el mesero tuvo que modificar el pedido*/
EXECUTE PK_CAJERO.pedidoModificar(4, 'En camino', 40000);

/*El mesero consulta que se haya modificado correctamente el pedido*/
VARIABLE rc8 REFCURSOR;
EXECUTE PK_CAJERO.pedidoConsultar(4, :rc8);
PRINT rc8;

/*Luego de comer, la cajera generó la factura*/
EXECUTE PK_CAJERO.facturaAdicionar('Carrera 8 7 26', 'Pagada', NULL, 18000, 1, 1);

/*La cajera se dio cuenta de que habia generado la factura de otro cliente entonces la borró y genero una nueva factura para luego consultarla*/
EXECUTE PK_CAJERO.facturaEliminar('A2026-05-000001');
EXECUTE PK_CAJERO.facturaAdicionar('Calle 123 #80 - 66','Emitida', 25000, 40000, 4, 4);
VARIABLE rc9 REFCURSOR;
EXECUTE PK_CAJERO.facturaConsultar('A2026-05-000004', :rc9);
PRINT rc9;

/*Juan Esteban procede a hacer el pago*/
EXECUTE PK_CAJERO.pagoAdicionar(4, 'A2026-05-000004', 'Tarjeta de crédito', 'Aceptado');

/*La cajera consulta el pago de Juan y revisa la generosa factura*/
VARIABLE rc10 REFCURSOR;
EXECUTE PK_CAJERO.pagoConsultar('A2026-05-000004', :rc10);
PRINT rc10;

/*Al cerrar el turno, el gerente revisa los productos mas apetecidos y las sugerencias para saber que hay que mejorar*/
VARIABLE rc11 REFCURSOR;
EXECUTE PK_GERENTE.productosMasApetecidos(:rc11);
PRINT rc11;
VARIABLE rc12 REFCURSOR;
EXECUTE PK_GERENTE.sugerencias(:rc12);
PRINT rc12;

/*Luego, mas tarde, el administrador consultó el inventario, actualizó el stock de la salchipapa Apocaliptica (de 10 a 30) y miró la informacion del personal de turno*/
VARIABLE rc13 REFCURSOR;
EXECUTE PK_ADMINISTRADOR.productoConsultar(3, :rc13);
PRINT rc13;
EXECUTE PK_ADMINISTRADOR.productoModificar(3,'Apocaliptica',22000,'Meteoritos de papa y salchicha sobre papas bañadas en queso',30,1);
VARIABLE rc14 REFCURSOR
EXECUTE PK_ADMINISTRADOR.empleadoConsultar(4, :rc14);
PRINT rc14;


/*Prueba de aceptación 2*/

/*La cajera registra a Camilo y a Daniela*/
EXECUTE PK_CAJERO.clienteAdicionar('Camilo', 'Ríos', 3127709832, 'Avenida Caracas 22 - 90', 2)
EXECUTE PK_CAJERO.clienteAdicionar('Daniela', 'Peña', 3215475109, 'Calle 189 #12A 19', 2)

/*La cajera valida que se hayan registrado y les muestra el menú*/
VARIABLE rc15 REFCURSOR;
EXECUTE PK_CAJERO.consultarCliente(7, :rc15);
PRINT rc15;
VARIABLE rc16 REFCURSOR;
EXECUTE PK_CAJERO.consultarCliente(8, :rc16);
PRINT rc16;

VARIABLE rc17 REFCURSOR;
EXECUTE PK_CAJERO.preciosProductos(rc17);
PRINT rc17;

/*El mesero registra el pedido: una salchipapa La Demoníaca y una cocacola*/
EXECUTE PK_CAJERO.pedidoAdicionar('Pendiente', 26000, 7);

/*Verifica que la orden haya sido registrada correctamente*/
VARIABLE rc18 REFCURSOR;
EXECUTE PK_CAJERO.pedidoConsultar(5, :rc18);
PRINT rc18;

/*La cajera cambia el numero de telefono de Camilo*/
EXECUTE PK_CAJERO.clienteModificar(7, 'Camilo', 'Ríos', 3135709832, 'Avenida Caracas 22 - 90');

/*Verifica que el cambio se haya guardado correctamente*/
VARIABLE rc19 REFCURSOR;
EXECUTE PK_CAJERO.clienteConsultar(7, :rc19);
PRINT rc19;

/*La cajera procede a generar la factura*/
EXECUTE PK_CAJERO.facturaAdicionar('Avenida Caracas 22 - 90', 'Emitida', 7000, 26000, 7, 5);

/*Verifica que haya generado bien la factura*/
VARIABLE rc20 REFCURSOR;
EXECUTE PK_CAJERO.facturaConsultar('A2026-05-000005', :rc20);
PRINT rc20;

/*Se registra el pago del pedido exitosamente*/
EXECUTE PK_CAJERO.pagoAdicionar(7, 'A2026-05-000005', 'Efectivo', 'Aceptado');

/*La cajera revisa que el pago se vea reflejado en el sistema*/
VARIABLE rc21;
EXECUTE PK_CAJERO.pagoConsultar('A2026-05-000005', :rc21);
PRINT rc21;

/*La cajera registra a Rodrigo*/
EXECUTE PK_CAJERO.clienteAdicionar('Rodrigo', 'Bermúdez', 3218394563, 'Centro comercial Santafe', 1);

/*Revisa que se haya registrado exitosamente*/
VARIABLE rc22 REFCURSOR;
EXECUTE PK_CAJERO.clienteConsultar(9, :rc22);
PRINT rc22;

/*El mesero registra el pedido de Rodrigo: La Nuclear Clásica y un jugo hit*/
EXECUTE PK_CAJERO.pedidoAdicionar('Pendiente', 17000, 9);

/*Antes de verificar si lo habia registrado correctamente, el mesero tuvo que corregirlo*/
