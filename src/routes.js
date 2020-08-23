const express = require('express')
const routes = express.Router()
const Cars = require('../src/app/controllers/cars')

routes.get('/admin/cars', Cars.index)
routes.get('/admin/cars/create', Cars.create)
routes.post('/cars', Cars.post)

module.exports = routes