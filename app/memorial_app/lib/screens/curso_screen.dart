// lib/screens/aluno_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/curso_provider.dart';

class CursoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final cursoProvider = Provider.of<CursoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Alunos')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              cursoProvider.fetchCurso();
            },
            child: Text('Load Alunos'),
          ),
          Expanded(
            child: cursoProvider.isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: cursoProvider.cursoList.length,
                    itemBuilder: (context, index) {
                      final curso = cursoProvider.cursoList[index];
                      return ListTile(
                        title: Text("${curso.nome}"),
                        subtitle: Text('Total de períodos: ${curso.totalPeriodos}'),
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
