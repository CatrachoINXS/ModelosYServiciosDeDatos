/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-03-22
Descripción: Definición de claves unicas CICLO1
*/

ALTER TABLE Empleados
ADD CONSTRAINT UK_EMPLEADOS_TELEFONO UNIQUE (telefono);

ALTER TABLE Empleados
ADD CONSTRAINT UK_EMPLEADOS_CORREO UNIQUE (correo);

ALTER TABLE Domiciliarios
ADD CONSTRAINT UK_DOMICILIARIOS_PLACA_VEHICULO UNIQUE (placaVehiculo);

ALTER TABLE Clientes
ADD CONSTRAINT UK_CLIENTES_TELEFONO UNIQUE (telefono);