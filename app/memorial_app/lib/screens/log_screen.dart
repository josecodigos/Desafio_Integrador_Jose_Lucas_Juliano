import 'package:flutter/material.dart';
import '../services/database_helper.dart';
import '../models/log.dart';

class LogScreen extends StatefulWidget {
  @override
  _LogScreenState createState() => _LogScreenState();
}

class _LogScreenState extends State<LogScreen> {
  final DatabaseHelper dbHelper = DatabaseHelper();
  List<Log> logs = [];

  @override
  void initState() {
    super.initState();
    _fetchLogs();
  }

  Future<void> _fetchLogs() async {
    final data = await dbHelper.getLogs();
    setState(() {
      logs = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Request Logs')),
      body: logs.isEmpty
          ? Center(child: Text('No logs available'))
          : ListView.builder(
              itemCount: logs.length,
              itemBuilder: (context, index) {
                final log = logs[index];
                return ListTile(
                  title: Text('${log.method} ${log.endpoint}'),
                  subtitle: Text(
                    'Status: ${log.status}\nResponse: ${log.responseMessage}\nTime: ${log.timestamp}',
                  ),
                );
              },
            ),
    );
  }
}
