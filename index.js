const express = require('express')
const app = express()

const path = require('path')

app.use(express.static(path.join(__dirname, 'public')))

app.use(express.json())


// const db = require('./db/db')

const reservasRouter = require("./routes/reservasRouter.js")
app.use('/reservar', reservasRouter)

// app.get('/viajes', (req, res) => {
//     const sql = 'SELECT v.*, h.nombre, d.destino, d.descripcion, d.imagen FROM viajes AS v INNER JOIN hoteles AS h ON h.id = v.hotel_id INNER JOIN destinos AS d ON d.id = v.destino_id'
//     db.query(sql, (error, rows) => {
//         //console.log(rows)
//         if (error) {
//             return res.status(500).json({ error: 'intente mas tarde' })
//         }
//         res.json(rows)
//     })

// })

const viajesRouter = require("./routes/viajesRouter.js")
app.use('/', viajesRouter)


const PORT = 3000
app.listen(PORT, () => console.log(`http://localhost:${PORT}`))