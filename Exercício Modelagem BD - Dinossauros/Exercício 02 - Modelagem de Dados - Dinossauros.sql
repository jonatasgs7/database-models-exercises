/* Questão 4 - Criando o banco de dados */
CREATE DATABASE dinossaurosdb;

/* Usando o banco de dados criado */
USE dinossaurosdb;

/* Questão 5 */
/* Criando as tabelas de acordo com o diagrama lógico */
CREATE TABLE `grupo` (
  `id` int auto_increment not null,
  `grupo` varchar(80),
  PRIMARY KEY (`id`)
);

CREATE TABLE `pais` (
  `id` int auto_increment not null,
  `pais` varchar(80),
  PRIMARY KEY (`id`)
);

CREATE TABLE `descobridor` (
  `id` int auto_increment not null,
  `nome` varchar(160),
  PRIMARY KEY (`id`)
);

CREATE TABLE `era` (
  `id` int auto_increment not null,
  `era` varchar(80),
  `inicio` int,
  `fim` int,
  PRIMARY KEY (`id`)
);

CREATE TABLE `dinossauro` (
  `id` int auto_increment not null,
  `nome` varchar(160),
  `toneladas` int,
  `ano_descoberta` int,
  `fk_grupo` int not null,
  `fk_pais` int not null,
  `fk_descobridor` int not null,
  `fk_era` int not null,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`fk_grupo`) REFERENCES `grupo`(`id`),
  FOREIGN KEY (`fk_pais`) REFERENCES `pais`(`id`),
  FOREIGN KEY (`fk_descobridor`) REFERENCES `descobridor`(`id`),
  FOREIGN KEY (`fk_era`) REFERENCES `era`(`id`)
);

/* Questão 6 */
/* Inserindo dados na tabela "grupo" */
INSERT INTO grupo (grupo) VALUES
('Anquilossauros'),
('Ceratopsídeos'),
('Estegossauros'),
('Terápodes');

/* Inserindo dados na tabela "país" */
INSERT INTO pais (pais) VALUES
('Mongólia'),
('Canadá'),
('Tanzânia'),
('China'),
('América do Norte'),
('USA'),
('América do Norte');

/* Inserindo dados na tabela "descobridor" */
INSERT INTO descobridor (nome) VALUES
('Maryanska'),
('John Bell Hatcher'),
('Cientistas Alemãs'),
('Museu Americano de História Natural'),
('Othniel Charles Marsh'),
('Barnum Brown');

/* Inserindo dados na tabela "era" */
INSERT INTO era (era, inicio, fim) VALUES
('Cretáceo', 145, 66),
('Jurássico', 201, 145);

/* Inserindo dados na tabela "dinossauro" */
INSERT INTO dinossauro (nome, toneladas, ano_descoberta, fk_grupo, fk_pais, fk_descobridor, fk_era) VALUES
('Saichania', 4, 1977, 1, 1, 1, 1),
('Tricerátops', 6, 1887, 2, 2, 2, 1),
('Kentrossauro', 2, 1909, 3, 3, 3, 2),
('Pinacossauro', 6, 1999, 1, 4, 4, 1),
('Alossauro', 3, 1877, 4, 5, 5, 2),
('Torossauro', 8, 1891, 2, 6, 2, 1),
('Anquilossauro', 8, 1906, 1, 5, 6, 1);

/* Questão 7 */
SELECT dinossauro.nome AS 'Dinossauro',
grupo.grupo AS 'Grupo',
dinossauro.toneladas AS 'Toneladas',
dinossauro.ano_descoberta AS 'Ano Descoberta',
descobridor.nome AS 'Descobridor',
era.era AS 'Era',
era.inicio AS 'Início - Milhões',
era.fim AS 'Fim - Milhões',
pais.pais AS 'País / Região'
FROM dinossauro, grupo, pais, descobridor, era
WHERE dinossauro.fk_grupo = grupo.id
AND dinossauro.fk_pais = pais.id
AND dinossauro.fk_descobridor = descobridor.id
AND dinossauro.fk_era = era.id
ORDER BY dinossauro.nome;


/* Questão 8 */
SELECT descobridor.nome AS 'Descobridor',
dinossauro.ano_descoberta AS 'Ano Descoberta',
dinossauro.nome AS 'Dinossauro',
grupo.grupo AS 'Grupo',
dinossauro.toneladas AS 'Toneladas',
era.era AS 'Era',
era.inicio AS 'Início - Milhões',
era.fim AS 'Fim - Milhões',
pais.pais AS 'País / Região'
FROM dinossauro, grupo, pais, descobridor, era
WHERE dinossauro.fk_grupo = grupo.id
AND dinossauro.fk_pais = pais.id
AND dinossauro.fk_descobridor = descobridor.id
AND dinossauro.fk_era = era.id
ORDER BY descobridor.nome;


/* Questão 9 */
SELECT grupo.grupo AS 'Grupo',
dinossauro.nome AS 'Dinossauro',
dinossauro.ano_descoberta AS 'Ano Descoberta',
dinossauro.toneladas AS 'Toneladas',
descobridor.nome AS 'Descobridor',
era.era AS 'Era',
era.inicio AS 'Início - Milhões',
era.fim AS 'Fim - Milhões',
pais.pais AS 'País / Região'
FROM dinossauro, grupo, pais, descobridor, era
WHERE dinossauro.fk_grupo = grupo.id
AND dinossauro.fk_pais = pais.id
AND dinossauro.fk_descobridor = descobridor.id
AND dinossauro.fk_era = era.id
AND grupo.grupo like 'Anqui%'
ORDER BY dinossauro.ano_descoberta;

/* Questão 10 */
SELECT dinossauro.nome AS 'Dinossauro',
grupo.grupo AS 'Grupo',
dinossauro.toneladas AS 'Toneladas',
dinossauro.ano_descoberta AS 'Ano de Descoberta',
descobridor.nome AS 'Descobridor',
era.era AS 'Era',
era.inicio AS 'Início - Milhões',
era.fim AS 'Fim - Milhões',
pais.pais AS 'País / Região'
FROM dinossauro, grupo, descobridor, era, pais
WHERE dinossauro.fk_grupo = grupo.id
AND dinossauro.fk_pais = pais.id
AND dinossauro.fk_descobridor = descobridor.id
AND dinossauro.fk_era = era.id
AND grupo.grupo in ('Ceratopsídeos', 'Anquilossauros')
AND dinossauro.ano_descoberta between 1900 AND 1999
ORDER BY dinossauro.nome;



 