import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/controllers/bottom_navigation_bar_controller.dart';
import 'app/routes/app_pages.dart';

void main() async {
  Get.put(BottomNavigationBarController());
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      title: "HUMIC Engineering Payroll Mobile App",
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
