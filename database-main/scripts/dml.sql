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
select * from pessoas;

SELECT inserirProjetoAluno('Projeto 1', 'Java', 'c1', 'd1', '2023-10-15', NULL, 'Descrição Projeto 1', 'João Silva', 'Pedro Rodrigues');
SELECT inserirProjetoAluno('Projeto 2', 'Python', 'c2', 'd2', '2023-11-01', NULL, 'Descrição Projeto 2', 'João Silva', 'Maria Souza');
SELECT inserirProjetoAluno('Projeto 3', 'C++', 'c3', 'd3', '2023-11-15', NULL, 'Descrição Projeto 3', 'Mariana Lima', 'José Santos');
SELECT inserirProjetoAluno('Projeto 4', 'Java', 'c1', 'd1', '2023-10-15', NULL, 'Descrição Projeto 4', 'Carlos Ferreira', 'Pedro Rodrigues');
SELECT inserirProjetoAluno('Projeto 5', 'Python', 'c2', 'd2', '2023-11-01',NULL, 'Descrição Projeto 5', 'Sofia Vieira', 'Maria Souza');
SELECT inserirProjetoAluno('Projeto 6', 'C++', 'c3', 'd3', '2023-11-15', NULL, 'Descrição Projeto 6', 'Luís Santos', 'José Santos');
SELECT inserirProjetoAluno('Projeto 7', 'Java', 'c1', 'd1', '2023-10-15', NULL, 'Descrição Projeto 7', 'Luís Santos', 'José Santos');
SELECT inserirProjetoAluno('Projeto 8', 'Java', 'c1', 'd1', '2023-10-16', NULL, 'Descrição Projeto 8', 'Marta Costa', 'José Santos');
SELECT inserirProjetoAluno('Projeto 9', 'C++', 'c3', 'd3', '2023-11-15', NULL, 'Descrição Projeto 9', 'Luís Santos', 'Ana Oliveira');
SELECT inserirProjetoAluno('Projeto 10', 'Java', 'c1', 'd1', '2023-10-15', NULL, 'Descrição Projeto 10', 'Marta Costa', 'Ana Oliveira');
select * from projetos;
select * from pessoas_projetos;

INSERT INTO profissao (id, cargo, empresa, tempo_contrato, salario) 
VALUES 
(default,'Engenheiro de Software', 'TechCorp', 36, 8000.00),
(default, 'Analista de Marketing', 'AdvertiseNow', 24, 5000.00),
(default, 'Designer Gráfico', 'CreativeDesign', 12, 4000.00),
(default, 'Gerente de Projetos', 'Global Solutions', 48, 10000.00),
(default, 'Consultor Financeiro', 'MoneyMatters', 36, 9000.00),
(default, 'Desenvolvedor Web', 'WebDev Co.', 24, 6000.00),
(default, 'Arquiteto de Software', 'CodeArchitects', 48, 12000.00),
(default, 'Analista de Dados', 'DataAnalytics Inc.', 36, 8500.00);
SELECT * FROM profissao;

INSERT INTO pessoas_profissao (id, fkpessoapr, fkprofissao)
VALUES
(default, 1, 1),
(default, 3, 2),
(default, 4, 3),
(default, 5, 4),
(default, 6, 5),
(default, 8, 6),
(default, 9, 7),
(default, 10, 8);
SELECT * FROM pessoas_profissao;

SELECT * FROM relatorio_quant_projetos_alunos;

SELECT * FROM relatorio_quant_projetos_linguagem;

SELECT * FROM relatorio_quant_alunos_periodo;

SELECT * FROM relatorio_maiores_salarios;

SELECT * FROM relatorio_pessoas_trabalhando;

SELECT * FROM relatorio_pessoas_nao_trabalhando;