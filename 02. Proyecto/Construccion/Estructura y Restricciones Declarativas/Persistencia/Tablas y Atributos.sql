/*
SalchiTask
Autores: Juan Jose Perez Torres, Cristian Camilo Ortiz Sánchez
Fecha: 2026-03-22
Descripción: Creacion de tablas y atributos CICLO1
*/

CREATE TABLE Empleados(
    id NUMBER(5) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono NUMBER(10),
    direccionResidencia VARCHAR(100) NOT NULL,
    correo VARCHAR(30),
    EPS VARCHAR(30) NOT NULL,
    aseguradora VARCHAR(30) NOT NULL,
    salario NUMBER(20) NOT NULL,
    fechaIngreso DATE NOT NULL);
    
CREATE TABLE Cajeros(
    idEmpleado NUMBER(5) NOT NULL,
    turnoCaja VARCHAR(10) NOT NULL,
    clientesAtendidos NUMBER(5) NOT NULL);
    
CREATE TABLE Domiciliarios(
    idEmpleado NUMBER(5) NOT NULL,
    pedidosEntregados NUMBER(5) NOT NULL,
    placaVehiculo VARCHAR(6),
    disponiblidad NUMBER(1) NOT NULL);
    
CREATE TABLE Meseros(
    idEmpleado NUMBER(5) NOT NULL,
    propinas NUMBER(20) NOT NULL,
    mesasAtendidas NUMBER(5) NOT NULL);
    
CREATE TABLE Clientes(
    id NUMBER(5) NOT NULL,
    nombres VARCHAR(30) NOT NULL,
    apellidos VARCHAR(30) NOT NULL,
    telefono NUMBER(10),
    direccion VARCHAR(100) NOT NULL,
    clienteFiel NUMBER(1) NOT NULL,
    reseña VARCHAR(300),
    idMesero NUMBER(5) NOT NULL);
    
CREATE TABLE Productos(
    id NUMBER(5) NOT NULL,
    nombre VARCHAR(20) NOT NULL,
    precio NUMBER(20) NOT NULL,
    descripcion VARCHAR(300) NOT NULL,
    stock NUMBER(5) NOT NULL,
    idMenu NUMBER(5) NOT NULL);
    
CREATE TABLE Salchipapas(
    idProducto NUMBER(5) NOT NULL,
    tipoSalchipapa VARCHAR(30) NOT NULL,
    tamaño VARCHAR(10) NOT NULL);
    
CREATE TABLE Bebidas(
    idProducto NUMBER(5) NOT NULL,
    tipoBebida VARCHAR(30) NOT NULL);
    
CREATE TABLE Ingredientes(
    idProducto NUMBER(5) NOT NULL,
    ingrediente  VARCHAR(30) NOT NULL);
    
CREATE TABLE Menu(
    id NUMBER(5) NOT NULL,
    activo NUMBER(1) NOT NULL);
    
CREATE TABLE Facturas(
    id VARCHAR(15) NOT NULL,
    fechaExpedicion DATE NOT NULL,
    direccion VARCHAR(100) NOT NULL,
    estadoFactura VARCHAR(10) NOT NULL,
    propina NUMBER(20),
    precio NUMBER(20) NOT NULL,
    idCliente NUMBER(5) NOT NULL,
    idPedido NUMBER(5) NOT NULL);
    
CREATE TABLE Descuentos(
    idFactura VARCHAR(15) NOT NULL,
    descuento NUMBER(20) NOT NULL);
    
CREATE TABLE Paga(
    idCliente NUMBER(5) NOT NULL,
    idFactura VARCHAR(15) NOT NULL,
    metodoPago VARCHAR(50) NOT NULL,
    estadoPago VARCHAR(10) NOT NULL);
    
CREATE TABLE Pedidos(
    id NUMBER(5) NOT NULL,
    estado VARCHAR(10) NOT NULL,
    precio NUMBER(20) NOT NULL,
    idCliente NUMBER(5) NOT NULL);
    
CREATE TABLE SeComponenDe(
    idPedido NUMBER(5) NOT NULL,
    idProducto NUMBER(5) NOT NULL,
    cantidad NUMBER(5) NOT NULL);