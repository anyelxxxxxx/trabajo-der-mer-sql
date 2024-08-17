-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 16-08-2024 a las 22:02:40
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
-- Base de datos: `club_nautico`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `amarres`
--

CREATE TABLE `amarres` (
  `Id_Amarre` int(5) NOT NULL,
  `Numero_Amarre` int(10) DEFAULT NULL,
  `Contador_Agua` int(10) DEFAULT NULL,
  `Contador_Luz` int(10) DEFAULT NULL,
  `Servicio_Mantenimiento` varchar(30) DEFAULT NULL,
  `FK_Id_Zona` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `amarres`
--

INSERT INTO `amarres` (`Id_Amarre`, `Numero_Amarre`, `Contador_Agua`, `Contador_Luz`, `Servicio_Mantenimiento`, `FK_Id_Zona`) VALUES
(1, 53, 75862, 1025, 'Limpieza', 5),
(2, 145, 85263, 7521, 'Lubricacion', 2),
(3, 14, 100693, 52754, 'Ninguno', 4),
(4, 697, 5841, 758961, 'Pintura', 3),
(5, 74, 2046, 205631, 'Ninguno', 5);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `embarcaciones`
--

CREATE TABLE `embarcaciones` (
  `Id_Embarcaciones` int(5) NOT NULL,
  `Matricula` int(10) DEFAULT NULL,
  `Nombre_E` varchar(30) DEFAULT NULL,
  `Tipo` varchar(30) DEFAULT NULL,
  `Dimensiones` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `embarcaciones`
--

INSERT INTO `embarcaciones` (`Id_Embarcaciones`, `Matricula`, `Nombre_E`, `Tipo`, `Dimensiones`) VALUES
(1, 104526, 'Veloz', 'Yate', '20x14x30'),
(2, 25631, 'Santa Maria', 'Carabela', '20x7'),
(3, 69754, 'La niña', 'Carabela', '21x8'),
(4, 14562, 'La pinta', 'Carbela', '20x7'),
(5, 17896, 'Titanic', 'transatlántico', '269x53');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados`
--

CREATE TABLE `empleados` (
  `Id_Empleado` int(5) NOT NULL,
  `Nombre_EM` varchar(30) DEFAULT NULL,
  `Direccion_EM` varchar(30) DEFAULT NULL,
  `Telefono_EM` int(10) DEFAULT NULL,
  `Especialidad` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `empleados`
--

INSERT INTO `empleados` (`Id_Empleado`, `Nombre_EM`, `Direccion_EM`, `Telefono_EM`, `Especialidad`) VALUES
(1, 'Juan Perez', 'av. norte 56 #45', 300736954, 'Muelle'),
(2, 'Salome Figueroa', 'carrera 90 #45 bis 03', 320802653, 'Secretaria'),
(3, 'Luis Rojas', 'calle 89 #23-56', 311845667, 'Contador'),
(4, 'Nicolas Forero', 'calle 80 #12', 302569847, 'Muelle'),
(5, 'Maria Lopez', 'av. sur 45 bis 34', 321096546, 'Capitan');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `empleados_zonas`
--

CREATE TABLE `empleados_zonas` (
  `FK_Id_Empleado` int(5) NOT NULL,
  `FK_Id_Zona` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios`
--

CREATE TABLE `socios` (
  `Id_Socio` int(5) NOT NULL,
  `Direccion` varchar(30) DEFAULT NULL,
  `C.I` int(10) DEFAULT NULL,
  `Telefono` int(10) DEFAULT NULL,
  `Fecha_Ingreso` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socios`
--

INSERT INTO `socios` (`Id_Socio`, `Direccion`, `C.I`, `Telefono`, `Fecha_Ingreso`) VALUES
(1, 'carrera 84 #55', 1085629565, 2147483647, '2010-05-31'),
(2, 'carrera 132#145 a-06', 528964122, 318560673, '2024-01-01'),
(3, 'calle 107 #95-b', 24563158, 356894715, '2016-04-27'),
(4, 'av. sur 67 #56-c', 80452134, 311265352, '2023-08-23'),
(5, 'calle 48 bis 05', 114562896, 358749612, '2000-02-28');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `socios_amarres_embarcaciones`
--

CREATE TABLE `socios_amarres_embarcaciones` (
  `SociosId_Socio` int(5) NOT NULL,
  `EmbarcacionesId_Embarcaciones` int(5) NOT NULL,
  `AmarresId_Amarre` int(5) NOT NULL,
  `Fecha_Asignacion` date DEFAULT NULL,
  `Fecha_Compra` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `socios_amarres_embarcaciones`
--

INSERT INTO `socios_amarres_embarcaciones` (`SociosId_Socio`, `EmbarcacionesId_Embarcaciones`, `AmarresId_Amarre`, `Fecha_Asignacion`, `Fecha_Compra`) VALUES
(1, 2, 3, '2023-07-15', '2022-05-12'),
(2, 3, 4, '2022-08-23', '2022-08-23'),
(3, 4, 5, '2024-01-20', '2024-03-20'),
(4, 5, 1, '2020-12-24', '2021-06-24'),
(5, 1, 2, '2021-11-09', '2022-02-09');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `zonas`
--

CREATE TABLE `zonas` (
  `Id_Zona` int(5) NOT NULL,
  `Letra` varchar(10) DEFAULT NULL,
  `Tipo_Barco` varchar(30) DEFAULT NULL,
  `Numero_Barco` int(10) DEFAULT NULL,
  `Profundidad` int(10) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `zonas`
--

INSERT INTO `zonas` (`Id_Zona`, `Letra`, `Tipo_Barco`, `Numero_Barco`, `Profundidad`) VALUES
(1, 'A', 'barco carga', 1052, 789),
(2, 'F', 'Barco pesca', 582, 1963),
(3, 'P', 'Barco servicios', 2560, 145),
(4, 'L', 'Barco militar', 754, 2000),
(5, 'F', 'Barco pasajeros', 1452, 100);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `amarres`
--
ALTER TABLE `amarres`
  ADD PRIMARY KEY (`Id_Amarre`),
  ADD KEY `FKAmarres55966` (`FK_Id_Zona`);

--
-- Indices de la tabla `embarcaciones`
--
ALTER TABLE `embarcaciones`
  ADD PRIMARY KEY (`Id_Embarcaciones`);

--
-- Indices de la tabla `empleados`
--
ALTER TABLE `empleados`
  ADD PRIMARY KEY (`Id_Empleado`);

--
-- Indices de la tabla `empleados_zonas`
--
ALTER TABLE `empleados_zonas`
  ADD PRIMARY KEY (`FK_Id_Empleado`,`FK_Id_Zona`),
  ADD KEY `FKEmpleados_466258` (`FK_Id_Zona`);

--
-- Indices de la tabla `socios`
--
ALTER TABLE `socios`
  ADD PRIMARY KEY (`Id_Socio`);

--
-- Indices de la tabla `socios_amarres_embarcaciones`
--
ALTER TABLE `socios_amarres_embarcaciones`
  ADD KEY `FKSocios_Ama195101` (`SociosId_Socio`),
  ADD KEY `FKSocios_Ama85455` (`EmbarcacionesId_Embarcaciones`),
  ADD KEY `FKSocios_Ama974820` (`AmarresId_Amarre`);

--
-- Indices de la tabla `zonas`
--
ALTER TABLE `zonas`
  ADD PRIMARY KEY (`Id_Zona`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `amarres`
--
ALTER TABLE `amarres`
  MODIFY `Id_Amarre` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `embarcaciones`
--
ALTER TABLE `embarcaciones`
  MODIFY `Id_Embarcaciones` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT de la tabla `empleados`
--
ALTER TABLE `empleados`
  MODIFY `Id_Empleado` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `socios`
--
ALTER TABLE `socios`
  MODIFY `Id_Socio` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `zonas`
--
ALTER TABLE `zonas`
  MODIFY `Id_Zona` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `amarres`
--
ALTER TABLE `amarres`
  ADD CONSTRAINT `FKAmarres55966` FOREIGN KEY (`FK_Id_Zona`) REFERENCES `zonas` (`Id_Zona`);

--
-- Filtros para la tabla `empleados_zonas`
--
ALTER TABLE `empleados_zonas`
  ADD CONSTRAINT `FKEmpleados_466258` FOREIGN KEY (`FK_Id_Zona`) REFERENCES `zonas` (`Id_Zona`),
  ADD CONSTRAINT `FKEmpleados_779553` FOREIGN KEY (`FK_Id_Empleado`) REFERENCES `empleados` (`Id_Empleado`);

--
-- Filtros para la tabla `socios_amarres_embarcaciones`
--
ALTER TABLE `socios_amarres_embarcaciones`
  ADD CONSTRAINT `FKSocios_Ama195101` FOREIGN KEY (`SociosId_Socio`) REFERENCES `socios` (`Id_Socio`),
  ADD CONSTRAINT `FKSocios_Ama85455` FOREIGN KEY (`EmbarcacionesId_Embarcaciones`) REFERENCES `embarcaciones` (`Id_Embarcaciones`),
  ADD CONSTRAINT `FKSocios_Ama974820` FOREIGN KEY (`AmarresId_Amarre`) REFERENCES `amarres` (`Id_Amarre`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
