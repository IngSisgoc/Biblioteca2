-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 12-06-2025 a las 05:07:07
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `biblioteca2`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `libros`
--

CREATE TABLE `libros` (
  `ID_LIBRO` int(11) NOT NULL,
  `ISBN` varchar(20) DEFAULT NULL,
  `TIPO_LIBRO` int(11) DEFAULT NULL,
  `TITULO` varchar(100) DEFAULT NULL,
  `AUTOR` varchar(100) DEFAULT NULL,
  `EDITORIAL` varchar(100) DEFAULT NULL,
  `ANIO_PUBLICACION` date DEFAULT NULL,
  `CANTIDAD` int(11) DEFAULT NULL,
  `CATEGORIA` varchar(50) DEFAULT NULL,
  `FECHA_REGISTRO` datetime DEFAULT NULL,
  `USUARIO_REGISTER` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `libros`
--

INSERT INTO `libros` (`ID_LIBRO`, `ISBN`, `TIPO_LIBRO`, `TITULO`, `AUTOR`, `EDITORIAL`, `ANIO_PUBLICACION`, `CANTIDAD`, `CATEGORIA`, `FECHA_REGISTRO`, `USUARIO_REGISTER`) VALUES
(1, '9788498388122', 1, 'Cien Años de Soledad', 'Gabriel García Márquez', 'Sudamericana', '1967-05-30', 5, 'Novela', '2025-06-11 18:50:33', 1),
(2, '9783161484100', 2, 'El Principito', 'Antoine de Saint-Exupéry', 'Reynal & Hitchcock', '1943-04-06', 3, 'Fábula', '2025-06-11 18:50:33', 2),
(3, '9788437604947', 1, 'Don Quijote de la Mancha', 'Miguel de Cervantes', 'Francisco de Robles', '1605-01-16', 4, 'Novela', '2025-06-11 18:50:33', 1),
(4, '9789871138209', 3, 'La Sombra del Viento', 'Carlos Ruiz Zafón', 'Planeta', '2001-04-12', 6, 'Misterio', '2025-06-11 18:50:33', 3);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `persona`
--

CREATE TABLE `persona` (
  `ID` int(11) NOT NULL,
  `Nombre` varchar(500) NOT NULL,
  `Correo` varchar(500) NOT NULL,
  `contrasena` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `persona`
--

INSERT INTO `persona` (`ID`, `Nombre`, `Correo`, `contrasena`) VALUES
(1, 'Sergio', 'U17304698@utp.edu.pe', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225'),
(2, 'Edward', 'U19202253@utp.edu.pe', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225'),
(3, 'Jomar', 'U21317793@utp.edu.pe', '15e2b0d3c33891ebb0f1ef609ec419420c20e320ce94c65fbc8c3312448eb225');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo`
--

CREATE TABLE `prestamo` (
  `ID` int(11) NOT NULL,
  `ID_persona` int(11) DEFAULT NULL,
  `libro` varchar(255) DEFAULT NULL,
  `fecha_prestamo` date DEFAULT NULL,
  `fecha_vencimiento` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `prestamo`
--

INSERT INTO `prestamo` (`ID`, `ID_persona`, `libro`, `fecha_prestamo`, `fecha_vencimiento`) VALUES
(1, 1, 'Cien Años de Soledad', '2025-06-10', '2025-06-12'),
(2, 2, 'El Principito', '2025-06-10', '2025-06-15'),
(3, 3, '1984', '2025-06-10', '2025-06-11'),
(4, 1, 'Don Quijote', '2025-06-10', '2025-06-13');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `libros`
--
ALTER TABLE `libros`
  ADD PRIMARY KEY (`ID_LIBRO`);

--
-- Indices de la tabla `persona`
--
ALTER TABLE `persona`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID_persona` (`ID_persona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `libros`
--
ALTER TABLE `libros`
  MODIFY `ID_LIBRO` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `persona`
--
ALTER TABLE `persona`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `prestamo`
--
ALTER TABLE `prestamo`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `prestamo`
--
ALTER TABLE `prestamo`
  ADD CONSTRAINT `prestamo_ibfk_1` FOREIGN KEY (`ID_persona`) REFERENCES `persona` (`ID`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
