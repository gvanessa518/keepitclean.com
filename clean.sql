-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 03-04-2023 a las 07:05:22
-- Versión del servidor: 10.1.38-MariaDB
-- Versión de PHP: 5.6.40

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `clean`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_compra`
--

CREATE TABLE `ordenes_compra` (
  `ID` int(8) NOT NULL,
  `fecha` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_cliente` int(8) NOT NULL,
  `monto` float(6,1) NOT NULL,
  `status` enum('abierta','cerrada') NOT NULL DEFAULT 'abierta'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ordenes_compra`
--

INSERT INTO `ordenes_compra` (`ID`, `fecha`, `ID_cliente`, `monto`, `status`) VALUES
(1, '2023-04-03 00:28:54', 2, 6.2, 'cerrada'),
(2, '2023-04-03 00:36:39', 2, 11.0, 'cerrada');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_produccion`
--

CREATE TABLE `ordenes_produccion` (
  `ID` int(8) NOT NULL,
  `fecha_solicitada` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `ID_producto` int(8) NOT NULL,
  `cantidad` float(6,2) NOT NULL,
  `status` enum('activo','Completado y entregado') NOT NULL DEFAULT 'activo',
  `fecha_entregada` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ordenes_produccion`
--

INSERT INTO `ordenes_produccion` (`ID`, `fecha_solicitada`, `ID_producto`, `cantidad`, `status`, `fecha_entregada`) VALUES
(1, '2023-04-02 17:14:36', 3, 20.00, 'Completado y entregado', '2023-04-02 17:33:46'),
(2, '2023-04-02 18:02:27', 1, 10.00, 'Completado y entregado', '2023-04-02 18:02:58'),
(3, '2023-04-02 18:05:51', 1, 20.00, 'Completado y entregado', '2023-04-02 18:06:08'),
(4, '2023-04-02 18:20:06', 1, 5.00, 'Completado y entregado', '2023-04-02 18:21:04'),
(5, '2023-04-02 18:20:20', 2, 20.00, 'Completado y entregado', '2023-04-02 18:21:17'),
(6, '2023-04-02 18:20:31', 3, 15.00, 'Completado y entregado', '2023-04-02 18:20:50');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `ordenes_producto`
--

CREATE TABLE `ordenes_producto` (
  `ID` int(8) NOT NULL,
  `ID_orden` int(8) NOT NULL,
  `ID_producto` int(8) NOT NULL,
  `cantidad` float(6,1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `ordenes_producto`
--

INSERT INTO `ordenes_producto` (`ID`, `ID_orden`, `ID_producto`, `cantidad`) VALUES
(1, 1, 3, 2.0),
(2, 2, 1, 10.0),
(3, 2, 2, 2.0);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `ID` int(8) NOT NULL,
  `nombre` varchar(25) NOT NULL,
  `cantidad` float(7,1) NOT NULL,
  `costo` float(7,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`ID`, `nombre`, `cantidad`, `costo`) VALUES
(1, 'Jabon Lavaplatos Brisol', 75.0, 1.00),
(2, 'Jabon Lavaplatos Generico', 118.0, 0.50),
(3, 'Desinfectante Naranja', 103.0, 0.60);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuario`
--

CREATE TABLE `usuario` (
  `ID` int(8) NOT NULL,
  `cedula` int(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `direccion` text NOT NULL,
  `correo` varchar(50) NOT NULL,
  `clave` varchar(21) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Volcado de datos para la tabla `usuario`
--

INSERT INTO `usuario` (`ID`, `cedula`, `nombre`, `apellido`, `direccion`, `correo`, `clave`) VALUES
(1, 2726700, 'cami', 'gon', 'monte bello', 'cami@hotmail.com', 'ecboewbcow544'),
(2, 2726789, 'vane', 'barrios', 'urb. gallo verde', 'vane@neo.com', 'vane123');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ordenes_produccion`
--
ALTER TABLE `ordenes_produccion`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `ordenes_producto`
--
ALTER TABLE `ordenes_producto`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `usuario`
--
ALTER TABLE `usuario`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `ordenes_compra`
--
ALTER TABLE `ordenes_compra`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `ordenes_produccion`
--
ALTER TABLE `ordenes_produccion`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `ordenes_producto`
--
ALTER TABLE `ordenes_producto`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `usuario`
--
ALTER TABLE `usuario`
  MODIFY `ID` int(8) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
