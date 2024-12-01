import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/planning.dart';
import 'package:humic_payroll_mobile_app/app/services/planning_services.dart';

class PlanningScreenController extends GetxController {
  var planningData = <Datum>[].obs;
  var pageData = <Datum>[].obs;
  var isLoading = true.obs;
  RxInt currentPage = 1.obs;
  RxInt totalPages = 1.obs;

  var selectedPlanningYear = DateTime.now().year.obs;

  DateTime convertYearToDateTime(int year) {
    return DateTime(year, 1, 1);
  }

  void fetchDataForYear(DateTime selectedDate) {
    int selectedYear = selectedDate.year;

    getPlanningData(year: selectedYear, index: currentPage.value);
  }

  void updatePlanningYear(int year) {
    selectedPlanningYear.value = year;
    DateTime selectedDate = convertYearToDateTime(year);
    fetchDataForYear(selectedDate);
  }

  void addPagination() {
    if (currentPage.value < totalPages.value) {
      currentPage.value++;
      fetchDataForYear(convertYearToDateTime(selectedPlanningYear.value));
    }
  }

  void decrementPagination() {
    if (currentPage.value > 1) {
      currentPage.value--;
      fetchDataForYear(convertYearToDateTime(selectedPlanningYear.value));
    }
  }

  void getPlanningData({int? index = 0, int? year}) async {
    isLoading.value = true;

    final planningResponse =
        await PlanningServices().getPlanningData(page: index, year: year);
    print(planningResponse?.data);
    if (planningResponse != null) {
      planningData.value = planningResponse.data.data;
      totalPages.value = planningResponse.data.lastPage;
      pageData.value = planningData;
      print(pageData);
    } else {
      pageData.value = [];
    }

    isLoading.value = false;
  }

  @override
  void onInit() {
    fetchDataForYear(convertYearToDateTime(selectedPlanningYear.value));
    super.onInit();
  }
}
