const db = require('../db/db')
const pool = require('../db/dbAsync')

async function baseDatos(sql, values) {
    try {
        let datos = await pool.query(sql, values);
        console.log(datos[0], 'datos')
        return datos[0]

    } catch (err) {
        return 'error'
    }
}




const reservar = async (req, res) => {
    let pasajero = {}
    //traigo los datos del POST
    const { viaje_id, dni, nombre, apellido, telefono, email, fecha_nacimiento, cantidad_acompanantes } = req.body

    //Consulto si existe el pasajero, si existe devuelve en la cosntante pasajero [{ id:x , dni:xxxxxxxx}], si no existe devuelve []
    const sql1 = 'SELECT pasajeros.id, pasajeros.dni FROM pasajeros WHERE pasajeros.dni = ?'
    pasajero = await baseDatos(sql1, dni)

    //verifico que no se produjo un error
    if (pasajero === 'error') { return res.status(500).json({ error: 'intente mas tarde' }) }

    console.log(pasajero)
    if (pasajero.length == 0) {
        //si el pasajero no existe en base de datos lo creo
        const sql2 = 'INSERT INTO pasajeros (dni, nombre, apellido, telefono, email, fecha_nacimiento) VALUES (?, ?, ?, ?, ?, ?)'
        const values2 = [dni, nombre, apellido, telefono, email, fecha_nacimiento]
        //traigo el id creado
        const insertID = await baseDatos(sql2, values2)
        //verifico que no se produjo un error
        if (insertID === 'error') { return res.status(500).json({ error: 'intente mas tarde' }) }

        //cargo el id del nuevo pasajero y el dni en el objeto pasajero
        pasajero = [{ id: insertID.insertId, dni: dni }]
    } else {
        //si el pasajero existe, actualizo los datos
        const sql3 = 'UPDATE pasajeros SET nombre = ?, apellido = ?, telefono = ?, email = ?, fecha_nacimiento = ? WHERE id = ?'
        const values3 = [nombre, apellido, telefono, email, fecha_nacimiento, pasajero[0].id]
        const actualizar = await baseDatos(sql3, values3)
        //verifico que no se produjo un error
        if (actualizar === 'error') { return res.status(500).json({ error: 'intente mas tarde' }) }

        //si el pasajero existe verifico que no tenga una reserva hecha para ese viaje seleccionado
        const sql4 = 'SELECT reservas.viaje_id, reservas.pasajero_id FROM reservas WHERE reservas.viaje_id = ? AND reservas.pasajero_id = ?'
        const values4 = [viaje_id, pasajero[0].id]
        const existeReserva = await baseDatos(sql4, values4)
        //verifico que no se produjo un error
        if (existeReserva === 'error') { return res.status(500).json({ error: 'intente mas tarde' }) }


        if (existeReserva.length != 0) {
            //si exisite una reserva envio el mensaje
            return res.json({ error: 'Usted ya posee una reserva para este viaje' })
        }

        //si paso las validaciones creo la reserva
        const sql5 = 'INSERT INTO reservas (viaje_id, pasajero_id, cantidad_acompanantes) VALUES (?, ?, ?)'
        const pasajero_id = pasajero[0].id
        const values5 = [viaje_id, pasajero_id, cantidad_acompanantes]
        const reservado = await baseDatos(sql5, values5)
        //verifico que no se produjo un error 
        if (reservado === 'error') { return res.status(500).json({ error: 'intente mas tarde adasd' }) }
        const reserva = { ...req.body }
        res.json(reserva)
    }
}

module.exports = {
    reservar,
}