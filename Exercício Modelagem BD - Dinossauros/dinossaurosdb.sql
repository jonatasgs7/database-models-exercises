-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3306
-- Generation Time: 07-Maio-2022 às 18:03
-- Versão do servidor: 5.7.26
-- versão do PHP: 7.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dinossaurosdb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `descobridor`
--

DROP TABLE IF EXISTS `descobridor`;
CREATE TABLE IF NOT EXISTS `descobridor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `descobridor`
--

INSERT INTO `descobridor` (`id`, `nome`) VALUES
(1, 'Maryanska'),
(2, 'John Bell Hatcher'),
(3, 'Cientistas Alemãs'),
(4, 'Museu Americano de História Natural'),
(5, 'Othniel Charles Marsh'),
(6, 'Barnum Brown');

-- --------------------------------------------------------

--
-- Estrutura da tabela `dinossauro`
--

DROP TABLE IF EXISTS `dinossauro`;
CREATE TABLE IF NOT EXISTS `dinossauro` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(160) DEFAULT NULL,
  `toneladas` int(11) DEFAULT NULL,
  `ano_descoberta` int(11) DEFAULT NULL,
  `fk_grupo` int(11) NOT NULL,
  `fk_pais` int(11) NOT NULL,
  `fk_descobridor` int(11) NOT NULL,
  `fk_era` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_grupo` (`fk_grupo`),
  KEY `fk_pais` (`fk_pais`),
  KEY `fk_descobridor` (`fk_descobridor`),
  KEY `fk_era` (`fk_era`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `dinossauro`
--

INSERT INTO `dinossauro` (`id`, `nome`, `toneladas`, `ano_descoberta`, `fk_grupo`, `fk_pais`, `fk_descobridor`, `fk_era`) VALUES
(1, 'Saichania', 4, 1977, 1, 1, 1, 1),
(2, 'Tricerátops', 6, 1887, 2, 2, 2, 1),
(3, 'Kentrossauro', 2, 1909, 3, 3, 3, 2),
(4, 'Pinacossauro', 6, 1999, 1, 4, 4, 1),
(5, 'Alossauro', 3, 1877, 4, 5, 5, 2),
(6, 'Torossauro', 8, 1891, 2, 6, 2, 1),
(7, 'Anquilossauro', 8, 1906, 1, 5, 6, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `era`
--

DROP TABLE IF EXISTS `era`;
CREATE TABLE IF NOT EXISTS `era` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `era` varchar(80) DEFAULT NULL,
  `inicio` int(11) DEFAULT NULL,
  `fim` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `era`
--

INSERT INTO `era` (`id`, `era`, `inicio`, `fim`) VALUES
(1, 'Cretáceo', 145, 66),
(2, 'Jurássico', 201, 145);

-- --------------------------------------------------------

--
-- Estrutura da tabela `grupo`
--

DROP TABLE IF EXISTS `grupo`;
CREATE TABLE IF NOT EXISTS `grupo` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `grupo` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `grupo`
--

INSERT INTO `grupo` (`id`, `grupo`) VALUES
(1, 'Anquilossauros'),
(2, 'Ceratopsídeos'),
(3, 'Estegossauros'),
(4, 'Terápodes');

-- --------------------------------------------------------

--
-- Estrutura da tabela `pais`
--

DROP TABLE IF EXISTS `pais`;
CREATE TABLE IF NOT EXISTS `pais` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pais` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `pais`
--

INSERT INTO `pais` (`id`, `pais`) VALUES
(1, 'Mongólia'),
(2, 'Canadá'),
(3, 'Tanzânia'),
(4, 'China'),
(5, 'América do Norte'),
(6, 'USA'),
(7, 'América do Norte');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
