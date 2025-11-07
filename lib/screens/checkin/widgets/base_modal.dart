import 'package:flutter/material.dart';
import 'package:smart_queue/screens/checkin/widgets/base_button.dart';
import 'package:get/get.dart';

openModal(String contentMsg) {
  Get.defaultDialog(
    titlePadding: const EdgeInsets.all(20.0),
    contentPadding: const EdgeInsets.all(20.0),
    title: "เกิดข้อผิดพลาดบางประการ",
    content: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [Text(contentMsg, textAlign: TextAlign.center)],
    ),
    confirm: SizedBox(
      width: 100,
      height: 50.0,
      child: baseButton(Get.back, 'ตกลง'),
    ),
    barrierDismissible: false,
    backgroundColor: Colors.white,
    radius: 10,
  );
}
