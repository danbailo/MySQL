create DATABASE COMERCIO;

USE COMERCIO;

CREATE TABLE CLIENTE(
	IDCLIENTE INT PRIMARY KEY AUTO_INCREMENT, #O BANCO INCREMENTA SOZINHO A VARIAVEL EX I++
	NOME VARCHAR(30) NOT NULL, #O BANCO NAO DEIXA O DADO ENTRAR SEM UM NOME
	SEXO ENUM('M','F') NOT NULL,
	EMAIL VARCHAR(50) UNIQUE, #UMA COLUNA N TENHA VALORES REPITIDOS, EX: UM EMAIL E UNICO NO MUNDO INTEIRO
	CPF VARCHAR(15) UNIQUE
);

CREATE TABLE TELEFONE(
	IDTELEFONE INT PRIMARY KEY AUTO_INCREMENT,
	TIPO ENUM('COM','RES','CEL'),#SE EU COLOCAR UNIQUE AQUI, SOMENTE UMA PESSOA TERA CEL, UMA TERA COM, E SO UMA TERA RES
	NUMERO VARCHAR(10),
	ID_CLIENTE INT,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) #CONVENCIONAR, CHAVE PRIMARIA NAO TEM UNDERLINE, CHAVE ESTRAGEIRA SIM
);

CREATE TABLE ENDERECO(
	IDENDERECO INT PRIMARY KEY AUTO_INCREMENT,
	RUA VARCHAR(30) NOT NULL,# SE EU COLOCAR UNIQUE, EU N VOU PODER TER CLIENTE MORANDO NA MESMA RUA
	BAIRRO VARCHAR(30) NOT NULL,
	CIDADE VARCHAR(30) NOT NULL,
	ESTADO CHAR(2) NOT NULL,
	ID_CLIENTE INT UNIQUE,
	FOREIGN KEY(ID_CLIENTE) REFERENCES CLIENTE(IDCLIENTE) #CONVENCIONAR, CHAVE PRIMARIA NAO TEM UNDERLINE, CHAVE ESTRAGEIRA SIM
);

/* FOREIGN KEY - CHAVE ESTRANGEIRA - FK */

/* É A CHAVE PRIMÁRIA DE UMA TABELA, QUE VAI ATE OUTRA TABELA FAZER REFERENCIA */

/* EM RELACIONAMENTOS 1 X 1 A CHAVE ESTRANGEIRA FICA NA TABELA MAIS FRACA 
   SE É RELACIONAMENTO 1 X 1, VAI TER UNIQUE NA CHAVE!
*/

/* É INSERIDA NA ENTIDADE MAIS FRACA DE UM RELACIONAMENTO, EX:
   NO RELACIONAMENTO CLIENTE E ENDEREÇO, QUAL É A ENTIDADE MAIS FRACA ?
   É O ENDEREÇO, POIS PODEMOS CADASTRAR UM CLIENTE SEM UM ENDEREÇO, MAS NAO PODEMOS 
   CADASTRAR UM ENDEREÇO SEM UM CLIENTE!
*/

/* EM RELACIONAMENTOS 1 X N, A CHAVE ESTRANGEIRA FICARA SEMPRE NA TABELA N */

SHOW DATABASES; #MOSTRA OS BANCOS

SHOW TABLES;

#passar null no auto increment, pois o banco que irá cuidar disso
INSERT INTO CLIENTE VALUES(NULL,'JOAO','M','JOAO@IG.COM','98547-6');
INSERT INTO CLIENTE VALUES(NULL,'CARLOS','M','CARLOS@TERA.COM','86664-7');
INSERT INTO CLIENTE VALUES(NULL,'ANA','F','ANA@GLOBO.COM','75658-5');
INSERT INTO CLIENTE VALUES(NULL,'JORGE','M','JORGE@IG.COM','88657-5');
INSERT INTO CLIENTE VALUES(NULL,'CLARA','M',NULL,'99754-7');
INSERT INTO CLIENTE VALUES(NULL,'CELIA','F','JOAO@TERRA.COM','77558-5');

SELECT * FROM CLIENTE;

/* INSERINDO UM REGISTRO ERRADO */

INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M','JOAO@IG.COM');

/*CORRIGINDO*/

INSERT INTO CLIENTE VALUES(NULL,'ANTONIO','M',NULL,'78558-6');
INSERT INTO CLIENTE VALUES(NULL,'JOAO','M',NULL,'86695-6');

#ELE NAO DEIXA ENTRAR, SO PODE SER 'M' OU 'F'
INSERT INTO CLIENTE VALUES(NULL,'DANIEL','G',NULL,'86695-6');

#CONTA A QTD DE REGISTROS DA TABLE;
SELECT COUNT(*) FROM CLIENTE;

DESC ENDERECO;

INSERT INTO ENDERECO VALUES(NULL,'RUA A','CENTRO','B. HORIZONTE','MG',4);
INSERT INTO ENDERECO VALUES(NULL,'RUA B','CENTRO','RIO DE JANEIRO','RJ',1);
INSERT INTO ENDERECO VALUES(NULL,'RUA C','JARDINS','SAO PAULO','SP',3);
INSERT INTO ENDERECO VALUES(NULL,'RUA B','ESTACIO','RIO DE JANEIRO','RJ',8);
INSERT INTO ENDERECO VALUES(NULL,'RUA Z','CRUZEIRO','B. HORIZONTE','MG',2);
INSERT INTO ENDERECO VALUES(NULL,'RUA X','FLAMENGO','RIO DE JANEIRO','RJ',7);
INSERT INTO ENDERECO VALUES(NULL,'RUA Z','CRUZEIRO','B. HORIZONTE','MG',5);
INSERT INTO ENDERECO VALUES(NULL,'RUA X','CENTRO','NITERÓI','RJ',6);

#isso da erro, pq nao existe essa chave na table cliente
INSERT INTO ENDERECO VALUES(NULL,'RUA X','CENTRO','NITERÓI','RJ',10);

#isso da erro pq n pode duplicar chave primaria/estrangeira
INSERT INTO ENDERECO VALUES(NULL,'RUA X','CENTRO','NITERÓI','RJ',1);

/*
"DELETA SOMENTE OS REGISTROS DA TABELA, POREM NAO RESETA O CONTADOR"
DELETE FROM ENDERECO
WHERE IDENDERECO = 2;

DELETE FROM ENDERECO WHERE IDENDERECO > 2 AND IDENDERECO < 10;
 */

/*
"DELETA A TABLE INTEIRA"
DROP TABLE ENDERECO;
*/

INSERT INTO TELEFONE VALUES(NULL,'CEL','9955331',1);
INSERT INTO TELEFONE VALUES(NULL,'COM','6574565',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','8864566',2);
INSERT INTO TELEFONE VALUES(NULL,'CEL','5557798',7);
INSERT INTO TELEFONE VALUES(NULL,'COM','6765768',1);
INSERT INTO TELEFONE VALUES(NULL,'RES','5676765',6);
INSERT INTO TELEFONE VALUES(NULL,'CEL','5765547',1);
INSERT INTO TELEFONE VALUES(NULL,'CEL','8865645',7);
INSERT INTO TELEFONE VALUES(NULL,'RES','7555446',7);
INSERT INTO TELEFONE VALUES(NULL,'CEL','5788654',3);
INSERT INTO TELEFONE VALUES(NULL,'CEL','7865644',6);
INSERT INTO TELEFONE VALUES(NULL,'RES','5754644',6);

SELECT * FROM TELEFONE WHERE TIPO='CEL' AND ID_CLIENTE=1;

SELECT * FROM CLIENTE;
SELECT * FROM ENDERECO;
SELECT * FROM TELEFONE;

/*SELECAO, PROJECAO E JUNCAO*/

/* PROJECAO - TUDO O QUE VÊ NA TELA*/

SELECT NOW() AS "DATA";

SELECT NOME, NOW() AS "DATA"
FROM CLIENTE;

/* SELECAO - TEORIA DOS CONJUNTOS - WHERE É A CLAUSULA DE SELEÇÃO */
SELECT NOME, NOW() AS "DATA"
FROM CLIENTE
WHERE SEXO = "M";

SELECT NOME, NOW() AS DATA FROM CLIENTE WHERE SEXO = 'M';

#MUDANDO O SEXO DA CLARA PARA FEMININO
UPDATE CLIENTE
SET SEXO = 'F'
WHERE IDCLIENTE = 5; #SELEÇÃO

SELECT NOME, SEXO, BAIRRO, CIDADE, NOW() AS "DATA"
FROM CLIENTE, ENDERECO #A VIRGULA SERIA PRA SETAR OUTRA TABELA
WHERE IDCLIENTE = ID_CLIENTE; #AQUI, SETAMOS AS CHAVES PRIMARIAS COMO A MESMA ESTRANGEIRA

-- SELECT IDCLIENTE, NOME, SEXO, BAIRRO, CIDADE, NOW() AS "DATA"
-- FROM CLIENTE, ENDERECO
-- WHERE IDCLIENTE = ID_CLIENTE;

-- SELECT ID_CLIENTE, NOME, SEXO, BAIRRO, CIDADE, NOW() AS "DATA"
-- FROM CLIENTE, ENDERECO
-- WHERE IDCLIENTE = ID_CLIENTE;

SELECT NOME, SEXO, BAIRRO, CIDADE, NOW() AS "DATA"
FROM CLIENTE, ENDERECO
WHERE IDCLIENTE = ID_CLIENTE /* WHERE E UM COMANDO DE SELECT NAO DE JOIN*/
AND BAIRRO = 'CENTRO'; /* SELECAO - NAO FAZER ISSO, POIS ISSO SERIA UM COMANDO DE JUNCAO,
 E DA MANEIRA QUE CONFIGURAMOS, ESSAS CHAVES SEMPRE SERAO IGUAIS*/

/* JUNÇÃO - JOIN, INNER JOIN */

SELECT NOME, SEXO, BAIRRO, CIDADE /* PROJECAO */
FROM CLIENTE
INNER JOIN ENDERECO /* JUNCAO */
ON IDCLIENTE = ID_CLIENTE
WHERE BAIRRO = 'CENTRO'; /* SELECAO */


#ESSE SCRIPT DARÁ UM ERRO DE AMBIGUIDADE
SELECT NOME, SEXO, BAIRRO, CIDADE, TIPO, NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON IDCLIENTE = ID_CLIENTE
INNER JOIN TELEFONE
ON IDCLIENTE = ID_CLIENTE;

#CORREÇÃO DO ERRO DE AMBIGUIDADE E MANEIRA DE TRABALHO
#1 forma
SELECT CLIENTE.NOME, CLIENTE.SEXO, 
ENDERECO.BAIRRO, ENDERECO.CIDADE, 
TELEFONE.TIPO, TELEFONE.NUMERO
FROM CLIENTE
INNER JOIN ENDERECO
ON CLIENTE.IDCLIENTE = ENDERECO.ID_CLIENTE
INNER JOIN TELEFONE
ON CLIENTE.IDCLIENTE = TELEFONE.ID_CLIENTE;

#2 forma
SELECT C.NOME, C.SEXO, 
E.BAIRRO, E.CIDADE, 
T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE;

#PROJECAO, JOIN E SELECAO
SELECT C.NOME, C.SEXO, 
E.BAIRRO, E.CIDADE, 
T.TIPO, T.NUMERO
FROM CLIENTE C
INNER JOIN ENDERECO E
ON C.IDCLIENTE = E.ID_CLIENTE
INNER JOIN TELEFONE T
ON C.IDCLIENTE = T.ID_CLIENTE
WHERE SEXO = 'M';