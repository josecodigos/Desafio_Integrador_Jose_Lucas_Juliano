import 'dart:convert';
import '../models/professor.dart';
import 'package:http/http.dart' as http;
import '../models/aluno.dart';
import '../models/atividade.dart';
import '../models/curso.dart';
import '../models/log.dart';
import 'database_helper.dart'; 

class ApiService {
  final String baseUrl = 'http://127.0.0.1:5000';
  final DatabaseHelper dbHelper = DatabaseHelper();

  Future<void> logRequest(String endpoint, String method, String status, String responseMessage) async {
    final log = Log(
      endpoint: endpoint,
      method: method,
      status: status,
      responseMessage: responseMessage,
      timestamp: DateTime.now(),
    );
    await dbHelper.insertLog(log);
  }

  Future<List<Aluno>> fetchAlunos() async {
    final String endpoint = '/aluno';
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      String status = response.statusCode == 200 ? 'Success' : 'Failure';
      await logRequest(endpoint, 'GET', status, response.body);

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> data = json.decode(response.body);
          if (data['element'] != null && data['element'] is List) {
        final List<dynamic> alunosList = data['element'];

        return alunosList.map((alunoData) => Aluno.fromJson(alunoData)).toList();
        }else {
          print('No Aluno found or invalid structure');
          return [];
        }
        } catch (e) {
          throw Exception('Error parsing alunos data: $e');
        }
      } else {
        throw Exception('Failed to load alunos');
      }
    } catch (e) {
      await logRequest(endpoint, 'GET', 'Error', e.toString());
      throw Exception('Error fetching alunos: $e');
    }
  }

  Future<bool> createAluno(Aluno aluno) async {
    final endpoint = '/aluno';
    try {
      final url = Uri.parse('$baseUrl$endpoint');
      final requestBody = jsonEncode(aluno.toJson());
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
        },
        body: requestBody,
      );

      String status = response.statusCode == 201 ? 'Success' : 'Failure';

      await logRequest(endpoint, 'POST', status, requestBody);

      if (response.statusCode == 201) {
        return true;
      } else {
        print('Failed to create aluno. Status code: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error creating aluno: $e');
      
      await logRequest(endpoint, 'POST', 'Error', e.toString());

      return false;
    }
  }

  Future<List<Atividade>> fetchAtividades() async {
    final String endpoint = '/atividade';
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      String status = response.statusCode == 200 ? 'Success' : 'Failure';
      await logRequest(endpoint, 'GET', status, response.body);

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> data = json.decode(response.body);
          if (data['element'] != null && data['element'] is List) {
        final List<dynamic> atividadeList = data['element'];

        return atividadeList.map((atividadeData) => Atividade.fromJson(atividadeData)).toList();
        }else {
          print('No Atividade found or invalid structure');
          return [];
        }
        } catch (e) {
          throw Exception('Error parsing  data: $e');
        }
      } else {
        throw Exception('Failed to load atividades');
      }
    } catch (e) {
      await logRequest(endpoint, 'GET', 'Error', e.toString());
      throw Exception('Error fetching atividades: $e');
    }
  }
  
  Future<List<Curso>> fetchCurso() async {
    final String endpoint = '/curso';
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      String status = response.statusCode == 200 ? 'Success' : 'Failure';
      await logRequest(endpoint, 'GET', status, response.body);

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> data = json.decode(response.body);
          if (data['element'] != null && data['element'] is List) {
        final List<dynamic> cursoList = data['element'];

        return cursoList.map((cursoData) => Curso.fromJson(cursoData)).toList();
        }else {
          print('No Curso found or invalid structure');
          return [];
        }
        } catch (e) {
          throw Exception('Error parsing  data: $e');
        }
      } else {
        throw Exception('Failed to load curso');
      }
    } catch (e) {
      await logRequest(endpoint, 'GET', 'Error', e.toString());
      throw Exception('Error fetching curso: $e');
    }
  }
  
  Future<List<Professor>> fetchProfessor() async {
    final String endpoint = '/professor';
    try {
      final response = await http.get(Uri.parse('$baseUrl$endpoint'));

      String status = response.statusCode == 200 ? 'Success' : 'Failure';
      await logRequest(endpoint, 'GET', status, response.body);

      if (response.statusCode == 200) {
        try {
          final Map<String, dynamic> data = json.decode(response.body);
          if (data['element'] != null && data['element'] is List) {
        final List<dynamic> professorList = data['element'];

        return professorList.map((professorData) => Professor.fromJson(professorData)).toList();
        }else {
          print('No Professor found or invalid structure');
          return [];
        }
        } catch (e) {
          throw Exception('Error parsing  data: $e');
        }
      } else {
        throw Exception('Failed to load professor');
      }
    } catch (e) {
      await logRequest(endpoint, 'GET', 'Error', e.toString());
      throw Exception('Error fetching professor: $e');
    }
  }


}
