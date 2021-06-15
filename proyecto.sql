-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 10-06-2021 a las 19:43:59
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

SELECT * FROM prestamo_ambientes WHERE fecha between fecha_prestamo AND fecha_devolucion;
END$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `insertar_ambientes` (`a` INT, `b` VARCHAR(50), `c` VARCHAR(50)) RETURNS TEXT CHARSET utf8mb4 BEGIN INSERT INTO ambientes(no,cede,nom_aula) VALUES ( a, b, c); RETURN 'datos insertados con exito'; END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `insertar_instructores` (`a` INT, `b` VARCHAR(50), `c` INT) RETURNS TEXT CHARSET utf8mb4 BEGIN INSERT INTO instructores(No_documento,nom_instructor,no) VALUES ( a, b, c); RETURN 'datos insertados con exito'; END$$

CREATE DEFINER=`root`@`localhost` FUNCTION `insertar_programas` (`a` INT, `b` VARCHAR(50), `c` INT) RETURNS TEXT CHARSET utf8mb4 BEGIN INSERT INTO programas(ficha,nom_programa,No_documento) VALUES ( a, b, c); RETURN 'datos insertados con exito'; END$$

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
(0, '', ''),
(12, 'modelo', '0'),
(13, 'modelo', 'paisa'),
(55, 'modelo', 'aula5'),
(56, 'acalisto', 'abahaa'),
(57, 'acalisto', 'abahaa'),
(58, 'acalisto', 'abahaa'),
(59, 's', 'abahaa');

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
(1010, 'galiano', 13),
(4323, 'a', 55),
(12121211, 'a', 59),
(65215651, 'wsdxsa', 59),
(121212111, 'a', 55),
(121212113, 'a', 56),
(121212118, 'a', 56),
(1006723921, 'david sanchez', 58),
(1007293903, 'diego', 0),
(1212121144, 'a', 56),
(2147483647, 'a', 57);

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

INSERT INTO `prestamo_ambientes` (`fecha_registro`, `hora_ingreso`, `hora_salida`, `observaciones`, `no`, `id`, `fecha_prestamo`, `fecha_devolucion`) VALUES
('2021-05-13 15:44:54', '00:00:00', '00:00:00', NULL, NULL, NULL, NULL, '2021-05-18 00:00:00'),
('2021-05-13 16:02:28', '00:10:00', '00:00:00', NULL, NULL, NULL, NULL, '2021-05-18 00:00:00'),
('2021-05-13 16:04:03', '23:02:02', '00:10:21', NULL, 0, 1, '2021-05-11 00:00:00', NULL),
('2021-05-13 16:04:47', '10:21:20', '28:02:02', 'ewjfroi fjWHIivf', 0, 3, '2021-05-06 00:00:00', '2050-05-18 00:00:00'),
('2021-05-14 15:56:31', '510:10:10', '10:10:11', 'dsdsdc', NULL, NULL, '2021-05-11 00:00:00', '0000-00-00 00:00:00'),
('2021-05-27 16:58:20', '12:00:00', '12:00:00', '', 0, 1, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('2021-05-27 16:59:13', '13:00:00', '18:00:00', 'ninguna', 55, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('2021-05-27 17:01:53', '13:00:00', '18:00:00', 'ninguna', 55, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('2021-05-27 17:02:03', '13:00:00', '18:00:00', 'ninguna', 55, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('2021-05-27 17:02:44', '13:00:00', '18:00:00', 'ninguna', 55, 6, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
('2021-05-27 17:04:48', '13:00:00', '18:00:00', 'ninguna', 55, 6, '2021-06-10 13:00:00', '2021-06-10 18:00:00'),
('2021-05-27 17:53:25', '12:00:00', '12:00:00', '', 0, 1, '2021-01-01 12:00:00', '2021-01-01 12:00:00'),
('2021-06-04 14:37:11', '12:00:00', '12:00:00', 'Estado en el que se encuentra el Aula ', 0, 1, '2021-06-04 09:18:00', '2021-06-04 09:18:00'),
('2021-06-04 15:18:21', '12:00:00', '12:00:00', 'saugdusa', 58, 1, '2021-06-04 10:15:00', '2021-06-11 10:15:00'),
('2021-06-04 15:19:25', '12:00:00', '12:00:00', 'saugdusa', 58, 1, '2021-06-04 10:15:00', '2021-06-11 10:15:00'),
('2021-06-09 11:43:59', '18:44:00', '18:46:00', 'xdxddxdddxdddxdxdxddxdddddxdxdxdx', 59, 1, '2021-06-30 18:44:00', '2021-06-18 06:46:00'),
('2021-06-09 14:25:42', '12:00:00', '12:00:00', 'Estado  en  el  que  se  encuentra  el  Aula ', 0, 1, '2021-06-05 09:25:00', '2021-06-03 09:25:00'),
('2021-06-09 15:00:43', '12:00:00', '12:00:00', 'Estado  en  el  que  se  encuentra  el  Aula ', 58, 1, '2021-06-12 10:00:00', '2021-06-04 10:00:00');

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
(12, 'david sanchez', 1006723921),
(1010, 'pepapig', 1010),
(1234, 'noe', NULL),
(12345, 'noe', 1007293903),
(20589, 'ADSI', 1006723921);

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
(1, 'Se borró un registro de prestamo', '2021-05-06 08:27:21'),
(2, 'Se borró un registro de ambientes', '2021-05-06 08:29:13'),
(3, 'Se borró un registro de instructores', '2021-05-06 08:31:58'),
(4, 'Se borró un registro de programas', '2021-05-11 11:56:28'),
(5, 'Se borró un registro de programas', '2021-05-11 12:05:02'),
(6, 'Se borró un registro de ambientes', '2021-05-13 10:21:38'),
(7, 'Se borró un registro de ambientes', '2021-05-13 10:21:39'),
(8, 'Se borró un registro de ambientes', '2021-05-13 10:21:41'),
(9, 'Se borró un registro de ambientes', '2021-05-13 10:21:42'),
(10, 'Se borró un registro de ambientes', '2021-05-13 10:21:43'),
(11, 'Se borró un registro de ambientes', '2021-05-13 10:21:43'),
(12, 'Se borró un registro de ambientes', '2021-05-13 10:21:44'),
(13, 'Se borró un registro de ambientes', '2021-05-13 10:21:45'),
(14, 'Se borró un registro de ambientes', '2021-05-13 10:21:45'),
(15, 'Se borró un registro de ambientes', '2021-05-13 10:21:46'),
(16, 'Se borró un registro de ambientes', '2021-05-13 10:21:47'),
(17, 'Se borró un registro de ambientes', '2021-05-13 10:21:48'),
(18, 'Se borró un registro de ambientes', '2021-05-13 10:21:48'),
(19, 'Se borró un registro de ambientes', '2021-05-13 10:21:48'),
(20, 'Se borró un registro de ambientes', '2021-05-13 10:21:49'),
(21, 'Se borró un registro de ambientes', '2021-05-13 10:21:50'),
(22, 'Se borró un registro de ambientes', '2021-05-25 12:09:02'),
(23, 'Se borró un registro de ambientes', '2021-05-25 12:09:03'),
(24, 'Se borró un registro de ambientes', '2021-05-25 12:09:04'),
(25, 'Se borró un registro de ambientes', '2021-05-25 12:09:05'),
(26, 'Se borró un registro de ambientes', '2021-05-25 12:09:05'),
(27, 'Se borró un registro de ambientes', '2021-05-25 12:09:06'),
(28, 'Se borró un registro de ambientes', '2021-05-25 12:09:07'),
(29, 'Se borró un registro de ambientes', '2021-05-25 12:09:07'),
(30, 'Se borró un registro de ambientes', '2021-05-25 12:09:08'),
(31, 'Se borró un registro de ambientes', '2021-05-25 12:09:08'),
(32, 'Se borró un registro de ambientes', '2021-05-25 12:09:09'),
(33, 'Se borró un registro de ambientes', '2021-05-25 12:09:09'),
(34, 'Se borró un registro de ambientes', '2021-05-25 12:09:10'),
(35, 'Se borró un registro de ambientes', '2021-05-25 12:09:45'),
(36, 'Se borró un registro de ambientes', '2021-05-25 12:09:46'),
(37, 'Se borró un registro de ambientes', '2021-05-25 12:09:47'),
(38, 'Se borró un registro de ambientes', '2021-05-25 12:09:48'),
(39, 'Se borró un registro de ambientes', '2021-05-25 12:09:48'),
(40, 'Se borró un registro de ambientes', '2021-05-25 12:09:49'),
(41, 'Se borró un registro de ambientes', '2021-05-25 12:09:50'),
(42, 'Se borró un registro de ambientes', '2021-05-25 12:09:50'),
(43, 'Se borró un registro de ambientes', '2021-05-25 12:09:54'),
(44, 'Se borró un registro de ambientes', '2021-05-25 12:09:59'),
(45, 'Se borró un registro de ambientes', '2021-05-25 12:10:01'),
(46, 'Se borró un registro de ambientes', '2021-05-25 12:10:03'),
(47, 'Se borró un registro de ambientes', '2021-05-25 12:10:03'),
(48, 'Se borró un registro de ambientes', '2021-05-25 12:10:04'),
(49, 'Se borró un registro de ambientes', '2021-05-25 12:10:05'),
(50, 'Se borró un registro de ambientes', '2021-05-25 12:10:06'),
(51, 'Se borró un registro de ambientes', '2021-05-25 12:10:07'),
(52, 'Se borró un registro de ambientes', '2021-05-25 12:10:08'),
(53, 'Se borró un registro de ambientes', '2021-05-25 12:10:08'),
(54, 'Se borró un registro de ambientes', '2021-05-25 12:10:09'),
(55, 'Se borró un registro de ambientes', '2021-05-25 12:23:17'),
(56, 'Se borró un registro de ambientes', '2021-05-25 12:28:11');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `id` int(11) NOT NULL,
  `fecha` datetime NOT NULL,
  `clave` varchar(10) NOT NULL,
  `correo` varchar(30) NOT NULL,
  `nombre_usuario` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`id`, `fecha`, `clave`, `correo`, `nombre_usuario`) VALUES
(1, '2021-04-07 08:19:13', '12345', 'DAMH1006@GMAIL.COM', 'PEPE'),
(3, '2021-04-14 08:06:56', '123', 'uno12@gmail.com', 'uno'),
(6, '2021-05-27 07:41:01', 'hola', 'hola', 'Administrador'),
(19, '2021-06-02 09:12:09', 'hola', 'hola1', 'Administrador'),
(20, '2021-06-02 09:12:33', '12345hola', 'hola', 'Administrador'),
(21, '2021-06-02 09:29:54', '12345', 'DS', 'Administrador'),
(22, '2021-06-02 11:56:32', 'HOLA1', 'hola14', '1007293903'),
(23, '2021-06-03 12:41:18', '', '', ''),
(1, '2021-04-07 08:19:13', '12345', 'DAMH1006@GMAIL.COM', 'PEPE'),
(3, '2021-04-14 08:06:56', '123', 'uno12@gmail.com', 'uno'),
(6, '2021-05-27 07:41:01', 'hola', 'hola', 'Administrador'),
(19, '2021-06-02 09:12:09', 'hola', 'hola1', 'Administrador'),
(20, '2021-06-02 09:12:33', '12345hola', 'hola', 'Administrador'),
(21, '2021-06-02 09:29:54', '12345', 'DS', 'Administrador'),
(22, '2021-06-02 11:56:32', 'HOLA1', 'hola14', '1007293903'),
(23, '2021-06-03 12:41:18', '', '', '');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_ambientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_ambientes` (
`no` int(20)
,`cede` varchar(50)
,`nom_aula` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_instructores`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_instructores` (
`No_documento` int(15)
,`nom_instructor` varchar(35)
,`no` int(20)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_prestamo_ambientes`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_prestamo_ambientes` (
`fecha_registro` timestamp
,`hora_ingreso` time
,`hora_salida` time
,`observaciones` varchar(100)
,`no` int(20)
,`id` int(11)
,`fecha_prestamo` datetime
,`fecha_devolucion` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_programas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_programas` (
`ficha` int(15)
,`nom_programa` varchar(50)
,`No_documento` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_re_drop`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_re_drop` (
`id` int(11)
,`descripcion` varchar(200)
,`fecha_registro` datetime
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_usuario`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_usuario` (
`id` int(11)
,`fecha` datetime
,`clave` varchar(10)
,`correo` varchar(30)
,`nombre_usuario` varchar(20)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_ambientes`
--
DROP TABLE IF EXISTS `vista_ambientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_ambientes`  AS SELECT `ambientes`.`no` AS `no`, `ambientes`.`cede` AS `cede`, `ambientes`.`nom_aula` AS `nom_aula` FROM `ambientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_instructores`
--
DROP TABLE IF EXISTS `vista_instructores`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_instructores`  AS SELECT `instructores`.`No_documento` AS `No_documento`, `instructores`.`nom_instructor` AS `nom_instructor`, `instructores`.`no` AS `no` FROM `instructores` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_prestamo_ambientes`
--
DROP TABLE IF EXISTS `vista_prestamo_ambientes`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_prestamo_ambientes`  AS SELECT `prestamo_ambientes`.`fecha_registro` AS `fecha_registro`, `prestamo_ambientes`.`hora_ingreso` AS `hora_ingreso`, `prestamo_ambientes`.`hora_salida` AS `hora_salida`, `prestamo_ambientes`.`observaciones` AS `observaciones`, `prestamo_ambientes`.`no` AS `no`, `prestamo_ambientes`.`id` AS `id`, `prestamo_ambientes`.`fecha_prestamo` AS `fecha_prestamo`, `prestamo_ambientes`.`fecha_devolucion` AS `fecha_devolucion` FROM `prestamo_ambientes` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_programas`
--
DROP TABLE IF EXISTS `vista_programas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_programas`  AS SELECT `programas`.`ficha` AS `ficha`, `programas`.`nom_programa` AS `nom_programa`, `programas`.`No_documento` AS `No_documento` FROM `programas` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_re_drop`
--
DROP TABLE IF EXISTS `vista_re_drop`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_re_drop`  AS SELECT `re_drop`.`id` AS `id`, `re_drop`.`descripcion` AS `descripcion`, `re_drop`.`fecha_registro` AS `fecha_registro` FROM `re_drop` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_usuario`
--
DROP TABLE IF EXISTS `vista_usuario`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_usuario`  AS SELECT `usuario`.`id` AS `id`, `usuario`.`fecha` AS `fecha`, `usuario`.`clave` AS `clave`, `usuario`.`correo` AS `correo`, `usuario`.`nombre_usuario` AS `nombre_usuario` FROM `usuario` ;

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
  ADD KEY `id` (`id`) USING BTREE;

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ambientes`
--
ALTER TABLE `ambientes`
  MODIFY `no` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=60;

--
-- AUTO_INCREMENT de la tabla `re_drop`
--
ALTER TABLE `re_drop`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=57;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

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
