import '../models/curso.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class CursoProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Curso> cursoList = [];
  bool isLoading = false;

  Future<void> fetchCurso() async {
    isLoading = true;
    notifyListeners();
    try {
      cursoList = await apiService.fetchCurso();
    } catch (e) {
      print('Error fetching curso: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}