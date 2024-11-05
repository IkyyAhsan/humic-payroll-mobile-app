import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/planning_input.dart';
import 'package:humic_payroll_mobile_app/app/services/planning_services.dart';

class PlanningScreenController extends GetxController {
  var planningData = <Datum>[].obs;
  var isLoading = true.obs;

  void getPlanningData() async {
    isLoading.value = true;
    final planningResponse = await PlanningServices().getPlanningData();

    if (planningResponse != null) {
      planningData.value = planningResponse.data.data;
      print('Jumlah Data Planning: ${planningData.length}');

      for (var datum in planningData) {
        print(
            'ID: ${datum.id}, Title: ${datum.title}, Status: ${datum.status}, Start Date: ${datum.startDate}');
      }
    } else {
      print('No data received from API');
    }
    isLoading.value = false;
  }

  @override
  void onInit() {
    getPlanningData();
    super.onInit();
  }
}
