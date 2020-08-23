const Car = require('../models/car')
const Models = require('../models/model')

module.exports={
    index(req,res){
        Car.all().then((results)=>{
            const cars = results.rows
            return res.render('cars/index.njk',{cars})
        }).catch((err)=>{
            throw new Error(err)
        })
    },
    create(req,res){
        Models.all().then((results)=>{
            const models = results.rows
            return res.render('cars/create',{models})
        }).catch((err)=>{
            throw new Error(err)
        })
    }
}