import 'package:flutter/material.dart';
import 'package:smart_queue/configs/color.dart';
import 'package:smart_queue/controllers/checkin_controller.dart';
import 'package:smart_queue/models/checkin_result.dart';
import 'package:smart_queue/models/profile_model.dart';
import 'package:smart_queue/screens/checkin/widgets/base_button.dart';
import 'package:smart_queue/widgets/profile_detail.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:intl/intl.dart';
import '../../models/shop_model.dart';

part 'widgets/check_in_section.dart';
part 'widgets/queue_detail_section.dart';
part 'widgets/error_distance_section.dart';

class CheckInPage extends StatelessWidget {
  CheckInPage({super.key});
  CheckInController controller = Get.put(CheckInController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsConfig.bgColor,
      body: Obx(() {
        final userProfile = controller.currentUser.value;
        final checkinDetail = controller.checkinDetail.value;
        final shopDetail = controller.shopDetail;
        final isShowErrorDistance = controller.isShowErrorDistance.value;
        Widget content = SizedBox();
        if (isShowErrorDistance) {
          content = renderErrorDistanceSection(shopDetail);
        } else if (checkinDetail != null) {
          content = renderQueueDetailSection(checkinDetail);
        } else if (userProfile != null && !isShowErrorDistance) {
          content = renderCheckInSection(
            userProfile,
            controller.displayNameController,
            controller,
          );
        }
        return Center(
          child: Container(
            width: 500,
            height: 500,
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: 400),
            decoration: BoxDecoration(
              color: Color(0xFFFFFFF6),
              borderRadius: BorderRadius.circular(20.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.25),
                  offset: const Offset(5, 2),
                  blurRadius: 20.0,
                  spreadRadius: 0,
                ),
              ],
            ),
            child: content,
          ),
        );
      }),
    );
  }
}
