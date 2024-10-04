import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/register_screen/controllers/register_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';

class HumicRegisterForm extends StatelessWidget {
  const HumicRegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    final registerController = Get.put(RegisterScreenController());
    final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();
    return Form(
      key: registerFormKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // -- Email
          TextFormField(
            controller: registerController.emailController,
            decoration: InputDecoration(
              prefixIcon: const Icon(FluentIcons.person_20_regular),
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
              controller: registerController.passwordController,
              obscureText: registerController.hidePassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(FluentIcons.lock_closed_20_regular),
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
                  onPressed: () => registerController.hidePassword.value = !registerController.hidePassword.value, 
                  icon: Icon(registerController.hidePassword.value ? FluentIcons.eye_off_20_regular : FluentIcons.eye_20_regular)
                )
              ),
            ),
          ),
          verticalSpace(16),

          // -- Confirm Password
          Obx(
            () => TextFormField(
              controller: registerController.confirmPasswordController,
              obscureText: registerController.hideConfirmPassword.value,
              decoration: InputDecoration(
                prefixIcon: const Icon(FluentIcons.lock_closed_20_regular),
                hintText: HumicTexts.humicConfirmPasswordTitle,
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
                  onPressed: () => registerController.hideConfirmPassword.value = !registerController.hideConfirmPassword.value, 
                  icon: Icon(registerController.hideConfirmPassword.value ? FluentIcons.eye_off_20_regular : FluentIcons.eye_20_regular)
                )
              ),
            ),
          ),
        ],
      )
    );
  }
}