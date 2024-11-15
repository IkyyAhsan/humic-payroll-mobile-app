import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_add_item_screen/controllers/realization_add_item_screen_controller.dart';

class RealizationAddItemScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<RealizationAddItemScreenController>(
      () => RealizationAddItemScreenController(),
    );
  }
}
