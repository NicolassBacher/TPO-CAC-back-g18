const express = require('express')
const app = express()

const path = require('path')

app.use(express.static(path.join(__dirname, 'public')))

app.use(express.json())

const reservasRouter = require("./routes/reservasRouter.js")
app.use('/reservar', reservasRouter)

const viajesRouter = require("./routes/viajesRouter.js")
app.use('/viajes', viajesRouter)


const PORT = 3000
app.listen(PORT, () => console.log(`http://localhost:${PORT}`))