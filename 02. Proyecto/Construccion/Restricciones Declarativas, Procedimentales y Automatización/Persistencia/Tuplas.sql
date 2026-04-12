/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-04-11
Descripción: Creacción de restricciones de tupla CICLO1
*/

/*La propina no puede ser mayor al 20 porciento del costo total*/
ALTER TABLE Facturas ADD CONSTRAINT CK_PROPINA_REAL
CHECK (NOT(propina > 0.20 * precio));