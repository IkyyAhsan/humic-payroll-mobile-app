import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/register_screen/views/register_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';

class HumicSignupButton extends StatelessWidget {
  const HumicSignupButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          HumicTexts.humicRegisterQuestion,
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: HumiColors.humicTransparencyColor,
            )
          ),
        ),
        TextButton(
          onPressed: () => Get.to(() => const RegisterScreenView()), 
          child: Text(
            HumicTexts.humicRegisterButton,
            style: GoogleFonts.plusJakartaSans(
              textStyle: const TextStyle(
                fontSize: 14,
                decoration: TextDecoration.underline,
                decorationColor: HumiColors.humicPrimaryColor,
                decorationThickness: 2,
                fontWeight: FontWeight.w500, 
                color: HumiColors.humicPrimaryColor
              ),
            ),
          ),
        ),
      ],
    );
  }
}