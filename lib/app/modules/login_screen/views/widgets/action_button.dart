import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';

class HumicButton extends StatelessWidget {
  const HumicButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 52,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: HumiColors.humicPrimaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        onPressed: () => Get.offAll(() => const BottomNavigationBarView()), 
        child: Text(
          HumicTexts.humicLoginButton,
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(
              fontSize: 16, 
              fontWeight: FontWeight.w600, 
              color: HumiColors.humicWhiteColor
            ),
          ),
        ),
      ),
    );
  }
}