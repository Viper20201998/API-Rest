const { Router } = require('express');
const router = Router();

//importamos lo que viene de la carpeta controllers
const {
	getUsers,
	createUsers,
	getUsersById,
	deleteUser,
	updateUser,
    subirExcel
} = require('../controllers/index.controller');

router.get('/users', getUsers);
router.get('/users/:id', getUsersById);
//para guardar datos se utiliza el metodo post la misma ruta /users
router.post('/users', createUsers);
//actualizacion de registros.
router.put('/users/:id', updateUser);
//eliminar
router.delete('/users/:id', deleteUser);
//subir archivo excel
router.post('/user', subirExcel);

module.exports = router;
