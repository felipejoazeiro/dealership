const express = require('express')
const routes = express.Router()
const Cars = require('../src/app/controllers/cars')

routes.get('/', Cars.index)

module.exports = routes