const express = require('express')
const router = express.Router()
const path = require('path')


//se importa el modulo controlador
const controller = require('../controllers/reservasControllers.js')

router.post('/', controller.reservar)


module.exports = router