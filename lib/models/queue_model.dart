class QueueModel {
  final String lineId;
  final String lineName;
  final String? inputName;
  final int queueNumber;
  final DateTime timestamp;
  final String? pictureUrl;

  QueueModel({
    required this.lineId,
    required this.lineName,
    required this.queueNumber,
    required this.timestamp,
    this.inputName,
    this.pictureUrl,
  });

  factory QueueModel.fromMap(Map<String, dynamic> m) {
    return QueueModel(
      lineId: m['lineId'] ?? '',
      lineName: m['lineName'] ?? '',
      inputName: m['name'],
      queueNumber: (m['queueNumber'] ?? 0) as int,
      timestamp: DateTime.parse(m['timestamp']),
      pictureUrl: m['pictureUrl'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'lineId': lineId,
      'lineName': lineName,
      'name': inputName,
      'queueNumber': queueNumber,
      'timestamp': timestamp.toUtc().toIso8601String(),
      'pictureUrl': pictureUrl,
    };
  }
}
