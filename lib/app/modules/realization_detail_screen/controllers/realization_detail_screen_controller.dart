import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/show_realization.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_screen/controllers/realization_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/services/realization_services.dart';
import 'package:humic_payroll_mobile_app/app/services/show_realization_services.dart';

class RealizationDetailScreenController extends GetxController {
  ShowRealization? realizationDetailData;
  bool isLoading = true;
  bool isRealization = false;

  var id = Get.arguments['id'];
  void getRealizationDetailData() async {
    isLoading = true;
    realizationDetailData =
        await ShowRealizationServices().getShowRealization(id);
    isLoading = false;
    update();
  }

  void delete() async {
    isRealization = await RealizationServices().deleteItem(id);
    if (isRealization) {
      getRealizationDetailData();
    }
    var controller = Get.put(RealizationScreenController());
    controller.getRealizationData();
  }

  @override
  void onInit() {
    super.onInit();
    getRealizationDetailData();
  }
}
