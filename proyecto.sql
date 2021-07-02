-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 02-07-2021 a las 17:02:17
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

SELECT * FROM prestamo_ambientes WHERE fecha NOT between fecha_prestamo AND fecha_devolucion;

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
-- Volcado de datos para la tabla `ambientes`
--

INSERT INTO `ambientes` (`no`, `cede`, `nom_aula`) VALUES
(1, 'la paz', '400'),
(12, 'centrada', 'pintura'),
(14, 'retorno', '12'),
(15, 'calamar', '13');

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
-- Volcado de datos para la tabla `instructores`
--

INSERT INTO `instructores` (`No_documento`, `nom_instructor`, `no`) VALUES
(1007, 'javerson', 1),
(234911, 'Noe Patricio', 1),
(4121578, 'Noelio paz', 1),
(1006729931, 'javerson dueñas', 12);

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
  `cede` varchar(10) DEFAULT NULL,
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

INSERT INTO `prestamo_ambientes` (`fecha_registro`, `cede`, `hora_ingreso`, `hora_salida`, `observaciones`, `no`, `id`, `fecha_prestamo`, `fecha_devolucion`) VALUES
('2021-06-01 13:27:51', 'modelo', '10:20:32', '19:59:11', 'lalalal', 1, 1, '2023-06-09 07:38:19', '2023-06-23 07:38:19'),
('2021-06-07 12:40:04', 'modelo', '15:58:32', '20:59:11', 'xdxdxd', 1, 1, '2021-06-09 07:38:19', '2021-06-23 07:00:00'),
('2021-07-02 14:19:09', NULL, '12:00:00', '12:06:00', 'Estado  en  el  que  se  encuentra  el  Aula ', 1, 1, '2021-07-02 09:18:00', '2021-07-28 09:19:00'),
('2021-07-02 14:39:45', NULL, '06:30:00', '13:00:00', 'en pésimo estado por culpa de javerson', 1, 1, '2003-04-24 10:38:00', '2021-07-02 09:38:00'),
('2021-07-02 14:55:09', '13', '12:00:00', '12:00:00', 'xdxdxd lala', 15, 1, '2021-09-08 09:54:00', '2021-07-29 09:54:00'),
('2021-07-02 14:56:17', '13', '12:03:00', '12:00:00', 'Estado  en  el  que  se  encuentra  el  Aula ', 15, 1, '2021-07-09 09:55:00', '2021-07-08 09:55:00'),
('2021-07-02 15:00:09', '12', '12:00:00', '12:00:00', 'Estado  en  el  que  se  encuentra  el  Aula ', 14, 1, '2021-07-22 10:00:00', '2021-07-23 10:00:00');

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
-- Volcado de datos para la tabla `programas`
--

INSERT INTO `programas` (`ficha`, `nom_programa`, `No_documento`) VALUES
(0, 'adsi', 1007),
(10203, 'administración de empresas', 4121578),
(2058969, 'ADSI', 1006729931);

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

--
-- Volcado de datos para la tabla `re_drop`
--

INSERT INTO `re_drop` (`id`, `descripcion`, `fecha_registro`) VALUES
(1, 'Se borró un registro de instructores', '2021-06-30 10:58:26'),
(2, 'Se borró un registro de instructores', '2021-06-30 10:58:31'),
(3, 'Se borró un registro de ambientes', '2021-07-01 08:22:18'),
(4, 'Se borró un registro de ambientes', '2021-07-01 08:22:23'),
(5, 'Se borró un registro de ambientes', '2021-07-01 08:22:29'),
(6, 'Se borró un registro de ambientes', '2021-07-01 08:26:52'),
(7, 'Se borró un registro de programas', '2021-07-01 09:23:26'),
(8, 'Se borró un registro de ambientes', '2021-07-01 12:47:17'),
(9, 'Se borró un registro de ambientes', '2021-07-01 12:47:18'),
(10, 'Se borró un registro de ambientes', '2021-07-01 12:47:20'),
(11, 'Se borró un registro de ambientes', '2021-07-01 12:47:21'),
(12, 'Se borró un registro de ambientes', '2021-07-01 12:47:22'),
(13, 'Se borró un registro de instructores', '2021-07-01 12:50:45'),
(14, 'Se borró un registro de instructores', '2021-07-01 12:50:46'),
(15, 'Se borró un registro de instructores', '2021-07-01 12:50:48'),
(16, 'Se borró un registro de programas', '2021-07-01 12:51:00'),
(17, 'Se borró un registro de instructores', '2021-07-02 06:58:01'),
(18, 'Se borró un registro de instructores', '2021-07-02 06:58:09'),
(19, 'Se borró un registro de instructores', '2021-07-02 06:58:12'),
(20, 'Se borró un registro de ambientes', '2021-07-02 06:58:42'),
(21, 'Se borró un registro de programas', '2021-07-02 06:59:03'),
(22, 'Se borró un registro de ambientes', '2021-07-02 09:45:45');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `fecha` timestamp NOT NULL DEFAULT current_timestamp(),
  `clave` varchar(10) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `fecha`, `clave`, `correo`, `nombre_usuario`) VALUES
(1, '2021-06-03 14:35:57', '123', 'javerson287@gmail.com', 'yo'),
(2, '2021-06-03 15:19:22', '123', 'javeson280@gmail.com', 'yo'),
(3, '2021-07-02 12:00:02', 'noe123', 'noelio28@gmail.com', 'noelio');

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
  MODIFY `no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `re_drop`
--
ALTER TABLE `re_drop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
