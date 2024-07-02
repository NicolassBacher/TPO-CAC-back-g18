-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost:3306
-- Tiempo de generación: 02-07-2024 a las 02:56:51
-- Versión del servidor: 8.0.30
-- Versión de PHP: 8.1.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `cac_viajes`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `destinos`
--

CREATE TABLE `destinos` (
  `id` int UNSIGNED NOT NULL,
  `destino` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `descripcion` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `imagen` varchar(50) COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `destinos`
--

INSERT INTO `destinos` (`id`, `destino`, `descripcion`, `imagen`) VALUES
(6, 'Cataratas del Iguazú', 'Una de las Siete Maravillas Naturales del Mundo, los saltos de agua más impactantes del planeta dentro de la selva misionera.', '1719059080.jpg'),
(7, 'San Rafael', 'Destino de montaña perfecto para disfrutar en verano: lagos, ríos, turismo aventura, bodegas y viñedos, y claro, buena movida nocturna.', ' 1719055480.jpg'),
(9, 'Esquel', 'Uno de los rincones más lindos de nuestra Patagonia, puerta de entrada al Parque Nacional los Alerces, patrimonio de la humanidad.', '1719062680.jpg'),
(10, 'Norte Argentino', 'Hogar de paisajes pintorescos, gastronomía única, peñas folklóricas y gente maravillosa. Destino mágico sin igual.', '1719069890.jpg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `hoteles`
--

CREATE TABLE `hoteles` (
  `id` int UNSIGNED NOT NULL,
  `destino_id` int UNSIGNED NOT NULL,
  `nombre` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `direccion` varchar(35) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `telefono` int DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `web` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `estrellas` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `hoteles`
--

INSERT INTO `hoteles` (`id`, `destino_id`, `nombre`, `direccion`, `telefono`, `email`, `web`, `estrellas`) VALUES
(1, 6, 'Hotel Catarata', NULL, NULL, NULL, NULL, 4),
(2, 7, 'Hotel Don Rafael', NULL, NULL, NULL, NULL, 3),
(3, 9, 'Esquel Hotel', NULL, NULL, NULL, NULL, 5),
(4, 10, 'hotel Jujuy', NULL, NULL, NULL, NULL, 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pasajeros`
--

CREATE TABLE `pasajeros` (
  `id` int UNSIGNED NOT NULL,
  `dni` int UNSIGNED NOT NULL,
  `nombre` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `apellido` varchar(30) COLLATE utf8mb4_general_ci NOT NULL,
  `telefono` int NOT NULL,
  `email` varchar(25) COLLATE utf8mb4_general_ci NOT NULL,
  `fecha_nacimiento` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `pasajeros`
--

INSERT INTO `pasajeros` (`id`, `dni`, `nombre`, `apellido`, `telefono`, `email`, `fecha_nacimiento`) VALUES
(1, 15266352, 'sgfdsf', 'dsfadf', 12512344, 'asfsda@gfdgs64.ad', '2024-06-25'),
(3, 11111111, 'Pepito', 'Peres', 1568859568, 'pepo@gmail.com', '2001-06-12'),
(34, 11711118, 'Pepito', 'Peres', 1568859568, 'pepo@gmail.com', '2001-06-12');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `reservas`
--

CREATE TABLE `reservas` (
  `viaje_id` int UNSIGNED NOT NULL,
  `pasajero_id` int UNSIGNED NOT NULL,
  `cantidad_acompanantes` int UNSIGNED NOT NULL,
  `codigo_reserva` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `reservas`
--

INSERT INTO `reservas` (`viaje_id`, `pasajero_id`, `cantidad_acompanantes`, `codigo_reserva`) VALUES
(1, 1, 3, '2024-06-28 00:11:46'),
(2, 3, 1, '2024-06-28 00:12:06'),
(10, 34, 2, '2024-07-02 02:03:10'),
(1, 34, 2, '2024-07-02 02:04:47');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `viajes`
--

CREATE TABLE `viajes` (
  `id` int UNSIGNED NOT NULL,
  `destino_id` int UNSIGNED NOT NULL,
  `transporte` enum('Bus Semicama','Bus Cama','Aéreo') CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'Bus Semicama',
  `cantidad_dias` int UNSIGNED NOT NULL,
  `cantidad_noches` int UNSIGNED NOT NULL,
  `salida` date NOT NULL,
  `regreso` date NOT NULL,
  `hotel_id` int UNSIGNED NOT NULL,
  `cantidad_pasajero` int UNSIGNED NOT NULL,
  `cantidad_reservas` int UNSIGNED NOT NULL,
  `precio` float UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `viajes`
--

INSERT INTO `viajes` (`id`, `destino_id`, `transporte`, `cantidad_dias`, `cantidad_noches`, `salida`, `regreso`, `hotel_id`, `cantidad_pasajero`, `cantidad_reservas`, `precio`) VALUES
(1, 6, 'Bus Semicama', 5, 2, '2024-06-09', '2024-06-13', 1, 47, 0, 33000),
(2, 6, 'Bus Semicama', 5, 2, '2024-07-14', '2024-07-18', 1, 53, 0, 35000),
(3, 6, 'Bus Semicama', 5, 2, '2024-10-10', '2024-10-14', 1, 53, 0, 35000),
(4, 6, 'Bus Semicama', 5, 2, '2024-11-12', '2024-11-16', 1, 53, 0, 40000),
(5, 6, 'Bus Semicama', 5, 2, '2025-02-12', '2025-02-16', 1, 53, 0, 40000),
(6, 6, 'Bus Semicama', 5, 2, '2025-05-20', '2025-05-25', 1, 53, 0, 45000),
(7, 6, 'Bus Semicama', 5, 2, '2025-08-12', '2025-08-16', 1, 53, 0, 50000),
(8, 7, 'Aéreo', 7, 6, '2024-06-10', '2024-06-16', 2, 32, 0, 90000),
(9, 7, 'Aéreo', 7, 6, '2024-08-05', '2024-08-11', 2, 32, 0, 90000),
(10, 7, 'Aéreo', 7, 6, '2025-01-10', '2025-01-16', 2, 32, 0, 100000),
(11, 7, 'Aéreo', 7, 6, '2025-01-20', '2025-01-26', 2, 32, 0, 100000),
(12, 7, 'Aéreo', 7, 6, '2025-02-03', '2025-02-09', 2, 32, 0, 100000),
(13, 7, 'Aéreo', 7, 6, '2025-03-03', '2025-03-09', 2, 32, 0, 100000),
(14, 9, 'Aéreo', 6, 5, '2025-03-20', '2025-03-25', 3, 35, 0, 120000),
(15, 9, 'Aéreo', 6, 5, '2025-06-10', '2025-06-15', 3, 35, 0, 200000),
(16, 9, 'Aéreo', 6, 5, '2024-07-20', '2024-07-25', 3, 35, 0, 102000),
(17, 9, 'Aéreo', 6, 5, '2024-08-12', '2024-08-17', 3, 35, 0, 105000),
(18, 9, 'Aéreo', 6, 5, '2024-09-05', '2024-09-10', 3, 35, 0, 105000),
(19, 10, 'Bus Cama', 9, 6, '2024-11-05', '2024-11-13', 4, 39, 0, 80000),
(20, 10, 'Bus Cama', 9, 6, '2024-10-05', '2024-10-13', 4, 39, 0, 80000),
(21, 10, 'Aéreo', 7, 6, '2027-10-07', '2027-10-13', 4, 32, 0, 110000),
(22, 10, 'Aéreo', 7, 6, '2024-08-19', '2024-08-25', 4, 32, 0, 110000),
(23, 10, 'Bus Cama', 9, 6, '2025-02-05', '2025-02-13', 4, 39, 0, 80000),
(24, 10, 'Aéreo', 7, 6, '2024-07-20', '2024-07-27', 4, 35, 0, 110000),
(25, 10, 'Bus Cama', 9, 6, '2025-06-01', '2025-06-09', 4, 39, 0, 100000),
(26, 10, 'Aéreo', 7, 6, '2025-04-29', '2025-05-05', 4, 35, 0, 135000);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `destinos`
--
ALTER TABLE `destinos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_destino` (`destino_id`);

--
-- Indices de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD KEY `pasajero_id` (`pasajero_id`),
  ADD KEY `viaje_id` (`viaje_id`);

--
-- Indices de la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_destino` (`destino_id`),
  ADD KEY `id_hotel` (`hotel_id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `destinos`
--
ALTER TABLE `destinos`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `hoteles`
--
ALTER TABLE `hoteles`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `pasajeros`
--
ALTER TABLE `pasajeros`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;

--
-- AUTO_INCREMENT de la tabla `viajes`
--
ALTER TABLE `viajes`
  MODIFY `id` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `hoteles`
--
ALTER TABLE `hoteles`
  ADD CONSTRAINT `hoteles_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `reservas`
--
ALTER TABLE `reservas`
  ADD CONSTRAINT `reservas_ibfk_1` FOREIGN KEY (`pasajero_id`) REFERENCES `pasajeros` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `reservas_ibfk_2` FOREIGN KEY (`viaje_id`) REFERENCES `viajes` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;

--
-- Filtros para la tabla `viajes`
--
ALTER TABLE `viajes`
  ADD CONSTRAINT `viajes_ibfk_1` FOREIGN KEY (`destino_id`) REFERENCES `destinos` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  ADD CONSTRAINT `viajes_ibfk_2` FOREIGN KEY (`hotel_id`) REFERENCES `hoteles` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
