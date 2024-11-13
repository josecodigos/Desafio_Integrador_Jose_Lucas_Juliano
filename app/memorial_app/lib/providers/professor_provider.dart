import '../models/professor.dart';
import 'package:flutter/material.dart';
import '../services/api_service.dart';

class ProfessorProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Professor> professorList = [];
  bool isLoading = false;

  Future<void> fetchProfessor() async {
    isLoading = true;
    notifyListeners();
    try {
      professorList = await apiService.fetchProfessor();
    } catch (e) {
      print('Error fetching professores: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}