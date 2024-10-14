import 'package:get/get.dart';

import '../controllers/export_screen_controller.dart';

class ExportScreenBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ExportScreenController>(
      () => ExportScreenController(),
    );
  }
}
