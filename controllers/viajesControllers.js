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
            return res.status(404).json({ error: 'No existen el viajes' })
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

const cargarViaje = (req, res) => {

    const { destino_id, transporte, cantidad_dias, cantidad_noches, salida, regreso, hotel_id, cantidad_pasajero, cantidad_reservas, precio } = req.body
    const sql = 'INSERT INTO viajes (destino_id, transporte, cantidad_dias, cantidad_noches, salida, regreso, hotel_id, cantidad_pasajero, cantidad_reservas, precio) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?) '
    const values = [destino_id, transporte, cantidad_dias, cantidad_noches, salida, regreso, hotel_id, cantidad_pasajero, cantidad_reservas, precio]

    db.query(sql, values, (error, result) => {
        if (error) {
            return res.status(500).json({ error: 'intente mas tarde' })
        }
        const viaje = { id: result.insertId, ...req.body, mensaje: 'El viaje fue guardado correctamente' }
        res.json(viaje)
    })
}

const modificarViaje = (req, res) => {
    const { id } = req.params
    const { destino_id, transporte, cantidad_dias, cantidad_noches, salida, regreso, hotel_id, cantidad_pasajero, cantidad_reservas, precio } = req.body
    const sql = 'UPDATE viajes SET destino_id = ?, transporte = ?, cantidad_dias = ?, cantidad_noches = ?, salida = ?, regreso = ?, hotel_id = ?, cantidad_pasajero = ?, cantidad_reservas = ?, precio = ? WHERE id = ?'
    const values = [destino_id, transporte, cantidad_dias, cantidad_noches, salida, regreso, hotel_id, cantidad_pasajero, cantidad_reservas, precio, id]

    db.query(sql, values, (error, result) => {
        if (error) {
            return res.status(500).json({ error: 'intente mas tarde' })
        }
        const viaje = { id: id, ...req.body, mensaje: 'El viaje fue actualizado correctamente' }
        res.json(viaje)
    })
}

const deleteViaje = (req, res) => {
    console.log('entre')
    const { id } = req.params
    const sql = 'DELETE FROM viajes WHERE id = ?'
    const values = [id]

    db.query(sql, values, (error, result) => {
        if (error) {
            console.log(error)
            return res.status(500).json({ error: 'intente mas tarde' })
        }
        const viaje = { mensaje: `El viaje con id=${id} fue eliminado correctamente` }
        res.json(viaje)
    })
}


module.exports = {
    showViaje,
    show,
    cargarViaje,
    modificarViaje,
    deleteViaje,
}