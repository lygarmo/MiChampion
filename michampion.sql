-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1:3000
-- Tiempo de generación: 13-05-2025 a las 18:33:07
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `michampion`
--

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `alergenos`
--

CREATE TABLE `alergenos` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `icono` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `alergenos`
--

INSERT INTO `alergenos` (`id`, `nombre`, `icono`) VALUES
(1, 'Altramuces', 'alergenos/altramuces.svg'),
(2, 'Apio', 'alergenos/apio.svg'),
(3, 'Cacahuetes', 'alergenos/cacahuetes.svg'),
(4, 'Crustáceos', 'alergenos/crustaceos.svg'),
(5, 'Frutos secos', 'alergenos/frutossecos.svg'),
(6, 'Gluten', 'alergenos/gluten.svg'),
(7, 'Huevo', 'alergenos/huevo.svg'),
(8, 'Lácteos', 'alergenos/lacteos.svg'),
(9, 'Moluscos', 'alergenos/moluscos.svg'),
(10, 'Mostaza', 'alergenos/mostaza.svg'),
(11, 'Pescado', 'alergenos/pescado.svg'),
(12, 'Sésamo', 'alergenos/sesamo.svg'),
(13, 'Soja', 'alergenos/soja.svg'),
(14, 'Sulfitos', 'alergenos/sulfitos.svg');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `burgers`
--

CREATE TABLE `burgers` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `restaurante` varchar(100) DEFAULT NULL,
  `descripcion` text DEFAULT NULL,
  `logo` varchar(255) DEFAULT NULL,
  `imagen` varchar(255) DEFAULT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `burgers`
--

INSERT INTO `burgers` (`id`, `nombre`, `restaurante`, `descripcion`, `logo`, `imagen`, `creado_en`) VALUES
(1, 'LIL WAYNE', 'GOTTAN', 'Brioche con parmesano y mozzarella gratinada, picada de chuletón madurado, cheddar fundido, panceta estilo Kikanbo cocinada durante 48 h, salsa Louisiana, cebolla crispy, bacon estilo Au Cheval y mayonesa ahumada.', 'logos/gottan.png', 'burgers/lilwayne.jpg', '2025-05-13 12:02:00'),
(2, 'LA PREMIADA', 'MOFLETE BY JOE BURGER', 'Carne de chuletón de ganadería nacional, queso cremoso trufado, sweet jamón ibérico, yema de huevo tostada y trufada, salsa PX y corteza de jamón.', 'logos/moflete.png', 'burgers/lapremiada.jpg', '2025-05-13 12:02:36'),
(3, 'KRAKEN', 'EL BARCO', 'Brioche artesano glaseado, lluvia de pretzel, picada de chuletón, queso ahumado, panceta bites, pepinillos, cebolla caramelizada, salsa MOA y salsa Top of the World.', 'logos/elbarco.png', 'burgers/kraken.png', '2025-05-13 12:02:52'),
(4, 'LUXURIA', 'TEOX X CENANDO CON PABLO', 'Sabe a chuletón: Carne de vaca y buey madurada más de 100 días, cecina de buey, pan brioche de grasa de buey, mermelada de tuétano, queso Jack Monterey y salsa Gochujang casera.', 'logos/teox.png', 'burgers/luxuria.jpg', '2025-05-13 12:03:27'),
(5, 'OLIMPO', 'HADES BY ALIAS DOSUNMU', 'Carne de vaca madurada, centro de panceta crujiente, cebolla caramelizada, pan brioche negro, queso cheddar, relish y salsa “Olimpo\" by Elías Dosunmu.', 'logos/hades.png', 'burgers/olimpo.png', '2025-05-13 12:05:01'),
(6, 'GANGNAM STYLE', 'CHEECK\'S', 'Pan brioche de mantequilla, contramuslo de pollo frito casero bañado en salsa Koreana, coleslaw y cacahuete asiático.', 'logos/cheecks.png', 'burgers/gangnamstyle.jpg', '2025-05-13 12:05:01'),
(7, 'CLÁSICA', 'CHEECK\'S', 'Pan brioche de mantequilla, contramuslo de pollo frito casero, queso cheddar americano, bacon bites y salsa ranchera CHEECK’S.', 'logos/cheecks.png', 'burgers/clasica.jpg', '2025-05-13 12:05:45'),
(8, 'LA GAMBERRA 2.0', 'STREET FOOD', 'Pan rojo high glaseado, carne de vaca nacional madurada, costilla de cerdo ahumada, queso cheddar ahumado, mayo ahumada street , bacon bits caramelizados y Gublins.', 'logos/streetfood.png', 'burgers/lagamberra.jpg', '2025-05-13 12:05:45'),
(9, 'SIXTY S3X', 'JENKIN\'S', 'Dos discos de 100 g de vaca madurada, doble queso cheddar ahumado, jugosa panceta ahumada a baja temperatura con polvo crunch, pepinillo encurtido, Boca Bits y salsa Mustang.', 'logos/jenkins.png', 'burgers/sixtys3x.png', '2025-05-13 12:06:35'),
(10, 'ALL-STAR', 'MURALLA', 'Pan brioche, 180 g de picada chuletón premium, doble queso cheddar ahumado, salsa Golden, bacon bits caramelizados, salsa All-Star, cebolla crispy y patatas paja.', 'logos/muralla.png', 'burgers/allstar.png', '2025-05-13 12:06:35'),
(11, 'GALÁCTICA', 'DAK BURGER', '180 g de chuletón de vaca nacional, cheddar rojo madurado, salsa Galáctica, pulled beef, bacon bits, crispy onion y polvo lunar.', 'logo/dakburger.png', 'burgers/galactica.png', '2025-05-13 12:07:20'),
(12, 'MULTIORGÁSMICA', 'THE VICBROS BURGER', 'Pan brioche, salsa Orgásmica, carne de vaca vieja madurada, cheddar ahumado, cebolla caramelizada, mini torreznos, salsa Khalifa y lluvia crunchy de bacon.', 'logos/vicbrosburger.png', 'burgers/multiorgasmica.png', '2025-05-13 12:07:20'),
(13, 'EMINEM', 'SOUL', 'Pan artesanal de patata, “The Beef” dry aged, queso Jack Monterey ahumado, fat bacon a baja temperatura, MisterCorn bites, cebolla crunchy y salsa Detroit.', 'logos/soul.png', 'burgers/eminem.jpg', '2025-05-13 12:07:55'),
(14, 'ROYALE GOLD', 'GODEO', 'Brioche con oro comestible, salsa Emmy, mermelada de bacon, carne de chuletón, queso ahumado, costillar de ternera a baja temperatura 48 h, sour cream ahumada y bacon bits.', 'logos/godeo.png', 'burgers/royalegold.png', '2025-05-13 12:07:55'),
(15, 'LA NONNA', 'NOLA SMOKE', 'Carbonara de autor con pan high potato, fat smash en brasa kamado, ragú de costilla, salsa La Nonna, guanciale tostado, yema de huevo y pecorino.', 'logos/nolasmoke.png', 'burgers/lanonna.png', '2025-05-13 12:08:26'),
(16, 'LA FINALISTA', 'RICO', 'Brioche de bacon, carne de chuletón madurado, bacon caramelizado, cheddar fundido, crispy onion, mayo RICO y lluvia de parmesano.', 'logos/rico.png', 'burgers/lafinalista.png', '2025-05-13 12:08:26'),
(17, 'LA BICHOTA PRO MAX', 'TARANTIN', 'Pan de queso gratinado, croqueta de mac & cheese, picada de chuletón, medallón de queso y costilla frita cubierta de salsa Pro Max.', 'logos/tarantin.png', 'burgers/labichota.jpg', '2025-05-13 12:09:02'),
(18, 'THE WINNER', 'TOKIO', 'Carne de chuletón, pan brioche con reducción Red Winner, crema de queso trufada, Wagyu cocinado a 48 h y caramelizado, queso gouda ahumado y cecina crunchy.', 'logos/tokio.png', 'burgers/thewinner.png', '2025-05-13 12:09:02'),
(19, 'BLACK QUEEN', 'VACARNAL BURGER', 'Costilla rota ahumada 48 h, mermelada de bacon bites sobre Black Angus, cheddar rojo, salsa Queen, crispy onion e hilos de salsa cheddar rosa sobre brioche negro.', 'logos/vacarnalburger.png', 'burgers/blackqueen.jpg', '2025-05-13 12:09:43'),
(20, 'MAMBA NEGRA', 'CIRCO', 'Chuletón premium, costilla de vaca 48 h glaseada, cheddar rojo fundido, caramel bacon, crush de Doritos Tex Mex, salsa Mamba, cebolla crispy y brioche negro.', 'logos/circo.png', 'burgers/mambanegra.jpg', '2025-05-13 12:09:43'),
(21, 'LUJURIA', 'EL CIRCULO - CARLOS MALDONADO', 'Brioche, salsa dantesca, 180 g de carne, cheddar fundido, carrillera en salsa infernal, bacon, cebolla caramelizada y crumble salado.', 'logos/elcirculo.png', 'burgers/lujuria.jpg', '2025-05-13 12:11:10'),
(22, 'TEXAS MAVERICK', 'THE RANCH - SMOKE HOUSE', 'Burger de chuletón madurado 60 días, costilla Black Angus desmenuzada con salsa BBQ, queso cheddar ahumado, mermelada de bacon, salsa Franklin y Doritos BBQ.', 'logos/theranch.png', 'burgers/texasmaverick.png', '2025-05-13 12:11:10'),
(23, 'LA DESCARADA', 'POISON', 'Pan brioche, carne de chuletón dry-aged, queso cheddar fundido, nuestra salsa especial Poison, bacon caramelizado, torrezno crunchy y mayo ahumada.', 'logos/poison.png', 'burgers/ladescarada.png', '2025-05-13 12:11:58'),
(24, 'LA MANUELA 2.0', 'SODABUS', 'Pan brioche, doble smash de 85 g, mermelada de bacon ahumado, queso cheddar inglés, cebolla caramelizada, mayonesa de chistorra, cortezas y polvo Takis volcano.', 'logos/sodabus.png', 'burgers/lamanuela.png', '2025-05-13 12:11:58'),
(25, 'TEXAS BLAZE®', 'MARLONS®', 'Mermelada de bacon casera con salsa chipotle, cheddar ahumado, brioche en forma de nube y nuestro blend de vaca nacional súper jugoso. Doble smash-burger 180 g.', 'logos/marlons.png', 'burgers/texasblaze.png', '2025-05-13 12:13:09'),
(26, 'THE NOTORIOUS P.I.G', 'ASADO BURGERS', 'Vaca vieja dry-aged, pulled pork de Duroc, ChoriJam, cheddar ahumado, mayo de bacon, cebolla encurtida, brioche glaseado con dulce de leche bourbon y cubierto con Lotus Biscoff.', 'logos/asadoburgers.png', 'burgers/thenotorious.png', '2025-05-13 12:13:09'),
(27, 'Flow', 'JISMA - THE BEST BURGER', 'Brioche artesano de bacon, space mayo, patty smash de vaca fat x Lacy Edge, queso cheddar madurado, crumble de bacon-cola, salsa Cheese Galaxy Cream y Cheetos.', 'logos/jisma.png', 'burgers/flow.jpg', '2025-05-13 12:13:40');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `burgers_probadas`
--

CREATE TABLE `burgers_probadas` (
  `id` int(11) NOT NULL,
  `id_burger` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `calificacion` int(11) DEFAULT NULL CHECK (`calificacion` between 1 and 5),
  `fecha_prueba` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `tabla_alergenos`
--

CREATE TABLE `tabla_alergenos` (
  `id` int(11) NOT NULL,
  `id_alergeno` int(11) NOT NULL,
  `id_burger` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `tabla_alergenos`
--

INSERT INTO `tabla_alergenos` (`id`, `id_alergeno`, `id_burger`) VALUES
(1, 6, 1),
(2, 7, 1),
(3, 5, 1),
(4, 10, 1),
(5, 12, 1),
(6, 3, 1),
(7, 14, 1),
(8, 13, 1),
(9, 8, 1),
(10, 9, 2),
(11, 6, 2),
(12, 4, 2),
(13, 2, 2),
(14, 7, 2),
(15, 5, 2),
(16, 10, 2),
(17, 12, 2),
(18, 3, 2),
(19, 14, 2),
(20, 13, 2),
(21, 8, 2),
(22, 6, 3),
(23, 2, 3),
(24, 7, 3),
(25, 5, 3),
(26, 10, 3),
(27, 12, 3),
(28, 14, 3),
(29, 13, 3),
(30, 8, 3),
(31, 6, 4),
(32, 7, 4),
(33, 5, 4),
(34, 10, 4),
(35, 12, 4),
(36, 3, 4),
(37, 14, 4),
(38, 13, 4),
(39, 7, 5),
(40, 4, 5),
(41, 5, 5),
(42, 10, 5),
(43, 11, 5),
(44, 3, 5),
(45, 14, 5),
(46, 13, 5),
(47, 8, 5),
(48, 1, 5),
(49, 2, 5),
(50, 6, 5),
(51, 6, 6),
(52, 2, 6),
(53, 7, 6),
(54, 10, 6),
(55, 11, 6),
(56, 12, 6),
(57, 3, 6),
(58, 14, 6),
(59, 13, 6),
(60, 8, 6),
(61, 6, 7),
(62, 7, 7),
(63, 5, 7),
(64, 10, 7),
(65, 11, 7),
(66, 12, 7),
(67, 3, 7),
(68, 14, 7),
(69, 13, 7),
(70, 8, 7),
(71, 9, 8),
(72, 6, 8),
(73, 2, 8),
(74, 7, 8),
(75, 5, 8),
(76, 10, 8),
(77, 11, 8),
(78, 12, 8),
(79, 1, 8),
(80, 3, 8),
(81, 14, 8),
(82, 13, 8),
(83, 8, 8),
(84, 6, 9),
(85, 7, 9),
(86, 5, 9),
(87, 10, 9),
(88, 12, 9),
(89, 3, 9),
(90, 14, 9),
(91, 13, 9),
(92, 8, 9),
(93, 6, 10),
(94, 7, 10),
(95, 5, 10),
(96, 10, 10),
(97, 12, 10),
(98, 3, 10),
(99, 14, 10),
(100, 13, 10),
(101, 8, 10),
(102, 6, 11),
(103, 1, 11),
(104, 7, 11),
(105, 5, 11),
(106, 10, 11),
(107, 12, 11),
(108, 9, 11),
(109, 14, 11),
(110, 13, 11),
(111, 8, 11),
(112, 6, 12),
(113, 7, 12),
(114, 5, 12),
(115, 10, 12),
(116, 12, 12),
(117, 14, 12),
(118, 13, 12),
(119, 8, 12),
(120, 3, 13),
(121, 6, 13),
(122, 4, 13),
(123, 5, 13),
(124, 7, 13),
(125, 5, 13),
(126, 10, 13),
(127, 11, 13),
(128, 12, 13),
(129, 1, 13),
(130, 14, 13),
(131, 13, 13),
(132, 8, 13),
(157, 3, 14),
(158, 6, 14),
(159, 4, 14),
(160, 5, 14),
(161, 7, 14),
(162, 10, 14),
(163, 11, 14),
(164, 12, 14),
(165, 1, 14),
(166, 14, 14),
(167, 13, 14),
(168, 8, 14),
(169, 1, 15),
(170, 2, 15),
(171, 3, 15),
(172, 4, 15),
(173, 5, 15),
(174, 6, 15),
(175, 7, 15),
(176, 8, 15),
(177, 9, 15),
(178, 10, 15),
(179, 11, 15),
(180, 12, 15),
(181, 13, 15),
(182, 14, 15),
(183, 6, 16),
(184, 2, 16),
(185, 7, 16),
(186, 5, 16),
(187, 10, 16),
(188, 12, 16),
(189, 1, 16),
(190, 3, 16),
(191, 14, 16),
(192, 13, 16),
(193, 8, 16),
(194, 9, 17),
(195, 6, 17),
(196, 4, 17),
(197, 2, 17),
(198, 7, 17),
(199, 5, 17),
(200, 10, 17),
(201, 11, 17),
(202, 12, 17),
(203, 1, 17),
(204, 3, 17),
(205, 14, 17),
(206, 13, 17),
(207, 8, 17),
(208, 6, 18),
(209, 4, 18),
(210, 2, 18),
(211, 7, 18),
(212, 5, 18),
(213, 10, 18),
(214, 11, 18),
(215, 12, 18),
(216, 14, 18),
(217, 13, 18),
(218, 8, 18),
(219, 6, 19),
(220, 7, 19),
(221, 5, 19),
(222, 10, 19),
(223, 12, 19),
(224, 1, 19),
(225, 14, 19),
(226, 13, 19),
(227, 8, 19),
(228, 6, 20),
(229, 7, 20),
(230, 10, 20),
(231, 12, 20),
(232, 14, 20),
(233, 13, 20),
(234, 8, 20),
(235, 1, 21),
(236, 6, 21),
(237, 2, 21),
(238, 11, 21),
(239, 7, 21),
(240, 4, 21),
(241, 14, 21),
(242, 13, 21),
(243, 8, 21),
(244, 6, 22),
(245, 11, 22),
(246, 7, 22),
(247, 10, 22),
(248, 12, 22),
(249, 14, 22),
(250, 13, 22),
(251, 8, 22),
(252, 6, 23),
(253, 7, 23),
(254, 10, 23),
(255, 8, 23),
(256, 6, 24),
(257, 9, 24),
(258, 7, 24),
(259, 10, 24),
(260, 5, 24),
(261, 11, 24),
(262, 12, 24),
(263, 13, 24),
(264, 8, 24),
(265, 6, 25),
(266, 7, 25),
(267, 10, 25),
(268, 12, 25),
(269, 13, 25),
(270, 8, 25),
(271, 6, 26),
(272, 2, 26),
(273, 7, 26),
(274, 11, 26),
(275, 10, 26),
(276, 9, 26),
(277, 14, 26),
(278, 12, 26),
(279, 13, 26),
(280, 8, 26),
(281, 6, 27),
(282, 7, 27),
(283, 11, 27),
(284, 10, 27),
(285, 12, 27),
(286, 8, 27);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `usuarios`
--

CREATE TABLE `usuarios` (
  `id` int(11) NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `email` varchar(150) NOT NULL,
  `password` varchar(255) NOT NULL,
  `creado_en` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `alergenos`
--
ALTER TABLE `alergenos`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `burgers`
--
ALTER TABLE `burgers`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `burgers_probadas`
--
ALTER TABLE `burgers_probadas`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id_burger` (`id_burger`,`id_usuario`),
  ADD KEY `id_usuario` (`id_usuario`);

--
-- Indices de la tabla `tabla_alergenos`
--
ALTER TABLE `tabla_alergenos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_alergeno` (`id_alergeno`),
  ADD KEY `id_burger` (`id_burger`);

--
-- Indices de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `alergenos`
--
ALTER TABLE `alergenos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `burgers`
--
ALTER TABLE `burgers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;

--
-- AUTO_INCREMENT de la tabla `burgers_probadas`
--
ALTER TABLE `burgers_probadas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `tabla_alergenos`
--
ALTER TABLE `tabla_alergenos`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=287;

--
-- AUTO_INCREMENT de la tabla `usuarios`
--
ALTER TABLE `usuarios`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `burgers_probadas`
--
ALTER TABLE `burgers_probadas`
  ADD CONSTRAINT `burgers_probadas_ibfk_1` FOREIGN KEY (`id_burger`) REFERENCES `burgers` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `burgers_probadas_ibfk_2` FOREIGN KEY (`id_usuario`) REFERENCES `usuarios` (`id`) ON DELETE CASCADE;

--
-- Filtros para la tabla `tabla_alergenos`
--
ALTER TABLE `tabla_alergenos`
  ADD CONSTRAINT `tabla_alergenos_ibfk_1` FOREIGN KEY (`id_alergeno`) REFERENCES `alergenos` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tabla_alergenos_ibfk_2` FOREIGN KEY (`id_burger`) REFERENCES `burgers` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
