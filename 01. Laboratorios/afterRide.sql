/* afterRide
* Autores: Juan Jose Perez, Cristian Camilo Ortiz
*/

/*Tablas*/
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
    razonSocial VARCHAR(30) NOT NULL,
    personaId NUMBER(15) NOT NULL);
    
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
    periodicidad VARCHAR(20) NOT NULL); /*Revisar tipo periodicidad*/
    
CREATE TABLE Punto(
    orden NUMBER(2) NOT NULL,
    nombre VARCHAR(10) NOT NULL,
    tipo CHAR(1) NOT NULL,
    distancia NUMBER(8,2) NOT NULL,
    tiempoLimite NUMBER(9) NOT NULL,
    codigo VARCHAR(20) NOT NULL); /*Revisar tipo periodicidad*/
    
CREATE TABLE PropiedadDe(
    id NUMBER(5) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    porcentaje NUMBER(3) NOT NULL);  /*Revisar tipo porcentaje*/
    
CREATE TABLE Segmento(
    nombre VARCHAR(10) NOT NULL,
    tipo CHAR(1) NOT NULL,
    ordenInicio NUMBER(2) NOT NULL,
    ordenFin NUMBER(2) NOT NULL);
    
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
    foto VARCHAR(50) NOT NULL,
    numeroRegistro NUMBER(5) NOT NULL);
    
CREATE TABLE Encuesta(
    id NUMBER(5) NOT NULL,
    criterio VARCHAR(20) NOT NULL,
    presupuesto NUMBER(30) NOT NULL,
    valorIncentivo NUMBER(30) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL);
    
CREATE TABLE Evaluacion(
    id NUMBER(5) NOT NULL,
    fechaExacta DATE NOT NULL,
    autor VARCHAR(30) NOT NULL,
    bienEvaluado VARCHAR(50) NOT NULL,
    puntuacion NUMBER(1),
    encuestaId NUMBER(5),
    participanteId NUMBER(5));
    
CREATE TABLE Comentario(
    id NUMBER(5) NOT NULL,
    contenido VARCHAR(300) NOT NULL,
    idEvaluacion NUMBER(5));

/* PoblarOK */

INSERT INTO Participante(id, idt, idn, pais, correo) VALUES (12345, 'CC', 111111111111839, 'CHILE', 'mandarina_podrida2@outlook.es');
INSERT INTO Participante(id, idt, idn, pais, correo) VALUES (87999, 'CC', 1076741066, 'COLOMBIA', 'scamilo027@gmail.com');
INSERT INTO Participante(id, idt, idn, pais, correo) VALUES (85733, 'CC', 123498757683922, 'COLOMBIA', 'juanpereztorres874@gmail.com');

INSERT INTO Persona(participanteId, nombre) VALUES (12345, 'Valeria Caballero Galvis');
INSERT INTO Persona(participanteId, nombre) VALUES(87999, 'Cristian Camilo Ortiz Sanchez');
INSERT INTO Persona(participanteId, nombre) VALUES(85733, 'Juan Jose Perez Torres');

INSERT INTO Empresa(participanteId, razonSocial, personaId) VALUES (12345, 'BAVARIA CIA S.C.A.', 12345);
INSERT INTO Empresa(participanteId, razonSocial, personaId) VALUES (87999, 'Nu Colombia S.A.', 87999);
INSERT INTO Empresa(participanteId, razonSocial, personaId) VALUES (85733, 'Red Bull Colombia S.A.S.', 85733);

INSERT INTO Ciclista(participanteId, nacimiento, categoria) VALUES (12345, DATE '1987-12-20', 2);
INSERT INTO Ciclista(participanteId, nacimiento, categoria) VALUES (87999, DATE '2007-09-24', 2);
INSERT INTO Ciclista(participanteId, nacimiento, categoria) VALUES (85733, DATE '2001-01-07', 5);

INSERT INTO EsOrganizador(participanteId, versionNombre) VALUES (85733, 'Coco');
INSERT INTO EsOrganizador(participanteId, versionNombre) VALUES (12345, 'Aloja');
INSERT INTO EsOrganizador(participanteId, versionNombre) VALUES (87999, 'Coco');

INSERT INTO Participa(ciclistaId, versionNombre) VALUES (12345, 'Aloja');
INSERT INTO Participa(ciclistaId, versionNombre) VALUES(85733, 'Campo');
INSERT INTO Participa(ciclistaId, versionNombre) VALUES(87999, 'Coco');

INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES ('LK92KJDH475829301LQW', 'Vuelta Libertadores', 'COLOMBIA', 2, 5); /*Revisar tipo periodicidad*/
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES('AHSGW627384HTTRYENVM', 'Vuelta del Sancocho', 'COLOMBIA', 2, 5); /*Revisar tipo periodicidad*/
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES('A6H29GDK3B7WEBVF7WBQ', 'Giro de la ECI', 'COLOMBIA', 5, 5); /*Revisar tipo periodicidad*/
       
INSERT INTO Punto(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (15, 'AltoAguila', 'C', 14.82, 54, 'LK92KJDH475829301LQW');
INSERT INTO Punto(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (32, 'PuntoRojo', 'M', 21.01, 95, 'AHSGW627384HTTRYENVM');
INSERT INTO Punto(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (22, 'Laguna', 'A', 17.54, 77, 'A6H29GDK3B7WEBVF7WBQ');

INSERT INTO PropiedadDe(id, codigo, porcentaje) VALUES (12345, 'LK92KJDH475829301LQW', 20);
INSERT INTO PropiedadDe(id, codigo, porcentaje) VALUES (87999, 'LK92KJDH475829301LQW', 50);
INSERT INTO PropiedadDe(id, codigo, porcentaje) VALUES (85733, 'A6H29GDK3B7WEBVF7WBQ', 25);  /*Revisar tipo porcentaje*/

INSERT INTO Segmento(nombre, tipo, ordenInicio, ordenFin) VALUES ('Arroyo', 'M', 15, 32);
INSERT INTO Segmento(nombre, tipo, ordenInicio, ordenFin) VALUES ('Acantilado', 'M', 32, 22);
INSERT INTO Segmento(nombre, tipo, ordenInicio, ordenFin) VALUES ('HotWheels', 'C', 15, 22);

INSERT INTO Version(nombre, fecha, codigo) VALUES ('Coco',  DATE '2026-03-02', 'LK92KJDH475829301LQW');
INSERT INTO Version(nombre, fecha, codigo) VALUES ('Aloja',  DATE '2026-11-01', 'AHSGW627384HTTRYENVM');
INSERT INTO Version(nombre, fecha, codigo) VALUES ('Campo',  DATE '2026-03-07', 'A6H29GDK3B7WEBVF7WBQ');

INSERT INTO Contiene(versionNombre, segmentoNombre) VALUES ('Coco', 'HotWheels');
INSERT INTO Contiene(versionNombre, segmentoNombre) VALUES ('Aloja', 'Acantilado');
INSERT INTO Contiene(versionNombre, segmentoNombre) VALUES ('Campo', 'Arroyo');

INSERT INTO Registro(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) VALUES (72811, DATE '2025-12-01', 15, 2304, 'Falta poner revision', 'M', 'potente', 12345, 'Aloja', 'Acantilado');
INSERT INTO Registro(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) VALUES (28761, DATE '2026-01-02', 10, 556, 'Falta poner revision', 'M', 'Facilisimo Verdad?', 85733, 'Aloja', 'Acantilado'); /*Revisar tiempo y tipo duración*/
INSERT INTO Registro(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) VALUES (87999, DATE '2026-02-19', 20, 2473, 'Falta poner revision', 'M', 'Estoy re-cansado', 87999, 'Campo', 'Arroyo');

INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.ciclismo-pro-ataque-montana.gif', 72811);
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.documentacion-tecnica-perfil-etapa.pdf', 28761);
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.sucesor-de-nairo-quintana.pdf', 87999);

INSERT INTO Encuesta(id, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (76525, 'atencion', 250000, 60000, DATE '2026-03-11', DATE '2026-03-15');
INSERT INTO Encuesta(id, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (17293, 'tiempo de espera', 480000, 120000, DATE '2026-03-11', DATE '2026-03-15');
INSERT INTO Encuesta(id, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (99271, 'calidad percibida', 340000, 70000, DATE '2026-04-20', DATE '2026-04-24');
       
INSERT INTO Evaluacion(id, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (75888, DATE '2026-03-11', 'Carlos', 'NOC', 4, 76525, 12345);
INSERT INTO Evaluacion(id, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (90182, DATE '2026-03-11', 'Sofia', 'NOC', 2, 17293, 85733);
INSERT INTO Evaluacion(id, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (12571, DATE '2026-03-11', 'Esteban', 'NOC', 3, 99271, 87999);
       
INSERT INTO Comentario(id, contenido, idEvaluacion) VALUES (43281, 'Demasiado exótico.',75888);
INSERT INTO Comentario(id, contenido, idEvaluacion) VALUES (81623, 'Awesome', 90182);
INSERT INTO Comentario(id, contenido, idEvaluacion) VALUES (15120, 'Fantastic', 12571);

/*PoblarNoOK 2)*/

/*Caso 1: Se va a verificar que el tipo de dato de los id sea de tipo NUMBER y no VARCHAR. (SQL Error: ORA-01722: invalid number)
Caso 2: Se va a validar que la cantidad de datos solicitados de una tabla, corresponda a la cantidad de datos ingresados. (SQL Error: ORA-00913: too many values)
Caso 3: Se va a validar que el ‘participanteId’ de Persona no sea mayor a 15 caracteres. (SQL Error: ORA-01438: value larger than specified precision allowed for this column)*/

/*
INSERT INTO Comentario(id, contenido, idEvaluacion) VALUES ('unodostres', 'Demasiado exótico', 'sietecincoocho');
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.sucesor-de-nairo-quintana.pdf', 87999, 'Hola');
INSERT INTO Persona(participanteId, nombre) VALUES(12345678910111213141516, 'Francisco Jose de Caldas');
*/

/*PoblarNoOK 3)*/

/*Caso 1: correo donde el '@' no tiene caracteres ni antes ni después
Caso 2: carrera donde la categoría es un entero que no está en el rango entre 1 y 5 
Caso 3: Foto que no empieza por www. ni termina con .git o .pdf*/

/*
INSERT INTO Participante(id, idt, idn, pais, correo) VALUES (76456, 'CC', 80541115, 'PERU', '@');
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES ('IAUFIKJDKALFU3423IO', 'VueltaDeLosDeSistemas', 'COLOMBIA', 9, 5);
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('sucesor-de-egan-bernal', 87999);
*/

/*Primarias*/

ALTER TABLE Participante
ADD CONSTRAINT PK_PARTICIPANTE PRIMARY KEY (id);

ALTER TABLE Persona
ADD CONSTRAINT PK_PERSONA PRIMARY KEY (participanteId); 

ALTER TABLE Empresa
ADD CONSTRAINT PK_EMPRESA PRIMARY KEY (participanteId);

ALTER TABLE Ciclista
ADD CONSTRAINT PK_CICLISTA PRIMARY KEY (participanteId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT PK_ORGANIZADOR_DE PRIMARY KEY (participanteId, versionNombre);

ALTER TABLE Carrera
ADD CONSTRAINT PK_CARRERA PRIMARY KEY (codigo); 

ALTER TABLE PropiedadDe
ADD CONSTRAINT PK_PROPIEDAD_DE PRIMARY KEY (id, codigo);

ALTER TABLE Punto
ADD CONSTRAINT PK_PUNTO PRIMARY KEY (orden); 

ALTER TABLE Segmento
ADD CONSTRAINT PK_SEGMENTO PRIMARY KEY (nombre); 

ALTER TABLE Version
ADD CONSTRAINT PK_VERSION PRIMARY KEY (nombre); 

ALTER TABLE Contiene
ADD CONSTRAINT PK_CONTIENE PRIMARY KEY (versionNombre, segmentoNombre);

ALTER TABLE Registro
ADD CONSTRAINT PK_REGISTRO PRIMARY KEY (numero);

ALTER TABLE Encuesta
ADD CONSTRAINT PK_ENCUESTA PRIMARY KEY (id);

ALTER TABLE Evaluacion
ADD CONSTRAINT PK_EVALUACION PRIMARY KEY (id);

ALTER TABLE Comentario
ADD CONSTRAINT PK_COMENTARIO PRIMARY KEY (id);

/*Unicas*/

ALTER TABLE Registro
ADD CONSTRAINT UK_CICLISTA_ID UNIQUE (ciclistaId);

/*Foráneas*/

ALTER TABLE Persona
ADD CONSTRAINT FK_PERSONA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participante (id);

ALTER TABLE Empresa
ADD CONSTRAINT FK_EMPRESA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participante (id);

ALTER TABLE Empresa
ADD CONSTRAINT FK_EMPRESA_PERSONAID FOREIGN KEY (personaId) REFERENCES Persona (participanteId);

ALTER TABLE Ciclista
ADD CONSTRAINT FK_CICLISTA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Persona (participanteId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT FK_ES_ORGANIZADOR_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participante (id);

ALTER TABLE EsOrganizador
ADD CONSTRAINT FK_ES_ORGANIZADOR_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Version (nombre);

ALTER TABLE Participa
ADD CONSTRAINT FK_PARTICIPA_PARTICIPANTEID FOREIGN KEY (ciclistaId) REFERENCES Participante (id);

ALTER TABLE Participa
ADD CONSTRAINT FK_PARTICIPA_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Version (nombre);

ALTER TABLE PropiedadDe
ADD CONSTRAINT FK_PROPIEDADDE_PARTICIPANTE FOREIGN KEY (id) REFERENCES Participante (id);

ALTER TABLE PropiedadDe
ADD CONSTRAINT FK_PROPIEDADDE_CARRERA FOREIGN KEY (codigo) REFERENCES Carrera (codigo);

ALTER TABLE Punto
ADD CONSTRAINT FK_PUNTO_CARRERA FOREIGN KEY (codigo) REFERENCES Carrera (codigo);

ALTER TABLE Segmento
ADD CONSTRAINT FK_ORDENINICIO FOREIGN KEY (ordenInicio) REFERENCES Punto (orden);

ALTER TABLE Segmento
ADD CONSTRAINT FK_ORDENFIN FOREIGN KEY (ordenFin) REFERENCES Punto (orden);

ALTER TABLE Contiene
ADD CONSTRAINT FK_CONTIENE_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Version (nombre);

ALTER TABLE Contiene
ADD CONSTRAINT FK_CONTIENE_SEGMENTO_NOMBRE FOREIGN KEY (segmentoNombre) REFERENCES Segmento (nombre);

ALTER TABLE Version
ADD CONSTRAINT FK_VERSION_CODIGO FOREIGN KEY (codigo) REFERENCES Carrera (codigo);

ALTER TABLE Registro
ADD CONSTRAINT FK_CICLISTAID_PARTICIPANTEID FOREIGN KEY (ciclistaId) REFERENCES Ciclista (participanteId);

ALTER TABLE Registro
ADD CONSTRAINT FK_REGISTRO_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Version (nombre);

ALTER TABLE Registro
ADD CONSTRAINT FK_REGISTRO_SEGMENTO_NOMBRE FOREIGN KEY (segmentoNombre) REFERENCES Segmento (nombre);

ALTER TABLE Fotos
ADD CONSTRAINT FK_FOTOS_NUMERO_REGISTRO FOREIGN KEY (numeroRegistro) REFERENCES Registro (numero);

ALTER TABLE Evaluacion
ADD CONSTRAINT FK_EVALUACION_ENCUESTA_ID FOREIGN KEY (encuestaId) REFERENCES Encuesta (id);

ALTER TABLE Evaluacion
ADD CONSTRAINT FK_EVALUACION_PARTICIPANTE_ID FOREIGN KEY (participanteId) REFERENCES Participante (id);

ALTER TABLE Comentario
ADD CONSTRAINT FK_COMENTARIO_ID_EVALUACION FOREIGN KEY (idEvaluacion) REFERENCES Evaluacion (id);



/* Consultas consultadas por consultar

SELECT s.nombre, p.nombre FROM segmento s JOIN punto p
ON s.ordenInicio = p.orden AND s.ordenFin = p.orden
WHERE */


/*(CICLO 1: XTablas)*/
/*

-- Esto elimina las tablas si ya existen, evitando conflictos de integridad
DROP TABLE Comentario CASCADE CONSTRAINTS;
DROP TABLE Evaluacion CASCADE CONSTRAINTS;
DROP TABLE Encuesta CASCADE CONSTRAINTS;
DROP TABLE Fotos CASCADE CONSTRAINTS;
DROP TABLE Registro CASCADE CONSTRAINTS;
DROP TABLE Contiene CASCADE CONSTRAINTS;
DROP TABLE Version CASCADE CONSTRAINTS;
DROP TABLE Segmento CASCADE CONSTRAINTS;
DROP TABLE PropiedadDe CASCADE CONSTRAINTS;
DROP TABLE Punto CASCADE CONSTRAINTS;
DROP TABLE Carrera CASCADE CONSTRAINTS;
DROP TABLE Participa CASCADE CONSTRAINTS;
DROP TABLE EsOrganizador CASCADE CONSTRAINTS;
DROP TABLE Ciclista CASCADE CONSTRAINTS;
DROP TABLE Empresa CASCADE CONSTRAINTS;
DROP TABLE Persona CASCADE CONSTRAINTS;
DROP TABLE Participante CASCADE CONSTRAINTS;

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
DROP TABLE Comentario;*/