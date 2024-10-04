import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';

class HumicButton extends StatelessWidget {
  const HumicButton({
    super.key, 
    required this.onPressed, 
    required this.buttonTitle,
  });
  final VoidCallback onPressed;
  final String buttonTitle;

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
        onPressed: onPressed, 
        child: Text(
          buttonTitle,
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