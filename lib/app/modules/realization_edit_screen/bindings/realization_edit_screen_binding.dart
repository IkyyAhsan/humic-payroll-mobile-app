import 'package:get/get.dart';

import '../controllers/realization_edit_screen_controller.dart';

class RealizationEditScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RealizationEditScreenController>(
      () => RealizationEditScreenController(),
    );
  }
}
