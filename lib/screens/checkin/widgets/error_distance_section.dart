part of '../checkin_page.dart';

Widget renderErrorDistanceSection(ShopModel? shopdetail) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/khamika-logo.jpg', height: 150),
      Padding(
        padding: const EdgeInsets.all(20.0),
        child: Text(
          'กรุณา Check-in ที่หน้าร้าน ${shopdetail?.name ?? ""} ในระยะไม่เกิน 10 เมตร',
          style: TextStyle(color: ColorsConfig.mainTextColor, fontSize: 20.0),
          textAlign: TextAlign.center,
          maxLines: 2,
        ),
      ),
    ],
  );


}
