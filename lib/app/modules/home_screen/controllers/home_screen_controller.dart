import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/dashboard.dart';
import 'package:humic_payroll_mobile_app/app/services/dashboard_services.dart';

class HomeScreenController extends GetxController {
  Dashboard? dashboardData;
  bool isLoading = true;
  void getDashboardData() async {
    dashboardData = await DashboardServices().getDashboardData();
    isLoading = false;
    update();
  }

  @override
  void onInit() {
    getDashboardData();
    super.onInit();
  }
}
