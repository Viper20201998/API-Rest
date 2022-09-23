# API-Rest

create database betacode;

ejecutamos el comando en consola 
psql -U postgres -d betacode -h localhost < /ruta_del_archivo/betacode.sql

--comandos--
npm run dev

usamos postman para enviar peticiones
ejemplo
-----router('/') metodo post---

lo ejecutamos solo una vez genera las 80 registros de las evaluaciones
localhost:3000/genEvaluaciones

lo ejecutamos solo una vez genera los 20 registros de los alumnos
localhost:3000/genAlumnos

inserta nuevo estudiante al la base de datos
en el body JSON
localhost:3000/insAlumno
{
    "id":1,
    "nombre":"alum",
    "apellido":"sam",
    "correo":"alum@gmail.com",
    "telefono":"7075546"
}

inserta las notas a la tabla notas desde un archivo excel
localhost:3000/insNotas

-----router('/') metodo get---

devuelve todos los registros de los alumnos
localhost:3000/alumnos

/alumnos/:id busca el registro del estudiante dependiendo del 1 que  le pasemos
localhost:3000/alumnos/1

-----router('/') metodo put---

/actAlumnos/:id actualiza los registros de los alumnos le pasamos el id y en el body el archivo json
localhost:3000/actAlumnos/1
{
    "nombre":"les",
    "apellido":"sam",
    "correo":"lester@gmail.com",
    "telefono":"70754809"
}

-----router('/') metodo delete---
/delAlumno/:id elimina registros de los alumnos
localhost:3000/delAlumno/1 








