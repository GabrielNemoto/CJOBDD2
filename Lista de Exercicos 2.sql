-------------------------------------------
---------|  Lista de exercicios  |--------- 
-------------------------------------------

CREATE DATABASE LojaIFSP3037762;
GO

CREATE TABLE CLIENTESEX (
    ID INT PRIMARY KEY,
    Nome VARCHAR(50) NOT NULL,
    Sexo CHAR(1) NOT NULL,
    Idade INT CHECK (Idade > 18) NOT NULL,
    CPF CHAR(11) UNIQUE NOT NULL,
    Email VARCHAR (200) DEFAULT 'meu@email.com' NOT NULL
);
GO

INSERT INTO CLIENTESEX VALUES
    (1, 'Ana Cristina', 'F', 20, '111111111', 'ana@gmail.com'),
    (2, 'Marcos Paulo', 'M', 44, '222222222', 'marcos@gmail.com'),
    (3, 'André Luis', 'M', 22, '333333333', 'maria@gmail.com'),
    (4, 'Maria Clara', 'F', 20, '44444444', 'ana@gmail.com'),
    (5, 'Pedro Augusto', 'M', 23, '55555555', 'pedro@gmail.com'),
    (6, 'Ricaro Lima', 'M', 35, '66666666', 'ricardo@gmail.com'),
    (7, 'José Pereira', 'M', 50, '7777777', 'jose@gmail.com'),
    (8, 'Marcelo Souza', 'M', 41, '8888888', 'marcelo@gmail.com'),
    (9, 'Daphne Lima', 'F', 30, '9999999', 'daphne@gmail.com'),
    (10, 'Sheila Pereira', 'F', 19, '10100101', 'sheila@gmail.com'),
    (11, 'Tiago Augusto', 'M', 19, '11011011', 'tiago@gmail.com'),
    (12, 'Maria Pereira', 'F', 60, '12121212', 'ana@email.com');
GO

-- 1
SELECT * FROM CLIENTESEX;
GO

-- 2
SELECT * FROM CLIENTESEX
ORDER BY Nome;
GO

-- 3
SELECT * FROM CLIENTESEX
ORDER BY Idade;
GO

-- 4
SELECT * FROM CLIENTESEX
ORDER BY Idade DESC;
GO

-- 5
SELECT * FROM CLIENTESEX
ORDER BY Sexo DESC, Idade;
GO

-- 6
SELECT Nome,
       Idade,
       Email 
FROM CLIENTESEX;
GO

-- 7
SELECT Nome,
       Idade,
       Email 
FROM CLIENTESEX
ORDER BY Nome;
GO

-- 8
SELECT ID AS 'Código do Cliente',
       Nome,
       Idade,
       Email 
FROM CLIENTESEX
WHERE ID >= 10
ORDER BY Nome;
GO

-- 9
SELECT TOP 5
       ID AS 'Código do Cliente',
       Nome,
       Idade,
       Email 
FROM CLIENTESEX
ORDER BY Nome;
GO

-- 10
SELECT ID    AS 'Código do Cliente',
       Nome,
       Sexo,
       Idade,
       Email AS 'E-mail'
FROM CLIENTESEX
WHERE Idade > 30 AND Sexo = 'M'
ORDER BY Nome;
GO