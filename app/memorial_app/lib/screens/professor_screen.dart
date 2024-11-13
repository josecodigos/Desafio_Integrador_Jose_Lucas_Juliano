// lib/screens/aluno_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/professor_provider.dart';

class ProfessorScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final professorProvider = Provider.of<ProfessorProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Professor')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              professorProvider.fetchProfessor();
            },
            child: Text('Load Professor'),
          ),
          Expanded(
            child: professorProvider.isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: professorProvider.professorList.length,
                    itemBuilder: (context, index) {
                      final professor = professorProvider.professorList[index];
                      return ListTile(
                        title: Text("${professor.nome}"),
                        subtitle: Text('Descrição: ${professor.descricao}'),
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
