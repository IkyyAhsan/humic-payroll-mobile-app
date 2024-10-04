import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';
import 'widgets/action_button.dart';
import 'widgets/login_form.dart';
import 'widgets/authentication_icon.dart';
import 'widgets/login_title.dart';
import 'widgets/signup_button.dart';

class LoginScreenView extends GetView<LoginScreenController> {
  const LoginScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16
          ),
          child: SingleChildScrollView(
            child: Center(
              child: Column(
                children: [
                  verticalSpace(42),
                  const HumicAuthenticationIcon(),
                  
                  verticalSpace(20),
                  const HumicLoginTitle(),
            
                  verticalSpace(80),
                  const HumicLoginForm(),
            
                  verticalSpace(40),
                  HumicButton(
                    onPressed: () => Get.offAll(() => const BottomNavigationBarView()), 
                    buttonTitle: HumicTexts.humicLoginButton,
                  ),
            
                  verticalSpace(50),
                  const HumicSignupButton(),

                  
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}