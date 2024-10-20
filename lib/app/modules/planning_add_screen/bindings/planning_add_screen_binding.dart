import 'package:get/get.dart';

import '../controllers/planning_add_screen_controller.dart';

class PlanningAddScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanningAddScreenController>(
      () => PlanningAddScreenController(),
    );
  }
}
