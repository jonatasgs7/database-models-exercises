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
-- Database: `bibliotecadb`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `autor`
--

DROP TABLE IF EXISTS `autor`;
CREATE TABLE IF NOT EXISTS `autor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(160) DEFAULT NULL,
  `nacionalidade` varchar(160) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=7 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `autor`
--

INSERT INTO `autor` (`id`, `nome`, `nacionalidade`) VALUES
(1, 'J.K. Rowling', 'Inglaterra'),
(2, 'Clive Staples Lewis', 'Inglaterra'),
(3, 'Affonso Solano', 'Brasil'),
(4, 'Marcos Piangers', 'Brasil'),
(5, 'Ciro Botelho - Tiririca', 'Brasil'),
(6, 'Bianca Mól', 'Brasil');

-- --------------------------------------------------------

--
-- Estrutura da tabela `categoria`
--

DROP TABLE IF EXISTS `categoria`;
CREATE TABLE IF NOT EXISTS `categoria` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `categoria` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `categoria`
--

INSERT INTO `categoria` (`id`, `categoria`) VALUES
(1, 'Literatura Juvenil'),
(2, 'Ficção Científica'),
(3, 'Humor');

-- --------------------------------------------------------

--
-- Estrutura da tabela `editora`
--

DROP TABLE IF EXISTS `editora`;
CREATE TABLE IF NOT EXISTS `editora` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(120) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `editora`
--

INSERT INTO `editora` (`id`, `nome`) VALUES
(1, 'Rocco'),
(2, 'Wmf Martins Fontes'),
(3, 'Casa da Palavra'),
(4, 'Belas Letras'),
(5, 'Matrix');

-- --------------------------------------------------------

--
-- Estrutura da tabela `livro`
--

DROP TABLE IF EXISTS `livro`;
CREATE TABLE IF NOT EXISTS `livro` (
  `isbn` varchar(60) NOT NULL,
  `titulo` varchar(160) NOT NULL,
  `ano` int(11) NOT NULL,
  `fk_editora` int(11) NOT NULL,
  `fk_autor` int(11) NOT NULL,
  `fk_categoria` int(11) NOT NULL,
  PRIMARY KEY (`isbn`),
  KEY `fk_editora` (`fk_editora`),
  KEY `fk_categoria` (`fk_categoria`),
  KEY `fk_autor` (`fk_autor`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livro`
--

INSERT INTO `livro` (`isbn`, `titulo`, `ano`, `fk_editora`, `fk_autor`, `fk_categoria`) VALUES
('8532511015', 'Harry Potter e a Pedra Filosofal', 2000, 1, 1, 1),
('9788578270698', 'As Crônicas de Nárnia', 2009, 2, 2, 1),
('9788577343348', 'O Espadachim de Carvão', 2013, 3, 3, 2),
('9788581742458', 'O Papai é Pop', 2015, 4, 4, 3),
('9788582302026', 'Pior Que Tá Não Fica', 2015, 5, 5, 3),
('9788577345670', 'Garota Desdobrável', 2015, 3, 6, 1),
('8532512062', 'Harry Potter e o Prisioneiro de Azkaban', 2000, 1, 1, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `livroautor`
--

DROP TABLE IF EXISTS `livroautor`;
CREATE TABLE IF NOT EXISTS `livroautor` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fk_autor` int(11) NOT NULL,
  `fk_livro` varchar(60) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_livro` (`fk_livro`),
  KEY `fk_autor` (`fk_autor`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `livroautor`
--

INSERT INTO `livroautor` (`id`, `fk_autor`, `fk_livro`) VALUES
(1, 1, '8532511015'),
(2, 2, '9788578270698'),
(3, 3, '9788577343348'),
(4, 4, '9788581742458'),
(5, 5, '9788582302026'),
(6, 6, '9788577345670'),
(7, 1, '8532512062');
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
