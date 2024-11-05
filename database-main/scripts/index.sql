CREATE DATABASE IF NOT EXISTS memorial;
USE memorial;

CREATE TABLE IF NOT EXISTS pessoas (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(100),
	foto64 BLOB,
	curso VARCHAR(100),
	periodo INT,
	email VARCHAR(100),
	data_nasc DATE,
	link_github VARCHAR(100),
	descricao VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS projetos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	linguagem VARCHAR(10),
	curso VARCHAR(100),
	disciplina VARCHAR(100),
	data_realizacao DATE,
	arquivo BLOB,
	descricao VARCHAR(1000)
);

CREATE TABLE IF NOT EXISTS pessoas_projetos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    papel VARCHAR(50),
    fkpessoa INT,
	FOREIGN KEY(fkpessoa) REFERENCES pessoas(id),
    fkprojeto INT,
	FOREIGN KEY(fkprojeto) REFERENCES projetos(id)
);

INSERT INTO pessoas (id, nome, foto64, curso, periodo, email, data_nasc, link_github, descricao)
VALUES
(default, 'João Silva', null, 'Engenharia de Software', 3, 'joao.silva@example.com', '1995-02-15', 'https://github.com/joaosilva', 'Descrição sobre João Silva'),
(default, 'Maria Souza', null, 'Engenharia de Software', 4, 'maria.souza@example.com', '1993-07-20', 'https://github.com/mariasouza', 'Descrição sobre Maria Souza'),
(default, 'José Santos', null, 'Eng. de Software', 2, 'jose.santos@example.com', '1998-10-10', 'https://github.com/josesantos', 'Descrição sobre José Santos'),
(default, 'Ana Oliveira', null, 'Eng. de Software', 3, 'ana.oliveira@example.com', '1996-04-25', 'https://github.com/anaoliveira', 'Descrição sobre Ana Oliveira'),
(default, 'Pedro Rodrigues',null, 'Eng. de Software', 4, 'pedro.rodrigues@example.com', '1994-09-05', 'https://github.com/pedrorodrigues', 'Descrição sobre Pedro Rodrigues'),
(default, 'Mariana Lima', null, 'Eng. de Software', 2, 'mariana.lima@example.com', '1997-12-30', 'https://github.com/marianalima', 'Descrição sobre Mariana Lima'),
(default, 'Carlos Ferreira',null, 'Eng. de Software', 3, 'carlos.ferreira@example.com', '1995-08-12', 'https://github.com/carlosferreira', 'Descrição sobre Carlos Ferreira'),
(default, 'Sofia Vieira',null, 'Eng. de Software', 4, 'sofia.vieira@example.com', '1993-03-18', 'https://github.com/sofiavieira', 'Descrição sobre Sofia Vieira'),
(default, 'Luís Santos',null, 'Eng. de Software', 2, 'luis.santos@example.com', '1998-06-22', 'https://github.com/luissantos', 'Descrição sobre Luís Santos'),
(default, 'Marta Costa',null, 'Eng. de Software', 3, 'marta.costa@example.com', '1996-11-08', 'https://github.com/martacosta', 'Descrição sobre Marta Costa');

INSERT INTO projetos (id, titulo, linguagem, curso, disciplina, data_realizacao, arquivo, descricao)
VALUES
(default, 'Projeto 1', 'Java', 'c1', 'd1', '2023-10-15', LOAD_FILE('/caminho/para/seu/arquivo1.txt'), 'Descrição Projeto 1'),
(default, 'Projeto 2', 'Python', 'c2', 'd2', '2023-11-01', LOAD_FILE('/caminho/para/seu/arquivo2.txt'), 'Descrição Projeto 2'),
(default, 'Projeto 3', 'C++', 'c3', 'd3', '2023-11-15', LOAD_FILE('/caminho/para/seu/arquivo3.txt'), 'Descrição Projeto 3'),
(default, 'Projeto 4', 'Java', 'c1', 'd1', '2023-10-15', LOAD_FILE('/caminho/para/seu/arquivo4.txt'), 'Descrição Projeto 4'),
(default, 'Projeto 5', 'Python', 'c2', 'd2', '2023-11-01', LOAD_FILE('/caminho/para/seu/arquivo5.txt'), 'Descrição Projeto 5'),
(default, 'Projeto 6', 'C++', 'c3', 'd3', '2023-11-15', LOAD_FILE('/caminho/para/seu/arquivo6.txt'), 'Descrição Projeto 6'),
(default, 'Projeto 7', 'Java', 'c1', 'd1', '2023-10-15', LOAD_FILE('/caminho/para/seu/arquivo7.txt'), 'Descrição Projeto 7'),
(default, 'Projeto 8', 'Python', 'c2', 'd2', '2023-11-01', LOAD_FILE('/caminho/para/seu/arquivo8.txt'), 'Descrição Projeto 8'),
(default, 'Projeto 9', 'C++', 'c3', 'd3', '2023-11-15', LOAD_FILE('/caminho/para/seu/arquivo9.txt'), 'Descrição Projeto 9'),
(default, 'Projeto 10', 'Java', 'c1', 'd1', '2023-10-15', LOAD_FILE('/caminho/para/seu/arquivo10.txt'), 'Descrição Projeto 10');

INSERT INTO pessoas_projetos (id, papel, fkpessoa, fkprojeto)
VALUES
(default, 'Aluno', 1, 1),
(default, 'Aluno', 1, 2),
(default, 'Professor', 3, 1),
(default, 'Professor', 4, 2),
(default, 'Aluno', 5, 3),
(default, 'Professor', 6, 3),
(default, 'Aluno', 7, 4),
(default, 'Professor', 8, 4),
(default, 'Aluno', 9, 5),
(default, 'Professor', 10, 5);

CREATE VIEW relatorio_quant_projetos_alunos AS
SELECT nome as "Alunos", count(*) as "Quantidade de Projetos" from pessoas p
	join pessoas_projetos pp on p.id = pp.fkpessoa
where pp.papel="Aluno" group by pp.fkpessoa;

CREATE VIEW relatorio_quant_projetos_linguagem AS
SELECT linguagem as "Linguagem", count(*) as "Quantidade de Projetos" FROM projetos group by linguagem;  

CREATE VIEW relatorio_quant_alunos_periodo AS
SELECT periodo as "Período", count(*) as "Quantidade de Alunos" FROM pessoas group by periodo;  

-- Melhorar consulta de curso por pessoa 
CREATE INDEX idx_pessoas_curso ON pessoas(curso);

-- Melhorar consulta de período
CREATE INDEX idx_pessoas_periodo ON pessoas(periodo);

-- Melhorar na consulta de fkpessoa
CREATE INDEX idx_pessoas_projetos_fkpessoa ON pessoas_projetos(fkpessoa);

-- Melhorar na consulta de fkprojeto
CREATE INDEX idx_pessoas_projetos_fkprojeto ON pessoas_projetos(fkprojeto);

-- Melhorar na consulta múltipla de fkpessoa e papel
CREATE INDEX idx_pessoas_projetos_fkpessoa_papel ON pessoas_projetos(fkpessoa, papel);

-- Melhorar busca pela linguagem
CREATE INDEX idx_projetos_linguagem ON projetos(linguagem);

-- Melhorar busca pelo curso
CREATE INDEX idx_projetos_curso ON projetos(curso);

EXPLAIN SELECT nome as "Alunos", count(*) as "Quantidade de Projetos" from pessoas p
	join pessoas_projetos pp on p.id = pp.fkpessoa
where pp.papel="Aluno" group by pp.fkpessoa;
