
const express = require('express');
const mysql = require('mysql2');
const cors = require('cors');

const app = express();
app.use(express.json());
app.use(cors());
app.use(express.urlencoded());

const conexao = mysql.createPool({
    host: "localhost",
    user: "jose",
    password: "1234",
    database: "memorial",
});

// ALUNOS POST
app.post('/aluno', (req, res) => {
    console.log("chegou aqui aluno");
    const sql = `INSERT INTO aluno (nome, email, data_nascimento, descricao) VALUES (?, ?, ?, ?)`;
    const params = [req.body.nome, req.body.email, req.body.data_nascimento, req.body.descricao];
    
    conexao.promise().query(sql, params)
        .then(data => res.status(200).json({ message: "Aluno inserido com sucesso", pessoa: data[0] }))
        .catch(err => res.status(500).json({ message: "Erro ao inserir aluno: " + err }));
});

// PROFESSOR POST
app.post('/professor', (req, res) => {
    console.log("chegou aqui professor");
    const sql = `INSERT INTO professor (nome, descricao) VALUES (?, ?)`;
    const params = [req.body.nome, req.body.descricao];

    conexao.promise().query(sql, params)
        .then(data => res.status(200).json({ message: "Professor inserido com sucesso", pessoa: data[0] }))
        .catch(err => res.status(500).json({ message: "Erro ao inserir professor: " + err }));
});

// ATIVIDADE POST
app.post('/atividade', (req, res) => {
    console.log("chegou aqui atividade");
    const sql = `CALL adicionar_atividade(?, ?, ?, ?, ?, ?)`;
    const params = [
        req.body.titulo, 
        req.body.dataAtv, 
        req.body.descricao, 
        req.body.papel, 
        req.body.idAluno, 
        req.body.idProfessor
    ];

    conexao.promise().query(sql, params)
        .then(data => res.status(200).json({ message: "Atividade inserida com sucesso", pessoa: data[0] }))
        .catch(err => res.status(500).json({ message: "Erro ao inserir atividade: " + err }));
});

// LOGIN POST
app.post('/login', (req, res) => {
    console.log("chegou aqui login");
    const sql = `INSERT INTO login (usuario, senha) VALUES (?, ?)`;
    const params = [req.body.usuario, req.body.senha];

    conexao.promise().query(sql, params)
        .then(data => res.status(200).json({ message: "Login inserido com sucesso", pessoa: data[0] }))
        .catch(err => res.status(500).json({ message: "Erro ao inserir login: " + err }));
});

// CURSO POST
app.post('/curso', (req, res) => {
    console.log("chegou aqui curso");
    const sql = `INSERT INTO curso (nome, total_periodos) VALUES (?, ?)`;
    const params = [req.body.nome, req.body.total_periodos];

    conexao.promise().query(sql, params)
        .then(data => res.status(200).json({ message: "Curso inserido com sucesso", pessoa: data[0] }))
        .catch(err => res.status(500).json({ message: "Erro ao inserir curso: " + err }));
});

// MATRICULA POST
app.post('/matricula', (req, res) => {
    console.log("chegou aqui matricula");
    const sql = `INSERT INTO matricula (fk_Aluno_id, fk_Curso_id, data) VALUES (?, ?, ?)`;
    const params = [req.body.fk_Aluno_id, req.body.fk_Curso_id, req.body.data];

    conexao.promise().query(sql, params)
        .then(data => res.status(200).json({ message: "Matricula inserida com sucesso", pessoa: data[0] }))
        .catch(err => res.status(500).json({ message: "Erro ao inserir Matricula: " + err }));
});

//MATRICULA GET
app.get('/matricula', (req, res) => {
    const sql = `SELECT * FROM matricula `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ element: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({message: "Erro ao buscar matricula: " + err})
    })
})

//CURSO GET
app.get('/curso', (req, res) => {
    const sql = `SELECT * FROM curso `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ element: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({message: "Erro ao buscar curso: " + err})
    })
})

//ALUNOS GET
app.get('/aluno', (req, res) => {
    const sql = `SELECT * FROM aluno `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ element: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({message: "Erro ao buscar aluno: " + err})
    })
})

//PROFESSOR GET
app.get('/professor', (req, res) => {
    const sql = `SELECT * FROM professor `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ element: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({message: "Erro ao buscar aluno: " + err})
    })
})

//ATIVIDADE GET
app.get('/atividade', (req, res) => {
    const sql = `SELECT * FROM aluno_atividade_professor;`
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ element: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({message: "Erro ao buscar atividade: " + err})
    })
})

//LOGIN GET
app.get('/login', (req, res) => {
    const sql = `SELECT * FROM login `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ element: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({message: "Erro ao buscar login: " + err})
    })
})


app.get('/professor/:id/atividades', (req, res) => {
    const professorId = req.params.id;
    const sql = `
        SELECT atividade.titulo, atividade.descricao, atividade.data
        FROM atividade
        INNER JOIN professor_atividade ON atividade.id = professor_atividade.fk_Atividade_id
        WHERE professor_atividade.fk_Professor_id = ?
    `;
    conexao.promise().query(sql, [professorId])
    .then(data => {
        res.status(200).json({ element: data[0] });
    })
    .catch(err => {
        res.status(500).json({ message: "Erro ao buscar atividades do professor: " + err });
    });
});

app.get('/atividade/:id/participantes', (req, res) => {
    const atividadeId = req.params.id;
    const sql = `
        SELECT aluno.nome AS nome_participante, aluno_atividade.papel AS papel, 'Aluno' AS tipo
        FROM aluno
        INNER JOIN aluno_atividade ON aluno.id = aluno_atividade.fk_Aluno_id
        WHERE aluno_atividade.fk_Atividade_id = ?
        UNION
        SELECT professor.nome AS nome_participante, NULL AS papel, 'Professor' AS tipo
        FROM professor
        INNER JOIN professor_atividade ON professor.id = professor_atividade.fk_Professor_id
        WHERE professor_atividade.fk_Atividade_id = ?
    `;
    conexao.promise().query(sql, [atividadeId, atividadeId])
    .then(data => {
        res.status(200).json({ element: data[0] });
    })
    .catch(err => {
        res.status(500).json({ message: "Erro ao buscar participantes da atividade: " + err });
    });
});

app.get('/cursos/quantidade-alunos', (req, res) => {
    const sql = `
        SELECT curso.nome, COUNT(matricula.fk_Aluno_id) AS quantidade_alunos
        FROM curso
        LEFT JOIN matricula ON curso.id = matricula.fk_Curso_id
        GROUP BY curso.id
    `;
    conexao.promise().query(sql)
    .then(data => {
        res.status(200).json({ element: data[0] });
    })
    .catch(err => {
        res.status(500).json({ message: "Erro ao buscar quantidade de alunos nos cursos: " + err });
    });
});

app.get('/curso/:id/alunos', (req, res) => {
    const cursoId = req.params.id;
    const sql = `
        SELECT aluno.nome, aluno.email, aluno.data_nascimento
        FROM aluno
        INNER JOIN matricula ON aluno.id = matricula.fk_Aluno_id
        WHERE matricula.fk_Curso_id = ?
    `;

    conexao.promise().query(sql, [cursoId])
        .then(data => res.status(200).json({ element: data[0] }))
        .catch(err => res.status(500).json({ message: "Erro ao buscar alunos do curso: " + err }));
});

app.get('/aluno/:id/atividades', (req, res) => {
    const alunoId = req.params.id;
    const sql = `
        SELECT atividade.titulo, atividade.descricao, atividade.data, aluno_atividade.papel
        FROM atividade
        INNER JOIN aluno_atividade ON atividade.id = aluno_atividade.fk_Atividade_id
        WHERE aluno_atividade.fk_Aluno_id = ?
    `;

    conexao.promise().query(sql, [alunoId])
        .then(data => res.status(200).json({ element: data[0] }))
        .catch(err => res.status(500).json({ message: "Erro ao buscar atividades do aluno: " + err }));
});

app.listen('5000', () => {
    console.log("Servidor executando na porta 5000")
})
