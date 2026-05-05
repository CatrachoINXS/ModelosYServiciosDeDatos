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