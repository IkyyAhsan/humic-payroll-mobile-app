import 'package:get/get.dart';

import '../controllers/realization_edit_item_screen_controller.dart';

class RealizationEditItemScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RealizationEditItemScreenController>(
      () => RealizationEditItemScreenController(),
    );
  }
}
