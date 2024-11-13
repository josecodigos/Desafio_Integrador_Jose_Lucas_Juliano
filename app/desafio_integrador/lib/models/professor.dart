class Professor {
  final int id;
  final String? nome;
  final String? descricao;

  Professor({
    required this.id, 
    this.nome, 
    this.descricao});

  factory Professor.fromJson(Map<String, dynamic> json) {
    return Professor(
      id: json['id'],
      descricao: json['descricao'],
      nome: json['nome']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'descricao': descricao 
    };
  }
}
