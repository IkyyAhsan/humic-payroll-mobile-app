import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:humic_payroll_mobile_app/app/modules/login_screen/views/widgets/action_button.dart';
import 'package:humic_payroll_mobile_app/app/modules/login_screen/views/widgets/authentication_icon.dart';
import 'package:humic_payroll_mobile_app/app/modules/register_screen/views/widgets/register_form.dart';
import 'package:humic_payroll_mobile_app/app/modules/register_screen/views/widgets/register_title.dart';
import 'package:humic_payroll_mobile_app/app/modules/register_screen/views/widgets/signin_button.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';
import '../controllers/register_screen_controller.dart';

class RegisterScreenView extends GetView<RegisterScreenController> {
  const RegisterScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(RegisterScreenController());
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                verticalSpace(42),
                const HumicAuthenticationIcon(),
                verticalSpace(20),
                const HumicRegisterTitle(),
                verticalSpace(80),
                const HumicRegisterForm(),
                verticalSpace(40),
                HumicButton(
                  onPressed: controller.register,
                  buttonTitle: HumicTexts.humicRegisterButton,
                ),
                verticalSpace(50),
                const HumicSigninButton(),
              ],
            ),
          ),
        ),
      )),
    );
  }
}
