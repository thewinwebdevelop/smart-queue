import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:smart_queue/configs/color.dart';
import 'package:smart_queue/models/checkin_result.dart';
import 'package:smart_queue/models/profile_model.dart';
import 'package:smart_queue/models/shop_model.dart';
import 'package:smart_queue/screens/checkin/widgets/base_modal.dart';
import 'package:smart_queue/services/api_service.dart';
import 'package:smart_queue/services/location_service.dart';
import 'package:smart_queue/utils/distance.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';

class CheckInController extends GetxController {
  String shopId = '';
  final currentUser = Rxn<ProfileModel>();
  final checkinDetail = Rxn<CheckinResult>();
  ShopModel? shopDetail;
  TextEditingController displayNameController = TextEditingController();
  RxBool isShowErrorDistance = false.obs;
  @override
  void onReady() {
    super.onReady();
    init();
  }

  Future<void> checkDistance() async {
    try {
      final position = await LocationService.getCurrentPosition();
      if (shopDetail != null) {
        double distance = distanceMeters(
          position.latitude,
          position.longitude,
          shopDetail!.lat,
          shopDetail!.lng,
        );
        print('++++ distance $distance');
        if (distance > 10) {
          openModal(
            'iff position.latitude ${position.latitude}, position.longitude ${position.longitude}',
          );
          isShowErrorDistance.value = true;
        } else {
          openModal(
            'else position.latitude ${position.latitude}, position.longitude ${position.longitude}',
          );
        }
      }
    } catch (err) {
      openModal(err.toString());
      rethrow;
    }
  }

  Future<void> init() async {
    final uri = Uri.base;
    final params = uri.queryParameters;
    shopId = params['shopId'] ?? '';

    try {
      EasyLoading.show(status: "Loading...");
      await getShopDetail();
      await getUserProfile();
      await getQueueDetail();
    } catch (err) {
      final errorMessgae = err as Exception? ?? "";
      if (errorMessgae.toString().contains('data not found')) {
        await checkDistance();
      } else {
        openModal(err.toString());
      }
    } finally {
      EasyLoading.dismiss();
    }
  }

  Future<void> getShopDetail() async {
    shopDetail = await ApiService.getShop(shopId);
  }

  Future<void> getUserProfile() async {
    currentUser.value = await ApiService.getUserProfile();
  }

  Future<void> getQueueDetail() async {
    if (currentUser.value?.userID != null) {
      checkinDetail.value = await ApiService.getQueue(
        shopId,
        currentUser.value!.userID,
      );
    }
  }

  Future<void> checkin() async {
    try {
      if (currentUser.value?.userID != null) {
        EasyLoading.show(status: "Loading...");
        final position = await LocationService.getCurrentPosition();
        print('+++++ position.latitude ${position.latitude}');
        print('+++++ position.longitude ${position.longitude}');

        checkinDetail.value = await ApiService.checkIn(
          userId: currentUser.value!.userID,
          shopId: shopId,
          profileUrl: currentUser.value!.pictureUrl ?? "",
          name: displayNameController.text,
          lat: position.latitude,
          lng: position.longitude,
        );
      }
    } catch (err) {
      openModal(err.toString());
    } finally {
      EasyLoading.dismiss();
    }
  }
}
