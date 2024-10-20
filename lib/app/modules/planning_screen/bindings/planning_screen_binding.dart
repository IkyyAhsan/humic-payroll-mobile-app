import 'package:get/get.dart';

import '../controllers/planning_screen_controller.dart';

class PlanningScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanningScreenController>(
      () => PlanningScreenController(),
    );
  }
}
