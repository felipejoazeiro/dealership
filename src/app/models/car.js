const db = require('../../config/db')

module.exports = {
    all(){
        return db.query(`SELECT * FROM cars`)
    },
    create(data){
        const query = `
            INSERT INTO cars(
                models_id,
                color,
                plate,
                direction,
                price,
                old_price,
                quantity
            ) VALUES ($1,$2,$3,$4,$5,$6,$7)
            RETURNING id
        `
        data.price = data.price.replace(/\D/g,"")
        const values = [
            data.models_id,
            data.color,
            data.plate,
            data.direction,
            data.price,
            data.old_price || data.price,
            data.quantity
        ]
        return db.query(query,values)
    }
}