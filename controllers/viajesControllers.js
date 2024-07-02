const db = require('../db/db')
const pool = require('../db/dbAsync')

const show = (req, res) => {
    const sql = 'SELECT v.*, d.destino, d.descripcion, d.imagen FROM viajes AS v INNER JOIN destinos AS d ON d.id = v.destino_id'
    db.query(sql, (error, rows) => {
        //console.log(rows)
        if (error) {
            return res.status(500).json({ error: 'intente mas tarde' })
        }
        if (rows.length === 0) {
            return res.status(404).json({ error: 'No existe el viaje' })
        }
        res.json(rows)
    })
}




const showViaje = (req, res) => {
    const { id } = req.params
    const sql = 'SELECT v.*, h.nombre, d.destino, d.descripcion, d.imagen FROM viajes AS v INNER JOIN hoteles AS h ON h.id = v.hotel_id INNER JOIN destinos AS d ON d.id = v.destino_id WHERE v.id = ?'

    db.query(sql, [id], (error, rows) => {
        //console.log(rows)
        if (error) {
            return res.status(500).json({ error: 'intente mas tarde' })
        }
        if (rows.length === 0) {
            return res.status(404).json({ error: 'No existe el viaje' })
        }
        res.json(rows)
    })
}








module.exports = {
    showViaje,
    show,
}