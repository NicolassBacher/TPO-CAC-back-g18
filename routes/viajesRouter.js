const express = require('express')
const router = express.Router()
const path = require('path')


//se importa el modulo controlador
const controller = require('../controllers/viajesControllers.js')

router.get('/:id', controller.showViaje)
router.get('/', controller.show)



module.exports = router