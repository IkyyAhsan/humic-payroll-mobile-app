import 'package:get/get.dart';

import '../controllers/approval_detail_screen_controller.dart';

class ApprovalDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApprovalDetailScreenController>(
      () => ApprovalDetailScreenController(),
    );
  }
}
