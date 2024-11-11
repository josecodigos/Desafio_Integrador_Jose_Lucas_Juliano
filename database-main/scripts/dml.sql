ALTER TABLE matricula ADD CONSTRAINT fk_Matricula_1
	FOREIGN KEY (fk_Aluno_id)
	REFERENCES aluno (id)
	ON DELETE RESTRICT;
 
ALTER TABLE matricula ADD CONSTRAINT fk_Matricula_2
	FOREIGN KEY (fk_Curso_id)
	REFERENCES curso (id)
	ON DELETE RESTRICT;
 
ALTER TABLE aluno_atividade ADD CONSTRAINT fk_Aluno_Atividade_2
	FOREIGN KEY (fk_Atividade_id)
	REFERENCES atividade (id)
	ON DELETE CASCADE;
 
ALTER TABLE aluno_atividade ADD CONSTRAINT fk_Aluno_Atividade_3
	FOREIGN KEY (fk_Aluno_id)
	REFERENCES aluno (id)
	ON DELETE CASCADE;
 
ALTER TABLE professor_atividade ADD CONSTRAINT fk_Professor_Atividade_2
	FOREIGN KEY (fk_Professor_id)
	REFERENCES professor (id)
	ON DELETE RESTRICT;

ALTER TABLE professor_atividade ADD CONSTRAINT fk_Professor_Atividade_3
	FOREIGN KEY (fk_Atividade_id)
	REFERENCES atividade (id)
	ON DELETE RESTRICT;

ALTER TABLE aluno_login ADD CONSTRAINT fk_Aluno_Login_1
	FOREIGN KEY (fk_Aluno_id)
	REFERENCES aluno (id)
	ON DELETE RESTRICT;

ALTER TABLE aluno_login ADD CONSTRAINT fk_Aluno_Login_2
	FOREIGN KEY (fk_Login_id)
	REFERENCES login (id)
	ON DELETE RESTRICT;

DELIMITER $$

CREATE PROCEDURE adicionar_atividade (
	IN titulo VARCHAR(100),
	IN dataAtividade date,
	IN descricao VARCHAR(500),
	IN papel VARCHAR(100),
	IN idAluno INT,
	IN idProfessor INT)
	BEGIN
	INSERT INTO atividade(titulo, data, descricao)
	VALUES(titulo, dataAtividade, descricao)/

	SET @idAtividade = LAST_INSERT_ID();

	INSERT INTO aluno_atividade (papel, fk_Atividade_id, fk_Aluno_id)
	VALUES (papel, @idAtividade, idAluno);

	INSERT INTO professor_atividade (fk_Professor_id, fk_Atividade_id)
	VALUES (idProfessor, @idAtividade);
	END $$

DELIMITER ;

DELIMITER $$

CREATE PROCEDURE adicionar_aluno (
	IN nome VARCHAR(500),
	IN email VARCHAR(200),
	IN dataNascimento DATE,
	IN usuarioGitHub VARCHAR(100)
	IN descricao VARCHAR(2000),
	IN senha VARCHAR(100))
	BEGIN

	INSERT INTO aluno(nome, email, data_nascimento, usuarioGitHub, descricao)
	VALUES(nome, email, dataNascimento, usuarioGitHub, descricao);

	SET @idAluno = LAST_INSERT_ID();

	INSERT INTO login(id_aluno, senha)
	VALUES(@idAluno, senha);

	END $$

DELIMITER ;