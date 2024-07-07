// Importar el módulo dotenv para gestionar variables de entorno
require('dotenv').config();

// Importar el módulo mysql2 para trabajar con MySQL
const mysql = require('mysql2');

// Configuración de la base de datos utilizando variables de entorno
const config = {
    host: process.env.DB_HOST || 'mysql-vabros.alwaysdata.net',
    user: process.env.DB_USER || 'vabros',
    password: process.env.DB_PASS || '2590Chue@',
    database: process.env.DB_DATABASE || 'vabros_cac_viajes'
};

// Crear la conexión a la base de datos
const connection = mysql.createConnection(config);

// Conectar a la base de datos y manejar posibles errores
connection.connect((error) => {
    if (error) {
        return console.error('Error de conexión:', error);
    }
    console.log('Conectados a la base de datos');
});

// Exportar la conexión para usarla en otras partes de la aplicación
module.exports = connection;
