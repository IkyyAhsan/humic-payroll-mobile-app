import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/income.dart';
import 'package:humic_payroll_mobile_app/app/services/income_services.dart';

class IncomeScreenController extends GetxController {
  var userIncomeData = UserIncome().obs;
  var incomeTransactions = <Datum>[].obs;
  var isLoading = true.obs;

  // Pagination variables
  var currentPage = 1.obs;
  final int itemsPerPage = 10;

  void getUserIncomeData({bool reset = false}) async {
    isLoading.value = true;

    if (reset) {
      currentPage.value = 1; // Reset pagination
      incomeTransactions.clear(); // Clear existing data
    }

    // Fetch data for the current page
    var newUserIncomeData =
        await UserIncomeServices().getUserIncome(index: currentPage.value);
    if (newUserIncomeData != null && newUserIncomeData.data != null) {
      userIncomeData.value = newUserIncomeData;

      // Replace data to show only 10 items per page
      incomeTransactions.value =
          newUserIncomeData.data!.data!.take(itemsPerPage).toList();
    }

    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    getUserIncomeData(reset: true);
    super.onInit();
  }
}
