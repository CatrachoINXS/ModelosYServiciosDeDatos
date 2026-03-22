/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-03-22
Descripción: Definición de claves foraneas CICLO1
*/

ALTER TABLE Cajeros
ADD CONSTRAINT FK_EMPLEADO FOREIGN KEY (idEmpleado) REFERENCES Empleados (id);

ALTER TABLE Meseros
ADD CONSTRAINT FK_EMPLEADO FOREIGN KEY (idEmpleado) REFERENCES Empleados (id);

ALTER TABLE Domiciliarios
ADD CONSTRAINT FK_EMPLEADO FOREIGN KEY (idEmpleado) REFERENCES Empleados (id);



ALTER TABLE Clientes
ADD CONSTRAINT FK_MESERO FOREIGN KEY (idMesero) REFERENCES Meseros (idEmpleado);



ALTER TABLE Facturas
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idCliente) REFERENCES Clientes (id);

ALTER TABLE Facturas
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idPedido) REFERENCES Pedidos (id);

ALTER TABLE Descuentos
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idFactura) REFERENCES Facturas (id);

ALTER TABLE Paga
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idCliente) REFERENCES Clientes (id);

ALTER TABLE Paga
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idFactura) REFERENCES Facturas (id);

ALTER TABLE Pedidos
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idCliente) REFERENCES Clientes (id);

ALTER TABLE seComponeDe
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idPedido) REFERENCES Pedidos (id);

ALTER TABLE seComponeDe
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idProducto) REFERENCES Productos (id);



ALTER TABLE Productos
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idMenu) REFERENCES Menu (id);

ALTER TABLE Bebidas
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idProducto) REFERENCES Productos (id);

ALTER TABLE Salchipapas
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idProducto) REFERENCES Productos (id);

ALTER TABLE Ingredientes
ADD CONSTRAINT FK_CLIENTE FOREIGN KEY (idProducto) REFERENCES Salchiáás (idProducto);






















