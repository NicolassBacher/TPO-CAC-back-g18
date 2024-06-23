const mysql = require('mysql2')

const conection = mysql.createConnection({
    host: 'localhost',
    user: 'root',
    password: '',
    database: 'cac_viajes',
})

conection.connect((error) => {
    if (error) {
        return console.log(error)
    }
    console.log('conectados')
})

module.exports = conection