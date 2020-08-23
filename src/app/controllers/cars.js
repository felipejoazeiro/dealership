const Car = require('../models/car')

module.exports={
    index(req,res){
        Car.all().then((results)=>{
            const cars = results.rows
            return res.render('cars/index.njk',{cars})
        }).catch((err)=>{
            throw new Error(err)
        })
    }
}