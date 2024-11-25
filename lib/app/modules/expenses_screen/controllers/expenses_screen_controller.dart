import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/income_expense.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';

class ExpensesScreenController extends GetxController {
  var userExpensesData = IncomeExpense().obs;
  var expenseTransactions = <Datum>[].obs; // Tambahkan list untuk transaksi
  var isLoading = true.obs;

  // Pagination variables
  var currentPage = 1.obs;
  final int itemsPerPage = 10;

  void getExpensesData({bool reset = false}) async {
    isLoading.value = true;

    if (reset) {
      currentPage.value = 1; // Reset pagination
      expenseTransactions.clear(); // Clear existing data
    }

    // Fetch data for the current page
    var newExpensesData =
        await ApprovalServices().getExpenseData(index: currentPage.value);
    if (newExpensesData != null && newExpensesData.data != null) {
      userExpensesData.value = newExpensesData;

      // Replace data to show only 10 items per page
      expenseTransactions.value =
          newExpensesData.data!.data!.take(itemsPerPage).toList();
    }

    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    getExpensesData(reset: true);
    super.onInit();
  }
}
