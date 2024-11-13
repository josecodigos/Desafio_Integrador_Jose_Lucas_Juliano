class Atividade {
  final int? id;
  final String? titulo;
  final String? descricao;
  final DateTime? dataAtividade;
  final String? nomeAluno;
  final String? nomeProfessor;

  Atividade({
    required this.id, 
    this.titulo, 
    this.descricao, 
    this.dataAtividade, 
    this.nomeAluno, 
    this.nomeProfessor});

  factory Atividade.fromJson(Map<String, dynamic> json) {
    DateTime? parsedDate = json['data'] != null
        ? DateTime.tryParse(json['data'])
        : null;  
    
    int? parsedId = json['id'] != null
      ? int.tryParse(json['id'])
      : null;

    return Atividade(
      id: parsedId,
      titulo: json['titulo'],
      descricao: json['descricao_atividade'],
      dataAtividade: parsedDate,
      nomeAluno: json['alunoNome'],
      nomeProfessor: json['ProfessorNome']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'dataAtividade': dataAtividade,
      'nomeAluno': nomeAluno,
      'nomeProfessor': nomeProfessor
    };
  }
}
