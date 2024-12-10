import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/login_input.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/services/auth_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final hidePassword = true.obs;
  final isLoginSuccessful = false.obs;
  final isLoading = false.obs;
  AuthServices authServices = AuthServices();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  final box = GetStorage();

  void login() async {
    isLoading(true);
    final data = LoginInput(
        email: emailController.text, password: passwordController.text);

    try {
      bool isLoginSuccessful = await authServices.login(data);
      if (isLoginSuccessful) {
        box.write('isLoggedIn', true);
        Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
        Get.snackbar(
          "Login Successful",
          "You have successfully logged in to HUMIC Payroll Mobile.",
          backgroundColor: HumiColors.humicSecondaryColor,
          colorText: HumiColors.humicWhiteColor,
        );
      } else {
        Get.snackbar(
          "Error",
          "The email and password you entered are incorrect.",
          backgroundColor: HumiColors.humicPrimaryColor,
          colorText: HumiColors.humicWhiteColor,
        );
      }
    } catch (e) {
      Get.snackbar(
        "Unexpected Error",
        "An error occurred while processing your request. Please try again later. Error details: ${e}",
        backgroundColor: HumiColors.humicPrimaryColor,
        colorText: HumiColors.humicWhiteColor,
      );
    } finally {
      isLoading(false);
    }
  }
}
