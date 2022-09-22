const { json } = require('express');
const { Pool } = require('pg');
const xlsx = require('xlsx');

//le asignaremos los parametros de conexion
const pool = new Pool({
	host: 'localhost',
	user: 'postgres',
	password: 'root',
	database: 'betacode',
	port: '5432',
});

//lista todos los registros de los alumnos como JSON
const getUsers = async (req, res) => {
	const response = await pool.query('SELECT * FROM alumnos'); 
	res.status(200).json(response.rows);
};

//esta funcion busca los alumnos
const getUsersById = async (req, res) => {
	const id = req.params.id;
	const response = await pool.query(
		'SELECT * FROM alumnos WHERE idAlumnos = $1',
		[id]
	);
	res.json(response.rows);
};

//inserta datos de alumnos
const insAlumno = async (req, res) => {
	const { id, nombre, apellido, correo, telefono } = req.body;

	const response = await pool.query(
		'INSERT INTO alumnos (idAlumnos, nombre, apellido, correo, telefono) VALUES ($1, $2, $3, $4, $5)',
		[id, nombre, apellido, correo, telefono]
	);

	console.log(response);
	res.json({
		message: 'user added succesfully',
		body: {
			user: { id, nombre, apellido, correo, telefono },
		},
	});
};

//actualiza los datos de los alumnos
const updatealumnos = async (req, res) => {
	const id = req.params.id;
	const { nombre, apellido, correo, telefono } = req.body;

	const response = await pool.query(
		'UPDATE alumnos SET nombre = $1, apellido = $2, correo = $3, telefono = $4 WHERE idAlumnos = $5',
		[nombre, apellido, correo, telefono, id]
	);

	console.log(response);
	res.send('user updated successfully');
};

//elimina los registros de los alumnos
const delAlum = async (req, res) => {
	const id = req.params.id;

	const response = await pool.query(
		'DELETE FROM alumnos WHERE idAlumnos = $1',
		[id]
	);
	console.log(response);
	res.json(`alunno ${id} deleted successfully`);
};

//convierte el excel a json
const excelAJson = () => {
	const excel = xlsx.readFile('./notas2.xlsx');
	let nombreHoja = excel.SheetNames;
	let datos = xlsx.utils.sheet_to_json(excel.Sheets[nombreHoja[0]]);
	return datos;
};

//ingresamos las notas el la base de datos.
const insNotas = async (req, res) => {
	const dat = excelAJson();

	for (let i = 0; i < dat.length; i++) {
		let id = dat[i]['id'];
		let ideva = dat[i]['ideva'];
		let idalum = dat[i]['idalum'];
		let nota = dat[i]['nota'];

		const response = await pool.query(
			'INSERT INTO nota (idnota, idevaluaciones, idalumnos, notas) VALUES ($1, $2, $3, $4)',
			[id, ideva, idalum, nota]
		);
	}
	res.send('notas ingresadas con exito');
};

//login de los maestros

const logMaster = async (req, res) => {
	const {usuario, contra} = req.body;

	const response = await pool.query('SELECT * FROM usuari WHERE usuario = $1 AND contra = $2',
	[usuario, contra]
	);	
	res.send('bienbenido');
	
	
};

//generador de registros de la tabla alumnos
const genReAlumnos = async (req, res) => {
	for (let i = 1; i < 21; i++) {
		let id = `${i}`;
		console.log(id);
		let nombre = `alumno${i}`;
		let apellido = `sam${i}`;
		let correo = `alumno${i}@gmil.com`;
		let telefono = `7898091${i}`;
		const response = await pool.query(
			'INSERT INTO alumnos (idAlumnos, nombre, apellido, correo, telefono) VALUES ($1, $2, $3, $4, $5)',
			[id, nombre, apellido, correo, telefono]
		);
	}
	res.send('datos registrados correctamente');
};

const genReEvaluacion = async (req, res) => {
	for (let i = 1; i < 81; i++) {
		let id = `${i}`;
		console.log(id);
		let nombre = `evaluacion${i}`;
		const response = await pool.query(
			'INSERT INTO evaluaciones (idEvaluaciones, nombre) VALUES ($1, $2)',
			[id, nombre]
		);
	}
	res.send('datos registrados correctamente');
};

//para exportar la funcion
module.exports = {
	getUsers,
	getUsersById,
	insAlumno,
	updatealumnos,
	delAlum,
	insNotas,
	genReEvaluacion,
	genReAlumnos,
	logMaster
};
