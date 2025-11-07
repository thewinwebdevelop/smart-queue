part of '../checkin_page.dart';

Widget renderQueueDetailSection(CheckinResult result) {
  final date = DateFormat("dd/MM/yyyy HH:mm").format(result.checkinTime);

  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/khamika-logo.jpg', height: 150),
      SizedBox(height: 30.0),
      Text(
        'ยินดีด้วยคุณ "${result.name}"',
        style: TextStyle(color: ColorsConfig.mainTextColor, fontSize: 24.0),
        maxLines: 2,
      ),
      Text(
        'ได้คิวที่ ${result.queueNumber.toString()}',
        style: TextStyle(color: ColorsConfig.mainTextColor, fontSize: 20.0),
      ),
      SizedBox(height: 30.0),
      Text(
        "เวลาจองคิว: $date",
        maxLines: 2,
        style: TextStyle(color: ColorsConfig.mainTextColor, fontSize: 16.0),
      ),
    ],
  );
}
