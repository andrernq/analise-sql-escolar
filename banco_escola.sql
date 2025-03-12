CREATE DATABASE Banco_Escola;
USE Banco_Escola;


# Criando tabelas

CREATE TABLE Alunos (
    ID_Aluno INT PRIMARY KEY,
    Nome_Aluno VARCHAR(255),
    Data_Nascimento DATE,
    Genero VARCHAR(50),
    Endereco VARCHAR(255),
    Telefone_Contato VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Professores (
    ID_Professor INT PRIMARY KEY,
    Nome_Professor VARCHAR(255),
    Data_Nascimento DATE,
    Genero VARCHAR(50),
    Telefone_Contato VARCHAR(20),
    Email VARCHAR(255)
);

CREATE TABLE Disciplinas (
    ID_Disciplina INT PRIMARY KEY,
    Nome_Disciplina VARCHAR(255),
    Descricao TEXT,
    Carga_Horaria INT,
    ID_Professor INT,
    FOREIGN KEY (ID_Professor) REFERENCES Professores(ID_Professor)
);

CREATE TABLE Turmas (
    ID_Turma INT PRIMARY KEY,
    Nome_Turma VARCHAR(255),
    Ano_Letivo INT,
    ID_Professor_Orientador INT,
    FOREIGN KEY (ID_Professor_Orientador) REFERENCES Professores(ID_Professor)
);

CREATE TABLE Turma_Disciplinas (
    ID_Turma INT,
    ID_Disciplina INT,
    PRIMARY KEY (ID_Turma, ID_Disciplina),
    FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID_Turma),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);

CREATE TABLE Turma_Alunos (
    ID_Turma INT,
    ID_Aluno INT,
    PRIMARY KEY (ID_Turma, ID_Aluno),
    FOREIGN KEY (ID_Turma) REFERENCES Turmas(ID_Turma),
    FOREIGN KEY (ID_Aluno) REFERENCES Alunos(ID_Aluno)
);

CREATE TABLE Notas (
    ID_Nota INT PRIMARY KEY,
    ID_Aluno INT,
    ID_Disciplina INT,
    Nota DECIMAL(5, 2),
    Data_Avaliacao DATE,
    FOREIGN KEY (ID_Aluno) REFERENCES Alunos(ID_Aluno),
    FOREIGN KEY (ID_Disciplina) REFERENCES Disciplinas(ID_Disciplina)
);

# Inserindo dados

INSERT INTO Alunos VALUES 
 ('1','João Silva','2005-03-15','Masculino','Rua das Flores, 123','(11) 9876-5432','joao@email.com'), 
 ('2','Maria Santos','2006-06-20','Feminino','Avenida Principal, 456','(11) 8765-4321','maria@email.com'), 
 ('3','Pedro Soares','2004-01-10','Masculino','Rua Central, 789','(11) 7654-3210','pedro@email.com'), 
 ('4','Ana Lima','2005-04-02','Feminino','Rua da Escola, 56','(11) 8765-4321','ana@email.com'), 
 ('5','Mariana Fernandes','2005-08-12','Feminino','Avenida da Paz, 789','(11) 5678-1234','mariana@email.com'), 
 ('6','Lucas Costa','2003-11-25','Masculino','Rua Principal, 456','(11) 1234-5678','lucas@email.com'), 
 ('7','Isabela Santos','2006-09-10','Feminino','Rua da Amizade, 789','(11) 9876-5432','isabela@email.com'), 
 ('8','Gustavo Pereira','2004-05-15','Masculino','Avenida dos Sonhos, 123','(11) 7654-3210','gustavo@email.com'), 
 ('9','Carolina Oliveira','2005-02-20','Feminino','Rua da Alegria, 456','(11) 8765-4321','carolina@email.com'), 
 ('10','Daniel Silva','2003-10-05','Masculino','Avenida Central, 789','(11) 1234-5678','daniel@email.com'), 
 ('11','Larissa Souza','2004-12-08','Feminino','Rua da Felicidade, 123','(11) 9876-5432','larissa@email.com'), 
 ('12','Bruno Costa','2005-07-30','Masculino','Avenida Principal, 456','(11) 7654-3210','bruno@email.com'), 
 ('13','Camila Rodrigues','2006-03-22','Feminino','Rua das Estrelas, 789','(11) 8765-4321','camila@email.com'), 
 ('14','Rafael Fernandes','2004-11-18','Masculino','Avenida dos Sonhos, 123','(11) 1234-5678','rafael@email.com'), 
 ('15','Letícia Oliveira','2005-01-05','Feminino','Rua da Alegria, 456','(11) 9876-5432','leticia@email.com'), 
 ('16','Fernanda Lima','2004-02-12','Feminino','Rua da Esperança, 789','(11) 4567-8901','fernanda@email.com'), 
 ('17','Vinícius Santos','2003-07-28','Masculino','Avenida da Amizade, 123','(11) 8901-2345','vinicius@email.com'), 
 ('18','Juliana Pereira','2006-09-01','Feminino','Rua das Rosas, 789','(11) 3456-7890','juliana@email.com');
 
INSERT INTO Professores VALUES 
 ('1','Ana Oliveira','1980-05-25','Feminino','(11) 1234-5678','ana@email.com'), 
 ('2','Carlos Ferreira','1975-09-12','Masculino','(11) 2345-6789','carlos@email.com'), 
 ('3','Mariana Santos','1982-03-15','Feminino','(11) 3456-7890','mariana@email.com'), 
 ('4','Ricardo Silva','1978-08-20','Masculino','(11) 7890-1234','ricardo@email.com'), 
 ('5','Fernanda Lima','1985-01-30','Feminino','(11) 4567-8901','fernanda@email.com');
 
INSERT INTO Disciplinas VALUES 
 ('1','Matemática','Estudo de conceitos matemáticos avançados','60','1'), 
 ('2','História','História mundial e local','45','2'), 
 ('3','Física','Princípios fundamentais da física','60','1'), 
 ('4','Química','Estudo da química e suas aplicações','45','3'), 
 ('5','Inglês','Aulas de inglês para iniciantes','45','4'), 
 ('6','Artes','Exploração da criatividade artística','30','5');
 
INSERT INTO Turmas VALUES 
 ('1','Turma A','2023','1'), 
 ('2','Turma B','2023','2'), 
 ('3','Turma C','2023','3'), 
 ('4','Turma D','2023','4'), 
 ('5','Turma E','2023','5');
 
INSERT INTO Turma_Disciplinas VALUES 
 ('1','1'), 
 ('2','2'), 
 ('3','3'), 
 ('4','4'), 
 ('5','5'), 
 ('1','3'), 
 ('2','1'), 
 ('3','2');
 
INSERT INTO Turma_Alunos VALUES 
 ('1','1'), 
 ('2','2'), 
 ('3','3'), 
 ('4','4'), 
 ('5','5'), 
 ('1','6'), 
 ('2','7'), 
 ('3','8'), 
 ('4','9'), 
 ('5','10');

INSERT INTO Notas VALUES 
 (2,1,1,6.19,'2024-07-07'),
 (3,1,2,7.18,'2024-07-07'),
 (4,1,3,7.47,'2024-07-07'),
 (5,1,4,7.46,'2024-07-07'),
 (6,1,5,4.35,'2024-07-07'),
 (7,1,6,4.43,'2024-07-07'),
 (8,1,7,0.76,'2024-07-07'),
 (9,1,8,9.22,'2024-07-07'),
 (10,1,9,9.04,'2024-07-07'),
 (11,1,10,3.28,'2024-07-07'),
 (12,2,1,1.34,'2024-07-09'),
 (13,2,2,3.1,'2024-07-09'),
 (14,2,3,1.66,'2024-07-09'),
 (15,2,4,0.03,'2024-07-09'),
 (16,2,5,4.34,'2024-07-09'),
 (17,2,6,4.02,'2024-07-09'),
 (18,2,7,8.79,'2024-07-09'),
 (19,2,8,1.17,'2024-07-09'),
 (20,2,9,8.26,'2024-07-09'),
 (21,2,10,3.41,'2024-07-09'),
 (22,3,1,6.82,'2024-07-27'),
 (23,3,2,8.21,'2024-07-27'),
 (24,3,3,1.3,'2024-07-27'),
 (25,3,4,4.01,'2024-07-27'),
 (26,3,5,0.25,'2024-07-27'),
 (27,3,6,6.63,'2024-07-27'),
 (28,3,7,9.74,'2024-07-27'),
 (29,3,8,3.77,'2024-07-27'),
 (30,3,9,0.58,'2024-07-27'),
 (31,3,10,8.52,'2024-07-27'),
 (32,4,1,8.37,'2024-08-08'),
 (33,4,2,0.26,'2024-08-08'),
 (34,4,3,5.95,'2024-08-08'),
 (35,4,4,6.98,'2024-08-08'),
 (36,4,5,6.18,'2024-08-08'),
 (37,4,6,4.79,'2024-08-08'),
 (38,4,7,7.96,'2024-08-08'),
 (39,4,8,0.62,'2024-08-08'),
 (40,4,9,7.77,'2024-08-08'),
 (41,4,10,5.81,'2024-08-08'),
 (42,5,1,2.25,'2024-08-15'),
 (43,5,2,5.82,'2024-08-15'),
 (44,5,3,4.11,'2024-08-15'),
 (45,5,4,7.99,'2024-08-15'),
 (46,5,5,3.23,'2024-08-15'),
 (47,5,6,8.09,'2024-08-15'),
 (48,5,7,8.24,'2024-08-15'),
 (49,5,8,3.33,'2024-08-15'),
 (50,5,9,4.24,'2024-08-15'),
 (51,5,10,0.11,'2024-08-15');

# Retornando as informações de todos os alunos ordenados pelo nome

SELECT * FROM Alunos ORDER BY nome_aluno;

# Retornando as disciplinas com carga horária maior que 40

SELECT * FROM Disciplinas WHERE carga_horaria > 40;

# Buscando notas maiores que 6 e menores que 8

SELECT * FROM Notas WHERE nota > 6 AND nota < 8;

# Retornando a média dos alunos em História

SELECT AVG(nota) AS Média_História FROM Notas
WHERE id_disciplina = 2;

# Retornando as informações dos alunos cujo nome começa com "A"

SELECT * FROM Alunos
WHERE Nome_Aluno LIKE 'A%';

# Buscando apenas os alunos que fazem aniversário em fevereiro

SELECT * FROM Alunos
WHERE MONTH(Data_Nascimento) = 02;

# Calculando quantos anos o aluno completou ou completará no ano atual

SELECT nome_aluno, 
       data_nascimento,
       TIMESTAMPDIFF(YEAR, data_nascimento, CURDATE()) AS idade_2025
FROM Alunos;

# Retornando as disciplinas que o aluno João Silva foi aprovado ou não (nota maior ou igual a 6)

SELECT ID_Aluno As aluno, nota, id_disciplina,
CASE WHEN nota >= 6 THEN 'Aprovado' 
ELSE 'Reprovado' END 
AS Situação_final
FROM Notas
WHERE ID_Aluno = 1;

# Buscando o nome do professor e a turma que ele é orientador

SELECT p.Nome_Professor, t.Nome_Turma
FROM Professores p
JOIN Turmas t
ON p.ID_Professor = t.ID_Professor_Orientador;

# Retornando o nome e a nota do aluno que possui a melhor nota na disciplina de Matemática

SELECT a.Nome_Aluno, n.Nota as Maior_nota_matemática
FROM Alunos a
JOIN Notas n ON a.ID_Aluno = n.ID_Aluno
JOIN Disciplinas d ON n.ID_Disciplina = d.ID_Disciplina
WHERE d.ID_Disciplina = 1
ORDER BY n.Nota DESC LIMIT 1;

# Identificando o total de alunos por turma

SELECT t.Nome_Turma, COUNT(ta.ID_Turma) AS Qtd_alunos
FROM Turmas t
JOIN Turma_Alunos ta ON t.ID_Turma = ta.ID_Turma
GROUP BY t.Nome_Turma;

# Listando os alunos e as disciplinas que estão matriculados

SELECT a.Nome_Aluno, d.Nome_Disciplina
FROM Alunos a 
JOIN Turma_Alunos ta ON a.ID_Aluno = ta.ID_Aluno
JOIN Turma_Disciplinas td ON ta.ID_Turma = td.ID_Turma
JOIN Disciplinas D ON td.ID_Disciplina = d.ID_Disciplina;

# Criando uma View que apresenta nome, disciplina e nota dos alunos

CREATE VIEW AlunosDisciplinaNota AS
SELECT Nome_Aluno, Nome_Disciplina, Nota
FROM Alunos a
JOIN Notas n ON a.ID_Aluno = n.ID_Aluno
JOIN Disciplinas d ON n.ID_Disciplina = d.ID_Disciplina;

SELECT * FROM AlunosDisciplinaNota;

# Retornando todas as disciplinas

SELECT * FROM Disciplinas;

# Retornando os alunos aprovados em Matemática

SELECT a.Nome_Aluno, n.Nota
FROM Alunos a
JOIN Notas n ON a.ID_Aluno = n.ID_Aluno
WHERE n.ID_Disciplina = 1 
AND n.Nota >= 6;

# Identificando o total de disciplinas por turma

SELECT t.Nome_Turma AS Turma, COUNT(td.ID_Disciplina) AS Total_Disciplinas
FROM Turma_Disciplinas td
JOIN Turmas t ON td.ID_Turma = t.ID_Turma
GROUP BY t.ID_Turma;

# Verificando a porcentagem dos alunos aprovados 

SELECT (SELECT COUNT(*) FROM Alunos) AS Qtd_Alunos,
	 COUNT(CASE WHEN n.Nota >= 6.0 THEN 1 END) AS Notas_Aprovados,
	 COUNT(*) AS Notas_Total,
	 CONCAT(ROUND(100.0 * COUNT(CASE WHEN n.Nota >= 6.0 THEN 1 END) / COUNT(*), 2), '%') AS Porcentagem_Aprovações
FROM Notas n;

# Verificando a porcentagem dos alunos aprovados por disciplina

SELECT d.Nome_Disciplina AS Disciplina, 
       COUNT(*) AS Total_Alunos, 
       SUM(CASE WHEN n.Nota >= 6.0 THEN 1 ELSE 0 END) AS Alunos_Aprovados,
       CONCAT(ROUND(SUM(CASE WHEN n.Nota >= 6.0 THEN 1 ELSE 0 END) * 100.0 / COUNT(*), 2), '%') AS Porcentagem_Aprovados
FROM Alunos a 
JOIN Notas n ON a.ID_Aluno = n.ID_Aluno
JOIN Disciplinas d ON n.ID_Disciplina = d.ID_Disciplina
GROUP BY d.Nome_Disciplina;
