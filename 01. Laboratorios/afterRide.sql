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

INSERT INTO Participante(id, idt, idn, pais, correo)
VALUES (12345, CC, 196734811123456, Colombia, yanpopo@gmail.com),
       (85733, CC, 123498757683922, Colombia, mandarina_podrida2@outlook.es),
       (87999, CC, 111111111111839, Chile, mat1asElmo_jo@gmail.com);

INSERT INTO Persona(participanteId, nombres)
VALUES (87999, Yanhira Alexandra Rios Churta),
       (85733, Daniela Alexandra Mora Galvis),
       (12345, Valeria Caballero Galvis);

INSERT INTO Empresa(participanteId, razonSocial, personaId)
VALUES (85733, atencion, 85733), /* Revisar lo de razon social y personaId*/
       (12345, atencion, 12345),
       (87999, atencion, 87999);

INSERT INTO Ciclista(participanteId, nacimiento, categoria)
VALUES (12345, 02/06/1998, 2),
       (87999, 17/01/2001, 2),
       (85733, 20/12/1987, 5);

INSERT INTO EsOrganizador(participanteId, versionNombre)
VALUES (85733, Coco),
       (12345, Aloja),
       (87999, Coco);

INSERT INTO Participa(ciclistId, versionNombre)
VALUES (12345, Aloja),
       (85733, Campo),
       (87999, Coco);

INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad)
VALUES (LK92KJDH475829301LQW, Amanecer, Colombia, 2, 5),
       (AHSGW627384HTTRYENVM, 'Cosecha', 'Colombia', 2, 5),
       (A6H29GDK3B7WEBVF7WBQ, 'Sancocho', 'Colombia', 5, 5);

INSERT INTO Punto(codigo, orden, nombre, tipo, distancia, tiempoLimite) /*Terminar esta parte luego*/
VALUES (LK92KJDH475829301LQW, ),

INSERT INTO PropiedadDe(id, codigo, porcentaje)
VALUES (12345, LK92KJDH475829301LQW, 20),
       (85733, LK92KJDH475829301LQW, 50),
       (87999, A6H29GDK3B7WEBVF7WBQ, 25);

INSERT INTO Segmento(nombre, tipo, puntoId)
VALUES ('Arroyo', 'M', A6H29GDK3B7WEBVF7WBQ),
       ('Acantilado', 'M', LK92KJDH475829301LQW),
       ('HotWheels', 'C', AHSGW627384HTTRYENVM);

INSERT INTO Vserion(nombre, fecha, codigo)
VALUES ('Coco', 02/03/2026, AHSGW627384HTTRYENVM),
       ('Aloja', 11/01/2026, LK92KJDH475829301LQW),
       ('Campo', 7/03/2026, A6H29GDK3B7WEBVF7WBQ);

INSERT INTO Contiene(versionNombre, segmentoNombre)
VALUES ('Coco', 'HotWheels'),
       ('Aloja', 'Acantilado'),
       ('Campo', 'Arroyo');

INSERT INTO Registro(numero, fecha, tiempo, posicion, revision dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (72811, 01/12/2025, 15, 2304, 'Falta poner revision dificultad', 'potente', 12345, 'Aloja', 'Acantilado'),
       (28761, 02/01/2026, 10, 6382, 'Falta poner revision dificultad', 'chevre', 85733, 'Aloja', 'Acantilado'),
       (87999, 19/02/2026, 20, 2473, 'Falta poner revision dificultad', 'mala', 87999, 'Campo', 'Arroyo');

INSERT INTO Fotos(numero, foto)
VALUES (72811, foto),
       (28761, foto),
       (87999, foto);

INSERT INTO Encuesta(id, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin)
VALUES (76525, 'atencion', 250000, 60000, 11/03/2026, 11/03/2026),
       (17293, 'tiempo de espera', 480000, 120000, 11/03/2026, 11/03/2026),
       (99271, 'calidad percibida', 340000, 70000, 20/04/2026, 20/04/2026);

INSERT INTO Evaluacion(id, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId)
VALUES (75888, 11/03/2026, 'Carlos', NOC, 4, 76525, 12345),
       (90182, 11/03/2026, 'Sofia', NOC, 2, 17293, 85733),
       (12571, 11/03/2026, 'Esteban', NOC, 3, 99271, 87999);

INSERT INTO Comentario(id, contenido, idEvaluacion)
VALUES (43281, 'exotico'75888),
       (81623, 'awesome', 90182),
       (15120, 'fantastic', 12571, );

