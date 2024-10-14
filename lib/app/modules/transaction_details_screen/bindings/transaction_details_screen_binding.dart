import 'package:get/get.dart';

import '../controllers/transaction_details_screen_controller.dart';

class TransactionDetailsScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionDetailsScreenController>(
      () => TransactionDetailsScreenController(),
    );
  }
}
