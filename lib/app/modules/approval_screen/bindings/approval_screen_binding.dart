import 'package:get/get.dart';

import '../controllers/approval_screen_controller.dart';

class ApprovalScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ApprovalScreenController>(
      () => ApprovalScreenController(),
    );
  }
}
