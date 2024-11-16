import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/dashboard.dart';
import 'package:humic_payroll_mobile_app/app/services/dashboard_services.dart';

class ExpensesScreenController extends GetxController {
  var userExpensesData = Dashboard().obs;
  var isLoading = true.obs;

  void getExpensesData() async {
    isLoading.value = true;
    userExpensesData.value = (await DashboardServices().getDashboardData())!;
    print(userExpensesData.value.data?.monthlyExpense);
    isLoading.value = false;
    update();
  }
}
