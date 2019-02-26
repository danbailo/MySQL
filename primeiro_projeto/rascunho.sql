/* Modelagem Básica - 
ENTIDADE = TABELA 
CAMPOS = ATRIBUTOS
*/
/*Structured Query Language, ou Linguagem de Consulta Estruturada*/

/*

1 caracter = 1 byte

char - estatico -> char(10) = 10bytes
varchar - variante, dinamico -> varchar(10) = joao = 4bytes

char - n gasta tempo variando, usar quando ter certeza do tamanhado da string
varchar - usar quando nao ter certeza da qtd de caracteres q pode ser inserido, um uso generico

 */

-- CLIENTE

-- NOME - CARACTER(30)
-- CPF - NUMÉRICO(11)
-- EMAIL - CARACTER(30)
-- TELEFONE - CARACTER(30)
-- ENDERECO - CARACTER(100)
-- SEXO - CARACTER(1)

/* PROCESSOS DE MODELAGEM */

/* FASE 01 E FASE 02 - AD ADM DE DADOS */
-- MODELAGEM CONCEITUAL - RASCUNHO
-- MODELAGEM LÓGICA - MODELAGEM

/* FASE 03 - DBA / AD */
-- MODELAGEM FÍSICA - SCRIPTS DE BANCO

/* INICIANDO A MODELAGEM FÍSICA*/

/* CRIANDO O BANCO DE DADOS */ 

CREATE DATABASE PROJETO;

/* CONECTANDO-SE AO BANCO */

USE PROJETO;

/* CRIANDO A TABELA DE CLIENTES */

CREATE TABLE CLIENTE(
    NOME VARCHAR(30),
    SEXO CHAR(1),
    EMAIL VARCHAR(30),
    CPF INT(11),
    TELEFONE VARCHAR(30),
    ENDERECO VARCHAR(100)
);

/* VERIFICANDO AS TABELAS DO BANCO */

SHOW TABLES; #so existe no mysql, ele é um ponteiro pra um select from dic. dados - todo banco tem

/* DESCOBRINDO COMO É A ESTRUTURA DE UMA TABELA */

DESC CLIENTE;

/* sintaxe basica de inserção(qqr banco) - INSERT INTO NOME_TABELA */

/* FORMA 1 - OMITINDO AS COLUNAS */ -- NÃO RECOMENDADO

INSERT INTO CLIENTE VALUES('JOAO','M','JOAO@GMAIL.COM',988638273,'22923110','MAIA LARCERDA - ESTACIO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('CELIA','F','CELIA@GMAIL.COM',541521456,'25078869','RIACHUELO - CENTRO - RIO DE JANEIRO - RJ');
INSERT INTO CLIENTE VALUES('JORGE','M','JORGE@GMAIL.COM',885755896,'58748895','OSCAR CURY - BOM RETIRO - PASSOS DE MINAS - MG');

/* FORMA 2 - COLOCANDO AS COLUNAS */ -- MELHOR MODO

INSERT INTO	CLIENTE(NOME,SEXO,ENDERECO,TELEFONE,CPF) VALUES('LILIAN','F','SENADOR SOARES - TIJUCA - RIO DE JANEIRO - RJ','947785696',887774856);

/* FORMA 3 - INSERT COMPACTO - SOMENTE NO MYSQL */

INSERT INTO CLIENTE VALUES('ANA','F','ANA@GMAIL.COM',85548962,'548556985','PIRES ANTONIO - CENTRO - RIO DE JANEIRO - RJ'),('CARLA','F','CARLA@GMAIL.COM',7745828,'66587458','ITIBERE VIEIRA - ESTACIO - PONTA PORA - MS');

/* O COMANDO SELECT
projecao, selecao e juncao
 */

#PROJECAO - SELECT
#SELECAO - WHERE
#JUNCAO - INTERSESSAO

#SELECT - FAZ PARTE DA PROJECAO; PROJETA NA TELA

SELECT NOW();

SELECT NOW() as DATA_HORA, 'DANIEL BAILO' as ALUNO; #so esta projetando, n quer dizer que criou

/*alias de colunas*/

#projetando dados do banco;
SELECT NOME, SEXO, EMAIL FROM CLIENTE;

#alias para a coluna
SELECT NOME AS CLIENTE, SEXO, EMAIL FROM CLIENTE;

SELECT NOME AS CLIENTE, EMAIL, SEXO, ENDERECO FROM CLIENTE; #query maior/ consula maior

SELECT NOME AS CLIENTE, EMAIL, SEXO, ENDERECO, NOW() AS DATA_HORA FROM CLIENTE; #mesclado com uma projecao nao existente

SELECT NOME FROM CLIENTE WHERE SEXO='M'; #query específica

#ex: SELECT NOME, SOBRENOME FROM USUARIOS WHERE RG=''55.555.555-55''

/* APENAS PARA FINS ACADEMICOS */ #mostra toda a query
SELECT * FROM CLIENTE;
# nao usar pois trafega mais dados na rede, o ideal e mostrar o que o usuario quer, nao todo o banco
#ele mata o indice, faz um full scan
#o indice faz um intervalo

/* FILTRANDO DADOS COM WHERE E LIKE */

SELECT NOME, TELEFONE FROM CLIENTE; 
/* FILTRANDO */

SELECT NOME, SEXO FROM CLIENTE #so projeta os parametros do select, filtrando pelo sexo;
WHERE SEXO = 'M';

SELECT NOME, ENDERECO FROM CLIENTE
WHERE SEXO = 'F';

SELECT NOME FROM CLIENTE
WHERE ENDERECO = 'PONTA PORA'; #empty set - conjunto vazio, logo n tem nenhum dado corresponde a esta query

#logo, banco de dados = teoria dos conjuntos;

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO = 'RJ'; #ira trazer somente os "IGUAIS"
#Empty set, conjunto vazio!

/* UTILIZANDO LIKE - VAI NO LUGAR DO IGUAL, SIGNIFICA "COMO" */

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE 'RJ';

/* CARACTER CORINGA % -> QQR COISA*/

SELECT NOME, SEXO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ'; #significa que ja começa com algo, ou seja, qqr string q venha antes e contenha RJ/termine com RJ

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE 'OSCAR CURY%'; #pegando a partir de um comeco, supondo q eu nao saiba o resto

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '%CENTRO%'; #PEGANDO NO MEIO DE DUAS STRINGS

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE ENDERECO LIKE '____________CENTRO%';#vamos supor q tenha centro, mas contenha 5 caracteres, eu 
#os represento utilizando "underline", pode ser no comeco, fim, meio,etc
#deixa a query mais específica ainda, *intervalo fechado, pegara exatamente a qtd de caracteres, nem mais e nem menos

#LIKE DEGRADA PERFORMANCE, E PREFERIVEL USAR IGUALDADE, POREM AS VEZES E INEVITÁVEL
#AJAX - vai mostrando o conteudo conforme a pessoa vai digitando numa caixa de pesquisa, sem submeter a entrada

/* A11 - OPERADORES LÓGICOS */

/* OR */

SELECT NOME, EMAIL FROM CLIENTE
WHERE
SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE
SEXO = 'M' OR ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE
WHERE
SEXO = 'F' OR ENDERECO LIKE '%PLANALTO%'; #so contem uma verdade

/* AND */

SELECT NOME, EMAIL FROM CLIENTE
WHERE
SEXO = 'M' AND ENDERECO LIKE '%RJ';

SELECT NOME, SEXO, ENDERECO FROM CLIENTE 
WHERE
SEXO = 'F' AND ENDERECO LIKE '%ESTACIO'; #EMPTY

SELECT NOME, SEXO, ENDERECO FROM CLIENTE 
WHERE
SEXO = 'F' AND ENDERECO LIKE '%ESTACIO%'; #TRUE

SELECT NOME FROM CLIENTE
WHERE
SEXO LIKE 'M' AND ENDERECO = '%RJ'; #EMPTY -> o igual precisa ser realmente igual

SELECT NOME FROM CLIENTE
WHERE
SEXO LIKE 'M' AND ENDERECO LIKE '%RJ'; #TRUE

/* COUNT (*), GROUP BY, PERFORMANCE COM OPERADORES LOGICOS */

/* CONTANDO OS REGISTROS DE UMA TABELA */

SELECT COUNT(*) FROM CLIENTE; #retorna a qtd de registro de uma table

SELECT COUNT(*) AS "QUANTIDADE" FROM CLIENTE;

/* OPERADOR GROUP BY */

SELECT SEXO, COUNT(*) AS "QUANTIDADE" #ele conta a qtd de sexo total e depois agrupa por distinção de sexo
FROM CLIENTE
GROUP BY SEXO; #agrupar por

/* PERFORMANCE EM OPERADORES LÓGICOS - AVANÇADO*/

/* 1 MILHÃO DE REGISTROS

PARA CONTAR
SELECT COUNT(*) FROM CLIENTE;

SELECT SEXO, COUNT(*) FROM CLIENTE
GROUP BY SEXO;

SELECT CIDADE, COUNT(*) FROM CLIENTE
GROUP BY CIDADE;

*DADOS DO CLIENTE FILTRANDO PELO SEXO E PELA CIDADE

CONDICAO
SEXO = F
CIDADE = RIO DE JANEIRO

SITUACAO - TRATANDO COM OU/OR
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO - PESSOAS

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE SEXO = 'F'             --- COLOCAR O QUE CONTEM MAIOR PORCENTAGEM NA FRENTE, POIS ASSIM,
OR CIDADE = 'RIO DE JANEIRO'; -- COMO É UM OR, ELE NEM VAI VERIFICAR A SEGUNDA, PQ ELE JA VAI TRAZER
							-- TODAS AS CONDICOES NA PRIMEIRA VERIFICACAO, "PERFORMANCE"

SITUACAO - TRATANDO COM E/AND
70% MULHERES = SEXO = F
30% MORA NO RIO DE JANEIRO - PESSOAS

#nesse caso eu inverto a ordem, pq no and, para ele retornar o valor, as duas clausulas precisam
#ser verdadeiras, logo, se eu tiver uma q e mentira, ele ja nao ira precisar verificar a outra;
#sendo assim, se eu colocar a menor antes, ele nao vai perder tempo verificando a outra e 
# eu ganho performance com isso
SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE CIDADE = 'RIO DE JANEIRO'
AND SEXO = 'F';

REGRA NUMA QUERY ESPECIFICA - INTERVALO
PARA OU - MAIOR PORCENTAGEM NA FRENTE
PARA E - MENOR PORCENTAGEM NA FRENTE

*/

/* FILTRANDO VALORES NULOS - vale p qqr banco */

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL = NULL; #isso esta errado, pois null eu nao sei o q, logo eu n posso igualar algo a null
#aqui ira retornar empty set;

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NULL;
#aqui retorna a query solicitada!

SELECT NOME, SEXO, ENDERECO
FROM CLIENTE
WHERE EMAIL IS NOT NULL; #inverte o valor