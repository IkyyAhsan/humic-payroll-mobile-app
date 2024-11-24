import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/approve.dart';
import 'package:humic_payroll_mobile_app/app/data/models/income.dart';
import 'package:humic_payroll_mobile_app/app/services/approval_services.dart';
import 'package:humic_payroll_mobile_app/app/services/finance_services.dart';

class ApprovalScreenController extends GetxController {
  var approvalData = Approve();
  var incomeData = UserIncome();
  var isPlanning = true;
  var isLoading = true;
  void getApprovalData() async {
    isPlanning = true;

    final approvalResponse = await ApprovalServices().getApproveData();

    if (approvalResponse != null) {
      approvalData = approvalResponse;
    } else {
      print('No data received from API');
    }

    isLoading = false;
    update();
  }

  void getIncomeData() async {
    isLoading = true;
    final approvalResponse = await FinanceServices().getFinance();

    if (approvalResponse != null) {
      incomeData = approvalResponse;
    } else {
      print('No data received from API');
    }

    isLoading = false;
    update();
  }

  void updateFinance(int id) async {
    print(await ApprovalServices()
        .updatePlanningStatusById(id: id, status: "approve"));
  }

  void deletedFinance(int id) async {
    print(await ApprovalServices()
        .updatePlanningStatusById(id: id, status: "decline"));
  }

  void updateTransaction(int id) async {
    print(
        await FinanceServices().updateStatusFinance(id: id, status: "approve"));
  }

  void deleteTransaction(int id) async {
    print(
        await FinanceServices().updateStatusFinance(id: id, status: "decline"));
  }

  void togglePlanning() {
    isPlanning = true;
    update();
  }

  void toggleTransaction() {
    isPlanning = false;
    getIncomeData();
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getApprovalData();
    getIncomeData();
  }
}
