import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/income_expense.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';

class ExpensesScreenController extends GetxController {
  var userExpensesData = IncomeExpense().obs;
  var isLoading = true.obs;

  void getExpensesData() async {
    isLoading.value = true;
    userExpensesData.value =
        await ApprovalServices().getExpenseData() ?? IncomeExpense();
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getExpensesData();
  }
}
