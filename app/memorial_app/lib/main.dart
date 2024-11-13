import 'dart:io';
import '/screens/homeScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

import 'providers/aluno_provider.dart';
import 'providers/atividade_provider.dart';
import 'providers/curso_provider.dart';
import 'providers/professor_provider.dart';

void main() {
  if (Platform.isWindows || Platform.isLinux || Platform.isMacOS) {
    databaseFactory = databaseFactoryFfi;
  }

runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => AlunoProvider()),
        ChangeNotifierProvider(create: (_) => AtividadeProvider()),
        ChangeNotifierProvider(create: (_) => CursoProvider()),
        ChangeNotifierProvider(create: (_) => ProfessorProvider()),
      ],
      child: MaterialApp(
        title: 'Memorial app',
        home: HomeScreen(),
      ),
    );
  }
}


