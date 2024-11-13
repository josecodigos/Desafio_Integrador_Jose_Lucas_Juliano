import 'package:flutter/material.dart';
import 'atividade_screen.dart';
import 'aluno_screen.dart';
import 'log_screen.dart';
import 'professor_screen.dart';
import 'curso_screen.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AtividadeScreen()),
                );
              },
              child: Text('Atividades'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AlunoScreen()),
                );
              },
              child: Text('Alunos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProfessorScreen()),
                );
              },
              child: Text('Professores'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CursoScreen()),
                );
              },
              child: Text('Cursos'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => LogScreen()),
                );
              },
              child: Text('LOG de requisições à API'),
            )
          ],
        ),
      ),
    );
  }
  
}
