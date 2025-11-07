part of '../checkin_page.dart';

Widget renderCheckInSection(
  ProfileModel userProfile,
  TextEditingController textController,
  CheckInController controller,
) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Image.asset('assets/images/khamika-logo.jpg', height: 150),
      ProfileCard(
        pictureUrl: userProfile!.pictureUrl,
        displayName: userProfile.displayName,
      ),
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 100.0),
        child: TextFormField(
          controller: textController,
          decoration: InputDecoration(
            isDense: true,
            labelText: 'กรุณากรอกชื่อเล่น',
            labelStyle: TextStyle(color: Color(0xFFDEDEDE)),
            floatingLabelStyle: TextStyle(color: ColorsConfig.primaryColor),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: ColorsConfig.primaryColor,
                width: 2.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: ColorsConfig.primaryColor,
                width: 2.0,
              ),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: ColorsConfig.primaryColor,
                width: 2.0,
              ),
            ),
            filled: true,
            fillColor: Colors.white,
          ),
        ),
      ),
      SizedBox(height: 20),
      SizedBox(
        width: 100,
        height: 50.0,
        child: baseButton(controller.checkin, 'จองคิว'),
      ),
    ],
  );
}
