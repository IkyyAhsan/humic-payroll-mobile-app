import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/login_screen/controllers/login_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';

class HumicLoginForm extends StatelessWidget {
  const HumicLoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final loginController = Get.put(LoginScreenController());
    final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
    return Form(
      key: loginFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // -- Email
          TextFormField(
            controller: loginController.emailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(FluentIcons.person_24_filled),
              hintText: HumicTexts.humicEmailTitle,
              hintStyle: GoogleFonts.plusJakartaSans(
                textStyle: const TextStyle(
                  fontSize: 12, 
                  fontWeight: FontWeight.w500, 
                  color: HumiColors.humicTransparencyColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(
                  color: HumiColors.humicBlackColor
                )
              )
            ),
          ),
          verticalSpace(16),
    
          // -- Password
          Obx(
            () => TextFormField(
              controller: loginController.passwordController,
              obscureText: loginController.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(FluentIcons.lock_closed_24_filled),
                hintText: HumicTexts.humicPasswordTitle,
                hintStyle: GoogleFonts.plusJakartaSans(
                  textStyle: const TextStyle(
                    fontSize: 12, 
                    fontWeight: FontWeight.w500, 
                    color: HumiColors.humicTransparencyColor,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: HumiColors.humicBlackColor
                  )
                ),
                suffixIcon: IconButton(
                  onPressed: () => loginController.hidePassword.value = !loginController.hidePassword.value, 
                  icon: Icon(loginController.hidePassword.value ? FluentIcons.eye_off_24_regular : FluentIcons.eye_24_regular)
                )
              ),
            ),
          ),
        ],
      ),
    );
  }
}
