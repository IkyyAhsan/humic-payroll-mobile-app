import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  void login() async {
    isLoading(true);
    final data = LoginInput(
        email: emailController.text, password: passwordController.text);

    try {
      bool isLoginSuccessful = await authServices.login(data);
      if (isLoginSuccessful) {
        Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
        Get.snackbar(
          "Login Successful",
          "Welcome to HUMIC Payroll Mobile",
          backgroundColor: HumiColors.humicPrimaryColor,
          colorText: HumiColors.humicWhiteColor,
        );
      } else {
        Get.snackbar("There is an error",
            "The email or password you entered is incorrect.",
            backgroundColor: HumiColors.humicPrimaryColor,
            colorText: HumiColors.humicWhiteColor);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        "Something went wrong. Please try again later.",
        backgroundColor: HumiColors.humicPrimaryColor,
        colorText: HumiColors.humicWhiteColor,
      );
    } finally {
      isLoading(false);
    }
  }
}
