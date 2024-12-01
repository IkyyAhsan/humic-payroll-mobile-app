import 'package:get/get.dart';

import '../controllers/planning_edit_item_screen_controller.dart';

class PlanningEditItemScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PlanningEditItemScreenController>(
      () => PlanningEditItemScreenController(),
    );
  }
}
