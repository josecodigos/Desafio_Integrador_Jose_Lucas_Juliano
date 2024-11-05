CREATE DATABASE memorial;
USE memorial;

CREATE TABLE pessoas (
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

CREATE TABLE profissao (
	id INT PRIMARY KEY AUTO_INCREMENT,
	cargo VARCHAR(100),
	empresa VARCHAR(100),
	tempo_contrato INT,
	salario FLOAT(10,2)
);

CREATE TABLE pessoas_profissao (
	id INT PRIMARY KEY AUTO_INCREMENT,
    fkpessoapr INT,
	FOREIGN KEY(fkpessoapr) REFERENCES pessoas(id),
    fkprofissao INT,
	FOREIGN KEY(fkprofissao) REFERENCES profissao(id)
);

CREATE TABLE projetos (
	id INT PRIMARY KEY AUTO_INCREMENT,
	titulo VARCHAR(100),
	linguagem VARCHAR(10),
	curso VARCHAR(100),
	disciplina VARCHAR(100),
	data_realizacao DATE,
	arquivo BLOB,
	descricao VARCHAR(1000)
);

CREATE TABLE pessoas_projetos (
	id INT PRIMARY KEY AUTO_INCREMENT,
    papel VARCHAR(50),
    fkpessoa INT,
	FOREIGN KEY(fkpessoa) REFERENCES pessoas(id),
    fkprojeto INT,
	FOREIGN KEY(fkprojeto) REFERENCES projetos(id)
);
SET GLOBAL log_bin_trust_function_creators = 1;

DELIMITER //
CREATE FUNCTION inserirProjetoAluno  (
	titulo VARCHAR(100),
	linguagem VARCHAR(10),
	curso VARCHAR(100),
	disciplina VARCHAR(100),
	data_realizacao DATE,
	arquivo BLOB,
	descricao VARCHAR(1000),
    aluno VARCHAR(100),
    professor VARCHAR(100)
    ) RETURNS BOOLEAN
BEGIN
	DECLARE id_aluno INT;
    DECLARE id_professor INT;
    DECLARE id_projeto INT;
    
    
	SELECT pe.id FROM pessoas pe WHERE pe.nome = aluno INTO id_aluno;
    SELECT pe.id FROM pessoas pe WHERE pe.nome = professor INTO id_professor;
    
    
    INSERT INTO projetos (id, titulo, linguagem, curso, disciplina, data_realizacao, arquivo, descricao)
	VALUES (default, titulo, linguagem, curso, disciplina, data_realização, arquivo, descricao);
    
    SELECT last_insert_id() INTO id_projeto;
    
    
	INSERT INTO pessoas_projetos (id, papel, fkpessoa, fkprojeto)
    VALUES 
    (default, "Aluno", id_aluno, id_projeto),
    (default, "Professor", id_professor, id_projeto);
    
	RETURN TRUE;
END //
DELIMITER ;

CREATE VIEW relatorio_quant_projetos_alunos AS
SELECT nome AS "Alunos", count(*) AS "Quantidade de Projetos" FROM pessoas p
	JOIN pessoas_projetos pp ON p.id = pp.fkpessoa
WHERE pp.papel="Aluno" GROUP BY pp.fkpessoa;


CREATE VIEW relatorio_quant_projetos_linguagem AS
SELECT linguagem as "Linguagem", count(*) as "Quantidade de Projetos" FROM projetos GROUP BY linguagem;  


CREATE VIEW relatorio_quant_alunos_periodo AS
SELECT periodo AS "Período", count(*) as "Quantidade de Alunos" FROM pessoas GROUP BY periodo;  

-- 3 maiores salários
CREATE VIEW relatorio_maiores_salarios AS
SELECT ps.nome, pr.salario FROM profissao pr
	JOIN pessoas_profissao ppr ON ppr.fkprofissao = pr.id
    JOIN pessoas ps ON ppr.fkpessoapr = ps.id
ORDER BY pr.salario DESC LIMIT 3;


-- pessoas que estão trabalhando
CREATE VIEW relatorio_pessoas_trabalhando AS
SELECT nome AS "Nomes" FROM pessoas p
	JOIN pessoas_profissao ppr ON p.id = ppr.fkpessoapr;

-- pessoas que não estão trabalhando
CREATE VIEW relatorio_pessoas_nao_trabalhando AS
SELECT nome as "Nomes" FROM pessoas p
	LEFT JOIN pessoas_profissao ppr ON p.id = ppr.fkpessoapr
WHERE ppr.id IS NULL;

