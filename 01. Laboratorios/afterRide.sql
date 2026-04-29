/* afterRide
* Autores: Juan Jose Perez, Cristian Camilo Ortiz
*/

/*Tablas*/
CREATE TABLE Participantes(
    pId NUMBER(5) NOT NULL,
    idt CHAR(2) NOT NULL,
    idn NUMBER(15) NOT NULL,
    pais VARCHAR(15) NOT NULL,
    correo VARCHAR(30) NOT NULL);
    
CREATE TABLE Personas(
    participanteId NUMBER(15) NOT NULL,
    nombre VARCHAR(30) NOT NULL);
    
CREATE TABLE Empresas(
    participanteId NUMBER(15) NOT NULL,
    razonSocial VARCHAR(30) NOT NULL,
    personaId NUMBER(15) NOT NULL);
    
CREATE TABLE Ciclistas(
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
    periodicidad VARCHAR(20) NOT NULL);
    
CREATE TABLE Puntos(
    orden NUMBER(2) NOT NULL,
    nombre VARCHAR(10) NOT NULL,
    tipo CHAR(1) NOT NULL,
    distancia NUMBER(8,2) NOT NULL,
    tiempoLimite NUMBER(9) NOT NULL,
    codigo VARCHAR(20) NOT NULL);
    
CREATE TABLE PropiedadDe(
    pdId NUMBER(5) NOT NULL,
    codigo VARCHAR(20) NOT NULL,
    porcentaje NUMBER(3) NOT NULL);
    
CREATE TABLE Segmentos(
    nombre VARCHAR(10) NOT NULL,
    tipo CHAR(1) NOT NULL,
    ordenInicio NUMBER(2) NOT NULL,
    ordenFin NUMBER(2) NOT NULL);
    
CREATE TABLE Versiones(
    nombre VARCHAR(5) NOT NULL,
    fecha DATE NOT NULL,
    codigo VARCHAR(20) NOT NULL);
    
CREATE TABLE Contiene(
    versionNombre VARCHAR(5) NOT NULL,
    segmentoNombre VARCHAR(10) NOT NULL);
    
CREATE TABLE Registros(
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
    
CREATE TABLE Encuestas(
    eId NUMBER(5) NOT NULL,
    criterio VARCHAR(20) NOT NULL,
    presupuesto NUMBER(30) NOT NULL,
    valorIncentivo NUMBER(30) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL);
    
CREATE TABLE Evaluaciones(
    evId NUMBER(5) NOT NULL,
    fechaExacta DATE NOT NULL,
    autor VARCHAR(30) NOT NULL,
    bienEvaluado VARCHAR(50) NOT NULL,
    puntuacion NUMBER(1),
    encuestaId NUMBER(5),
    participanteId NUMBER(5));
    
CREATE TABLE Comentarios(
    cId NUMBER(5) NOT NULL,
    contenido VARCHAR(300) NOT NULL,
    idEvaluacion NUMBER(5));


/* PoblarOK */

INSERT INTO Participantes(pId, idt, idn, pais, correo) VALUES (12345, 'CC', 111111111111839, 'CHILE', 'mandarina_podrida2@outlook.es');
INSERT INTO Participantes(pId, idt, idn, pais, correo) VALUES (87999, 'CC', 1076741066, 'COLOMBIA', 'scamilo027@gmail.com');
INSERT INTO Participantes(pId, idt, idn, pais, correo) VALUES (85733, 'CC', 123498757683922, 'COLOMBIA', 'juanpereztorres874@gmail.com');

INSERT INTO Personas(participanteId, nombre) VALUES (12345, 'Valeria Caballero Galvis');
INSERT INTO Personas(participanteId, nombre) VALUES(87999, 'Cristian Camilo Ortiz Sanchez');
INSERT INTO Personas(participanteId, nombre) VALUES(85733, 'Juan Jose Perez Torres');

INSERT INTO Empresas(participanteId, razonSocial, personaId) VALUES (12345, 'BAVARIA CIA S.C.A.', 12345);
INSERT INTO Empresas(participanteId, razonSocial, personaId) VALUES (87999, 'Nu Colombia S.A.', 87999);
INSERT INTO Empresas(participanteId, razonSocial, personaId) VALUES (85733, 'Red Bull Colombia S.A.S.', 85733);

INSERT INTO Ciclistas(participanteId, nacimiento, categoria) VALUES (12345, DATE '1987-12-20', 2);
INSERT INTO Ciclistas(participanteId, nacimiento, categoria) VALUES (87999, DATE '2007-09-24', 2);
INSERT INTO Ciclistas(participanteId, nacimiento, categoria) VALUES (85733, DATE '2001-01-07', 5);

INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES ('LK92KJDH475829301LQW', 'Vuelta Libertadores', 'COLOMBIA', 2, 5);
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES('AHSGW627384HTTRYENVM', 'Vuelta del Sancocho', 'COLOMBIA', 2, 5);
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES('A6H29GDK3B7WEBVF7WBQ', 'Giro de la ECI', 'COLOMBIA', 5, 5);

INSERT INTO Versiones(nombre, fecha, codigo) VALUES ('Coco',  DATE '2026-03-02', 'LK92KJDH475829301LQW');
INSERT INTO Versiones(nombre, fecha, codigo) VALUES ('Aloja',  DATE '2026-11-01', 'AHSGW627384HTTRYENVM');
INSERT INTO Versiones(nombre, fecha, codigo) VALUES ('Campo',  DATE '2026-03-07', 'A6H29GDK3B7WEBVF7WBQ');

INSERT INTO EsOrganizador(participanteId, versionNombre) VALUES (85733, 'Coco');
INSERT INTO EsOrganizador(participanteId, versionNombre) VALUES (12345, 'Aloja');
INSERT INTO EsOrganizador(participanteId, versionNombre) VALUES (87999, 'Coco');

INSERT INTO Participa(ciclistaId, versionNombre) VALUES (12345, 'Aloja');
INSERT INTO Participa(ciclistaId, versionNombre) VALUES(85733, 'Campo');
INSERT INTO Participa(ciclistaId, versionNombre) VALUES(87999, 'Coco');
       
INSERT INTO Puntos(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (15, 'AltoAguila', 'C', 14.82, 54, 'LK92KJDH475829301LQW');
INSERT INTO Puntos(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (32, 'PuntoRojo', 'M', 21.01, 95, 'AHSGW627384HTTRYENVM');
INSERT INTO Puntos(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (22, 'Laguna', 'A', 17.54, 77, 'A6H29GDK3B7WEBVF7WBQ');

INSERT INTO PropiedadDe(pdId, codigo, porcentaje) VALUES (12345, 'LK92KJDH475829301LQW', 20);
INSERT INTO PropiedadDe(pdId, codigo, porcentaje) VALUES (87999, 'LK92KJDH475829301LQW', 50);
INSERT INTO PropiedadDe(pdId, codigo, porcentaje) VALUES (85733, 'A6H29GDK3B7WEBVF7WBQ', 25);  /*Revisar tipo porcentaje*/

INSERT INTO Segmentos(nombre, tipo, ordenInicio, ordenFin) VALUES ('Arroyo', 'M', 15, 32);
INSERT INTO Segmentos(nombre, tipo, ordenInicio, ordenFin) VALUES ('Acantilado', 'M', 32, 22);
INSERT INTO Segmentos(nombre, tipo, ordenInicio, ordenFin) VALUES ('HotWheels', 'C', 15, 22);

INSERT INTO Contiene(versionNombre, segmentoNombre) VALUES ('Coco', 'HotWheels');
INSERT INTO Contiene(versionNombre, segmentoNombre) VALUES ('Aloja', 'Acantilado');
INSERT INTO Contiene(versionNombre, segmentoNombre) VALUES ('Campo', 'Arroyo');

INSERT INTO Registros(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) VALUES (72811, DATE '2025-12-01', 15, 2304, 'Falta poner revision', 'M', 'potente', 12345, 'Aloja', 'Acantilado');
INSERT INTO Registros(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) VALUES (28761, DATE '2026-01-02', 10, 556, 'Falta poner revision', 'M', 'Facilisimo Verdad?', 85733, 'Campo', 'Acantilado');
INSERT INTO Registros(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) VALUES (87999, DATE '2026-02-19', 20, 2473, 'Falta poner revision', 'M', 'Estoy re-cansado', 87999, 'Coco', 'Arroyo');

INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.ciclismo-pro-ataque-montana.gif', 72811);
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.documentacion-tecnica-perfil-etapa.pdf', 28761);
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.sucesor-de-nairo-quintana.pdf', 87999);

INSERT INTO Encuestas(eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (76525, 'atencion', 250000, 60000, DATE '2026-03-11', DATE '2026-03-15');
INSERT INTO Encuestas(eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (17293, 'tiempo de espera', 480000, 120000, DATE '2026-03-11', DATE '2026-03-15');
INSERT INTO Encuestas(eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (99271, 'calidad percibida', 340000, 70000, DATE '2026-04-20', DATE '2026-04-24');
       
INSERT INTO Evaluaciones(evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (75888, DATE '2026-03-11', 'Carlos', 'NOC', 4, 76525, 12345);
INSERT INTO Evaluaciones(evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (90182, DATE '2026-03-11', 'Sofia', 'NOC', 2, 17293, 85733);
INSERT INTO Evaluaciones(evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (12571, DATE '2026-03-11', 'Esteban', 'NOC', 3, 99271, 87999);
       
INSERT INTO Comentarios(cId, contenido, idEvaluacion) VALUES (43281, 'Demasiado exótico.',75888);
INSERT INTO Comentarios(cId, contenido, idEvaluacion) VALUES (81623, 'Awesome', 90182);
INSERT INTO Comentarios(cId, contenido, idEvaluacion) VALUES (15120, 'Fantastic', 12571);


/*PoblarNoOK 2)*/

/*Caso 1: Se va a verificar que el tipo de dato de los id sea NUMBER y no VARCHAR. 
    (SQL Error: ORA-01722: invalid number)*/
INSERT INTO Comentarios(cId, contenido, idEvaluacion) VALUES ('unodostres', 'Demasiado exótico', 'sietecincoocho'); 
    
/*Caso 2: Se va a validar que la cantidad de datos solicitados de una tabla, corresponda a la cantidad de datos ingresados.
    (SQL Error: ORA-00913: too many values)*/
INSERT INTO Participantes(pId, idt, idn, pais, correo) VALUES (12345, 'CC', 111111111111839, 'CHILE', 'mandarina_podrida2@outlook.es', 'mandarina_podrida2@outlook.es');
    
/*Caso 3: Se va a validar que el ‘participanteId’ de Personas no sea mayor a 15 caracteres. 
    (SQL Error: ORA-01438: value larger than specified precision allowed for this column)*/
INSERT INTO Personas(participanteId, nombre) VALUES(12345678910111213141516, 'Francisco Jose de Caldas');


/*PoblarNoOK 3)*/

-- Caso 1: correo donde el '@' no tiene caracteres ni antes ni después
INSERT INTO Participantes(pId, idt, idn, pais, correo) VALUES (76456, 'CC', 80541115, 'PERU', '@');

-- Caso 2: carrera donde la categoría es un entero que no está en el rango entre 1 y 5
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES ('IAUFIKJDKALFU3423IO', 'VueltaDeLosDeSistemas', 'COLOMBIA', 9, 5);

-- Caso 3: Foto que no empieza por www. ni termina con .git o .pdf*/
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('sucesor-de-egan-bernal', 87999);


/*Primarias*/

ALTER TABLE Participantes
ADD CONSTRAINT PK_PARTICIPANTE PRIMARY KEY (pId);

ALTER TABLE Personas
ADD CONSTRAINT PK_PERSONA PRIMARY KEY (participanteId); 

ALTER TABLE Empresas
ADD CONSTRAINT PK_EMPRESA PRIMARY KEY (participanteId);

ALTER TABLE Ciclistas
ADD CONSTRAINT PK_CICLISTA PRIMARY KEY (participanteId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT PK_ORGANIZADOR_DE PRIMARY KEY (participanteId, versionNombre);

ALTER TABLE Participa
ADD CONSTRAINT PK_PARTICIPA PRIMARY KEY (ciclistaId, versionNombre);

ALTER TABLE Carrera
ADD CONSTRAINT PK_CARRERA PRIMARY KEY (codigo); 

ALTER TABLE PropiedadDe
ADD CONSTRAINT PK_PROPIEDAD_DE PRIMARY KEY (pdId, codigo);

ALTER TABLE Puntos
ADD CONSTRAINT PK_PUNTO PRIMARY KEY (orden); 

ALTER TABLE Segmentos
ADD CONSTRAINT PK_SEGMENTO PRIMARY KEY (nombre); 

ALTER TABLE Versiones
ADD CONSTRAINT PK_VERSION PRIMARY KEY (nombre); 

ALTER TABLE Contiene
ADD CONSTRAINT PK_CONTIENE PRIMARY KEY (versionNombre, segmentoNombre);

ALTER TABLE Registros
ADD CONSTRAINT PK_REGISTRO PRIMARY KEY (numero);

ALTER TABLE Encuestas
ADD CONSTRAINT PK_ENCUESTA PRIMARY KEY (eId);

ALTER TABLE Evaluaciones
ADD CONSTRAINT PK_EVALUACION PRIMARY KEY (evId);

ALTER TABLE Comentarios
ADD CONSTRAINT PK_COMENTARIO PRIMARY KEY (cId);

/*Unicas*/

ALTER TABLE Registros
ADD CONSTRAINT UK_REGISTRO UNIQUE (comentario);

/*Foráneas*/

ALTER TABLE Personas
ADD CONSTRAINT FK_PERSONA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participantes (pId);

ALTER TABLE Empresas
ADD CONSTRAINT FK_EMPRESA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participantes (pId);

ALTER TABLE Empresas
ADD CONSTRAINT FK_EMPRESA_PERSONAID FOREIGN KEY (personaId) REFERENCES Personas (participanteId);

ALTER TABLE Ciclistas
ADD CONSTRAINT FK_CICLISTA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Personas (participanteId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT FK_ES_ORGANIZADOR_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participantes (pId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT FK_ES_ORGANIZADOR_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Versiones (nombre);

ALTER TABLE Participa
ADD CONSTRAINT FK_PARTICIPA_PARTICIPANTEID FOREIGN KEY (ciclistaId) REFERENCES Participantes (pId);

ALTER TABLE Participa
ADD CONSTRAINT FK_PARTICIPA_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Versiones (nombre);

ALTER TABLE PropiedadDe
ADD CONSTRAINT FK_PROPIEDADDE_PARTICIPANTE FOREIGN KEY (pdId) REFERENCES Participantes (pId);

ALTER TABLE PropiedadDe
ADD CONSTRAINT FK_PROPIEDADDE_CARRERA FOREIGN KEY (codigo) REFERENCES Carrera (codigo);

ALTER TABLE Puntos
ADD CONSTRAINT FK_PUNTO_CARRERA FOREIGN KEY (codigo) REFERENCES Carrera (codigo);

ALTER TABLE Segmentos
ADD CONSTRAINT FK_ORDENINICIO FOREIGN KEY (ordenInicio) REFERENCES Puntos (orden);

ALTER TABLE Segmentos
ADD CONSTRAINT FK_ORDENFIN FOREIGN KEY (ordenFin) REFERENCES Puntos (orden);

ALTER TABLE Contiene
ADD CONSTRAINT FK_CONTIENE_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Versiones (nombre);

ALTER TABLE Contiene
ADD CONSTRAINT FK_CONTIENE_SEGMENTO_NOMBRE FOREIGN KEY (segmentoNombre) REFERENCES Segmentos (nombre);

ALTER TABLE Versiones
ADD CONSTRAINT FK_VERSION_CODIGO FOREIGN KEY (codigo) REFERENCES Carrera (codigo);

ALTER TABLE Registros
ADD CONSTRAINT FK_CICLISTAID_PARTICIPANTEID FOREIGN KEY (ciclistaId) REFERENCES Ciclistas (participanteId);

ALTER TABLE Registros
ADD CONSTRAINT FK_REGISTRO_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Versiones (nombre);

ALTER TABLE Registros
ADD CONSTRAINT FK_REGISTRO_SEGMENTO_NOMBRE FOREIGN KEY (segmentoNombre) REFERENCES Segmentos (nombre);

ALTER TABLE Fotos
ADD CONSTRAINT FK_FOTOS_NUMERO_REGISTRO FOREIGN KEY (numeroRegistro) REFERENCES Registros (numero);

ALTER TABLE Evaluaciones
ADD CONSTRAINT FK_EVALUACION_ENCUESTA_ID FOREIGN KEY (encuestaId) REFERENCES Encuestas (eId);

ALTER TABLE Evaluaciones
ADD CONSTRAINT FK_EVALUACION_PARTICIPANTE_ID FOREIGN KEY (participanteId) REFERENCES Participantes (pId);

ALTER TABLE Comentarios
ADD CONSTRAINT FK_COMENTARIO_ID_EVALUACION FOREIGN KEY (idEvaluacion) REFERENCES Evaluaciones (evId);


-- Segunda parte de PoblarNoOK2)

/*Caso 1: Se va a verificar que una persona no se duplique. 
    (SQL Error: ORA-00001: unique constraint (BD1000105286.PK_PERSONA) violated)*/
INSERT INTO Personas(participanteId, nombre) VALUES(87999, 'Cristian Camilo Ortiz Sanchez');
    
/*Caso 2: Se va a validar que un id no pueda ser NULL.
    (SQL Error: ORA-01400: cannot insert NULL into ("BD1000105286"."PARTICIPANTE"."ID"))*/
INSERT INTO Participantes(pId, idt, idn, pais, correo) VALUES (NULL, 'CE', 15353423, 'BRASIL', 'other_user@outlook.es');
    
/*Caso 3: Se va a validar que en una clave foránea deba existir el valor al que se apunta. 
    (SQL Error: ORA-02291: integrity constraint (BD1000105286.FK_CONTIENE_SEGMENTO_NOMBRE) violated - parent key not found)*/
INSERT INTO Contiene(versionNombre, segmentoNombre) VALUES ('Coco', 'Coco2');


/* Consultas */

/* Consultar los cinco segmentos con tiempos más cortos. */
SELECT segmentoNombre AS Segmentos, tiempo
FROM Registros
ORDER BY tiempo
FETCH NEXT 5 ROWS ONLY;

/* Consultar puntos de la carrera. */
SELECT * FROM Puntos;

/*Consulta implementada: Consultar los comentarios, cada uno con su respectivo autor y con el criterio evaluado.*/
SELECT c.contenido, e.autor, q.criterio
FROM Comentarios c
JOIN Evaluaciones e ON (c.idEvaluacion = e.evId)
JOIN Encuestas q ON (e.encuestaId = q.eId);


/*(CICLO 1: XTablas)*/
/* Lo comentamos para que no se nos eliminen las tablas :P

DROP TABLE Comentarios CASCADE CONSTRAINTS;
DROP TABLE Evaluaciones CASCADE CONSTRAINTS;
DROP TABLE Encuestas CASCADE CONSTRAINTS;
DROP TABLE Fotos CASCADE CONSTRAINTS;
DROP TABLE Registros CASCADE CONSTRAINTS;
DROP TABLE Contiene CASCADE CONSTRAINTS;
DROP TABLE Versiones CASCADE CONSTRAINTS;
DROP TABLE Segmentos CASCADE CONSTRAINTS;
DROP TABLE PropiedadDe CASCADE CONSTRAINTS;
DROP TABLE Puntos CASCADE CONSTRAINTS;
DROP TABLE Carrera CASCADE CONSTRAINTS;
DROP TABLE Participa CASCADE CONSTRAINTS;
DROP TABLE EsOrganizador CASCADE CONSTRAINTS;
DROP TABLE Ciclistas CASCADE CONSTRAINTS;
DROP TABLE Empresas CASCADE CONSTRAINTS;
DROP TABLE Personas CASCADE CONSTRAINTS;
DROP TABLE Participantes CASCADE CONSTRAINTS;*/


/*Poblando nuevamente la base de datos*/

insert into Participantes (pId, idt, idn, pais, correo) values (10001, 'CE', 1010101, 'USA', 'john.doe@gmail.com');
insert into Participantes (pId, idt, idn, pais, correo) values (10002, 'CE', 2020202, 'UK', 'jane.smith@yahoo.com');
insert into Participantes (pId, idt, idn, pais, correo) values (10003, 'CE', 3030303, 'FRANCE', 'pierre.gasly@f1.com');
insert into Participantes (pId, idt, idn, pais, correo) values (10004, 'CE', 4040404, 'SPAIN', 'carlos.sainz@ferrari.es');
insert into Participantes (pId, idt, idn, pais, correo) values (10005, 'CC', 5050505, 'COLOMBIA', 'egan.bernal@ineos.co');
insert into Participantes (pId, idt, idn, pais, correo) values (10006, 'CE', 6060606, 'BELGIUM', 'remco.ev@quickstep.be');
insert into Participantes (pId, idt, idn, pais, correo) values (10007, 'CE', 7070707, 'GERMANY', 'contact@adidas.de');
insert into Participantes (pId, idt, idn, pais, correo) values (10008, 'CE', 8080808, 'USA', 'marketing@nike.com');
insert into Participantes (pId, idt, idn, pais, correo) values (10009, 'CE', 9090909, 'ITALY', 'info@pinarello.it');
insert into Participantes (pId, idt, idn, pais, correo) values (10010, 'CE', 1101101, 'SWISS', 'support@scott.ch');

insert into Personas (participanteId, nombre) values (10001, 'John Doe');
insert into Personas (participanteId, nombre) values (10002, 'Jane Smith');
insert into Personas (participanteId, nombre) values (10003, 'Pierre Gasly');
insert into Personas (participanteId, nombre) values (10004, 'Carlos Sainz');
insert into Personas (participanteId, nombre) values (10005, 'Egan Bernal');
insert into Personas (participanteId, nombre) values (10006, 'Remco Evenepoel');

insert into Ciclistas (participanteId, nacimiento, categoria) values (10001, date '1995-05-12', 1);
insert into Ciclistas (participanteId, nacimiento, categoria) values (10002, date '1998-08-20', 1);
insert into Ciclistas (participanteId, nacimiento, categoria) values (10003, date '1996-02-07', 2);
insert into Ciclistas (participanteId, nacimiento, categoria) values (10004, date '1994-09-01', 2);
insert into Ciclistas (participanteId, nacimiento, categoria) values (10005, date '1997-01-13', 1);
insert into Ciclistas (participanteId, nacimiento, categoria) values (10006, date '2000-01-25', 1);

insert into Empresas (participanteId, razonSocial, personaId) values (10007, 'Adidas AG', 10001);
insert into Empresas (participanteId, razonSocial, personaId) values (10008, 'Nike Inc', 10002);
insert into Empresas (participanteId, razonSocial, personaId) values (10009, 'Cicli Pinarello SRL', 10003);
insert into Empresas (participanteId, razonSocial, personaId) values (10010, 'Scott Sports SA', 10004);

insert into Carrera (codigo, nombre, pais, categoria, periodicidad) values ('KOT8R32894SADHFJKAS', 'vuelta a cundinamarca', 'COLOMBIA', 1, '3');
insert into Carrera (codigo, nombre, pais, categoria, periodicidad) values ('43SDFGASDFAJKSDHF7', 'clasica de boyaca', 'COLOMBIA', 4, '5');

insert into Puntos (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (1, 'Start-TDF', 'P', 0.00, 0, 'KOT8R32894SADHFJKAS');
insert into Puntos (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (2, 'Mid-TDF', 'H', 50.5, 120, 'KOT8R32894SADHFJKAS');
insert into Puntos (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (3, 'End-TDF', 'L', 110.2, 300, 'KOT8R32894SADHFJKAS');
insert into Puntos (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (4, 'Start-VUE', 'P', 0.00, 0, '43SDFGASDFAJKSDHF7');
insert into Puntos (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (5, 'Sprint-VUE', 'V', 45.0, 90, '43SDFGASDFAJKSDHF7');
insert into Puntos (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (6, 'End-VUE', 'F', 95.0, 240, '43SDFGASDFAJKSDHF7');

insert into Segmentos (nombre, tipo, ordenInicio, ordenFin) values ('Flat-TDF', 'C', 1, 2);
insert into Segmentos (nombre, tipo, ordenInicio, ordenFin) values ('Hill-TDF', 'M', 2, 3);
insert into Segmentos (nombre, tipo, ordenInicio, ordenFin) values ('Sprint-VUE', 'C', 4, 5);
insert into Segmentos (nombre, tipo, ordenInicio, ordenFin) values ('Final-VUE', 'M', 5, 6);

insert into Versiones (nombre, fecha, codigo) values ('V2026', date '2026-06-01', 'KOT8R32894SADHFJKAS');
insert into Versiones (nombre, fecha, codigo) values ('SUM26', date '2026-08-15', '43SDFGASDFAJKSDHF7');

insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) values (101, date '2026-06-02', 4500, 1, 'OK', 'A', 'Excellent', 10005, 'V2026', 'Flat-TDF');
insert into Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) values (102, date '2026-08-16', 3200, 1, 'OK', 'M', 'Clear day', 10001, 'SUM26', 'Sprint-VUE');

insert into Encuestas (eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) values (200, 'tiempo de espera', 10000, 500, date '2026-01-01', date '2026-01-31');
insert into Encuestas (eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) values (201, 'calidad percibida', 12000, 600, date '2026-02-01', date '2026-02-28');

insert into Evaluaciones (evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) values (300, date '2026-01-15', 'Admin', 'Race Course', 5, 200, 10001);
insert into Evaluaciones (evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) values (301, date '2026-02-10', 'Staff', 'Safety Barriers', 4, 201, 10002);

insert into Comentarios (cId, contenido, idEvaluacion) values (400, 'Best race of the year!', 300);
insert into Comentarios (cId, contenido, idEvaluacion) values (401, 'Need more barriers.', 301);


/* Caso de uso 1: Registrar Resultado
    A. Adicionando restricciones declarativas */

/* Restricciones: Faltó Tconsecutivo y Trevision */

/* Atributos */

ALTER TABLE Registros
ADD CONSTRAINT CK_REGISTRO_CONSECUTIVO
CHECK (numero BETWEEN 1 AND 99999);

ALTER TABLE Registros
ADD CONSTRAINT CK_REGISTRO_DURACION
CHECK(tiempo > 0);

ALTER TABLE Registros
ADD CONSTRAINT CK_REGISTRO_DIFICULTAD
CHECK (dificultad IN ('A', 'M', 'B'));

ALTER TABLE Fotos
ADD CONSTRAINT CK_FOTOS_FOTO
CHECK (foto LIKE 'www.%.gif' OR foto LIKE 'www.%.pdf');

/* Tuplas*/

/* TuplasOK (Datos validos por las restricciones)*/

INSERT INTO Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (2006, "2026-03-27", 3500, 2, "OK", "A", "Excelente carrera", 10005, "V2026", "Flat-TDF");

INSERT INTO Fotos (foto, numeroRegistro)
VALUES ("www.ciclismo-pro-ataque-montana.gif", 500);

/* TuplasNoOK */

/* debe ser numero > 99999*/
INSERT INTO Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (111111111, "2026-03-02", 2900, 6, "OK", "M", "La peor porqueria", 10001, "SUM26", "Final-VUE");

/* debe ser tiempo > 0*/
INSERT INTO Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (4999, "2026-02-08", -10000, 1, "OK", "B", "Una gran experiencia", 10002, "V2026", "Flat-TDF");

/* debe ser una dificultad valida ("A", "M", "B")*/
INSERT INTO Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (501, "2026-01-18", 5000, 3, "OK", "Salchipapa", "Que loco", 10003, "V2026", "Hill-VUE");

/* foto debe empezar en www. y terminar en .gif o .pdf*/
INSERT INTO Fotos (foto, numeroRegistro)
VALUES ("whatsapp.com/foto-carreritaLoca,jpg", 101);

/* B. Adicionando acciones de referencia */

--XForaneas

ALTER TABLE Personas DROP CONSTRAINT FK_PERSONA_PARTICIPANTEID;

ALTER TABLE Empresas DROP CONSTRAINT FK_EMPRESA_PARTICIPANTEID;

ALTER TABLE Empresas DROP CONSTRAINT FK_EMPRESA_PERSONAID;

ALTER TABLE Ciclistas DROP CONSTRAINT FK_CICLISTA_PARTICIPANTEID;

ALTER TABLE EsOrganizador DROP CONSTRAINT FK_ES_ORGANIZADOR_PARTICIPANTEID;

ALTER TABLE EsOrganizador DROP CONSTRAINT FK_ES_ORGANIZADOR_VERSION_NOMBRE;

ALTER TABLE Participa DROP CONSTRAINT FK_PARTICIPA_PARTICIPANTEID;

ALTER TABLE Participa DROP CONSTRAINT FK_PARTICIPA_VERSION_NOMBRE;

ALTER TABLE PropiedadDe DROP CONSTRAINT FK_PROPIEDADDE_PARTICIPANTE;

ALTER TABLE PropiedadDe DROP CONSTRAINT FK_PROPIEDADDE_CARRERA;

ALTER TABLE Puntos DROP CONSTRAINT FK_PUNTO_CARRERA;

ALTER TABLE Segmentos DROP CONSTRAINT FK_ORDENINICIO;

ALTER TABLE Segmentos DROP CONSTRAINT FK_ORDENFIN;

ALTER TABLE Contiene DROP CONSTRAINT FK_CONTIENE_VERSION_NOMBRE;

ALTER TABLE Contiene DROP CONSTRAINT FK_CONTIENE_SEGMENTO_NOMBRE;

ALTER TABLE Versiones DROP CONSTRAINT FK_VERSION_CODIGO;

ALTER TABLE Registros DROP CONSTRAINT FK_CICLISTAID_PARTICIPANTEID;

ALTER TABLE Registros DROP CONSTRAINT FK_REGISTRO_VERSION_NOMBRE;

ALTER TABLE Registros DROP CONSTRAINT FK_REGISTRO_SEGMENTO_NOMBRE;

ALTER TABLE Fotos DROP CONSTRAINT FK_FOTOS_NUMERO_REGISTRO;

ALTER TABLE Evaluaciones DROP CONSTRAINT FK_EVALUACION_ENCUESTA_ID;

ALTER TABLE Evaluaciones DROP CONSTRAINT FK_EVALUACION_PARTICIPANTE_ID;

ALTER TABLE Comentarios DROP CONSTRAINT FK_COMENTARIO_ID_EVALUACION;


/*Acciones*/

ALTER TABLE Personas ADD CONSTRAINT FK_PERSONA_PARTICIPANTEID
FOREIGN KEY (participanteId) REFERENCES Participantes (pId) ON DELETE CASCADE;

ALTER TABLE Empresas ADD CONSTRAINT FK_EMPRESA_PARTICIPANTEID
FOREIGN KEY (participanteId) REFERENCES Participantes (pId) ON DELETE CASCADE;

ALTER TABLE Empresas ADD CONSTRAINT FK_EMPRESA_PERSONAID
FOREIGN KEY (personaId) REFERENCES Personas (participanteId) ON DELETE CASCADE;

ALTER TABLE Ciclistas ADD CONSTRAINT FK_CICLISTA_PARTICIPANTEID
FOREIGN KEY (participanteId) REFERENCES Personas (participanteId) ON DELETE CASCADE;

ALTER TABLE EsOrganizador ADD CONSTRAINT FK_ES_ORGANIZADOR_PARTICIPANTEID
FOREIGN KEY (participanteId) REFERENCES Participantes (pId) ON DELETE CASCADE;

ALTER TABLE EsOrganizador ADD CONSTRAINT FK_ES_ORGANIZADOR_VERSION_NOMBRE
FOREIGN KEY (versionNombre) REFERENCES Versiones (nombre) ON DELETE CASCADE;

ALTER TABLE Participa ADD CONSTRAINT FK_PARTICIPA_PARTICIPANTEID
FOREIGN KEY (ciclistaId) REFERENCES Participantes (pId) ON DELETE CASCADE;

ALTER TABLE Participa ADD CONSTRAINT FK_PARTICIPA_VERSION_NOMBRE
FOREIGN KEY (versionNombre) REFERENCES Versiones (nombre) ON DELETE CASCADE;

ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PROPIEDADDE_PARTICIPANTE
FOREIGN KEY (pdId) REFERENCES Participantes (pId) ON DELETE CASCADE;

ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PROPIEDADDE_CARRERA
FOREIGN KEY (codigo) REFERENCES Carrera (codigo) ON DELETE CASCADE;

ALTER TABLE Puntos ADD CONSTRAINT FK_PUNTO_CARRERA
FOREIGN KEY (codigo) REFERENCES Carrera (codigo) ON DELETE CASCADE;

ALTER TABLE Segmentos ADD CONSTRAINT FK_ORDENINICIO
FOREIGN KEY (ordenInicio) REFERENCES Puntos (orden) ON DELETE CASCADE;

ALTER TABLE Segmentos ADD CONSTRAINT FK_ORDENFIN
FOREIGN KEY (ordenFin) REFERENCES Puntos (orden) ON DELETE CASCADE;

ALTER TABLE Contiene ADD CONSTRAINT FK_CONTIENE_VERSION_NOMBRE
FOREIGN KEY (versionNombre) REFERENCES Versiones (nombre) ON DELETE CASCADE;

ALTER TABLE Contiene ADD CONSTRAINT FK_CONTIENE_SEGMENTO_NOMBRE
FOREIGN KEY (segmentoNombre) REFERENCES Segmentos (nombre) ON DELETE CASCADE;

ALTER TABLE Versiones ADD CONSTRAINT FK_VERSION_CODIGO
FOREIGN KEY (codigo) REFERENCES Carrera (codigo) ON DELETE CASCADE;

ALTER TABLE Registros ADD CONSTRAINT FK_CICLISTAID_PARTICIPANTEID
FOREIGN KEY (ciclistaId) REFERENCES Ciclistas (participanteId) ON DELETE CASCADE;

ALTER TABLE Registros ADD CONSTRAINT FK_REGISTRO_VERSION_NOMBRE
FOREIGN KEY (versionNombre) REFERENCES Versiones (nombre) ON DELETE CASCADE;

ALTER TABLE Registros ADD CONSTRAINT FK_REGISTRO_SEGMENTO_NOMBRE
FOREIGN KEY (segmentoNombre) REFERENCES Segmentos (nombre) ON DELETE CASCADE;

ALTER TABLE Fotos ADD CONSTRAINT FK_FOTOS_NUMERO_REGISTRO
FOREIGN KEY (numeroRegistro) REFERENCES Registros (numero) ON DELETE CASCADE;

ALTER TABLE Evaluaciones ADD CONSTRAINT FK_EVALUACION_ENCUESTA_ID
FOREIGN KEY (encuestaId) REFERENCES Encuestas (eId) ON DELETE CASCADE;

ALTER TABLE Evaluaciones ADD CONSTRAINT FK_EVALUACION_PARTICIPANTE_ID
FOREIGN KEY (participanteId) REFERENCES Participantes (pId) ON DELETE CASCADE;

ALTER TABLE Comentarios ADD CONSTRAINT FK_COMENTARIO_ID_EVALUACION
FOREIGN KEY (idEvaluacion) REFERENCES Evaluaciones (evId) ON DELETE CASCADE;


/* AccionesOK */

/* Eliminaciones para comprobar que las acciones ON DELETE CASCADE
   eliminan automáticamente los registros dependientes en las tablas relacionadas. */

DELETE FROM Registros WHERE ciclistaId = 101;
SELECT * FROM Fotos WHERE ciclistaId = 101;

DELETE FROM Versiones WHERE nombre = "V2026";
SELECT * FROM Registros WHERE versionNombre = "V2026";

DELETE FROM Ciclistas WHERE participanteId = 10002;
SELECT * FROM Registros WHERE ciclistaId = 10002;

/* C. Adicionando disparadores */

/* Disparadores */

CREATE OR REPLACE TRIGGER DP_REGISTRO_BI_numero_fecha_automaticos
BEFORE INSERT ON Registros 
FOR EACH ROW
BEGIN
    SELECT COUNT(*) + 1 INTO :NEW.numero FROM Registros;
    :NEW.fecha := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER DP_REGISTRO_BU_actualizar_registro
BEFORE UPDATE ON Registros 
FOR EACH ROW
BEGIN
    :NEW.numero := :OLD.numero;
    :NEW.fecha := :OLD.fecha;
    :NEW.tiempo := :OLD.tiempo;
    :NEW.ciclistaId := :OLD.ciclistaId;
    :NEW.versionNombre := :OLD.versionNombre;
    :NEW.segmentoNombre := :OLD.segmentoNombre;
    :NEW.dificultad := :OLD.dificultad;
END;
/

CREATE OR REPLACE TRIGGER DP_FOTOS_BU_actualizar_foto
BEFORE UPDATE ON Fotos 
FOR EACH ROW
BEGIN
    :NEW.numeroRegistro := :OLD.numeroRegistro;
END;
/

CREATE OR REPLACE TRIGGER DP_REGISTRO_BD_validacion_eliminacion
BEFORE DELETE ON Registros
FOR EACH ROW
BEGIN
    IF SYSDATE - :OLD.fecha > 1 THEN
        RAISE_APPLICATION_ERROR(-20002,'No se puede eliminar el registro: ha pasado más de un día desde su creación');
    END IF;
END;
/

/* DisparadoresOK */

/* Se prueba el trigger BEFORE INSERT asigna automáticamente el número consecutivo del registro y la fecha. */
INSERT INTO Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) 
VALUES (NULL, NULL, 4500, 1, 'OK', 'H', 'Excellentisimo', 10005, 'V2026', 'Flat-TDF');
SELECT numero, fecha FROM Registros WHERE tiempo = 5400;

/* Se prueba el trigger BEFORE INSERT verificando que aunque se envíen valores NULL en numero y fecha, el disparador
los reemplace automáticamente por el consecutivo y la fecha. */
INSERT INTO Registros (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (NULL, NULL, 12345, 5, NULL, "B", "Que feo caso", 10006, "SUM26", "Sprint-VUE");

/* Se prueba el trigger BEFORE DELETE valida si el registro puede eliminarse dependiendo de la fecha de creación. Si el
registro fue creado hace menos de un día, la eliminación es permitida. */
DELETE FROM Registros WHERE tiempo = 12345;

/* DisparadoresNoOK */

/* Se prueba que el trigger BEFORE UPDATE impida modificar el número del registro, manteniendo el valor anterior. */
UPDATE Registros SET numero = 99999 WHERE numero = 102;
SELECT numero FROM Registros WHERE tiempo = 3200;

/* Se prueba que el trigger BEFORE UPDATE impida modificar la fecha original del registro, manteniendo el valor anterior. */
UPDATE Registros SET fecha = "2000-01-01" WHERE numero = 102;
SELECT fecha FROM Registros WHERE numero = 102;

/* Se prueba el trigger BEFORE UPDATE de la tabla Fotos, impide modificar el número de registro asociado a la foto, manteniendo el valor anterior. */
UPDATE Fotos SET numeroRegistro = 999 WHERE numeroRegistro = 102;
SELECT tiempo FROM Registros WHERE numero = 102;

/* Se prueba el trigger BEFORE DELETE impide eliminar registros cuya fecha de creación sea mayor a un día respecto a SYSDATE. */
DELETE FROM Registros WHERE numero = 101;

/* XDisparadores */

/*
DROP TRIGGER DP_REGISTRO_BI_numero_fecha_automaticos;
DROP TRIGGER DP_REGISTRO_BU_actualizar_registro;
DROP TRIGGER DP_FOTOS_BU_actualizar_foto;
DROP TRIGGER DP_REGISTRO_BD_validacion_eliminacion;
*/

/*Lab 5*/

/*Parte I---1---*/
/*SELECT * FROM mbda.DATA;*/

/*SELECT COUNT(*)FROM mbda.DATA;*/


/*---2---*/
/*INSERT INTO mbda.DATA (Numero, Pais, Correo, Nombre, Apellido, Nacimiento, Categoria) 
VALUES (5286, 'Colombia', 'cristian.ortiz-s@mail.escuelaing.edu.co', 'Cristian Camilo', 'Ortiz Sanchez', DATE '2007-09-24', 54538693);

INSERT INTO mbda.DATA (Numero, Pais, Correo, Nombre, Apellido, Nacimiento, Categoria) 
VALUES (5300, 'Colombia', 'juan.perez-t@mail.escuelaing.edu.co', 'Juan Jose', 'Perez Torres', DATE '2006-05-20', -5);*/


/*---3---*/
/*UPDATE mbda.DATA SET numero = 1234 WHERE correo = 5300;

DELETE FROM mbda.DATA WHERE numero = 5286;*/


/*---5---*/


/*Parte II---CRUDI---*/

CREATE OR REPLACE
PROCEDURE adicionarRegistro(xTiempo IN NUMBER, xPosicion IN NUMBER, xRevision IN VARCHAR, xDificultad IN VARCHAR,
            xComentario IN VARCHAR, xCiclistaId IN NUMBER, xVersionNombre IN VARCHAR, xSegmentoNombre IN VARCHAR)
IS
BEGIN
    INSERT INTO Registros(tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
    VALUES(xTiempo, xPosicion, xRevision, xDificultad, xComentario, xCiclistaId, xVersionNombre, xSegmentoNombre);
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20999, 'Error al registrar: ' || SQLERRM);
END;
/
    
CREATE OR REPLACE
PROCEDURE ModificarRegistro(xNumero IN VARCHAR, xRevision IN VARCHAR, xComentario IN VARCHAR)
IS
BEGIN
    UPDATE Registros SET revision = xRevision, comentario = xComentario WHERE numero = xNumero;
    IF (SQL%ROWCOUNT = 0) THEN
        RAISE_APPLICATION_ERROR(-20001, 'Registro no encontrado');
    END IF;
    COMMIT;
EXCEPTION
    WHEN OTHERS THEN
        ROLLBACK;
        RAISE_APPLICATION_ERROR(-20999, SQLERRM);
END;
/
    
CREATE OR REPLACE
PROCEDURE cincoSegmentosMasCortos(resultado OUT SYS_REFCURSOR) 
IS
BEGIN
    OPEN resultado FOR
        SELECT segmentoNombre AS Segmentos, tiempo
        FROM Registros
        ORDER BY tiempo ASC
        FETCH NEXT 5 ROWS ONLY;
END;
/

/*---XCRUD---*/

DROP PROCEDURE adicionarRegistro;
DROP PROCEDURE ModificarRegistro;
DROP PROCEDURE cincoSegmentosMasCortos;

/*---CRUDOK---*/

EXECUTE adicionarRegistro(3800, 5, 'OK', 'B', 'Pista mala', 10005, 'V2026', 'Sprint-VUE');
EXECUTE adicionarRegistro(2950, 1, 'OK', 'A', 'Nuevo record', 12345, 'V2026', 'Hill-TDF');
EXECUTE modificarRegistro(4,'Modificacion', 'Modificacion4');
EXECUTE modificarRegistro(5,'Modificacion2Noc', 'Modificacion5');

VARIABLE cursorOK REFCURSOR;
BEGIN
    cincoSegmentosMasCortos(:cursorOK);
END;
/
PRINT cursorOK;

/*---CRUDNoOK---*/

EXECUTE adicionarRegistro(3600, 3, 'OK', 'X', 'Dificultad erronea', 10010, 'V2026', 'Hill-TDF');
EXECUTE modificarRegistro(3600, 3, 'OK', 'A', 'Versiones inextistente', 10010, 'V-FALSA', 'Hill-TDF');
EXECUTE adicionarRegistro(-500, 1, 'OK', 'A', 'Negativo', 10012, 'V2026', 'Sprint-VUE');
