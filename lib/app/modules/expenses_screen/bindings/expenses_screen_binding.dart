import 'package:get/get.dart';

import '../controllers/expenses_screen_controller.dart';

class ExpensesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExpensesScreenController>(
      () => ExpensesScreenController(),
    );
  }
}
