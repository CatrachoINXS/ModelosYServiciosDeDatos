/* afterRide
* Autores: Juan Jose Perez, Cristian Camilo Ortiz
*/

/*(CICLO 1: Tablas)*/
CREATE TABLE Participante(
    id NUMBER(5) NOT NULL,
    idt CHAR(2) NOT NULL,
    idn NUMBER(15) NOT NULL,
    pais VARCHAR(15) NOT NULL,
    correo VARCHAR(30) NOT NULL);
    
CREATE TABLE Persona(
    participanteId NUMBER(15) NOT NULL,
    nombre VARCHAR(30) NOT NULL);
    
CREATE TABLE Empresa(
    participanteId NUMBER(15) NOT NULL,
    razonSocial VARCHAR(30) NOT NULL);
    
CREATE TABLE Ciclista(
    participanteId NUMBER(15) NOT NULL,
    nacimiento DATE NOT NULL,
    categoria NUMBER(1) NOT NULL);
    
CREATE TABLE EsOrganizador(
    participanteId NUMBER(15) NOT NULL,
    versionNombre VARCHAR(5) NOT NULL);
    
CREATE TABLE Participa(
    ciclistaId NUMBER(15) NOT NULL,
    versionNombre VARCHAR(5) NOT NULL);
    
CREATE TABLE Carrera(
    codigo VARCHAR(20) NOT NULL,
    nombre VARCHAR(30) NOT NULL,
    pais VARCHAR(15) NOT NULL,
    categoria NUMBER(1) NOT NULL,
    periodicidad VARCHAR NOT NULL); /*Revisar tipo periodicidad*/
    
CREATE TABLE Punto(
    codigo VARCHAR(20) NOT NULL,
    orden NUMBER(2) NOT NULL,
    nombre VARCHAR(10) NOT NULL,
    tipo CHAR(1) NOT NULL,
    distancia NUMBER(8,2) NOT NULL,
    tiempoLimite NUMBER(9) NOT NULL); /*Revisar tipo periodicidad*/
    
CREATE TABLE PropiedadDe(
    id NUMBER(5) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    porcentaje NUMBER(3) NOT NULL);  /*Revisar tipo porcentaje*/
    
CREATE TABLE Segmento(
    nombre VARCHAR(10) NOT NULL,
    tipo CHAR(1) NOT NULL,
    puntoId VARCHAR(20) NOT NULL);
    
CREATE TABLE Version(
    nombre VARCHAR(5) NOT NULL,
    fecha DATE NOT NULL,
    codigo VARCHAR(20) NOT NULL);
    
CREATE TABLE Contiene(
    versionNombre VARCHAR(5) NOT NULL,
    segmentoNombre VARCHAR(10) NOT NULL);
    
/*Hasta aquí llegué, revisar los tipos de las tablas definidas
y completar lo que falte de registro, tambien de encuesta, evaluacion
y comentario. Revisar también el modelo lógico porque foto puede ser
tabla (tiene multiplicidad).
*/
    
CREATE TABLE Registro(
    numero NUMBER(5) NOT NULL,
    fecha DATE NOT NULL,
    tiempo NUMBER(9) NOT NULL,
    posicion NUMBER(5) NOT NULL,
    revision VARCHAR,    /*Revisar*/
    dificultad VARCHAR(1) NOT NULL,
    fotos,
    comentario,
    ciclistaId,
    versionNombre VARCHAR(5) NOT NULL,
    segmentoNombre VARCHAR(10) NOT NULL);
    
/*(CICLO 1: XTablas)*/


/*Crear tablas */
INSERT INTO Encuesta
VALUES (),
    (),
    ();

INSERT INTO Evaluacion
VALUES (),
    (),
    ();

INSERT INTO Comentario
VALUES (),
    (),
    ();

INSERT INTO Ciclista
VALUES (),
    (),
    ();

INSERT INTO Persona
VALUES (),
    (),
    ();

INSERT INTO Participante
VALUES (),
    (),
    ();

INSERT INTO Empresa
VALUES (),
    (),
    ();

INSERT INTO EsOrganizador
VALUES (),
    (),
    ();

INSERT INTO Participa
VALUES (),
    (),
    ();

INSERT INTO Registro
VALUES (),
    (),
    ();

INSERT INTO Fotos
VALUES (),
    (),
    ();

INSERT INTO PropiedadDe
VALUES (),
    (),
    ();

INSERT INTO Punto
VALUES (),
    (),
    ();

INSERT INTO Carrera
VALUES (),
    (),
    ();

INSERT INTO Version
VALUES (),
    (),
    ();

INSERT INTO Contiene
VALUES (),
    (),
    ();

INSERT INTO Segmento
VALUES (),
    (),
    ();
