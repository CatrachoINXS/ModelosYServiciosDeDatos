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
    
CREATE TABLE Registro(
    numero NUMBER(5) NOT NULL,
    fecha DATE NOT NULL,
    tiempo NUMBER(9) NOT NULL,
    posicion NUMBER(5) NOT NULL,
    revision VARCHAR(50),
    dificultad VARCHAR(1) NOT NULL,
    comentario VARCHAR(20),
    ciclistaId NUMBER(15) NOT NULL,
    versionNombre VARCHAR(5) NOT NULL,
    segmentoNombre VARCHAR(10) NOT NULL);
    
CREATE TABLE Fotos(
    numero NUMBER(5) NOT NULL,
    foto VARCHAR(50) NOT NULL);
    
CREATE TABLE Encuesta(
    id NUMBER(5) NOT NULL,
    criterio VARCHAR(20) NOT NULL,
    presupuesto NUMBER(50) NOT NULL,
    valorIncentivo NUMBER(50) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL);
    
CREATE TABLE Evaluacion(
    id NUMBER(5) NOT NULL,
    fechaExacta DATE NOT NULL,
    autor VARCHAR NOT NULL,
    bienEvaluado VARCHAR NOT NULL,
    puntuacion NUMBER(1),
    encuestaId NUMBER(5),
    participanteId NUMBER(5));
    
CREATE TABLE Comentario(
    id NUMBER(5) NOT NULL,
    contenido VARCHAR(300) NOT NULL,
    idEvaluacion NUMBER(5));
    
/*(CICLO 1: XTablas)*/
DROP TABLE Participante;
DROP TABLE Persona;
DROP TABLE Empresa;
DROP TABLE Ciclista;
DROP TABLE EsOrganizador;
DROP TABLE Participa; 
DROP TABLE Carrera; 
DROP TABLE Punto; 
DROP TABLE PropiedadDe;  
DROP TABLE Segmento; 
DROP TABLE Version; 
DROP TABLE Contiene;
DROP TABLE Registro;
DROP TABLE Fotos;
DROP TABLE Encuesta;
DROP TABLE Evaluacion;
DROP TABLE Comentario;
