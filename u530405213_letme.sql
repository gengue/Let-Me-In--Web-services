
-- phpMyAdmin SQL Dump
-- version 3.5.2.2
-- http://www.phpmyadmin.net
--
-- Host: localhost
-- Generation Time: Dec 08, 2013 at 11:19 AM
-- Server version: 5.1.66
-- PHP Version: 5.2.17

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `u530405213_letme`
--

-- --------------------------------------------------------

--
-- Table structure for table `Entradas`
--

CREATE TABLE IF NOT EXISTS `Entradas` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `fechaYhora` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Entradas`
--

INSERT INTO `Entradas` (`id`, `fechaYhora`) VALUES
(1, '2013-12-06 06:00:00'),
(2, '2013-12-06 06:00:06'),
(5, '2013-12-07 06:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `RegistroLaboral`
--

CREATE TABLE IF NOT EXISTS `RegistroLaboral` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `usuario` int(20) NOT NULL,
  `entrada` int(12) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `RegistroLaboral`
--

INSERT INTO `RegistroLaboral` (`id`, `usuario`, `entrada`) VALUES
(1, 1082963607, 1),
(2, 1082765394, 2),
(5, 1082666, 5);

-- --------------------------------------------------------

--
-- Table structure for table `Salidas`
--

CREATE TABLE IF NOT EXISTS `Salidas` (
  `id` int(12) NOT NULL AUTO_INCREMENT,
  `entrada` int(12) NOT NULL,
  `fechaYhora` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entrada` (`entrada`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=6 ;

--
-- Dumping data for table `Salidas`
--

INSERT INTO `Salidas` (`id`, `entrada`, `fechaYhora`) VALUES
(1, 1, '2013-12-06 12:00:00'),
(2, 2, '2013-12-06 12:00:00'),
(5, 5, '2013-12-07 09:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `Usuario`
--

CREATE TABLE IF NOT EXISTS `Usuario` (
  `cedula` int(20) unsigned NOT NULL,
  `nombres` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `apellidos` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `tipoEmpleado` varchar(150) COLLATE utf8_unicode_ci NOT NULL,
  `estado` tinyint(1) NOT NULL,
  PRIMARY KEY (`cedula`),
  UNIQUE KEY `nombres` (`nombres`),
  FULLTEXT KEY `nombres_2` (`nombres`),
  FULLTEXT KEY `nombres_3` (`nombres`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `Usuario`
--

INSERT INTO `Usuario` (`cedula`, `nombres`, `apellidos`, `tipoEmpleado`, `estado`) VALUES
(1082963607, 'Genesis ', 'Guerreo Martinez', 'Supervisor', 0),
(1082765394, 'Jose Luis', 'Echavez Morales', 'Aseador', 0),
(1082666, 'Andres', 'Vasquez Zuñiga', 'Cigarron', 0),
(1082777, 'Francisco Rucutundo', 'Velasquez', 'Empacador', 0),
(1082444, 'Diana', 'Arevalo Marquez', 'Secretaria', 0);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
