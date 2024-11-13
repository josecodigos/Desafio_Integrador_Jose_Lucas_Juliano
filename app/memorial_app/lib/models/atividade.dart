class Atividade {
  final int? id;
  final String? titulo;
  final String? descricao;
  final DateTime? dataAtividade;
  final int? idAluno;
  final String? nomeAluno;
  final int? idProfessor;
  final String? nomeProfessor;

  Atividade({
    this.id, 
    this.titulo, 
    this.descricao, 
    this.dataAtividade, 
    this.idAluno, 
    this.nomeAluno,
    this.idProfessor,
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
      idAluno: json['idAluno'],
      nomeAluno: json['nomeAluno'],
      idProfessor: json['idProfessor'],
      nomeProfessor: json['nomeProfessor']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'titulo': titulo,
      'descricao': descricao,
      'dataAtividade': dataAtividade?.toIso8601String(),
      'idAluno': idAluno,
      'nomeAluno': nomeAluno,
      'idProfessor': idProfessor,
      'nomeProfessor': nomeProfessor
    };
  }
}
