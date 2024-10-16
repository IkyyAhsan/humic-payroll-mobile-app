import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/expenses_screen/views/expenses_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/home_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/income_screen/views/income_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/more_screen/views/more_screen_view.dart';

class BottomNavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreenView(),
    const IncomeScreenView(),
    const ExpensesScreenView(),
    const MoreScreenView()
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
