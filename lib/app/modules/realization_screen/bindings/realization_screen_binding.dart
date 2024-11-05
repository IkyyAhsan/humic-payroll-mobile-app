import 'package:get/get.dart';

import '../controllers/realization_screen_controller.dart';

class RealizationScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RealizationScreenController>(
      () => RealizationScreenController(),
    );
  }
}
