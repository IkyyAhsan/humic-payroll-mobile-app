import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/compare.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';

class CompareScreenController extends GetxController {
  Compare? compare = Compare();
  bool isLoading = true;
  void getCompare() async {
    compare = await ApprovalServices().getCompareData();
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getCompare();
  }
}
