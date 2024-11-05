import 'package:get/get.dart';

import '../controllers/compare_details_screen_controller.dart';

class CompareDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CompareDetailsScreenController>(
      () => CompareDetailsScreenController(),
    );
  }
}
