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
