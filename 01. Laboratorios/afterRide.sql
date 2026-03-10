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
VALUES (12345, 'CC', 111111111111839, 'CHILE', 'mandarina_podrida2@outlook.es'),
       (87999, 'CC', 1076741066, 'COLOMBIA', 'scamilo027@gmail.com'),
       (85733, 'CC', 123498757683922, 'COLOMBIA', 'juanpereztorres874@gmail.com');

INSERT INTO Persona(participanteId, nombre) /*Editar diagrama lógico nombres -> nombre*/
VALUES (12345, 'Valeria Caballero Galvis'),
       (87999, 'Cristian Camilo Ortiz Sanchez'),
       (85733, 'Juan Jose Perez Torres');

INSERT INTO Empresa(participanteId, razonSocial, personaId)
VALUES (23444, 'BAVARIA & CIA S.C.A.', 12345),
       (98787, 'Nu Colombia S.A.', 87999),
       (54321, 'Red Bull Colombia S.A.S.', 85733);

INSERT INTO Ciclista(participanteId, nacimiento, categoria)
VALUES (12345, DATE '1987-12-20', 2),
       (87999, DATE '2007-09-24', 2),
       (85733, DATE '2001-01-07', 5);

INSERT INTO EsOrganizador(participanteId, versionNombre)
VALUES (85733, Coco),
       (12345, Aloja),
       (87999, Coco);

INSERT INTO Participa(ciclistaId, versionNombre)
VALUES (12345, Aloja),
       (85733, Campo),
       (87999, Coco);

INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad)
VALUES ('LK92KJDH475829301LQW', 'Vuelta Libertadores', 'Colombia', 2, 5), /*Revisar tipo periodicidad*/
       ('AHSGW627384HTTRYENVM', 'Vuelta del Sancocho', 'Colombia', 2, 5), /*Revisar tipo periodicidad*/
       ('A6H29GDK3B7WEBVF7WBQ', 'Giro de la ECI', 'Colombia', 5, 5); /*Revisar tipo periodicidad*/
       
/* OJOOO!!
INSERT INTO Punto(codigo, orden, nombre, tipo, distancia, tiempoLimite)
VALUES ('A6H29GDK3B7WEBVF7WBQ', ),
       ('LK92KJDH475829301LQW', ),
       ('AHSGW627384HTTRYENVM', ); Punto debe tener un carreraId. Editar modelo lógico y editar los parámetros de la tabla.*/

INSERT INTO PropiedadDe(id, codigo, porcentaje)
VALUES (12345, 'LK92KJDH475829301LQW', 20),
       (87999, 'LK92KJDH475829301LQW', 50),
       (85733, 'A6H29GDK3B7WEBVF7WBQ', 25);  /*Revisar tipo porcentaje*/

INSERT INTO Segmento(nombre, tipo, puntoId) /*OJO QUE SEGMENTO NO ES CONCEPTO DE VERSION SINO DE CARRERA. Ajustar modelo lógico y diagrama de conceptos */
VALUES ('Arroyo', 'M', 'A6H29GDK3B7WEBVF7WBQ'),
       ('Acantilado', 'M', 'LK92KJDH475829301LQW'),
       ('HotWheels', 'C', 'AHSGW627384HTTRYENVM');

INSERT INTO Version(nombre, fecha, codigo) /*Revisar a que se refieren con version*/
VALUES ('Coco',  DATE '2026-03-02', 'LK92KJDH475829301LQW'),
       ('Aloja',  DATE '2026-11-01', 'AHSGW627384HTTRYENVM'),
       ('Campo',  DATE '2026-03-07', 'A6H29GDK3B7WEBVF7WBQ'); /*Mirar si es necesario poner el tipo de dato DATE*/

INSERT INTO Contiene(versionNombre, segmentoNombre)
VALUES ('Coco', 'HotWheels'),
       ('Aloja', 'Acantilado'),
       ('Campo', 'Arroyo');

INSERT INTO Registro(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (72811, '2025-12-01', 15, 2304, 'Falta poner revision dificultad', 'potente', 12345, 'Aloja', 'Acantilado'),
       (28761, '2026-01-02', 10, 556, 'Falta poner revision dificultad', 'chevre', 85733, 'Aloja', 'Acantilado'), /*Revisar tiempo y tipo duración*/
       (87999, '2026-02-19', 20, 2473, 'Falta poner revision dificultad', 'mala', 87999, 'Campo', 'Arroyo');

INSERT INTO Fotos(numero, foto)
VALUES (72811, foto),
       (28761, foto),
       (87999, foto);

INSERT INTO Encuesta(id, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin)
VALUES (76525, 'atencion', 250000, 60000, '2026-03-11', '2026-03-15'),
       (17293, 'tiempo de espera', 480000, 120000, '2026-03-11', '2026-03-15'),
       (99271, 'calidad percibida', 340000, 70000, '2026-04-20', '2026-04-24');
       
/*Revisar como es el tema con las evaluaciones y como se implementa en la base de datos porque puede que no sea necesario implementar bien evaluado*/
/*
INSERT INTO Evaluacion(id, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId)
VALUES (75888, '2026-03-11', 'Carlos', NOC, 4, 76525, 12345),
       (90182, '2026-03-11', 'Sofia', NOC, 2, 17293, 85733),
       (12571, '2026-03-11', 'Esteban', NOC, 3, 99271, 87999);*/
       
INSERT INTO Comentario(id, contenido, idEvaluacion)
VALUES (43281, 'Demasiado exótico.',75888),
       (81623, 'Awesome', 90182),
       (15120, 'Fantastic', 12571);
       
/*(D.	Construcción: protegiendo) */

ALTER TABLE Participante
ADD CONSTRAINT PK_PARTICIPANTE PRIMARY KEY (id);

ALTER TABLE Persona
ADD CONSTRAINT PK_PERSONA PRIMARY KEY (participanteId); 

ALTER TABLE Empresa
ADD CONSTRAINT PK_EMPRESA PRIMARY KEY (participanteId);

ALTER TABLE Ciclista
ADD CONSTRAINT PK_CICLISTA PRIMARY KEY (participanteId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT PK_ORGANIZADOR PRIMARY KEY (ciclistaId, versionNombre);

ALTER TABLE Carrera
ADD CONSTRAINT PK_CARRERA PRIMARY KEY (codigo); 

ALTER TABLE Punto
ADD CONSTRAINT PK_PUNTO PRIMARY KEY (codigo); 

ALTER TABLE PropiedadDe
ADD CONSTRAINT PK_PROPIEDADDE PRIMARY KEY (id, codigo); 

ALTER TABLE Segmento
ADD CONSTRAINT PK_SEGMENTO PRIMARY KEY (nombre); 

ALTER TABLE Version
ADD CONSTRAINT PK_VERSION PRIMARY KEY (nombre); 

ALTER TABLE Contiene
ADD CONSTRAINT PK_CONTIENE PRIMARY KEY (versionNombre, segmentoNombre);

ALTER TABLE Registro
ADD CONSTRAINT PK_REGISTRO PRIMARY KEY (numero);

ALTER TABLE Fotos
ADD CONSTRAINT PK_VERSION PRIMARY KEY (numeroRegistro);  /*CAMBIAR FOTOS PORQUE TIENE CARDINALIDAD! (En el lógico y acá, toca ponerle númeroRegistro)*/

/*FINALIZAR PRIMARY KEYS DE ENCUESTA, COMENTARIO Y EVALUACION*/
