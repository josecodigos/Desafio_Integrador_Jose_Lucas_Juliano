
import 'aluno.dart';

class Curso {
  final int id;
  final int? totalPeriodos;
  final String? nome;
  final List<Aluno>? alunos;

  Curso({
    required this.id, 
    this.nome, 
    this.totalPeriodos, 
    this.alunos});

  factory Curso.fromJson(Map<String, dynamic> json) {
    return Curso(
      id: json['id'],
      totalPeriodos: json['total_periodos'],
      nome: json['nome']
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'nome': nome,
      'totalPeiodos': totalPeriodos 
    };
  }
}
