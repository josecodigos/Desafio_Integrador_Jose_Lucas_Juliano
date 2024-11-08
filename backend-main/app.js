const express = require('express')
const mysql = require('mysql2')
const cors = require('cors')

//node --watch aula.js // para recarregar automático quando salvar

//import express from "express"
//import mysql from "mysql2"
//import cors from "cors"

const app = express()

// precisa para funcionar o post
app.use(express.json())
app.use(cors())

// para body
app.use(express.urlencoded());

/*var bodyParser = require('body-parser');

// configure the app to use bodyParser()
app.use(bodyParser.urlencoded({
    extended: true
}));
app.use(bodyParser.json());*/

const conexao = mysql.createPool({
    host: "localhost",
    user: "jose",
    password: "1234",
    database: "memorial",
});


//ALUNOS POST
app.post('/aluno', (req, res) => {
    console.log("chegou aqui aluno")
    console.log(req.body.descricao)
    const sql = `INSERT INTO aluno (nome, email, data_nascimento, descricao) VALUES ("${req.body.nome}", "${req.body.email}", "${req.body.data_nascimento}", "${req.body.descricao}");`
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({mesage: "Aluno inserido com sucesso",
            pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao inserir aluno:" + err})
    })
})

//PROFESSOR POST
app.post('/professor', (req, res) => {
    console.log("chegou aqui professor")
    const sql = `INSERT INTO professor (nome, descricao) VALUES ("${req.body.nome}", "${req.body.descricao}");`
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({mesage: "Professor inserido com sucesso",
            pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao inserir professor:" + err})
    })
})

//ATIVIDADE POST    
app.post('/atividade', (req, res) => {
    console.log("chegou aqui atividade")
    console.log(req)
    const sql = `CALL adicionar_atividade(
                ${req.body.titulo},
                ${req.body.dataAtv},
                ${req.body.descricao},
                ${req.body.papel},
                ${req.body.idAluno},
                ${req.body.idProfessor});`
    conexao.promise().query(sql)
    .then(data => {
        res.status(200)
        .json({message: "Atividade inserida com sucesso",
            pessoa: data[0]
        })
    })
    .catch(err => {
        res.status(500)
        .json({mesage: "Erro ao inserir atividade: " + err})
    })
    })

//LOGIN POST
app.post('/login', (req, res) => {
    console.log("chegou aqui login")
    console.log(req)
    const sql = `INSERT INTO login (usuario, senha) `+
                ` VALUES ("${req.body.usuario}", "${req.body.senha}")`
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({mesage: "Login inserido com sucesso",
            pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao inserir login: " + err})
    })
})

//CURSO POST
app.post('/curso', (req, res) => {
    console.log("chegou aqui curso")
    console.log(req)
    const sql = `INSERT INTO curso (nome, total_periodos) `+
                ` VALUES ("${req.body.nome}", "${req.body.total_periodos}")`
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({mesage: "Curso inserido com sucesso",
            pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao inserir curso: " + err})
    })
})

//MATRICULA POST
app.post('/matricula', (req, res) => {
    console.log("chegou aqui matricula")
    console.log(req)
    const sql = `INSERT INTO matricula (fk_Aluno_id, fk_Curso_id, data) `+
                ` VALUES ("${req.body.fk_Aluno_id}", "${req.body.fk_Curso_id}", "${req.body.data}")`
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({mesage: "Matricula inserida com sucesso",
            pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao inserir Matricula: " + err})
    })
})

//MATRICULA GET
app.get('/matricula', (req, res) => {
    const sql = `SELECT * FROM matricula `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao buscar matricula: " + err})
    })
})

//CURSO GET
app.get('/curso', (req, res) => {
    const sql = `SELECT * FROM curso `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao buscar curso: " + err})
    })
})

//ALUNOS GET
app.get('/aluno', (req, res) => {
    const sql = `SELECT * FROM aluno `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao buscar aluno: " + err})
    })
})

//PROFESSOR GET
app.get('/professor', (req, res) => {
    const sql = `SELECT * FROM professor `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao buscar aluno: " + err})
    })
})

//ATIVIDADE GET
app.get('/atividade', (req, res) => {
    const sql = `SELECT * FROM aluno_atividade_professor;`
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao buscar atividade: " + err})
    })
})

//LOGIN GET
app.get('/login', (req, res) => {
    const sql = `SELECT * FROM login `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao buscar login: " + err})
    })
})

app.listen('5000', () => {
    console.log("Servidor executando na porta 5000")
})
