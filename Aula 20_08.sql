CREATE DATABASE [CJ3037762];

GO



USE CJ3037762;

GO





CREATE TABLE FUNCIONARIOS (

	ID       INT            PRIMARY KEY,

	Nome     VARCHAR (25)   NOT NULL,

	Sexo     CHAR (1)       NULL,

	Admissao DATE           NOT NULL,

	Salario  DECIMAL (10,2) NOT NULL

	);

GO



SELECT name

FROM sys.tables;

GO



--CONFIGURA O FORMATO DA DATA

SET DATEFORMAT DMY;

GO



--INSERE VALORES NA TABELA



INSERT INTO FUNCIONARIOS (

ID,

Nome,

Sexo,

Admissao,

Salario)

VALUES (1, 'Matheus', 'M', '11/08/2025', 2000.00);

GO



INSERT INTO FUNCIONARIOS 

VALUES (2, 'Carlos', 'M', '20/02/2024', 3000.00);

GO



INSERT INTO FUNCIONARIOS 

VALUES (3, 'Joao', 'M', '30/07/2024', 1000.00);

GO



INSERT INTO FUNCIONARIOS 

VALUES (4, 'GABRIEL', 'M', '10/07/2022', 1500.00);

GO



--INSERIR VARIOS DADOS DE UMA VEZ



INSERT INTO FUNCIONARIOS VALUES

(5, 'Pedrinho', 'M', '10/07/2022', 1200.00),

(6, 'Danilo', 'M', '10/07/2022', 1100.00),

(7, 'Zézinho', 'F', '10/07/2022', 1300.00),

(8, 'Jaozinho', 'F', '10/07/2022', 1200.00);




--EXIBE O CONTEUDO DA TABELA



SELECT * FROM FUNCIONARIOS

GO



--EXIBE O CONTEUDO COM NOME DE COLIUNA FORMATADO

SELECT ID AS 'Codigo do Funcionario',

	Nome,

	Sexo,

	Salario AS 'Salário'

FROM FUNCIONARIOS;





--UTILIZADO PARA EXIBIR OS 3 PRIMEIROS REGISTROS

SELECT TOP 3 * FROM FUNCIONARIOS;



--EXIBE TODAS AS INFORMAÇOES DOS FUNCIONARIOS

--DO SEXO MASCULINO QUE RECEBAM MAIS DE 1200

SELECT * FROM FUNCIONARIOS

	WHERE Sexo = 'M' AND

	Salario > 1200;



--EXIBE TODOS OS FUNCIONARIOS ORDENANDO 

--EM ORDEM ALFABETICA (A-Z)

SELECT * FROM FUNCIONARIOS

ORDER BY Nome;



SELECT * FROM FUNCIONARIOS

ORDER BY Nome ASC;



--ORDEM DECRESCENTE

SELECT * FROM FUNCIONARIOS

ORDER BY Nome DESC;



INSERT INTO FUNCIONARIOS VALUES

	(9, 'Jubileu', 'M', '10/07/2022', 1200.00),

	(10, 'Jubileu', 'M', '10/07/2022', 1100.00);



--SELECIONA O REGISTRO DE TODOS OS FUNCIONARIOS

--ORDENA EM ORDEM ALFABETICA

--SEGUIDO PELOS REGISTROS DOS FUNCIONARIOS QUEM TEM O MAIOR SALARIO

--EXIBE SOMENTE DOS FUNCIONARIOS CUJO SALARIO SEJA MENOR QUE 3000

SELECT * FROM FUNCIONARIOS

WHERE Salario < 3000

ORDER BY Nome,

		 Salario DESC;







----------------------------------------------------------------------



CREATE TABLE TESTE (

	ID INT,

	Nome CHAR(10)

);	

	

--ALTERA O TIPO DE DADO OU O NUMERO DE CARACTERES DA COLUNA

ALTER TABLE TESTE

	ALTER COLUMN Nome CHAR(50);



--ADICIONA UMA NOVA COLUNA CHAMADA SEXO DO TIPO CHAR

ALTER TABLE TESTE

	ADD Sexo CHAR(1) NULL;



ALTER TABLE TESTE

	ADD DataNascimento DATE,

		Peso DECIMAL (5,2);



SELECT * FROM TESTE;



--MOSTRAR INFORMAÇÕES SOBRE A ESTRUTURA TABELA NO SQLSERVER

EXEC sp_columns TESTE;



--MOSTRAR INFORMAÇÕES SOBRE A ESTRUTURA DA TABELA EM OUTRAS SGBD

SELECT * FROM INFORMATION_SCHEMA.COLUMNS

WHERE TABLE_NAME = 'TESTE';



--EXIBE INFORMAÇÕES ESPECIFICAS SOBRE A ESTRUTURA DA TABELA

SELECT  TABLE_CATALOG 	  AS 'Banco de Dados',

		TABLE_NAME 		  AS 'Tabela',

		ORDINAL_POSITION  AS 'Posição',

		COLUMN_NAME 	  AS 'Coluna',

		DATA_TYPE 	 	  AS 'Tipo de Dado',

		COLLATION_NAME    AS 'Idioma da Coluna',

		IS_NULLABLE       AS 'Aceita Nulo?'

FROM INFORMATION_SCHEMA.COLUMNS

WHERE TABLE_NAME = 'TESTE';





--EXCLUI A COLUNA DATA DE NASCIMENTO

ALTER TABLE TESTE

	DROP COLUMN DataNascimento;



--ADICIONA UMA RESTRIÇÃO NAO NOMEADA DO TIPO UNICO

ALTER TABLE TESTE

	ADD UNIQUE (Sexo);



--COLUNA ID NAO PODE SER NULA

ALTER TABLE TESTE

	ALTER COLUMN ID INT NOT NULL;



--ADICIONA UMA RESTRIÇÃO NOMEADA, DO TIPO CHAVE PRIMARIA

ALTER TABLE TESTE

	ADD CONSTRAINT pk_id PRIMARY KEY (ID);



--MOSTRA INFORMAÇÕES DE CONSTRAINT (RESTRIÇÕES) EM SQLSERVER

EXEC sp_helpconstraint TESTE;



--MOSTRA INFORMAÇÕES DE CONSTRAINT (RESTRIÇÕES) EM OUTROS SGBD E ALTERA O NOME DAS COLUNAS NA EXIBIÇÃO

SELECT  CONSTRAINT_CATALOG AS 'Banco de Dados',

		TABLE_NAME 		   AS 'Tabela',

		CONSTRAINT_TYPE    AS 'Tipo de Restrição',

		CONSTRAINT_NAME    AS 'Nome da Restrição'

FROM  INFORMATION_SCHEMA.TABLE_CONSTRAINTS

WHERE TABLE_NAME = 'TESTE';

 

--REMOVER UMA RESTRIÇÃO ESPECIFICA

ALTER TABLE TESTE

	DROP CONSTRAINT pk_id;



--EXCLUI A TABELA TESTE

DROP TABLE TESTE;



--TENTA ABRIR A TABELA QUE NÃO EXISTE MAIS

SELECT * FROM TESTE;



EXEC sp_help 'FUNCIONARIOS';

-- =============================== AULA 27/08/2026 ==========================================================

-- Cria a tabela CLIENTES
CREATE TABLE CLIENTES (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sexo CHAR(1) NULL,
    Idade INT CHECK (Idade > 18) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR(200) DEFAULT 'meu@emial.com'
NOT NULL
);
GO


EXEC sp_help 'CLIENTES';
GO


EXEC sp_help 'FUNCIONARIOS';
GO

----------------------------
--TABELA TEMPORARIA LOCAL---
----------------------------

CREATE TABLE #TabelaA (
    ID INT NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Sexo CHAR (1) NULL,
    PRIMARY KEY (ID)
);
GO

-- Insere alguns valores na tabela temporária local

INSERT INTO #TabelaA VALUES
    (1, 'Marcelo Augusto', 'M'),
    (2, 'Maria Cristina', 'F');
GO

-- Exibe os registros armazenados na tabela local
SELECT * FROM #TabelaA;
GO


---------------------------------
--- TABELA TEMPORARIA  GLOBAL ---
---------------------------------

--Cria a tabela GLOBAL por usar '##'
CREATE TABLE ##TabelaB (
    ID INT NOT NULL,
    Nome VARCHAR(25) NOT NULL,
    Sexo CHAR (1) NULL,
    PRIMARY KEY (ID)
);
GO

-- Insere alguns valores na tabela temporária GLOBAL
INSERT INTO ##TabelaB VALUES
    (1, 'Marcelo Augusto', 'M'),
    (2, 'Maria Cristina', 'F');
GO

-- Insere os registros na tabela GLOBAL
INSERT INTO ##TabelaB VALUES
    (3, 'Teste supremo', 'M');
GO

-- Exibe os registros armazenados na tabela GLOBAL
SELECT * FROM ##TabelaB;
GO



---------------------------------|
------- COPIANDO TABELAS --------|
---------------------------------|

-- Exibe o nome das tabelas do banco de dados em uso
SELECT name
FROM sys.tables;
GO

-- Copia algumas colunas de alguns registros armazenados na tabela FUNCIONARIOS, para dentro da tabela temporária local
INSERT INTO #TabelaA
    SELECT  ID,
            Nome,
            Sexo
    FROM FUNCIONARIOS
    WHERE ID > 2;
GO

--MOSTRA INFORMAÇÕES DE CONSTRAINT (RESTRIÇÕES) EM OUTROS SGBD E ALTERA O NOME DAS COLUNAS NA EXIBIÇÃO

SELECT  CONSTRAINT_CATALOG AS 'Banco de Dados',
		TABLE_NAME 		   AS 'Tabela',
		CONSTRAINT_TYPE    AS 'Tipo de Restrição',
		CONSTRAINT_NAME    AS 'Nome da Restrição'

FROM  tempdb.INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME LIKE '#TabelaA%';
GO


--Cria uma nova tabela, utilizando como base os dados e a estrutura da tabela FUNCIONARIOS.
--Será criado a tabela FuncionariosCOPIA.
SELECT *
    INTO FuncionariosCOPIA
FROM FUNCIONARIOS;
GO

SELECT * FROM FuncionariosCOPIA;
GO


--Exibe informações específicas sobre a estrutura da tabela
SELECT  TABLE_CATALOG 	  AS 'Banco de Dados',
		TABLE_NAME 		  AS 'Tabela',
		ORDINAL_POSITION  AS 'Posição',
		COLUMN_NAME 	  AS 'Coluna',
		DATA_TYPE 	 	  AS 'Tipo de Dado',
		COLLATION_NAME    AS 'Idioma da Coluna',
		IS_NULLABLE       AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FuncionariosCOPIA';
GO


--Exibe informacações sobre as restrições da tabela
SELECT  CONSTRAINT_CATALOG AS 'Banco de Dados',
		TABLE_NAME 		   AS 'Tabela',
		CONSTRAINT_TYPE    AS 'Tipo de Restrição',
		CONSTRAINT_NAME    AS 'Nome da Restrição'

FROM  INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME IN ('FUNCIONARIOS', 'FuncionariosCOPIA');
GO

--Adiciona uma restrição nomeada, do time chave primária, na coluna ID.
ALTER TABLE FuncionariosCOPIA
    ADD CONSTRAINT pk_id PRIMARY KEY (ID);
GO

SELECT  CONSTRAINT_CATALOG AS 'Banco de Dados',
		TABLE_NAME 		   AS 'Tabela',
		CONSTRAINT_TYPE    AS 'Tipo de Restrição',
		CONSTRAINT_NAME    AS 'Nome da Restrição'

FROM  INFORMATION_SCHEMA.TABLE_CONSTRAINTS
WHERE TABLE_NAME IN ('FUNCIONARIOS', 'FuncionariosCOPIA');
GO

--Exibe a data de criação e o nome das tabelas existentes no banco de dados em uso no momento
SELECT create_date AS 'Data de criação',
       name        AS 'Nome da Tabela'
FROM sys.tables;
GO
