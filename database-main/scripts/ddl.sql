CREATE DATABASE memorial;

USE memorial;

CREATE TABLE login (
	usuario VARCHAR(100) NOT NULL,
	senha VARCHAR(100) NOT NULL,
	id INT PRIMARY KEY AUTO_INCREMENT
);

CREATE TABLE aluno (
	id INT PRIMARY KEY AUTO_INCREMENT,
	nome VARCHAR(500) NOT NULL,
	email VARCHAR(200),
	data_nascimento DATE,
	usuarioGitHub VARCHAR(100)
	descricao VARCHAR(2000)
);

CREATE TABLE curso (
	id INT PRIMARY KEY AUTO_INCREMENT,
	total_periodos INT,
	nome VARCHAR(500)
);

CREATE TABLE matricula (
	fk_Aluno_id INT,
	fk_Curso_id INT,
	data DATE,
	PRIMARY KEY (fk_Aluno_id, fk_Curso_id)
);

CREATE TABLE atividade (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(200),
	descricao VARCHAR(500),
	data DATE
);

CREATE TABLE aluno_atividade (
	papel VARCHAR(200),
	fk_Atividade_id INT,
	fk_Aluno_id INT,
	PRIMARY KEY (fk_Atividade_id, fk_Aluno_id)
);

CREATE TABLE professor (
	nome VARCHAR(500),
	id INT PRIMARY KEY AUTO_INCREMENT,
	descricao VARCHAR(500)
);

CREATE TABLE professor_atividade (
	fk_Professor_id INT,
	fk_Atividade_id INT,
	PRIMARY KEY (fk_Professor_id, fk_Atividade_id)
);
