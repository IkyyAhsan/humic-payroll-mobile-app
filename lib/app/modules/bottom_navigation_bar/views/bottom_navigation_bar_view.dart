import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({super.key});
  @override
  Widget build(BuildContext context) {
    final bottomNavbarController = Get.put(BottomNavigationBarController());
    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          indicatorColor: Colors.transparent,
          indicatorShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          height: 70,
          elevation: 0,
          backgroundColor: HumiColors.humicWhiteColor,
          selectedIndex: bottomNavbarController.selectedIndex.value,
          onDestinationSelected: (index) => bottomNavbarController.selectedIndex.value = index,
          destinations: [
            const NavigationDestination(icon: Icon(FluentIcons.home_24_regular, color: HumiColors.humicTransparencyColor,), selectedIcon: Icon(FluentIcons.home_24_filled, color: HumiColors.humicPrimaryColor),label: "Home"),
            NavigationDestination(icon: Image.asset(HumicImages.humicIncomeUnselectedIcon, width: 32, color: HumiColors.humicTransparencyColor,), selectedIcon: Image.asset(HumicImages.humicIncomeSelectedIcon, width: 32,) ,label: "Income"),
            NavigationDestination(icon: Image.asset(HumicImages.humicExpensesUnselectedIcon, width: 32, color: HumiColors.humicTransparencyColor,),  selectedIcon: Image.asset(HumicImages.humicExpensesSelectedIcon, width: 32,), label: "Expenses"),
            const NavigationDestination(icon: const Icon(FluentIcons.more_horizontal_24_regular, color: HumiColors.humicTransparencyColor), selectedIcon: Icon(FluentIcons.more_horizontal_24_filled, color: HumiColors.humicPrimaryColor),label: "More"),
          ]
        ),
      ),
      body: Obx(() => bottomNavbarController.screens[bottomNavbarController.selectedIndex.value])
    );
  }
}
