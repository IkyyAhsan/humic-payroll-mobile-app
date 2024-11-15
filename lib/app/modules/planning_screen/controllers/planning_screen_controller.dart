import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/planning.dart';
import 'package:humic_payroll_mobile_app/app/services/planning_services.dart';

class PlanningScreenController extends GetxController {
  var planningData = <Datum>[].obs;
  var pageData = <Datum>[].obs;
  var isLoading = true.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 1.obs;

  void addPagination() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      getPlanningData(currentPage.value);
    }
  }

  void decrementPagination() {
    if (currentPage.value > 1) {
      currentPage.value--;
      getPlanningData(currentPage.value);
    }
  }

  void getPlanningData(int index) async {
    isLoading.value = true;

    final planningResponse =
        await PlanningServices().getPlanningData(page: index);

    if (planningResponse != null) {
      planningData.value = planningResponse.data.data;

      totalPages.value = planningResponse.data.lastPage;

      pageData.value = planningData;
    } else {
      print('No data received from API');
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    getPlanningData(currentPage.value);
    super.onInit();
  }
}
