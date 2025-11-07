import 'package:dio/dio.dart';
import 'package:flutter_line_liff/flutter_line_liff.dart';
import 'package:smart_queue/models/profile_model.dart';
import '../models/shop_model.dart';
import '../models/checkin_result.dart';

class ApiService {
  static const baseUrl = "https://smart-queue-backend.vercel.app/api";
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(seconds: 10),
      receiveTimeout: const Duration(seconds: 10),
      headers: {"Content-Type": "application/json"},
    ),
  );

  static Future<ProfileModel> getUserProfile() async {
    try {
      if (FlutterLineLiff.instance.isLoggedIn) {
        final profile = await FlutterLineLiff.instance.profile;
        return ProfileModel(
          userID: profile.userId,
          displayName: profile.displayName,
          name: profile.displayName,
          pictureUrl: profile.pictureUrl,
        );
      }
      throw Exception('Require login');
    } catch (err) {
      throw Exception(err.toString);
    }
  }

  static Future<CheckinResult> getQueue(String shopId, String userId) async {
    try {
      final response = await _dio.get(
        '/queue',
        queryParameters: {"shopId": shopId, "userId": userId},
      );
      return CheckinResult.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  static Future<ShopModel> getShop(String shopId) async {
    try {
      final response = await _dio.get(
        '/shop',
        queryParameters: {"shopId": shopId},
      );
      return ShopModel.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  static Future<CheckinResult> checkIn({
    required String userId,
    required String name,
    required String profileUrl,
    required String shopId,
    required double lat,
    required double lng,
  }) async {
    try {
      final response = await _dio.post(
        '/checkin',
        data: {
          "userId": userId,
          "name": name,
          "shopId": shopId,
          "profileUrl": profileUrl,
          "lat": lat,
          "lng": lng,
        },
      );

      return CheckinResult.fromJson(response.data['data']);
    } on DioException catch (e) {
      throw Exception(_handleError(e));
    }
  }

  static String _handleError(DioException e) {
    if (e.type == DioExceptionType.connectionTimeout) {
      return "การเชื่อมต่อล้มเหลว: Timeout";
    } else if (e.response != null) {
      return e.response?.data["message"] ?? "เกิดข้อผิดพลาดจากเซิร์ฟเวอร์";
    } else {
      return "ไม่สามารถเชื่อมต่อเซิร์ฟเวอร์ได้";
    }
  }
}
