import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/text_strings.dart';

class HumicRegisterTitle extends StatelessWidget {
  const HumicRegisterTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      HumicTexts.humicRegisterHeadingTitle, 
      style: GoogleFonts.plusJakartaSans(
        textStyle: const TextStyle(
          fontSize: 24, 
          fontWeight: FontWeight.bold, 
          color: HumiColors.humicBlackColor
        ),
      ),
    );
  }
}