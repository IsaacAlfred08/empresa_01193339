-- phpMyAdmin SQL Dump
-- version 4.9.1
-- https://www.phpmyadmin.net/
--
-- Servidor: localhost
-- Tiempo de generación: 25-11-2025 a las 08:29:04
-- Versión del servidor: 8.0.17
-- Versión de PHP: 7.3.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `empresa_01193339`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `departamento`
--

CREATE TABLE `departamento` (
  `nombred` varchar(15) NOT NULL DEFAULT '',
  `numerod` int(11) NOT NULL DEFAULT '0',
  `nss_jefe` char(9) NOT NULL DEFAULT '',
  `fecha_inic_jefe_dept` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `departamento`
--

INSERT INTO `departamento` (`nombred`, `numerod`, `nss_jefe`, `fecha_inic_jefe_dept`) VALUES
('Administracion', 4, '987', '1995-01-01'),
('Direccion', 1, '888', '1981-06-19'),
('Investigacion', 5, '333', '1988-05-22');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `dependientes`
--

CREATE TABLE `dependientes` (
  `nsse` char(9) NOT NULL DEFAULT '0',
  `nombre_dependiente` varchar(30) NOT NULL DEFAULT '',
  `sexo` enum('M','H') DEFAULT NULL,
  `fecha_nto` date DEFAULT NULL,
  `parentesco` enum('HIJA','HIJO','ESPOSA') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `dependientes`
--

INSERT INTO `dependientes` (`nsse`, `nombre_dependiente`, `sexo`, `fecha_nto`, `parentesco`) VALUES
('123', 'Elizabeth', 'M', '1967-05-06', 'ESPOSA'),
('123', 'Juan', 'H', '2008-07-22', 'HIJO'),
('123', 'María', 'M', '2005-04-10', 'HIJA'),
('333', 'Joy', 'M', '1958-05-03', 'ESPOSA'),
('987', 'Abner', 'H', '1942-02-28', 'ESPOSA');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleado`
--

CREATE TABLE `empleado` (
  `nombre` varchar(20) NOT NULL DEFAULT '',
  `inic` char(2) DEFAULT NULL,
  `apellido` varchar(20) NOT NULL DEFAULT '',
  `nss` char(9) NOT NULL DEFAULT '0',
  `fecha_ncto` date DEFAULT NULL,
  `direccion` varchar(30) DEFAULT NULL,
  `sexo` enum('H','M') DEFAULT NULL,
  `salario` float(6,2) DEFAULT NULL,
  `nss_superv` char(9) DEFAULT NULL,
  `nd` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `empleado`
--

INSERT INTO `empleado` (`nombre`, `inic`, `apellido`, `nss`, `fecha_ncto`, `direccion`, `sexo`, `salario`, `nss_superv`, `nd`) VALUES
('Juan', 'B', 'Martínez', '123', '1965-04-19', 'Houston, TX', 'H', 9999.99, '333', 5),
('Ramesh', 'K', 'Narayan', '333', '1962-09-15', 'Humble, TX', 'H', 380.00, '888', 5),
('Alicia', 'J', 'Zelaya', '453', '1968-07-19', 'Spring, TX', 'M', 250.00, '987', 4),
('Joyce', 'A', 'English', '454', '1972-07-31', 'Houston, TX', 'M', 250.00, '333', 5),
('Francisco', 'T', 'Wong', '666', '1955-12-08', 'Houston, TX', 'H', 9999.99, '888', 5),
('Ahme', 'V', 'Jabbar', '879', '1969-03-29', 'Dallas, TX', 'H', 250.00, '987', 4),
('Jaime', 'E', 'Borg', '888', '1937-11-10', 'Houston, TX', 'H', 550.00, NULL, 1),
('Jennifer', 'S', 'Wallace', '987', '1941-06-20', 'Bellaire, TX', 'M', 430.00, '888', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `localizaciones_dept`
--

CREATE TABLE `localizaciones_dept` (
  `numerod` tinyint(4) NOT NULL DEFAULT '0',
  `localizacion` varchar(25) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `localizaciones_dept`
--

INSERT INTO `localizaciones_dept` (`numerod`, `localizacion`) VALUES
(1, 'Houston'),
(4, 'Stafford'),
(5, 'Bellaire');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proyecto`
--

CREATE TABLE `proyecto` (
  `nombrep` varchar(30) NOT NULL DEFAULT '',
  `numerop` tinyint(4) NOT NULL DEFAULT '0',
  `localizacion` varchar(25) DEFAULT NULL,
  `numd` tinyint(4) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `proyecto`
--

INSERT INTO `proyecto` (`nombrep`, `numerop`, `localizacion`, `numd`) VALUES
('ProductoX', 1, 'Bellaire', 5),
('ProductoY', 2, 'Sugarland', 5),
('ProductoZ', 3, 'Houston', 5),
('Automatizacion', 10, 'Stafford', 4),
('Reorganizacion', 20, 'Houston', 1),
('Nuevos beneficios', 30, 'Stafford', 4);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `trabaja_en`
--

CREATE TABLE `trabaja_en` (
  `nsse` char(9) NOT NULL DEFAULT '0',
  `np` tinyint(4) NOT NULL DEFAULT '0',
  `horas` decimal(3,1) NOT NULL DEFAULT '0.0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Volcado de datos para la tabla `trabaja_en`
--

INSERT INTO `trabaja_en` (`nsse`, `np`, `horas`) VALUES
('123', 1, '32.5'),
('123', 2, '15.0'),
('333', 2, '10.0'),
('453', 1, '20.0'),
('666', 3, '40.0'),
('879', 30, '5.0'),
('888', 10, '12.5'),
('888', 20, '0.0'),
('987', 30, '20.0'),
('999', 30, '30.0');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `departamento`
--
ALTER TABLE `departamento`
  ADD PRIMARY KEY (`nombred`);

--
-- Indices de la tabla `dependientes`
--
ALTER TABLE `dependientes`
  ADD PRIMARY KEY (`nsse`,`nombre_dependiente`);

--
-- Indices de la tabla `empleado`
--
ALTER TABLE `empleado`
  ADD PRIMARY KEY (`nss`);

--
-- Indices de la tabla `localizaciones_dept`
--
ALTER TABLE `localizaciones_dept`
  ADD PRIMARY KEY (`numerod`,`localizacion`);

--
-- Indices de la tabla `proyecto`
--
ALTER TABLE `proyecto`
  ADD PRIMARY KEY (`numerop`);

--
-- Indices de la tabla `trabaja_en`
--
ALTER TABLE `trabaja_en`
  ADD PRIMARY KEY (`nsse`,`np`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
