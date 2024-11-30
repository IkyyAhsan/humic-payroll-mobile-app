import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/profile.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/show_planning.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_screen/controllers/planning_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/services/planning_services.dart';
import 'package:humic_payroll_mobile_app/app/services/show_planning_services.dart';

class PlanningDetailScreenController extends GetxController {
  ShowPlanning? planningDetailData;
  bool isLoading = true;
  UserProfile? userProfileData;

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

  void deletePlanning({int? id}) async {
    print(id);
    final data = await PlanningServices().deletePlanning(id: id);
    if (data) {
      Get.back();
      var controller = Get.put(PlanningScreenController());
      controller.getPlanningData(index: controller.currentPage.value);
      controller.update();
    }
  }

  @override
void onInit() {
  super.onInit();
  var id = Get.arguments?['id'];
  if (id == null) {
    print("Error: No planningId provided");
  } else {
    getPlanningDetailData(planningId: id);
  }
}

}
