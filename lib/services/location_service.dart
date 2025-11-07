import 'package:geolocator/geolocator.dart';

class LocationService {
  static Future<Position> getCurrentPosition() async {
    bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      throw Exception("กรุณาเปิดบริการตำแหน่ง (GPS)");
    }
    LocationPermission permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.denied ||
        permission == LocationPermission.deniedForever) {
      throw Exception("ไม่ได้รับอนุญาตให้เข้าถึงตำแหน่งกรุณา allow location");
    }
    await Future.delayed(const Duration(seconds: 1));
    for (int i = 0; i < 3; i++) {
      try {
        final position = await Geolocator.getCurrentPosition();
        return position;
      } catch (e) {
        await Future.delayed(const Duration(seconds: 1));
        continue;
      }
    }
    throw Exception("ไม่สามารถรับตำแหน่งได้จาก CoreLocation");
  }
}
