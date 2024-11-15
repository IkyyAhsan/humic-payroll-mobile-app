import 'package:get/get.dart';

import '../controllers/realization_detail_screen_controller.dart';

class RealizationDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RealizationDetailScreenController>(
      () => RealizationDetailScreenController(),
    );
  }
}
