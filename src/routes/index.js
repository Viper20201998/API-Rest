const { Router } = require('express');
const router = Router();

//importamos lo que viene de la carpeta controllers
const {
	getUsers,
	insAlumno,
	getUsersById,
	delAlum,
	updatealumnos,
    insNotas,
	genReEvaluacion,
	genReAlumnos,
	logMaster
} = require('../controllers/index.controller');

//solo se ejecutan 1 vez//
//estas rutas solo son para generar todos los registros de la base de datos 
router.post('/genEvaluaciones', genReEvaluacion); //generar registros de la tabla evaluaciones en total 80
router.post('/genAlumnos', genReAlumnos); //genera registros de la tabla alumnos en total 20

//le enviamos un json con las credenciales
router.get('/login', logMaster);

//lista de todos los estudiantes
router.get('/alumnos', getUsers);

//busca un alumnos en especifico pasando un parametro localhots:3000/alumnos/1
router.get('/alumnos/:id', getUsersById);

//podemos ingresar nuevos alumnos de forma JSON
router.post('/insAlumno', insAlumno);

//actualizacion de registros de los alumnos.
router.put('/actAlumnos/:id', updatealumnos);

//elimina los registros de los alumnos
router.delete('/delAlumno/:id', delAlum);

//ingresa las notas a la base de datos desde el excel
router.post('/insNotas', insNotas);




module.exports = router;
