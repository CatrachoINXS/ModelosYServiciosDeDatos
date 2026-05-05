/* afterRide
* Autores: Juan Jose Perez, Cristian Camilo Ortiz
*/


/*Tablas*/
CREATE TABLE Participante(
    pId NUMBER(5) NOT NULL,
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
    periodicidad VARCHAR(20) NOT NULL);
    
CREATE TABLE Punto(
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
    eId NUMBER(5) NOT NULL,
    criterio VARCHAR(20) NOT NULL,
    presupuesto NUMBER(30) NOT NULL,
    valorIncentivo NUMBER(30) NOT NULL,
    fechaInicio DATE NOT NULL,
    fechaFin DATE NOT NULL);
    
CREATE TABLE Evaluacion(
    evId NUMBER(5) NOT NULL,
    fechaExacta DATE NOT NULL,
    autor VARCHAR(30) NOT NULL,
    bienEvaluado VARCHAR(50) NOT NULL,
    puntuacion NUMBER(1),
    encuestaId NUMBER(5),
    participanteId NUMBER(5));
    
CREATE TABLE Comentario(
    cId NUMBER(5) NOT NULL,
    contenido VARCHAR(300) NOT NULL,
    idEvaluacion NUMBER(5));


/* PoblarOK */

INSERT INTO Participante(pId, idt, idn, pais, correo) VALUES (12345, 'CC', 111111111111839, 'CHILE', 'mandarina_podrida2@outlook.es');
INSERT INTO Participante(pId, idt, idn, pais, correo) VALUES (87999, 'CC', 1076741066, 'COLOMBIA', 'scamilo027@gmail.com');
INSERT INTO Participante(pId, idt, idn, pais, correo) VALUES (85733, 'CC', 123498757683922, 'COLOMBIA', 'juanpereztorres874@gmail.com');

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

INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES ('LK92KJDH475829301LQW', 'Vuelta Libertadores', 'COLOMBIA', 2, 5);
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES('AHSGW627384HTTRYENVM', 'Vuelta del Sancocho', 'COLOMBIA', 2, 5);
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES('A6H29GDK3B7WEBVF7WBQ', 'Giro de la ECI', 'COLOMBIA', 5, 5);
       
INSERT INTO Punto(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (15, 'AltoAguila', 'C', 14.82, 54, 'LK92KJDH475829301LQW');
INSERT INTO Punto(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (32, 'PuntoRojo', 'M', 21.01, 95, 'AHSGW627384HTTRYENVM');
INSERT INTO Punto(orden, nombre, tipo, distancia, tiempoLimite, codigo) VALUES (22, 'Laguna', 'A', 17.54, 77, 'A6H29GDK3B7WEBVF7WBQ');

INSERT INTO PropiedadDe(pdId, codigo, porcentaje) VALUES (12345, 'LK92KJDH475829301LQW', 20);
INSERT INTO PropiedadDe(pdId, codigo, porcentaje) VALUES (87999, 'LK92KJDH475829301LQW', 50);
INSERT INTO PropiedadDe(pdId, codigo, porcentaje) VALUES (85733, 'A6H29GDK3B7WEBVF7WBQ', 25);  /*Revisar tipo porcentaje*/

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
INSERT INTO Registro(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) VALUES (28761, DATE '2026-01-02', 10, 556, 'Falta poner revision', 'M', 'Facilisimo Verdad?', 85733, 'Campo', 'Acantilado');
INSERT INTO Registro(numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) VALUES (87999, DATE '2026-02-19', 20, 2473, 'Falta poner revision', 'M', 'Estoy re-cansado', 87999, 'Coco', 'Arroyo');

INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.ciclismo-pro-ataque-montana.gif', 72811);
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.documentacion-tecnica-perfil-etapa.pdf', 28761);
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('www.sucesor-de-nairo-quintana.pdf', 87999);

INSERT INTO Encuesta(eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (76525, 'atencion', 250000, 60000, DATE '2026-03-11', DATE '2026-03-15');
INSERT INTO Encuesta(eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (17293, 'tiempo de espera', 480000, 120000, DATE '2026-03-11', DATE '2026-03-15');
INSERT INTO Encuesta(eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) VALUES (99271, 'calidad percibida', 340000, 70000, DATE '2026-04-20', DATE '2026-04-24');
       
INSERT INTO Evaluacion(evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (75888, DATE '2026-03-11', 'Carlos', 'NOC', 4, 76525, 12345);
INSERT INTO Evaluacion(evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (90182, DATE '2026-03-11', 'Sofia', 'NOC', 2, 17293, 85733);
INSERT INTO Evaluacion(evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) VALUES (12571, DATE '2026-03-11', 'Esteban', 'NOC', 3, 99271, 87999);
       
INSERT INTO Comentario(cId, contenido, idEvaluacion) VALUES (43281, 'Demasiado exótico.',75888);
INSERT INTO Comentario(cId, contenido, idEvaluacion) VALUES (81623, 'Awesome', 90182);
INSERT INTO Comentario(cId, contenido, idEvaluacion) VALUES (15120, 'Fantastic', 12571);


/*PoblarNoOK 2)*/

/*Caso 1: Se va a verificar que el tipo de dato de los id sea NUMBER y no VARCHAR. 
    (SQL Error: ORA-01722: invalid number)*/
INSERT INTO Comentario(cId, contenido, idEvaluacion) VALUES ('unodostres', 'Demasiado exótico', 'sietecincoocho'); 
    
/*Caso 2: Se va a validar que la cantidad de datos solicitados de una tabla, corresponda a la cantidad de datos ingresados.
    (SQL Error: ORA-00913: too many values)*/
INSERT INTO Participante(pId, idt, idn, pais, correo) VALUES (12345, 'CC', 111111111111839, 'CHILE', 'mandarina_podrida2@outlook.es', 'mandarina_podrida2@outlook.es');
    
/*Caso 3: Se va a validar que el ‘participanteId’ de Persona no sea mayor a 15 caracteres. 
    (SQL Error: ORA-01438: value larger than specified precision allowed for this column)*/
INSERT INTO Persona(participanteId, nombre) VALUES(12345678910111213141516, 'Francisco Jose de Caldas');


/*PoblarNoOK 3)*/

-- Caso 1: correo donde el '@' no tiene caracteres ni antes ni después
INSERT INTO Participante(pId, idt, idn, pais, correo) VALUES (76456, 'CC', 80541115, 'PERU', '@');

-- Caso 2: carrera donde la categoría es un entero que no está en el rango entre 1 y 5
INSERT INTO Carrera(codigo, nombre, pais, categoria, periodicidad) VALUES ('IAUFIKJDKALFU3423IO', 'VueltaDeLosDeSistemas', 'COLOMBIA', 9, 5);

-- Caso 3: Foto que no empieza por www. ni termina con .git o .pdf*/
INSERT INTO Fotos(foto, numeroRegistro) VALUES ('sucesor-de-egan-bernal', 87999);


/*Primarias*/

ALTER TABLE Participante
ADD CONSTRAINT PK_PARTICIPANTE PRIMARY KEY (pId);

ALTER TABLE Persona
ADD CONSTRAINT PK_PERSONA PRIMARY KEY (participanteId); 

ALTER TABLE Empresa
ADD CONSTRAINT PK_EMPRESA PRIMARY KEY (participanteId);

ALTER TABLE Ciclista
ADD CONSTRAINT PK_CICLISTA PRIMARY KEY (participanteId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT PK_ORGANIZADOR_DE PRIMARY KEY (participanteId, versionNombre);

ALTER TABLE Participa
ADD CONSTRAINT PK_PARTICIPA PRIMARY KEY (ciclistaId, versionNombre);

ALTER TABLE Carrera
ADD CONSTRAINT PK_CARRERA PRIMARY KEY (codigo); 

ALTER TABLE PropiedadDe
ADD CONSTRAINT PK_PROPIEDAD_DE PRIMARY KEY (pdId, codigo);

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
ADD CONSTRAINT PK_ENCUESTA PRIMARY KEY (eId);

ALTER TABLE Evaluacion
ADD CONSTRAINT PK_EVALUACION PRIMARY KEY (evId);

ALTER TABLE Comentario
ADD CONSTRAINT PK_COMENTARIO PRIMARY KEY (cId);

/*Unicas*/

ALTER TABLE Registro
ADD CONSTRAINT UK_REGISTRO UNIQUE (comentario);

/*Foráneas*/

ALTER TABLE Persona
ADD CONSTRAINT FK_PERSONA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participante (pId);

ALTER TABLE Empresa
ADD CONSTRAINT FK_EMPRESA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participante (pId);

ALTER TABLE Empresa
ADD CONSTRAINT FK_EMPRESA_PERSONAID FOREIGN KEY (personaId) REFERENCES Persona (participanteId);

ALTER TABLE Ciclista
ADD CONSTRAINT FK_CICLISTA_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Persona (participanteId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT FK_ES_ORGANIZADOR_PARTICIPANTEID FOREIGN KEY (participanteId) REFERENCES Participante (pId);

ALTER TABLE EsOrganizador
ADD CONSTRAINT FK_ES_ORGANIZADOR_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Version (nombre);

ALTER TABLE Participa
ADD CONSTRAINT FK_PARTICIPA_PARTICIPANTEID FOREIGN KEY (ciclistaId) REFERENCES Participante (pId);

ALTER TABLE Participa
ADD CONSTRAINT FK_PARTICIPA_VERSION_NOMBRE FOREIGN KEY (versionNombre) REFERENCES Version (nombre);

ALTER TABLE PropiedadDe
ADD CONSTRAINT FK_PROPIEDADDE_PARTICIPANTE FOREIGN KEY (pdId) REFERENCES Participante (pId);

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
ADD CONSTRAINT FK_EVALUACION_ENCUESTA_ID FOREIGN KEY (encuestaId) REFERENCES Encuesta (eId);

ALTER TABLE Evaluacion
ADD CONSTRAINT FK_EVALUACION_PARTICIPANTE_ID FOREIGN KEY (participanteId) REFERENCES Participante (pId);

ALTER TABLE Comentario
ADD CONSTRAINT FK_COMENTARIO_ID_EVALUACION FOREIGN KEY (idEvaluacion) REFERENCES Evaluacion (evId);


-- Segunda parte de PoblarNoOK2)

/*Caso 1: Se va a verificar que una persona no se duplique. 
    (SQL Error: ORA-00001: unique constraint (BD1000105286.PK_PERSONA) violated)*/
INSERT INTO Persona(participanteId, nombre) VALUES(87999, 'Cristian Camilo Ortiz Sanchez');
    
/*Caso 2: Se va a validar que un id no pueda ser NULL.
    (SQL Error: ORA-01400: cannot insert NULL into ("BD1000105286"."PARTICIPANTE"."ID"))*/
INSERT INTO Participante(pId, idt, idn, pais, correo) VALUES (NULL, 'CE', 15353423, 'BRASIL', 'other_user@outlook.es');
    
/*Caso 3: Se va a validar que en una clave foránea deba existir el valor al que se apunta. 
    (SQL Error: ORA-02291: integrity constraint (BD1000105286.FK_CONTIENE_SEGMENTO_NOMBRE) violated - parent key not found)*/
INSERT INTO Contiene(versionNombre, segmentoNombre) VALUES ('Coco', 'Coco2');


/* Consultas */

/* Consultar los cinco segmentos con tiempos más cortos. */
SELECT segmentoNombre AS Segmento, tiempo
FROM Registro
ORDER BY tiempo
FETCH NEXT 5 ROWS ONLY;

/* Consultar puntos de la carrera. */
SELECT * FROM Punto;

/*Consulta implementada: Consultar los comentarios, cada uno con su respectivo autor y con el criterio evaluado.*/
SELECT c.contenido, e.autor, q.criterio
FROM Comentario c
JOIN Evaluacion e ON (c.idEvaluacion = e.evId)
JOIN Encuesta q ON (e.encuestaId = q.eId);


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

insert into Participante (pId, idt, idn, pais, correo) values (10001, 'CE', 1010101, 'USA', 'john.doe@gmail.com');
insert into Participante (pId, idt, idn, pais, correo) values (10002, 'CE', 2020202, 'UK', 'jane.smith@yahoo.com');
insert into Participante (pId, idt, idn, pais, correo) values (10003, 'CE', 3030303, 'FRANCE', 'pierre.gasly@f1.com');
insert into Participante (pId, idt, idn, pais, correo) values (10004, 'CE', 4040404, 'SPAIN', 'carlos.sainz@ferrari.es');
insert into Participante (pId, idt, idn, pais, correo) values (10005, 'CC', 5050505, 'COLOMBIA', 'egan.bernal@ineos.co');
insert into Participante (pId, idt, idn, pais, correo) values (10006, 'CE', 6060606, 'BELGIUM', 'remco.ev@quickstep.be');
insert into Participante (pId, idt, idn, pais, correo) values (10007, 'CE', 7070707, 'GERMANY', 'contact@adidas.de');
insert into Participante (pId, idt, idn, pais, correo) values (10008, 'CE', 8080808, 'USA', 'marketing@nike.com');
insert into Participante (pId, idt, idn, pais, correo) values (10009, 'CE', 9090909, 'ITALY', 'info@pinarello.it');
insert into Participante (pId, idt, idn, pais, correo) values (10010, 'CE', 1101101, 'SWISS', 'support@scott.ch');

insert into Persona (participanteId, nombre) values (10001, 'John Doe');
insert into Persona (participanteId, nombre) values (10002, 'Jane Smith');
insert into Persona (participanteId, nombre) values (10003, 'Pierre Gasly');
insert into Persona (participanteId, nombre) values (10004, 'Carlos Sainz');
insert into Persona (participanteId, nombre) values (10005, 'Egan Bernal');
insert into Persona (participanteId, nombre) values (10006, 'Remco Evenepoel');

insert into Ciclista (participanteId, nacimiento, categoria) values (10001, date '1995-05-12', 1);
insert into Ciclista (participanteId, nacimiento, categoria) values (10002, date '1998-08-20', 1);
insert into Ciclista (participanteId, nacimiento, categoria) values (10003, date '1996-02-07', 2);
insert into Ciclista (participanteId, nacimiento, categoria) values (10004, date '1994-09-01', 2);
insert into Ciclista (participanteId, nacimiento, categoria) values (10005, date '1997-01-13', 1);
insert into Ciclista (participanteId, nacimiento, categoria) values (10006, date '2000-01-25', 1);

insert into Empresa (participanteId, razonSocial, personaId) values (10007, 'Adidas AG', 10001);
insert into Empresa (participanteId, razonSocial, personaId) values (10008, 'Nike Inc', 10002);
insert into Empresa (participanteId, razonSocial, personaId) values (10009, 'Cicli Pinarello SRL', 10003);
insert into Empresa (participanteId, razonSocial, personaId) values (10010, 'Scott Sports SA', 10004);

insert into Carrera (codigo, nombre, pais, categoria, periodicidad) values ('KOT8R32894SADHFJKAS', 'vuelta a cundinamarca', 'COLOMBIA', 1, '3');
insert into Carrera (codigo, nombre, pais, categoria, periodicidad) values ('43SDFGASDFAJKSDHF7', 'clasica de boyaca', 'COLOMBIA', 4, '5');

insert into Punto (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (1, 'Start-TDF', 'P', 0.00, 0, 'KOT8R32894SADHFJKAS');
insert into Punto (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (2, 'Mid-TDF', 'H', 50.5, 120, 'KOT8R32894SADHFJKAS');
insert into Punto (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (3, 'End-TDF', 'L', 110.2, 300, 'KOT8R32894SADHFJKAS');
insert into Punto (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (4, 'Start-VUE', 'P', 0.00, 0, '43SDFGASDFAJKSDHF7');
insert into Punto (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (5, 'Sprint-VUE', 'V', 45.0, 90, '43SDFGASDFAJKSDHF7');
insert into Punto (orden, nombre, tipo, distancia, tiempoLimite, codigo) values (6, 'End-VUE', 'F', 95.0, 240, '43SDFGASDFAJKSDHF7');

insert into Segmento (nombre, tipo, ordenInicio, ordenFin) values ('Flat-TDF', 'C', 1, 2);
insert into Segmento (nombre, tipo, ordenInicio, ordenFin) values ('Hill-TDF', 'M', 2, 3);
insert into Segmento (nombre, tipo, ordenInicio, ordenFin) values ('Sprint-VUE', 'C', 4, 5);
insert into Segmento (nombre, tipo, ordenInicio, ordenFin) values ('Final-VUE', 'M', 5, 6);

insert into Version (nombre, fecha, codigo) values ('V2026', date '2026-06-01', 'KOT8R32894SADHFJKAS');
insert into Version (nombre, fecha, codigo) values ('SUM26', date '2026-08-15', '43SDFGASDFAJKSDHF7');

insert into Registro (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) values (101, date '2026-06-02', 4500, 1, 'OK', 'A', 'Excellent', 10005, 'V2026', 'Flat-TDF');
insert into Registro (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) values (102, date '2026-08-16', 3200, 1, 'OK', 'M', 'Clear day', 10001, 'SUM26', 'Sprint-VUE');

insert into Encuesta (eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) values (200, 'tiempo de espera', 10000, 500, date '2026-01-01', date '2026-01-31');
insert into Encuesta (eId, criterio, presupuesto, valorIncentivo, fechaInicio, fechaFin) values (201, 'calidad percibida', 12000, 600, date '2026-02-01', date '2026-02-28');

insert into Evaluacion (evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) values (300, date '2026-01-15', 'Admin', 'Race Course', 5, 200, 10001);
insert into Evaluacion (evId, fechaExacta, autor, bienEvaluado, puntuacion, encuestaId, participanteId) values (301, date '2026-02-10', 'Staff', 'Safety Barriers', 4, 201, 10002);

insert into Comentario (cId, contenido, idEvaluacion) values (400, 'Best race of the year!', 300);
insert into Comentario (cId, contenido, idEvaluacion) values (401, 'Need more barriers.', 301);


/* Caso de uso 1: Registrar Resultado
    A. Adicionando restricciones declarativas */

/* Restricciones: Faltó Tconsecutivo y Trevision */

/* Atributos */

ALTER TABLE Registro
ADD CONSTRAINT CK_REGISTRO_CONSECUTIVO
CHECK (numero BETWEEN 1 AND 99999);

ALTER TABLE Registro
ADD CONSTRAINT CK_REGISTRO_DURACION
CHECK(tiempo > 0);

/*
-- Restriccion por revisar
ALTER TABLE Registro
ADD CONSTRAINT CK_REGISTRO_REVISION
CHECK (revision = 0);*/

ALTER TABLE Registro
ADD CONSTRAINT CK_REGISTRO_DIFICULTAD
CHECK (dificultad IN ('A', 'M', 'B'));

ALTER TABLE Fotos
ADD CONSTRAINT CK_FOTOS_FOTO
CHECK (foto LIKE 'www.%.gif' OR foto LIKE 'www.%.pdf');

/* Tuplas*/

/* TuplasOK (Datos validos por las restricciones)*/

INSERT INTO Registro (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (2006, "2026-03-27", 3500, 2, "OK", "A", "Excelente carrera", 10005, "V2026", "Flat-TDF");

INSERT INTO Fotos (foto, numeroRegistro)
VALUES ("www.ciclismo-pro-ataque-montana.gif", 500);

/* TuplasNoOK */

/* debe ser numero > 99999*/
INSERT INTO Registro (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (111111111, "2026-03-02", 2900, 6, "OK", "M", "La peor porqueria", 10001, "SUM26", "Final-VUE");

/* debe ser tiempo > 0*/
INSERT INTO Registro (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (4999, "2026-02-08", -10000, 1, "OK", "B", "Una gran experiencia", 10002, "V2026", "Flat-TDF");

/* debe ser una dificultad valida ("A", "M", "B")*/
INSERT INTO Registro (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (501, "2026-01-18", 5000, 3, "OK", "Salchipapa", "Que loco", 10003, "V2026", "Hill-VUE");

/* foto debe empezar en www. y terminar en .gif o .pdf*/
INSERT INTO Fotos (foto, numeroRegistro)
VALUES ("whatsapp.com/foto-carreritaLoca,jpg", 101);

/* B. Adicionando acciones de referencia */

--XForaneas

ALTER TABLE Persona DROP CONSTRAINT FK_PERSONA_PARTICIPANTEID;

ALTER TABLE Empresa DROP CONSTRAINT FK_EMPRESA_PARTICIPANTEID;

ALTER TABLE Empresa DROP CONSTRAINT FK_EMPRESA_PERSONAID;

ALTER TABLE Ciclista DROP CONSTRAINT FK_CICLISTA_PARTICIPANTEID;

ALTER TABLE EsOrganizador DROP CONSTRAINT FK_ES_ORGANIZADOR_PARTICIPANTEID;

ALTER TABLE EsOrganizador DROP CONSTRAINT FK_ES_ORGANIZADOR_VERSION_NOMBRE;

ALTER TABLE Participa DROP CONSTRAINT FK_PARTICIPA_PARTICIPANTEID;

ALTER TABLE Participa DROP CONSTRAINT FK_PARTICIPA_VERSION_NOMBRE;

ALTER TABLE PropiedadDe DROP CONSTRAINT FK_PROPIEDADDE_PARTICIPANTE;

ALTER TABLE PropiedadDe DROP CONSTRAINT FK_PROPIEDADDE_CARRERA;

ALTER TABLE Punto DROP CONSTRAINT FK_PUNTO_CARRERA;

ALTER TABLE Segmento DROP CONSTRAINT FK_ORDENINICIO;

ALTER TABLE Segmento DROP CONSTRAINT FK_ORDENFIN;

ALTER TABLE Contiene DROP CONSTRAINT FK_CONTIENE_VERSION_NOMBRE;

ALTER TABLE Contiene DROP CONSTRAINT FK_CONTIENE_SEGMENTO_NOMBRE;

ALTER TABLE Version DROP CONSTRAINT FK_VERSION_CODIGO;

ALTER TABLE Registro DROP CONSTRAINT FK_CICLISTAID_PARTICIPANTEID;

ALTER TABLE Registro DROP CONSTRAINT FK_REGISTRO_VERSION_NOMBRE;

ALTER TABLE Registro DROP CONSTRAINT FK_REGISTRO_SEGMENTO_NOMBRE;

ALTER TABLE Fotos DROP CONSTRAINT FK_FOTOS_NUMERO_REGISTRO;

ALTER TABLE Evaluacion DROP CONSTRAINT FK_EVALUACION_ENCUESTA_ID;

ALTER TABLE Evaluacion DROP CONSTRAINT FK_EVALUACION_PARTICIPANTE_ID;

ALTER TABLE Comentario DROP CONSTRAINT FK_COMENTARIO_ID_EVALUACION;


/*Acciones*/

ALTER TABLE Persona ADD CONSTRAINT FK_PERSONA_PARTICIPANTEID
FOREIGN KEY (participanteId) REFERENCES Participante (pId) ON DELETE CASCADE;

ALTER TABLE Empresa ADD CONSTRAINT FK_EMPRESA_PARTICIPANTEID
FOREIGN KEY (participanteId) REFERENCES Participante (pId) ON DELETE CASCADE;

ALTER TABLE Empresa ADD CONSTRAINT FK_EMPRESA_PERSONAID
FOREIGN KEY (personaId) REFERENCES Persona (participanteId) ON DELETE CASCADE;

ALTER TABLE Ciclista ADD CONSTRAINT FK_CICLISTA_PARTICIPANTEID
FOREIGN KEY (participanteId) REFERENCES Persona (participanteId) ON DELETE CASCADE;

ALTER TABLE EsOrganizador ADD CONSTRAINT FK_ES_ORGANIZADOR_PARTICIPANTEID
FOREIGN KEY (participanteId) REFERENCES Participante (pId) ON DELETE CASCADE;

ALTER TABLE EsOrganizador ADD CONSTRAINT FK_ES_ORGANIZADOR_VERSION_NOMBRE
FOREIGN KEY (versionNombre) REFERENCES Version (nombre) ON DELETE CASCADE;

ALTER TABLE Participa ADD CONSTRAINT FK_PARTICIPA_PARTICIPANTEID
FOREIGN KEY (ciclistaId) REFERENCES Participante (pId) ON DELETE CASCADE;

ALTER TABLE Participa ADD CONSTRAINT FK_PARTICIPA_VERSION_NOMBRE
FOREIGN KEY (versionNombre) REFERENCES Version (nombre) ON DELETE CASCADE;

ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PROPIEDADDE_PARTICIPANTE
FOREIGN KEY (pdId) REFERENCES Participante (pId) ON DELETE CASCADE;

ALTER TABLE PropiedadDe ADD CONSTRAINT FK_PROPIEDADDE_CARRERA
FOREIGN KEY (codigo) REFERENCES Carrera (codigo) ON DELETE CASCADE;

ALTER TABLE Punto ADD CONSTRAINT FK_PUNTO_CARRERA
FOREIGN KEY (codigo) REFERENCES Carrera (codigo) ON DELETE CASCADE;

ALTER TABLE Segmento ADD CONSTRAINT FK_ORDENINICIO
FOREIGN KEY (ordenInicio) REFERENCES Punto (orden) ON DELETE CASCADE;

ALTER TABLE Segmento ADD CONSTRAINT FK_ORDENFIN
FOREIGN KEY (ordenFin) REFERENCES Punto (orden) ON DELETE CASCADE;

ALTER TABLE Contiene ADD CONSTRAINT FK_CONTIENE_VERSION_NOMBRE
FOREIGN KEY (versionNombre) REFERENCES Version (nombre) ON DELETE CASCADE;

ALTER TABLE Contiene ADD CONSTRAINT FK_CONTIENE_SEGMENTO_NOMBRE
FOREIGN KEY (segmentoNombre) REFERENCES Segmento (nombre) ON DELETE CASCADE;

ALTER TABLE Version ADD CONSTRAINT FK_VERSION_CODIGO
FOREIGN KEY (codigo) REFERENCES Carrera (codigo) ON DELETE CASCADE;

ALTER TABLE Registro ADD CONSTRAINT FK_CICLISTAID_PARTICIPANTEID
FOREIGN KEY (ciclistaId) REFERENCES Ciclista (participanteId) ON DELETE CASCADE;

ALTER TABLE Registro ADD CONSTRAINT FK_REGISTRO_VERSION_NOMBRE
FOREIGN KEY (versionNombre) REFERENCES Version (nombre) ON DELETE CASCADE;

ALTER TABLE Registro ADD CONSTRAINT FK_REGISTRO_SEGMENTO_NOMBRE
FOREIGN KEY (segmentoNombre) REFERENCES Segmento (nombre) ON DELETE CASCADE;

ALTER TABLE Fotos ADD CONSTRAINT FK_FOTOS_NUMERO_REGISTRO
FOREIGN KEY (numeroRegistro) REFERENCES Registro (numero) ON DELETE CASCADE;

ALTER TABLE Evaluacion ADD CONSTRAINT FK_EVALUACION_ENCUESTA_ID
FOREIGN KEY (encuestaId) REFERENCES Encuesta (eId) ON DELETE CASCADE;

ALTER TABLE Evaluacion ADD CONSTRAINT FK_EVALUACION_PARTICIPANTE_ID
FOREIGN KEY (participanteId) REFERENCES Participante (pId) ON DELETE CASCADE;

ALTER TABLE Comentario ADD CONSTRAINT FK_COMENTARIO_ID_EVALUACION
FOREIGN KEY (idEvaluacion) REFERENCES Evaluacion (evId) ON DELETE CASCADE;


/* AccionesOK */

/* Eliminaciones para comprobar que las acciones ON DELETE CASCADE
   eliminan automáticamente los registros dependientes en las tablas relacionadas. */

DELETE FROM Registro WHERE ciclistaId = 101;
SELECT * FROM Fotos WHERE ciclistaId = 101;

DELETE FROM Version WHERE nombre = "V2026";
SELECT * FROM Registro WHERE versionNombre = "V2026";

DELETE FROM Ciclista WHERE participanteId = 10002;
SELECT * FROM Registro WHERE ciclistaId = 10002;

/* C. Adicionando disparadores */

/* Disparadores */

CREATE OR REPLACE TRIGGER DP_REGISTRO_BI_numero_fecha_automaticos
BEFORE INSERT ON Registro 
FOR EACH ROW
BEGIN
    SELECT COUNT(*) + 1 INTO :NEW.numero FROM Registro;
    :NEW.fecha := SYSDATE;
END;
/

CREATE OR REPLACE TRIGGER DP_REGISTRO_BU_actualizar_registro
BEFORE UPDATE ON Registro 
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
BEFORE DELETE ON Registro
FOR EACH ROW
BEGIN
    IF SYSDATE - :OLD.fecha > 1 THEN
        RAISE_APPLICATION_ERROR(-20002,'No se puede eliminar el registro: ha pasado más de un día desde su creación');
    END IF;
END;
/

/* DisparadoresOK */

/* Se prueba el trigger BEFORE INSERT asigna automáticamente el número consecutivo del registro y la fecha. */
INSERT INTO Registro (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre) 
VALUES (NULL, NULL, 4500, 1, 'OK', 'H', 'Excellentisimo', 10005, 'V2026', 'Flat-TDF');
SELECT numero, fecha FROM Registro WHERE tiempo = 5400;

/* Se prueba el trigger BEFORE INSERT verificando que aunque se envíen valores NULL en numero y fecha, el disparador
los reemplace automáticamente por el consecutivo y la fecha. */
INSERT INTO Registro (numero, fecha, tiempo, posicion, revision, dificultad, comentario, ciclistaId, versionNombre, segmentoNombre)
VALUES (NULL, NULL, 12345, 5, NULL, "B", "Que feo caso", 10006, "SUM26", "Sprint-VUE");

/* Se prueba el trigger BEFORE DELETE valida si el registro puede eliminarse dependiendo de la fecha de creación. Si el
registro fue creado hace menos de un día, la eliminación es permitida. */
DELETE FROM Registro WHERE tiempo = 12345;

/* DisparadoresNoOK */

/* Se prueba que el trigger BEFORE UPDATE impida modificar el número del registro, manteniendo el valor anterior. */
UPDATE Registro SET numero = 99999 WHERE numero = 102;
SELECT numero FROM Registro WHERE tiempo = 3200;

/* Se prueba que el trigger BEFORE UPDATE impida modificar la fecha original del registro, manteniendo el valor anterior. */
UPDATE Registro SET fecha = "2000-01-01" WHERE numero = 102;
SELECT fecha FROM Registro WHERE numero = 102;

/* Se prueba el trigger BEFORE UPDATE de la tabla Fotos, impide modificar el número de registro asociado a la foto, manteniendo el valor anterior. */
update Fotos SET numeroRegistro = 999 WHERE numeroRegistro = 102;
SELECT tiempo FROM Registro WHERE numero = 102;

/* Se prueba el trigger BEFORE DELETE impide eliminar registros cuya fecha de creación sea mayor a un día respecto a SYSDATE. */
DELETE FROM Registro WHERE numero = 101;

/* XDisparadores */

/*
DROP TRIGGER DP_REGISTRO_BI_numero_fecha_automaticos;
DROP TRIGGER DP_REGISTRO_BU_actualizar_registro;
DROP TRIGGER DP_FOTOS_BU_actualizar_foto;
DROP TRIGGER DP_REGISTRO_BD_validacion_eliminacion;
*/

/*
ALTER TABLE Ciclista
ADD CONSTRAINT CK_CICLISTA_CATEGORIA
CHECK (categoria BETWEEN 1 AND 5);

ALTER TABLE Segmento
ADD CONSTRAINT CK_SEGMENTO_TIPO
CHECK (tipo IN ('C', 'M', 'L'));

ALTER TABLE Punto
ADD CONSTRAINT CK_PUNTO_TIPO
CHECK (tipo IN ('P', 'L', 'H', 'A', 'M', 'V', 'C'));

ALTER TABLE Punto
ADD CONSTRAINT CK_PUNTO_TIEMPO_LIMITE
CHECK (tiempoLimite > 0);

--Revisar el tipo porcentaje
ALTER TABLE PropiedadDe
ADD CONSTRAINT CK_PROPIEDADDE_PORCENTAJE
CHECK (porcentaje > 0); 

ALTER TABLE Carrera
ADD CONSTRAINT CK_CARRERA_CODIGO
CHECK (codigo > 0); -- Hacer disparador

ALTER TABLE Carrera
ADD CONSTRAINT CK_CARRERA_PAIS
CHECK (pais = 'venezuela'); --Hacer esta restriccion

ALTER TABLE Carrera
ADD CONSTRAINT CK_CARRERA_CATEGORIA
CHECK (categoria BETWEEN 1 AND 5);

ALTER TABLE Carrera
ADD CONSTRAINT CK_CARRERA_PERIODICIDAD
CHECK (periodicidad > 0); -- Definir el tipo de periodicidad

ALTER TABLE Participante
ADD CONSTRAINT CK_PARTICIPANTE_CONSECUTIVO
CHECK (id BETWEEN 1 AND 99999);

ALTER TABLE Participante
ADD CONSTRAINT CK_PARTICIPANTE_ID
CHECK (idt IN ('CC', 'CE', 'NT'));

ALTER TABLE Participante
ADD CONSTRAINT CK_PARTICIPANTE_NID
CHECK (idn BETWEEN 0 AND 1111111111);

ALTER TABLE Participante
ADD CONSTRAINT CK_PARTICIPANTE_PAIS
CHECK (pais = 'c'); -- Hacer esta restriccion

ALTER TABLE Participante
ADD CONSTRAINT CK_PARTICIPANTE_CORREO
CHECK (correo LIKE '%@%.%');

ALTER TABLE Ciclista
ADD CONSTRAINT CK_CICLISTA_CATEGORIA
CHECK (categoria BETWEEN 1 AND 5);

ALTER TABLE Encuesta 
ADD CONSTRAINT CK_ENCUESTA_CONSECUTIVA
CHECK (id BETWEEN 1 AND 99999);

ALTER TABLE Encuesta
ADD CONSTRAINT CK_ENCUESTA_CRITERIO
CHECK (criterio IN ('atención', 'tiempo de espera', 'calidad percibida', 'infraestructura');

ALTER TABLE Encuesta 
ADD CONSTRAINT CK_ENCUESTA_PRESUPUESTO
CHECK (presupuesto > 0 AND ); //Poner lo de COP

ALTER TABLE Encuesta
ADD CONSTRAINT CK_ENCUESTA_VALORINCENTIVO
CHECK (valorIncentivo > 0 AND); //Poner lo de COP

ALTER TABLE Evaluacion
ADD CONSTRAINT CK_ENCUESTA_ID
CHECK (id BETWEEN 1 AND 99999);

ALTER TABLE Evaluacion
ADD CONSTRAINT CK_EVALUACION_PUNTUACION
CHECK (puntuacion BETWEEN 1 AND 5);

ALTER TABLE Comentario
ADD CONSTRAINT CK_COMENTARIO_ID
CHECK (id BETWEEN 1 AND 99999);

ALTER TABLE Comentario
ADD CONSTRAINT CK_COMENTARIO_IDEVALUACION
CHECK (idEvaluacion BETWEEN 1 AND 99999);/*
