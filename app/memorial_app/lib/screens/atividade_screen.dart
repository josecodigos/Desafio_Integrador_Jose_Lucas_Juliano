import 'package:flutter/material.dart';
import 'package:memorial_app/models/atividade.dart';
import 'package:provider/provider.dart';
import '../providers/atividade_provider.dart';
import '../services/api_service.dart';

class AtividadeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final atividadeProvider = Provider.of<AtividadeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Atividades')),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () { //Botao que carrega as atividades
              atividadeProvider.fetchAtividades();
            },
            child: Text('Load Atividades'),
          ),
          ElevatedButton( //Botao pra adicionar atividades
                onPressed: () {
                  _showAddAtividadeForm(context);
                  atividadeProvider.fetchAtividades();
                },
                child: Text('Adicionar Atividade'),
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
  void _showAddAtividadeForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddAtividadeForm(),
        );
      },
    );
  }
}

class AddAtividadeForm extends StatefulWidget {
  @override
  _AddAtividadeFormState createState() => _AddAtividadeFormState();
}

class _AddAtividadeFormState extends State<AddAtividadeForm> {
  final _formKey = GlobalKey<FormState>();
  final _tituloController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _alunoController = TextEditingController();
  final _professorController = TextEditingController();
  DateTime? _dataAtividade;
  final ApiService _apiService = ApiService();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Atividade novaAtividade = Atividade(
        titulo: _tituloController.text,
        descricao: _descricaoController.text,
        idAluno: int.tryParse(_alunoController.text),
        idProfessor : int.tryParse(_professorController.text),
        dataAtividade: _dataAtividade,
      );

      bool success = await _apiService.createAtividade(novaAtividade);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? 'Atividade inserted sucessfully!' : 'Error inserting atividade'),
        ),
      );
      if (success) Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _tituloController.dispose();
    _descricaoController.dispose();
    _alunoController.dispose();
    _professorController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: ListView(
          shrinkWrap: true,
          children: [
            TextFormField(
              controller: _tituloController,
              decoration: InputDecoration(labelText: 'Título'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira o título' : null,
            ),
            TextFormField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira a descrição' : null,
            ),
            TextFormField(
              controller: _alunoController,
              decoration: InputDecoration(labelText: 'Id do aluno'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira o id do aluno' : null,
            ),
            TextFormField(
              controller: _professorController,
              decoration: InputDecoration(labelText: 'Id do professor orientador da atividade'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira o id do professor' : null,
            ),
            ListTile(
              title: Text(
                _dataAtividade != null
                    ? 'Data da Atividade: ${_dataAtividade!.toLocal()}'.split(' ')[0]
                    : 'Escolha a Data da atividade',
              ),
              trailing: Icon(Icons.calendar_today),
              onTap: () async {
                DateTime? pickedDate = await showDatePicker(
                  context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(1900),
                  lastDate: DateTime.now(),
                );
                if (pickedDate != null) {
                  setState(() {
                    _dataAtividade = pickedDate;
                  });
                }
              },
            ),
            ElevatedButton(
              onPressed: _submitForm,
              child: Text('Salvar'),
            ),
          ],
        ),
      ),
    );
  }
}
