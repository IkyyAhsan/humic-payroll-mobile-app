import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/register_input.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/services/auth_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';

class RegisterScreenController extends GetxController {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final hidePassword = true.obs;
  final hideConfirmPassword = true.obs;
  final isRegisterSuccessful = false.obs;
  final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
  AuthServices authServices = AuthServices();

  void register() async {
    final data = RegisterInput(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        passwordConfirmation: confirmPasswordController.text);
    bool isRegisterSuccessful = await authServices.registers(data);
    if (isRegisterSuccessful) {
      Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
      Get.snackbar(
        "Registration Successful",
        "Your account has been created. Welcome!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: HumiColors.humicSecondaryColor,
        colorText: HumiColors.humicWhiteColor,
        duration: const Duration(seconds: 3),
      );
    } else {
      Get.snackbar(
        "Registration Failed",
        authServices.message.isNotEmpty
            ? authServices.message
            : "An error occurred during registration. Please try again. ${authServices.message}",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: HumiColors.humicPrimaryColor,
        colorText: HumiColors.humicWhiteColor,
        icon: const Icon(
          Icons.error,
          color: HumiColors.humicWhiteColor,
        ),
        duration: const Duration(seconds: 3),
      );
    }
  }
}
