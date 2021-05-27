-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 26-05-2021 a las 19:53:50
-- Versión del servidor: 10.4.16-MariaDB
-- Versión de PHP: 7.4.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `proyecto`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `disponibilidad` (IN `fecha` DATETIME)  BEGIN 

SELECT * FROM prestamo_ambientes, ambientes WHERE fecha NOT between fecha_prestamo AND fecha_devolucion;

END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ambientes`
--

CREATE TABLE `ambientes` (
  `no` int(20) NOT NULL,
  `cede` varchar(50) NOT NULL,
  `nom_aula` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--

--
-- Disparadores `ambientes`
--
DELIMITER $$
CREATE TRIGGER `drop_ambientes` AFTER DELETE ON `ambientes` FOR EACH ROW INSERT INTO re_drop( id, descripcion, fecha_registro ) VALUES( null, 'Se borró un registro de ambientes', NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `instructores`
--

CREATE TABLE `instructores` (
  `No_documento` int(15) NOT NULL,
  `nom_instructor` varchar(35) NOT NULL,
  `no` int(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--


--
-- Disparadores `instructores`
--
DELIMITER $$
CREATE TRIGGER `DROP_instructores` AFTER DELETE ON `instructores` FOR EACH ROW INSERT INTO re_drop ( id, descripcion, fecha_registro ) VALUES( null, 'Se borró un registro de instructores', NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `prestamo_ambientes`
--

CREATE TABLE `prestamo_ambientes` (
  `fecha_registro` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `hora_ingreso` time NOT NULL,
  `hora_salida` time NOT NULL,
  `observaciones` varchar(100) DEFAULT NULL,
  `no` int(20) DEFAULT NULL,
  `id` int(11) DEFAULT NULL,
  `fecha_prestamo` datetime DEFAULT NULL,
  `fecha_devolucion` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `prestamo_ambientes`
--



--
-- Disparadores `prestamo_ambientes`
--
DELIMITER $$
CREATE TRIGGER `eliminar` AFTER DELETE ON `prestamo_ambientes` FOR EACH ROW INSERT INTO re_drop ( id, descripcion, fecha_registro ) VALUES( null, 'Se borró un registro de prestamo', NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `programas`
--

CREATE TABLE `programas` (
  `ficha` int(15) NOT NULL,
  `nom_programa` varchar(50) NOT NULL,
  `No_documento` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--

--
-- Disparadores `programas`
--
DELIMITER $$
CREATE TRIGGER `drop_programas` AFTER DELETE ON `programas` FOR EACH ROW INSERT INTO re_drop ( id, descripcion, fecha_registro ) VALUES( null, 'Se borró un registro de programas', NOW() )
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `re_drop`
--

CREATE TABLE `re_drop` (
  `id` int(11) NOT NULL,
  `descripcion` varchar(200) NOT NULL,
  `fecha_registro` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `fecha` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `clave` varchar(10) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  ADD PRIMARY KEY (`no`);

--
-- Indices de la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD PRIMARY KEY (`No_documento`),
  ADD KEY `no` (`no`);

--
-- Indices de la tabla `prestamo_ambientes`
--
ALTER TABLE `prestamo_ambientes`
  ADD PRIMARY KEY (`fecha_registro`),
  ADD KEY `no` (`no`),
  ADD KEY `id` (`id`);

--
-- Indices de la tabla `programas`
--
ALTER TABLE `programas`
  ADD PRIMARY KEY (`ficha`),
  ADD KEY `No_documento` (`No_documento`);

--
-- Indices de la tabla `re_drop`
--
ALTER TABLE `re_drop`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  MODIFY `no` int(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `re_drop`
--
ALTER TABLE `re_drop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `instructores`
--
ALTER TABLE `instructores`
  ADD CONSTRAINT `instructores_ibfk_1` FOREIGN KEY (`no`) REFERENCES `ambientes` (`no`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `prestamo_ambientes`
--
ALTER TABLE `prestamo_ambientes`
  ADD CONSTRAINT `prestamo_ambientes_ibfk_1` FOREIGN KEY (`no`) REFERENCES `ambientes` (`no`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `prestamo_ambientes_ibfk_2` FOREIGN KEY (`id`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Filtros para la tabla `programas`
--
ALTER TABLE `programas`
  ADD CONSTRAINT `programas_ibfk_1` FOREIGN KEY (`No_documento`) REFERENCES `instructores` (`No_documento`) ON DELETE NO ACTION ON UPDATE NO ACTION;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
