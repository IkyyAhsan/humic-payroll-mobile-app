import 'package:get/get.dart';

import '../controllers/add_expenses_screen_controller.dart';

class AddExpensesScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddExpensesScreenController>(
      () => AddExpensesScreenController(),
    );
  }
}
