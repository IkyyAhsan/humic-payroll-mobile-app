import 'package:get/get.dart';

import '../controllers/planning_edit_screen_controller.dart';

class PlanningEditScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanningEditScreenController>(
      () => PlanningEditScreenController(),
    );
  }
}
