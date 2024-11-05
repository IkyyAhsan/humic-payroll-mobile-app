import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/views/home_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/more_screen/views/more_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_screen/views/planning_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/realization_screen/views/realization_screen_view.dart';

class BottomNavigationBarController extends GetxController {
  final Rx<int> selectedIndex = 0.obs;

  final screens = [
    const HomeScreenView(),
    const PlanningScreenView(),
    const RealizationScreenView(),
    const MoreScreenView()
  ];

  void changeIndex(int index) {
    selectedIndex.value = index;
  }
}
