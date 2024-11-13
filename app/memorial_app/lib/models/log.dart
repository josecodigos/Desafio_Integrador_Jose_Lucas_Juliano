class Log {
  final int? id;
  final String endpoint;
  final String method;
  final String status;
  final String responseMessage;
  final DateTime timestamp;

  Log({
    this.id,
    required this.endpoint,
    required this.method,
    required this.status,
    required this.responseMessage,
    required this.timestamp,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'endpoint': endpoint,
      'method': method,
      'status': status,
      'responseMessage': responseMessage,
      'timestamp': timestamp.toIso8601String(),
    };
  }

  factory Log.fromMap(Map<String, dynamic> map) {
    return Log(
      id: map['id'],
      endpoint: map['endpoint'],
      method: map['method'],
      status: map['status'],
      responseMessage: map['responseMessage'],
      timestamp: DateTime.parse(map['timestamp']),
    );
  }
}
