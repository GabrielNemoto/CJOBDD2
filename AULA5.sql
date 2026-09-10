--------------------------------------------------------------------------------
-- Arquivo: AULA5.sql                                                          |
-- Altera a tabela FUNCIONARIOS                                                |
-- Demonstra o uso de comandos de manipulação de dados                         |
-- Demonstra o uso de VIEWS                                                    |
-- Autor: Gabriel Nemoto Gonçalves                                             |
--------------------------------------------------------------------------------

-- Habilita o contexto.
USE CJ3037762;
GO

-- Exibe o nome das tabelas do banco de dados em uso.
SELECT create_date AS 'Data de criação',
       name        AS 'Nome da tabela'
FROM sys.tables;
GO

SELECT * FROM FUNCIONARIOS;
GO

-- Adiciona o campo Telefone, na tabela FUNCIONARIOS.
ALTER TABLE FUNCIONARIOS
    ADD Telefone CHAR(10);
GO


-- Exibe informações da estrutura da tabela FUNCIONARIOS.
SELECT TABLE_CATALOG     AS 'Banco de dados',
       TABLE_NAME        AS 'Tabela',
       ORDINAL_POSITION  AS 'Posição',
       COLUMN_NAME       AS 'Coluna',
       DATA_TYPE         AS "Tipo de dados",
       COLLATION_NAME    AS 'Idioma da coluna',
       IS_NULLABLE       AS 'Aceita Nulo?'
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'FUNCIONARIOS';
GO

-- Atualiza o telefone da funcionária MARIA DA SILVA.
UPDATE FUNCIONARIOS
    SET Telefone = '99999-9999'
    WHERE ID = 1;
GO

-- Atualiza o telefone dos funcionários a qual o ID o pertence com o WHERE.  
    UPDATE FUNCIONARIOS SET Telefone = '99999-1111' WHERE ID = 1;
    UPDATE FUNCIONARIOS SET Telefone = '99999-2222' WHERE ID = 2;
    UPDATE FUNCIONARIOS SET Telefone = '99999-4444' WHERE ID = 4;
    UPDATE FUNCIONARIOS SET Telefone = '99999-5555' WHERE ID = 5;
    UPDATE FUNCIONARIOS SET Telefone = '99999-7777' WHERE ID = 7;
    UPDATE FUNCIONARIOS SET Telefone = '99999-9999' WHERE ID = 9;
    UPDATE FUNCIONARIOS SET Telefone = '99999-1010' WHERE ID = 10;
GO

-----------------------------------------------------------------------------
    UPDATE FUNCIONARIOS SET Nome = 'Gabriel' WHERE ID = 4; GO              --
                                                                           --
    UPDATE FUNCIONARIOS SET Nome = 'Ronaldo Gaucho' WHERE ID = 10; GO      --
                                                                           --
    UPDATE FUNCIONARIOS SET Admissao = '2015-02-12' WHERE ID = 4; GO       --
-----------------------------------------------------------------------------


-- Concede um aumento de 10% para os funcionarios que foram admitidos antes de 2016.
UPDATE FUNCIONARIOS
    SET Salario = Salario * 1.10
    WHERE YEAR(Admissao) < 2016;
GO


SELECT * FROM FuncionariosCOPIA;
GO


-- Deleta todos funcionarios com salario a baixo de R$ 1500,00.
DELETE FROM FuncionariosCOPIA
WHERE Salario < 1500;
GO


-- Utiliza o comando TRUNCATE para remover todos os registros da tabela FuncionariosCOPIA.
-- (TRUNCATE apaga todos os dados da tabela de uma vez, NÃO FUNCIOA O WHERE).
TRUNCATE TABLE FuncionariosCOPIA; 
GO

-- Exclui a tabela FuncionariosCOPIA.
-- Só pode ser excluida caso não haja uma chave estrangeira!
DROP TABLE FuncionariosCOPIA;
GO 


-------------------------------------------------------------------------------------
-- Outros operadores: lógicos, comparação, NOT, BETWEEN, IS NULL, EXISTS, IN e LIKE |
-------------------------------------------------------------------------------------

-- Utiliza o operador de comparação <>, para exibir os dados dos funcionarios cujo sexo seja diferente de 'M'.
SELECT * FROM FUNCIONARIOS
WHERE Sexo <> 'M';
GO


SELECT * FROM FUNCIONARIOS
WHERE Sexo != 'M';
GO

-- utiliza os operadores >=, AND e <= para exibir os registros dos funcionarios cujo salário esteja entre 1000 e 1800 reais
SELECT * FROM FUNCIONARIOS
WHERE Salario >= 1000 AND
      Salario <= 1100;
GO

-- Uso do operador BETWEEN
SELECT * FROM FUNCIONARIOS
WHERE Salario BETWEEN 1000 AND 1100;
GO

-- Operador IS NULL, exibe campos nulls
SELECT * FROM FUNCIONARIOS
WHERE Telefone IS NULL;
GO

-- Opedador EXISTS, para verificar se existe algum funcinário que recebe acima de R$ 2000
IF EXISTS (
    SELECT * FROM FUNCIONARIOS
    WHERE Salario > 2000
)
    PRINT 'Alguém recebe acima de R$ 2000,00';
ELSE
    PRINT 'Ninguém recebe acima de R$ 2000,00';
GO

-- Operador IN, Utiliza o operador OR, para exibir os registros dos funcionarios cujo ID seja 1 ou 2 ou 5.
SELECT * FROM FUNCIONARIOS
WHERE ID = 1 OR
      ID = 2 OR
      ID = 5;
GO

-- Operador IN
SELECT * FROM FUNCIONARIOS
WHERE ID IN (1,2,5);
GO

-- Utiliza uma subconsulta, para retornar os valores da cláusula IN.
SELECT * FROM FUNCIONARIOS
WHERE Salario IN (
    SELECT Salario
    FROM FUNCIONARIOS
    WHERE Salario > 2000.00
);
GO

-- Operador LIKE, Exibe os registros de todos os funcionarios cujo nome comece com a letra M
SELECT * FROM FUNCIONARIOS
WHERE UPPER(Nome) LIKE '%Gaucho'
ORDER BY Nome;
GO

-- Operador LIKE, Exibe os registros de todos os funcionarios cujo nome nao comece com a letra 'M'. Ordena o resultado de acordo com o nome
SELECT * FROM FUNCIONARIOS
WHERE Nome LIKE '[^M]%'
ORDER BY Nome;
GO

-- Criando uma VIEW, Cria uma view que exibe algumas informações dos funcionarios, utilizando aliases para algumas colunas
CREATE VIEW MaioresSalarios AS
    SELECT ID AS 'Código do Funcionario',
           Nome,
           Sexo,
           Salario AS 'Salário'
    FROM FUNCIONARIOS;
GO

-- Exemplos de utlização da VIEW MaioresSalarios
SELECT * FROM MaioresSalarios
GO

SELECT [Código do Funcionario],
       Nome,
       Salário
FROM MaioresSalarios;
GO

-- Alterando uma VIEW, Exemplo de atualização da view MaioresSalarios
ALTER VIEW MaioresSalarios AS
    SELECT ID AS 'Código do Funcionario',
           Nome,
           Sexo AS 'Sexo do Funcionario',
           Salario AS 'Salário'
    FROM FUNCIONARIOS
    ORDER BY Salario DESC
    OFFSET 0 ROWS;
GO

-- Utilizando uma VIEW, Exemplo de utilização da VIEW MaioresSalarios
-- Exibe somente os registros cujo o salario esteja acima de R$ 1500,00
SELECT [Código do funcionario],
       Nome,
       "Sexo do Funcionario",
       Salário
FROM MaioresSalarios
WHERE Salário > 1500;
GO

-- Exibindo informacoes sobre as VIEWS
EXEC sp_helptext MaioresSalarios;
GO

SELECT TABLE_NAME      AS 'Nome da View',
       VIEW_DEFINITION AS 'Código SQL'
FROM INFORMATION_SCHEMA.Views;
GO

-- Exclui a view MaioresSalarios
DROP VIEW MaioresSalarios
GO