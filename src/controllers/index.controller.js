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

const getUsers = async (req, res) => {
	const response = await pool.query('SELECT * FROM alumnos'); // es una operacion asincrono.
	res.status(200).json(response.rows);
};

const getUsersById = async (req, res) => {
	const id = req.params.id;
	const response = await pool.query(
		'SELECT * FROM alumnos WHERE idAlumnos = $1',
		[id]
	);
	res.json(response.rows);
};

const createUsers = async (req, res) => {
	const { id, nombre, apellido, edad, sexo, correo, telefono } = req.body;

	const response = await pool.query(
		'INSERT INTO alumnos (idAlumnos, nombre, apellido, edad, sexo, correo, telefono) VALUES ($1, $2, $3, $4, $5, $6, $7)',
		[id, nombre, apellido, edad, sexo, correo, telefono]
	);

	console.log(response);
	res.json({
		message: 'user added succesfully',
		body: {
			user: { id, nombre, apellido, edad, sexo, correo, telefono },
		},
	});
};

const updateUser = async (req, res) => {
	const id = req.params.id;
	const { nombre, apellido, edad, sexo, correo, telefono } = req.body;

	const response = await pool.query(
		'UPDATE alumnos SET nombre = $1, apellido = $2, edad = $3, sexo = $4, correo = $5, telefono = $6 WHERE idAlumnos = $7',
		[nombre, apellido, edad, sexo, correo, telefono, id]
	);

	console.log(response);
	res.send('user updated successfully');
};

const deleteUser = async (req, res) => {
	const id = req.params.id;
	const response = await pool.query(
		'DELETE FROM alumnos WHERE idAlumnos = $1',
		[id]
	);
	console.log(response);
	res.json(`user ${id} deleted successfully`);
};

//leer archivo xlsx
const excelAJson = () => {
	const excel = xlsx.readFile('./notas.xlsx');
	let nombreHoja = excel.SheetNames;
	let datos = xlsx.utils.sheet_to_json(excel.Sheets[nombreHoja[0]]);
	return datos;
};

const subirExcel = async (req, res) => {
	const dat = excelAJson();
	

	//console.log(dat);

	for (let i = 0; i < dat.length; i++) {

       let id = dat[i]["id"];
       let idA = dat[i]["idA"];
       let idM = dat[i]["idM"];
       let grupo = dat[i]["grupo"];
       let aula = dat[i]["aula"];
       let nota = dat[i]["nota"];

       const response = await pool.query(
        'INSERT INTO evaluaciones (idevaluaciones, idalumnos, idmaestros, grupo, aula, notas) VALUES ($1, $2, $3, $4, $5, $6)',
        [id, idA, idM, grupo, aula, nota]
    );

		//console.log(dat[i]);
		console.log(dat[i]["idA"]);
        
		
	};

		

	res.send('hecho');
};

//para exportar la funcion
module.exports = {
	getUsers,
	getUsersById,
	createUsers,
	updateUser,
	deleteUser,
	subirExcel
};
