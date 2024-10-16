import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/login_screen/views/login_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';

class HumicSigninButton extends StatelessWidget {
  const HumicSigninButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          HumicTexts.humicLoginQuestion,
          style: GoogleFonts.plusJakartaSans(
              textStyle: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: HumiColors.humicTransparencyColor,
          )),
        ),
        TextButton(
          onPressed: () => Get.offAll(() => const LoginScreenView()),
          child: Text(
            HumicTexts.humicLoginTextButton,
            style: GoogleFonts.plusJakartaSans(
              textStyle: const TextStyle(
                  fontSize: 14,
                  decoration: TextDecoration.underline,
                  decorationColor: HumiColors.humicPrimaryColor,
                  decorationThickness: 2,
                  fontWeight: FontWeight.w500,
                  color: HumiColors.humicPrimaryColor),
            ),
          ),
        ),
      ],
    );
  }
}
