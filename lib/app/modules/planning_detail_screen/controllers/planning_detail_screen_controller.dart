import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/show_planning.dart';
import 'package:humic_payroll_mobile_app/app/services/show_planning_services.dart';

class PlanningDetailScreenController extends GetxController {
  ShowPlanning? planningDetailData;
  bool isLoading = true;

  void getPlanningDetailData({int? planningId}) async {
    if (planningId == null) {
      var id = Get.arguments['id'];

      planningId = id;
    }
    isLoading = true;
    planningDetailData =
        await ShowPlanningServices().getShowPlanning(planningId ?? 0);
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getPlanningDetailData();
  }
}
