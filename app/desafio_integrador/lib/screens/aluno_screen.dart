// lib/screens/aluno_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/aluno_provider.dart';

class AlunoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alunoProvider = Provider.of<AlunoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Alunos')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              alunoProvider.fetchAlunos();
            },
            child: Text('Load Alunos'),
          ),
          Expanded(
            child: alunoProvider.isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: alunoProvider.alunosList.length,
                    itemBuilder: (context, index) {
                      final aluno = alunoProvider.alunosList[index];
                      return ListTile(
                        title: Text("${aluno.nome}"),
                        subtitle: Text('Email: ${aluno.email} |   ' +
                                        'Data Nascimento: ${aluno.dataNascimento} |   ' + 
                                        'Usuario do Git Hub: ${aluno.usuarioGitHub} |   ' + 
                                        'Descrição: ${aluno.descricao} |    '),
                      );
                    },
                  ),
          ),
          /* ElevatedButton(
            onPressed: () {
              alunoProvider.addAluno(
                Aluno(id: 0, nome: 'José Antonio',email:'joseamandrade466@gmail.com', dataNascimento: DateTime.parse("2004-08-22"), usuarioGitHub: 'josecodigos', descricao: 'José', senha: '1234'),
              );
            },
            child: Text('Add Aluno'),
          ), */
        ],
      ),
    );
  }
}
