class CheckinResult {
  final String userId;
  final String name;
  final String profileUrl;
  final int queueNumber;
  final DateTime checkinTime;

  CheckinResult({
    required this.userId,
    required this.name,
    required this.profileUrl,
    required this.queueNumber,
    required this.checkinTime,
  });

  factory CheckinResult.fromJson(Map<String, dynamic> json) {
    DateTime utcTime = DateTime.parse(json['timestamp']);
    DateTime thailandTime = utcTime.add(Duration(hours: 7));
    return CheckinResult(
      userId: json['userId'],
      name: json['name'],
      profileUrl: json['profileUrl'],
      queueNumber: json['queueNumber'],
      checkinTime: thailandTime,
    );
  }
}
