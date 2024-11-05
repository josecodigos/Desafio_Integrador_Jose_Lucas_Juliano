//const express = require('express')
//const mysql = require('mysql2')

//node --watch aula.js // para recarregar automático quando salvar

import express from "express"
import mysql from "mysql2"
import cors from "cors"

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
    user: "cintia",
    password: "cintia",
    database: "memorial",
});

app.post('/teste', (req, res) => {
    console.log("chegou aqui")
    console.log(req)
    const sql = `INSERT INTO teste (nome, email) `+
                ` VALUES ("${req.body.nome}", "${req.body.email}")`
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({mesage: "Inserido com sucesso",
            pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao inserir " + err})
    })
   
})


app.get('/teste', (req, res) => {
    const sql = `SELECT * FROM teste `
    conexao.promise().query(sql)
    .then (data => {
        res.status(200)
        .json({ pessoa: data[0]
        })
    }) 
    .catch (err => {
        res.status(500)
        .json({mesage: "Erro ao BUSCAR " + err})
    })
   
})

app.get('/pessoasCallback', (req, res) => {
    const sql = `SELECT * FROM pessoas`
    conexao.query(sql, (err, result) => {
        if (err) {
            console.log(err)
            res.status(500)
                .json({
                    message: err
                })
        } else {
            console.log(result)
            res.status(200)
                .json({
                    pessoas: result
                })
        }
    })
})

app.get('/pessoasPromise', (req, res) => {

    let sql;
    if(req.query) {
         sql = `SELECT * FROM pessoas  where id = ${req.query.id}` 
    } else {
         sql = `SELECT * FROM pessoas`
    }
   
    conexao.promise().query(sql)
        .then((data) => {
            console.log(data[0])
            res.status(200)
                .json({
                    pessoas: data[0]
                })
        })
        .catch((err) => {
            console.log(err)
            res.status(500)
                .json({
                    message: err
                })
        })
})

app.post('/pessoasPromise2', (req, res) => {
    console.log(req.body)
    const { nome, curso, periodo } = req.body;
    const sql = `INSERT INTO pessoas (nome, curso)
                 VALUES (?, ?,)`
    conexao.promise().query(sql, [nome, curso])
        .then(data => {
            console.log(data)
            res.status(200)
                .json({
                    messagem: "Pessoa inserida"
                })
        })
        .catch(err => {
            console.log(err)
            res.status(500)
                .json({
                    messagem: "Ocorreu um erro"
                })
        })
})



app.post('/pessoasPromise', (req, res) => {
    const sql = `INSERT INTO pessoas (nome, curso, periodo)
                 VALUES ("${req.body.nome}", "${req.body.curso}",${req.body.periodo})`
    conexao.promise().query(sql,)
        .then(data => {
            console.log(data)
            res.status(200)
                .json({
                    messagem: "Pessoa inserida"
                })
        })
        .catch(err => {
            console.log(err)
            res.status(500)
                .json({
                    messagem: "Ocorreu um erro"
                })
        })
})



app.put('/pessoasPromise/:id', (req, res) => {
    const sql = `UPDATE pessoas SET  nome = "${req.body.nome}", ` +
                 `curso = "${req.body.curso}", `+
                  `periodo = ${req.body.periodo} `+ 
                  `where id = ${req.params.id}`
                  console.log(sql)
    conexao.promise().query(sql)
        .then(data => {
            res.status(200)
                .json({
                    messagem: "Pessoa alterada"
                })
        })
        .catch(err => {
            res.status(500)
                .json({
                    messagem: "Ocorreu um erro" + err
                })
        })
})


app.delete('/pessoasPromise/:id', (req, res) => {
    const sql = `DELETE FROM pessoas where id = ${req.params.id}`
    conexao.promise().query(sql)
        .then(data => {
            res.status(200)
                .json({
                    messagem: "Pessoa deletada"
                })
        })
        .catch(err => {
            console.log(err)
            res.status(500)
                .json({
                    messagem: "Ocorreu um erro" + err
                })
        })
})

// pessoa por id
/*app.get("/pessoasPromiseteste/:id", (req, res) => {
    //  const id = req.params.id;
    const { id } = req.params;
    const sql = "SELECT * FROM pessoas where id = ?"
    conexao.promise().query(sql, [id])
        .then(data => {
            res.status(200)
                .json({ mesage: "Pessoa atualizada" })
        })
        .catch(err => {
            res.status(500)
                .json({ mensage: err })
        })
}) */

// http://localhost:5000/pessoasPromiseteste/25

app.get("/pessoasPromise/:id", (req, res) => {
    const id = req.params.id;
    const sql = "SELECT * FROM pessoas where id = " + id
    conexao.promise().query(sql)
        .then(data => {
            console.log(data)
            res.status(200)
                .json({ pessoa: data[0] })
        })
        .catch(err => {
            res.status(500)
                .json({ mensage: err })
        })
})



app.listen('5000', () => {
    console.log("Servidor executando na porta 5000")
})