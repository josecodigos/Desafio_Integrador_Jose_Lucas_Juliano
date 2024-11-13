// lib/screens/aluno_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/atividade_provider.dart';

class AtividadeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final atividadeProvider = Provider.of<AtividadeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Atividades')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              atividadeProvider.fetchAtividades();
            },
            child: Text('Load Atividades'),
          ),
          Expanded(
            child: atividadeProvider.isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: atividadeProvider.atividadeList.length,
                    itemBuilder: (context, index) {
                      final atividade = atividadeProvider.atividadeList[index];
                      return ListTile(
                        title: Text("Título: ${atividade.titulo}"),
                        subtitle: Text('Data da atividade: ${atividade.dataAtividade} |   ' + 
                                        'Descrição: ${atividade.descricao} |    ' +
                                        'Aluno: ${atividade.nomeAluno}  |   '+
                                        'Professor: ${atividade.nomeProfessor}'),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
