import 'package:get/get.dart';

import '../controllers/compare_screen_controller.dart';

class CompareScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareScreenController>(
      () => CompareScreenController(),
    );
  }
}
