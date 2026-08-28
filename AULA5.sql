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