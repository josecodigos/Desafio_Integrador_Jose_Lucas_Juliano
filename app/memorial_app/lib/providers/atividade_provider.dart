import 'package:flutter/material.dart';
import '../models/atividade.dart';
import '../services/api_service.dart';


class AtividadeProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  List<Atividade> atividadeList = [];
  bool isLoading = false;

  Future<void> fetchAtividades() async {
    isLoading = true;
    notifyListeners();
    try{
      atividadeList = await apiService.fetchAtividades();
    } catch (e) {
      print("Error fetching atividades: $e");
    }finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
