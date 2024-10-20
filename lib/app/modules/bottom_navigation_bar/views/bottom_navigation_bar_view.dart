import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/home_screen/controllers/home_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import '../controllers/bottom_navigation_bar_controller.dart';

class BottomNavigationBarView extends GetView<BottomNavigationBarController> {
  const BottomNavigationBarView({super.key});
  @override
  Widget build(BuildContext context) {
    final bottomNavbarController = Get.put(BottomNavigationBarController());
    final homeScreenController = Get.put(HomeScreenController());

    return Scaffold(
        backgroundColor: HumiColors.humicBackgroundColor,
        bottomNavigationBar: Obx(
          () => NavigationBar(
              indicatorColor: HumiColors.humicPrimaryColor.withOpacity(0.12),
              indicatorShape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              height: 70,
              elevation: 0,
              backgroundColor: HumiColors.humicWhiteColor,
              selectedIndex: bottomNavbarController.selectedIndex.value,
              onDestinationSelected: (index) =>
                  bottomNavbarController.selectedIndex.value = index,
              destinations: [
                const NavigationDestination(
                  icon: Icon(
                    FluentIcons.home_24_regular,
                    color: HumiColors.humicTransparencyColor,
                  ),
                  selectedIcon: Icon(FluentIcons.home_24_filled,
                      color: HumiColors.humicPrimaryColor),
                  label: "Home",
                ),
                NavigationDestination(
                    icon: Image.asset(
                      HumicImages.humicIncomeUnselectedIcon,
                      width: 32,
                      color: HumiColors.humicTransparencyColor,
                    ),
                    selectedIcon: Image.asset(
                      HumicImages.humicIncomeSelectedIcon,
                      width: 32,
                    ),
                    label: "Income"),
                NavigationDestination(
                    icon: Image.asset(
                      HumicImages.humicExpensesUnselectedIcon,
                      width: 32,
                      color: HumiColors.humicTransparencyColor,
                    ),
                    selectedIcon: Image.asset(
                      HumicImages.humicExpensesSelectedIcon,
                      width: 32,
                    ),
                    label: "Expenses"),
                const NavigationDestination(
                    icon: Icon(
                      FluentIcons.more_horizontal_24_regular,
                      color: HumiColors.humicTransparencyColor,
                      weight: 100,
                    ),
                    selectedIcon: Icon(
                      FluentIcons.more_horizontal_24_filled,
                      color: HumiColors.humicPrimaryColor,
                      weight: 100,
                    ),
                    label: "More"),
              ]),
        ),
        body: Obx(() => bottomNavbarController
            .screens[bottomNavbarController.selectedIndex.value]));
  }
}
