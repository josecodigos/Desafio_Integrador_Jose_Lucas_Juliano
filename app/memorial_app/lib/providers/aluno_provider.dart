import 'package:flutter/material.dart';
import '../models/aluno.dart';
import '../services/api_service.dart';

class AlunoProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Aluno> alunosList = [];
  bool isLoading = false;

  Future<void> fetchAlunos() async {
    isLoading = true;
    notifyListeners();
    try {
      alunosList = await apiService.fetchAlunos();
    } catch (e) {
      print('Error fetching alunos: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }


}
