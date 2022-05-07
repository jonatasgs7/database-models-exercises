/* Questão 4 - Criando o banco de dados */
CREATE DATABASE bibliotecadb;

/* Usando o banco de dados criado */
USE bibliotecadb;

/* Questão 5 */
/* Criando as tabelas de acordo com o diagrama lógico */
CREATE TABLE `editora` (
  `id` int not null auto_increment,
  `nome` varchar(120),
  PRIMARY KEY (`id`)
);

CREATE TABLE `categoria` (
  `id` int not null auto_increment,
  `categoria` varchar(80),
  PRIMARY KEY (`id`)
);

CREATE TABLE `autor` (
  `id` int not null auto_increment,
  `nome` varchar(160),
  `nacionalidade` varchar(160),
  PRIMARY KEY (`id`)
);

CREATE TABLE `livro` (
  `isbn` varchar(60) not null,
  `titulo` varchar(160) not null,
  `ano` int not null,
  `fk_editora` int not null,
  `fk_autor` int not null,
  `fk_categoria` int not null,
  PRIMARY KEY (`isbn`),
  FOREIGN KEY (`fk_editora`) REFERENCES `editora`(`id`),
  FOREIGN KEY (`fk_categoria`) REFERENCES `categoria`(`id`),
  FOREIGN KEY (`fk_autor`) REFERENCES `autor`(`id`)
);

CREATE TABLE `livroAutor` (
  `id` int not null auto_increment,
  `fk_autor` int not null,
  `fk_livro` varchar(60) not null,
  PRIMARY KEY (`id`),
  FOREIGN KEY (`fk_livro`) REFERENCES `livro`(`isbn`),
  FOREIGN KEY (`fk_autor`) REFERENCES `autor`(`id`)
);

/* Questão 6 */
/* Inserindo dados na tabela "autor" */
INSERT INTO autor (nome, nacionalidade) VALUES 
('J.K. Rowling', 'Inglaterra'),
('Clive Staples Lewis', 'Inglaterra'),
('Affonso Solano', 'Brasil'),
('Marcos Piangers', 'Brasil'),
('Ciro Botelho - Tiririca', 'Brasil'),
('Bianca Mól', 'Brasil');

/* Inserindo dados na tabela "categoria" */
INSERT INTO categoria (categoria) VALUES 
('Literatura Juvenil'),
('Ficção Científica'),
('Humor');

/* Inserindo dados na tabela "editora" */
INSERT INTO editora (nome) VALUES
('Rocco'),
('Wmf Martins'),
('Casa da Palavra'),
('Belas Letras'),
('Matrix');

/* Inserindo dados da tabela "livro" */
INSERT INTO livro (isbn, titulo, ano, fk_editora, fk_autor, fk_categoria) VALUES
('8532511015', 'Harry Potter e a Pedra Filosofal', '2000', 1, 1, 1),
('9788578270698', 'As Crônicas de Nárnia', '2009', 2, 2, 1),
('9788577343348', 'O Espadachim de Carvão', '2013', 3, 3, 2),
('9788581742458', 'O Papai é Pop', '2015', 4, 4, 3),
('9788582302026', 'Pior Que Tá Não Fica', '2015', 5, 5, 3),
('9788577345670', 'Garota Desdobrável', '2015', 3, 6, 1),
('8532512062', 'Harry Potter e o Prisioneiro de Azkaban', '2000', 1, 1, 1);

/* Inserindo dados na tabela de relacionamento "livroAutor" */
INSERT INTO livroAutor (fk_autor, fk_livro) VALUES
(1, '8532511015'),
(2, '9788578270698'),
(3, '9788577343348'),
(4, '9788581742458'),
(5, '9788582302026'),
(6, '9788577345670'),
(1, '8532512062');

/* Questão 7 */
SELECT livro.isbn AS 'ISBN',
livro.titulo AS 'Título',
livro.ano AS 'Ano',
editora.nome AS 'Editora', 
categoria.categoria AS 'Categoria'
FROM livro, editora, categoria
WHERE livro.fk_editora = editora.id
AND livro.fk_categoria = categoria.id
ORDER BY livro.titulo;

/* Questão 8 */
SELECT livro.isbn AS 'ISBN',
livro.titulo AS 'Título',
livro.ano AS 'Ano',
editora.nome AS 'Editora', 
concat(autor.nome, ' (' , autor.nacionalidade, ')') AS 'Autor (Nacionalidade)',categoria.categoria AS 'Categoria'
FROM livro, editora, categoria, autor, livroautor
WHERE livro.fk_editora = editora.id
AND livro.fk_categoria = categoria.id
AND livroautor.fk_autor = autor.id
AND livroautor.fk_livro = livro.isbn
ORDER BY autor.nome;

/* Questão 9 */
SELECT livro.isbn AS 'ISBN',
livro.titulo AS 'Título',
livro.ano AS 'Ano',
editora.nome AS 'Editora', 
concat(autor.nome, ' (' , autor.nacionalidade, ')') AS  'Autor (Nacionalidade)',categoria.categoria as 'Categoria'
FROM livro, editora, categoria, autor, livroautor
WHERE livro.fk_editora = editora.id
AND livro.fk_categoria = categoria.id
AND livroautor.fk_autor = autor.id
AND livroautor.fk_livro = livro.isbn
AND categoria.categoria LIKE '%Juvenil%'
ORDER BY livro.ano;

/* Questão 10 */
SELECT livro.isbn AS 'ISBN',
livro.titulo AS 'Título',
livro.ano AS 'Ano',
editora.nome AS 'Editora', 
concat(autor.nome, ' (' , autor.nacionalidade, ')') AS 'Autor (Nacionalidade)',categoria.categoria AS 'Categoria'
FROM livro, editora, categoria, autor, livroautor
WHERE livro.fk_editora = editora.id
AND livro.fk_categoria = categoria.id
AND livroautor.fk_autor = autor.id
AND livroautor.fk_livro = livro.isbn
AND categoria.categoria IN ('Ficção Científica','Humor')
AND livro.ano between 2000 AND 2010
ORDER BY livro.ano;
