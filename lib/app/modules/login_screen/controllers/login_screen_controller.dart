import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/data/models/input/login_input.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/services/auth_services.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreenController extends GetxController {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final hidePassword = true.obs;
  final isLoginSuccessful = false.obs;
  final isLoading = false.obs;
  AuthServices authServices = AuthServices();
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  @override
  void onInit() {
    super.onInit();
    _checkSavedCredentials();
  }

  // Mengecek kredensial yang sudah tersimpan di SharedPreferences
  Future<void> _checkSavedCredentials() async {
    final prefs = await SharedPreferences.getInstance();
    final String? savedEmail = prefs.getString('email');
    final String? savedPassword = prefs.getString('password');

    // Jika email dan password ditemukan, otomatis login
    if (savedEmail != null && savedPassword != null) {
      emailController.text = savedEmail;
      passwordController.text = savedPassword;
      login(); // Proses login otomatis
    }
  }

  // Proses login
  void login() async {
    isLoading(true);
    final data = LoginInput(
        email: emailController.text, password: passwordController.text);

    try {
      bool isLoginSuccessful = await authServices.login(data);
      if (isLoginSuccessful) {
        final prefs = await SharedPreferences.getInstance();
        // Menyimpan email dan password setelah login berhasil
        await prefs.setString('email', emailController.text);
        await prefs.setString('password', passwordController.text);
        await prefs.setBool(
            'isLoggedIn', true); // Menandakan bahwa pengguna sudah login

        Get.offAllNamed(
            Routes.BOTTOM_NAVIGATION_BAR); // Pindah ke halaman utama
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

  // Logout dan reset status login serta menghapus kredensial
  Future<void> logout() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(
        'isLoggedIn', false); // Menandakan bahwa pengguna telah logout
    await prefs.remove('email'); // Menghapus email dari SharedPreferences
    await prefs.remove('password'); // Menghapus password dari SharedPreferences
  }
}
