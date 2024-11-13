class Aluno {
  final int? id;
  final String? nome;
  final String? email;
  final DateTime? dataNascimento;
  final String? usuarioGitHub;
  final String? descricao;
  final String? senha;

  Aluno({
    this.id, 
    this.nome, 
    this.email, 
    this.dataNascimento, 
    this.usuarioGitHub, 
    this.descricao, 
    this.senha});

  factory Aluno.fromJson(Map<String, dynamic> json) {
    DateTime? parsedDate = json['data_nascimento'] != null
        ? DateTime.tryParse(json['data_nascimento'])
        : null;  
    return Aluno(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      dataNascimento: parsedDate,
      usuarioGitHub: json['usuarioGitHub'],
      descricao: json['descricao'],
      senha: json['senha']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'email': email,
      'data_nascimento': dataNascimento?.toIso8601String(),
      'usuarioGitHub': usuarioGitHub,
      'descricao': descricao,
      'senha': senha
    };
  }
}
