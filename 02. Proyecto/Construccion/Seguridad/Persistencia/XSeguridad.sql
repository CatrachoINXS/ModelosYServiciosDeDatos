/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-05-05
Descripción: Eliminación de paquetes de actores, roles y permisos. CICLO1
*/

DROP USER cajero1 CASCADE;
DROP USER administrador1 CASCADE;
DROP USER gerente CASCADE;

DROP ROLE role_cajero;
DROP ROLE role_administrador;
DROP ROLE role_gerente;