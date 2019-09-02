CREATE DATABASE LIVRARIA; # Cria o banco de dados;

USE LIVRARIA; # Conecta no banco de dados;

# Cria a tabela Livros no banco;
CREATE TABLE LIVROS(
	IDLIVROS INT PRIMARY KEY AUTO_INCREMENT,
	NOME_LIVRO VARCHAR(64) NOT NULL,
	NOME_AUTOR VARCHAR(64) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	NUMERO_PAGINAS CHAR(4) NOT NULL,
	NOME_EDITORA VARCHAR(32) NOT NULL,
	VALOR_LIVRO FLOAT NOT NULL,
	ESTADO_EDITORA CHAR(2) NOT NULL,
	ANO_PUBLICACAO CHAR(4) NOT NULL
);

CREATE TABLE PESSOA(
	IDPESSOA INT PRIMARY KEY AUTO_INCREMENT,
	NOME_PESSOA VARCHAR(64) NOT NULL,
	TELEFONE_PESSOA VARCHAR()
	NOME_LIVRO VARCHAR(64) NOT NULL,
	SEXO ENUM('M','F') NOT NULL,
	CIDADE_PESSOA VARCHAR(32) NOT NULL,
	ESTADO_PESSOA CHAR(2) NOT NULL,
	ID_LIVROS INT,
	FOREIGN KEY(ID_LIVROS)
	REFERENCES LIVROS(IDLIVROS)
);

# Inserindo dados no banco;
INSERT INTO LIVROS VALUES(NULL,'Cavaleiro Real','Ana Claudia','F','465','Atlas',49.9,'RJ','2009');
INSERT INTO	LIVROS VALUES(NULL,'SQL para leigos','João Nunes','M','450','Addison',98,'SP','2018');
INSERT INTO LIVROS VALUES(NULL,'Receitas Caseiras','Celia Tavares','F','210','Atlas',45,'RJ','2008');
INSERT INTO	LIVROS VALUES(NULL,'Pessoas Efetivas','Eduardo Santos','M','390','Beta',78.99,'RJ','2018');
INSERT INTO	LIVROS VALUES(NULL,'Habitos Saudáveis','Eduardo Santos','M','630','Beta',150.98,'RJ','2019');
INSERT INTO	LIVROS VALUES(NULL,'A Casa Marrom','Hermes Macedo','M','250','Bubba',60,'MG','2016');
INSERT INTO	LIVROS VALUES(NULL,'Estácio Querido','Geraldo Francisco','M','310','Insignia',100,'ES','2015');
INSERT INTO	LIVROS VALUES(NULL,'Pra sempre amigas','Leda Silva','F','510','Insignia',78.98,'ES','2011');
INSERT INTO	LIVROS VALUES(NULL,'Copas Inesqueciveis','Marco Alcantra','M','200','Larson',130.98,'RS','2018');
INSERT INTO	LIVROS VALUES(NULL,'O poder da mente','Clara Mafra','F','120','Continental',56.58,'SP','2017');
INSERT INTO	LIVROS VALUES(NULL,'Data structures and algorithms in C++','Adam Drozdek','M','758','Boston',149.99,'MA','2005');
INSERT INTO	LIVROS VALUES(NULL,'Ajax in action','Dave Crane','M','650','Greenwich',201.55,'ES','2006');
INSERT INTO	LIVROS VALUES(NULL,'Testing object-oriented systems : models, patterns, and tools','Addison Wesley','M','1191','Boston',149.99,'SP','2000');
INSERT INTO	LIVROS VALUES(NULL,'The unified modeling language user guide','Addison Wesley','M','482','Greenwich',399.20,'RJ','1999');
INSERT INTO	LIVROS VALUES(NULL,'Álgebra Linear e Geometria Euclidiana','Alexandre Augusto Martins','M','202','Nobel',47.20,'SP','2005');
INSERT INTO	LIVROS VALUES(NULL,'Psicologia hospitalar  teoria, aplicações e casos clínicos','Rosana Righetto','F','300','Nobel',87.99,'SP','2018');
INSERT INTO	LIVROS VALUES(NULL,'O atendimento infantil na ótica fenomenológico-existencial','Clara Mafra','F','401','Continental',231.55,'SP','2008');
INSERT INTO	LIVROS VALUES(NULL,'A vida quotidiana em Cartago no tempo de Anibal','Leda Silva','F','297','Lisboa',25.99,'GO','2015');
INSERT INTO	LIVROS VALUES(NULL,'A História : Pensamento e Ação ','Hermes Macedo','M','286','Bubba',19.99,'MG','2001');
INSERT INTO	LIVROS VALUES(NULL,'História Geral e do Brasil','Marco Alcantra','M','359','Larson',149.99,'RS','2005');

# Consultas básicas

SELECT * FROM LIVROS; # Projeta todos os campos do banco;

SELECT NOME_AUTOR FROM LIVROS; # Projeta os nomes dos autores do banco;

SELECT NOME_EDITORA FROM LIVROS; # Projeta os nomes das editoras de livros do banco;

SELECT NOME_AUTOR, NOME_EDITORA # Projeta os nomes dos autores relacionados com as editoras 
FROM LIVROS 
WHERE SEXO = 'M';   # a qual esse autor publicou o livro;

# Consultas específicas

SELECT NOME_LIVRO
FROM LIVROS
WHERE VALOR_LIVRO < 30;

SELECT NOME_LIVRO, NOME_AUTOR
FROM LIVROS
WHERE ESTADO_EDITORA = 'SP';

SELECT NOME_LIVRO, NOME_AUTOR
FROM LIVROS
WHERE ESTADO_EDITORA = 'SP'
AND NOME_LIVRO LIKE 'P%';

SELECT NOME_LIVRO, NOME_AUTOR
FROM LIVROS
WHERE NOME_LIVRO LIKE 'P%';

SELECT NOME_LIVRO, NOME_AUTOR
FROM LIVROS
WHERE VALOR_LIVRO = (SELECT MIN(VALOR_LIVRO) FROM LIVROS)