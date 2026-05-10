/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-05-05
Descripción: Definición de roles y permisos CICLO1
*/

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