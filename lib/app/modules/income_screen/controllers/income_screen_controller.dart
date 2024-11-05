import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/income.dart';
import 'package:humic_payroll_mobile_app/app/services/income_services.dart';

class IncomeScreenController extends GetxController {
  var userIncomeData = UserIncome().obs;
  var incomeTransactions = <Datum>[].obs;
  var isLoading = true.obs;

  void getUserIncomeData() async {
    isLoading.value = true;
    userIncomeData.value = (await UserIncomeServices().getUserIncome())!;
    print(userIncomeData.value.data?.data);
    isLoading.value = false;
    update();
  }

  @override
  void onInit() {
    getUserIncomeData();
    super.onInit();
  }
}
