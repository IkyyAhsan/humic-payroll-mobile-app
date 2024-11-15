import 'package:get/get.dart';

import '../controllers/planning_detail_screen_controller.dart';

class PlanningDetailScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanningDetailScreenController>(
      () => PlanningDetailScreenController(),
    );
  }
}
