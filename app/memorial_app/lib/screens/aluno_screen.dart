import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/aluno_provider.dart';
import '../models/aluno.dart';
import '../services/api_service.dart';

class AlunoScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final alunoProvider = Provider.of<AlunoProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text('Alunos')),
      body: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton( //Botao pra carregar alunos
                onPressed: () {
                  alunoProvider.fetchAlunos();
                },
                child: Text('Load Alunos'),
              ),
              ElevatedButton( //Botao pra adicionar alunos
                onPressed: () {
                  _showAddAlunoForm(context);
                  alunoProvider.fetchAlunos();
                },
                child: Text('Adicionar Aluno'),
              ),
            ],
          ),
          Expanded( //faz um circulo de carregamento e cria a lista de alunos
            child: alunoProvider.isLoading
                ? CircularProgressIndicator()
                : ListView.builder(
                    itemCount: alunoProvider.alunosList.length,
                    itemBuilder: (context, index) {
                      final aluno = alunoProvider.alunosList[index];
                      return ListTile(
                        title: Text("${aluno.nome}"),
                        subtitle: Text(
                          'Email: ${aluno.email} | '
                          'Data Nascimento: ${aluno.dataNascimento} | '
                          'GitHub: ${aluno.usuarioGitHub} | '
                          'Descrição: ${aluno.descricao}',
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }

  void _showAddAlunoForm(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return Padding(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddAlunoForm(),
        );
      },
    );
  }
}

class AddAlunoForm extends StatefulWidget {
  @override
  _AddAlunoFormState createState() => _AddAlunoFormState();
}

class _AddAlunoFormState extends State<AddAlunoForm> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _emailController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _usuarioGitHubController = TextEditingController();
  final _senhaController = TextEditingController();
  DateTime? _dataNascimento;
  final ApiService _apiService = ApiService();

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      Aluno novoAluno = Aluno(
        nome: _nomeController.text,
        email: _emailController.text,
        descricao: _descricaoController.text,
        usuarioGitHub: _usuarioGitHubController.text,
        senha : _senhaController.text,
        dataNascimento: _dataNascimento,
      );

      bool success = await _apiService.createAluno(novoAluno);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? 'Aluno criado com sucesso!' : 'Erro ao criar aluno'),
        ),
      );
      if (success) Navigator.of(context).pop();
    }
  }

  @override
  void dispose() {
    _nomeController.dispose();
    _emailController.dispose();
    _descricaoController.dispose();
    _usuarioGitHubController.dispose();
    _senhaController.dispose();
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
              controller: _nomeController,
              decoration: InputDecoration(labelText: 'Nome'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira o nome' : null,
            ),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(labelText: 'Email'),
              keyboardType: TextInputType.emailAddress,
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira o email' : null,
            ),
            TextFormField(
              controller: _descricaoController,
              decoration: InputDecoration(labelText: 'Descrição'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira a descrição' : null,
            ),
            TextFormField(
              controller: _usuarioGitHubController,
              decoration: InputDecoration(labelText: 'Usuário do GitHub'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira o usuário do GitHub' : null,
            ),
            TextFormField(
              controller: _senhaController,
              decoration: InputDecoration(labelText: 'Senha para login futuro'),
              validator: (value) => value == null || value.isEmpty ? 'Por favor, insira uma senha para login' : null,
            ),
            ListTile(
              title: Text(
                _dataNascimento != null
                    ? 'Data de Nascimento: ${_dataNascimento!.toLocal()}'.split(' ')[0]
                    : 'Escolha a Data de Nascimento',
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
                    _dataNascimento = pickedDate;
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
