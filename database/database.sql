CREATE DATABASE betacode;

CREATE TABLE maestros(
    idMaestros INT PRIMARY KEY,
    nombre VARCHAR(50),
    apellido VARCHAR(50),
    usuario VARCHAR(30),
    contra VARCHAR(30)
    );

    INSERT INTO maestros (idMaestros, nombre, apellido, usuario, contra) VALUES (1, 'les', 'enins', 'les1', '30345');
    INSERT INTO maestros (idMaestros, nombre, apellido, usuario, contra) VALUES (2, 'vip', 'sain', 'vles2', '25445');
    INSERT INTO maestros (idMaestros, nombre, apellido, usuario, contra) VALUES (3, 'scorp', 'els', 'scels3', '56gjs');
    INSERT INTO maestros (idMaestros, nombre, apellido, usuario, contra) VALUES (4, 'test', 'cod', 'tcd4', '502038dkc');

    SELECT * FROM maestros;



    CREATE TABLE alumnos(
        idAlumnos INT PRIMARY KEY,
        nombre VARCHAR(50),
        apellido VARCHAR(50),
        edad VARCHAR(3),
        sexo VARCHAR(2),
        correo VARCHAR(100),
        telefono VARCHAR(18)
    );
    
    --Grupo 1 backend
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (1, 'les', 'enins', '45', 'm', 'les@gmail.com','70754809');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (2, 'les2', 'enins2', '18', 'f', 'les2@gmail.com','70754823');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (3, 'les3', 'enins3', '23', 'm', 'les3@gmail.com','70754834');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (4, 'les4', 'enins4', '54', 'f', 'les4@gmail.com','70754876');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (5, 'les5', 'enins5', '78', 'm', 'les5@gmail.com','70754845');
     
     --Grupo 2 frontend
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (6, 'les6', 'enins6', '30', 'f', 'les6@gmail.com','70754898');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (7, 'les7', 'enins7', '36', 'f', 'les7@gmail.com','70754856');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (8, 'les8', 'enins8', '18', 'm', 'les8@gmail.com','70754845');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (9, 'les9', 'enins9', '56', 'f', 'les9@gmail.com','70754867');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (10, 'les10', 'enins10', '23', 'm', 'les10@gmail.com','70754854');
     
     --Grupo 3 devops
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (11, 'les11', 'enins11', '18', 'm', 'les11@gmail.com','70754834');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (12, 'les12', 'enins12', '34', 'f', 'les12@gmail.com','70754890');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (13, 'les13', 'enins13', '67', 'm', 'les13@gmail.com','70754867');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (14, 'les14', 'enins14', '32', 'f', 'les14@gmail.com','70754812');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (15, 'les15', 'enins15', '12', 'm', 'les15@gmail.com','70754856');
     
     --Grupo 4 mobile
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (16, 'les16', 'enins16', '23', 'm', 'les16@gmail.com','70754887');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (17, 'les17', 'enins17', '24', 'm', 'les17@gmail.com','70754840');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (18, 'les18', 'enins18', '23', 'f', 'les18@gmail.com','70754823');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (19, 'les19', 'enins19', '27', 'm', 'les19@gmail.com','70754845');
     INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES (20, 'les20', 'enins20', '28', 'f', 'les20@gmail.com','70754801');
     
     SELECT * FROM alumnos;

    CREATE TABLE evaluaciones(
        idEvaluaciones INT PRIMARY KEY,
        idAlumnos INT,
        idMaestros INT,
        grupo VARCHAR(20),
        aula VARCHAR(4),
        notas VARCHAR(2),
        FOREIGN KEY (idMaestros)
        REFERENCES maestros (idMaestros)
        ON DELETE CASCADE,
        FOREIGN KEY (idAlumnos)
        REFERENCES alumnos (idAlumnos)
        ON DELETE CASCADE
    );

    SELECT * FROM evaluaciones;
    
    --4 Evaluaciones del alumno 1 les grupo de backend
    INSERT INTO evaluaciones (idEvaluaciones, idAlumnos, idMaestros, grupo, aula, notas) VALUES (1, 1, 1, 'g1', 'A1', '4');
    INSERT INTO evaluaciones (idEvaluaciones, idAlumnos, idMaestros, grupo, aula, notas) VALUES (2, 1, 1, 'g1', 'A1', '5');
    INSERT INTO evaluaciones (idEvaluaciones, idAlumnos, idMaestros, grupo, aula, notas) VALUES (3, 1, 1, 'g1', 'A1', '6');
    INSERT INTO evaluaciones (idEvaluaciones, idAlumnos, idMaestros, grupo, aula, notas) VALUES (4, 1, 1, 'g1', 'A1', '8');