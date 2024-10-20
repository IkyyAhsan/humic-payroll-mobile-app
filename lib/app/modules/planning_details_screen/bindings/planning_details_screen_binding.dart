import 'package:get/get.dart';

import '../controllers/planning_details_screen_controller.dart';

class PlanningDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanningDetailsScreenController>(
      () => PlanningDetailsScreenController(),
    );
  }
}
