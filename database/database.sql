CREATE DATABASE betacode;

CREATE TABLE maestros (
  idMaestros int PRIMARY KEY,
  nombre varchar(50),
  apellido varchar(50)
);

    INSERT INTO maestros (idMaestros, nombre, apellido) VALUES (1, 'les', 'enins');
    INSERT INTO maestros (idMaestros, nombre, apellido) VALUES (2, 'vip', 'sain');
    INSERT INTO maestros (idMaestros, nombre, apellido) VALUES (3, 'scorp', 'els');
    INSERT INTO maestros (idMaestros, nombre, apellido) VALUES (4, 'test', 'cod');

    SELECT * FROM maestros;

CREATE TABLE alumnos (
  idAlumnos int PRIMARY KEY,
  nombre varchar(50),
  apellido varchar(50),
  correo varchar(50),
  telefono varchar(50)
);

SELECT * FROM alumnos;

CREATE TABLE grupos (
  idGrupos int PRIMARY KEY,
  nombre varchar(50)
);

INSERT INTO grupos (idGrupos, nombre) VALUES (1, 'backend');
INSERT INTO grupos (idGrupos, nombre) VALUES (2, 'frontend');
INSERT INTO grupos (idGrupos, nombre) VALUES (3, 'devops');
INSERT INTO grupos (idGrupos, nombre) VALUES (4, 'mobile');

SELECT * FROM grupos;

CREATE TABLE aulas (
  idAulas int,
  idGrupos int,
  nombre varchar(50)
);

INSERT INTO aulas (idAulas, idGrupos, nombre) VALUES (1, 1, 'A1');
INSERT INTO aulas (idAulas, idGrupos, nombre) VALUES (2, 2, 'A2');
INSERT INTO aulas (idAulas, idGrupos, nombre) VALUES (3, 3, 'A3');
INSERT INTO aulas (idAulas, idGrupos, nombre) VALUES (4, 4, 'A4');

SELECT * FROM aulas;

CREATE TABLE evaluaciones (
  idEvaluaciones int PRIMARY KEY,
  nombre varchar(50)
);

SELECT * FROM evaluaciones;

CREATE TABLE nota (
  idNota int PRIMARY KEY,
  idEvaluaciones int,
  idAlumnos int,
  notas varchar(50)
);

SELECT * FROM nota;

CREATE TABLE grMaestro (
  idgMaestro int PRIMARY KEY,
  idMaestros int,
  idGrupos int
);

INSERT INTO grMaestro (idgMaestro, idMaestros, idGrupos) VALUES (1, 1, 1);
INSERT INTO grMaestro (idgMaestro, idMaestros, idGrupos) VALUES (2, 2, 2);
INSERT INTO grMaestro (idgMaestro, idMaestros, idGrupos) VALUES (3, 3, 3);
INSERT INTO grMaestro (idgMaestro, idMaestros, idGrupos) VALUES (4, 4, 4);

SELECT * FROM grMaestro;

CREATE TABLE grAlumnos (
  idgAlumnos int PRIMARY KEY,
  idAlumnos int,
  idGrupos int
);
--backend
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (1, 1, 1);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (2, 2, 1);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (3, 3, 1);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (4, 4, 1);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (5, 5, 1);

--frontend
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (6, 6, 2);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (7, 7, 2);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (8, 8, 2);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (9, 9, 2);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (10, 10, 2);

--devops
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (11, 11, 3);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (12, 12, 3);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (13, 13, 3);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (14, 14, 3);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (15, 15, 3);

--mobile
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (16, 16, 4);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (17, 17, 4);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (18, 18, 4);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (19, 19, 4);
INSERT INTO grAlumnos (idgAlumnos, idAlumnos, idGrupos) VALUES (20, 20, 4);

SELECT * FROM grAlumnos;

CREATE TABLE usuari (
  idUser int PRIMARY KEY,
  idMaestros int,
  usuario varchar(50),
  contra varchar(50)
);

INSERT INTO usuari (idUser, idMaestros, usuario, contra) VALUES (1, 1, 'les1', 'abcd1');
INSERT INTO usuari (idUser, idMaestros, usuario, contra) VALUES (2, 2, 'vip2', 'abcd2');
INSERT INTO usuari (idUser, idMaestros, usuario, contra) VALUES (3, 3, 'scorp3', 'abcd3');
INSERT INTO usuari (idUser, idMaestros, usuario, contra) VALUES (4, 4, 'test4', 'abcd4');

SELECT * FROM usuari;

ALTER TABLE usuari ADD FOREIGN KEY (idMaestros) REFERENCES maestros (idMaestros);

ALTER TABLE grAlumnos ADD FOREIGN KEY (idAlumnos) REFERENCES alumnos (idAlumnos);

ALTER TABLE nota ADD FOREIGN KEY (idEvaluaciones) REFERENCES evaluaciones (idEvaluaciones);

ALTER TABLE grMaestro ADD FOREIGN KEY (idMaestros) REFERENCES maestros (idMaestros);

ALTER TABLE grMaestro ADD FOREIGN KEY (idGrupos) REFERENCES grupos (idGrupos);

ALTER TABLE aulas ADD FOREIGN KEY (idGrupos) REFERENCES grupos (idGrupos);

ALTER TABLE grAlumnos ADD FOREIGN KEY (idGrupos) REFERENCES grupos (idGrupos);

ALTER TABLE nota ADD FOREIGN KEY (idAlumnos) REFERENCES alumnos (idAlumnos);


DROP TABLE user;
DROP TABLE maestros;
DROP TABLE alumnos;
DROP TABLE nota;
DROP TABLE aulas;
DROP TABLE grupos;
DROP TABLE evaluaciones;
DROP TABLE grAlumnos;
DROP TABLE grMaestro;

DELETE FROM NOTA;



select g.nombre, a.nombre, m.nombre
from grupos as g 
inner join aulas a on g.idgrupos = a.idgrupos
inner join grmaestro gm on g.idgrupos = gm.idgrupos
inner join maestros m on gm.idmaestros = m.idmaestros
;