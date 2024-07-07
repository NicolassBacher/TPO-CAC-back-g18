// Importar el módulo dotenv para gestionar variables de entorno
require('dotenv').config();

// Importar el módulo mysql2/promise para trabajar con MySQL
const mysql = require('mysql2/promise');

// Configuración de la base de datos utilizando variables de entorno
const config = {
    host: process.env.DB_HOST || 'mysql-vabros.alwaysdata.net',
    user: process.env.DB_USER || 'vabros',
    password: process.env.DB_PASS || '2590Chue@',
    database: process.env.DB_DATABASE || 'vabros_cac_viajes'
};

// Crear un pool de conexiones a la base de datos
const pool = mysql.createPool(config);

// Exportar el pool de conexiones para usarlo en otras partes de la aplicación
module.exports = pool;
