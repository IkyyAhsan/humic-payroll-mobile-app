import 'package:get/get.dart';

import '../controllers/income_screen_controller.dart';

class IncomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<IncomeScreenController>(
      () => IncomeScreenController(),
    );
  }
}
