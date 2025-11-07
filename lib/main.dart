import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_line_liff/flutter_line_liff.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:get/instance_manager.dart';
import 'package:smart_queue/configs/loading.dart';
import 'package:smart_queue/controllers/checkin_controller.dart';
import 'screens/checkin/checkin_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load(fileName: ".env"); // optional
  try {
    await FlutterLineLiff.instance.init(
      config: Config(liffId: '2008341455-YDeBlKX7'),
    );

    if (!FlutterLineLiff.instance.isLoggedIn) {
      FlutterLineLiff.instance.login();
      return; // หลัง login จะ reload หน้านี้ใหม่
    }

    await FlutterLineLiff.instance.ready;
  } catch (e) {
    print('LIFF init error: $e');
  }
  runApp(const SmartQueueApp());
  configLoading();
}

class SmartQueueApp extends StatelessWidget {
  const SmartQueueApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: BindingsBuilder(() {
        Get.lazyPut<CheckInController>(() => CheckInController());
      }),
      builder: (context, child) => EasyLoading.init()(context, child),
      title: 'Smart Check-in',
      theme: ThemeData(
        primarySwatch: Colors.teal,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: CheckInPage(),
    );
  }
}
