import 'package:get/get.dart';

import '../controllers/add_income_screen_controller.dart';

class AddIncomeScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddIncomeScreenController>(
      () => AddIncomeScreenController(),
    );
  }
}
