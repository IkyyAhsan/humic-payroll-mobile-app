import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';

class HumicCustomAppBar extends StatelessWidget {
  const HumicCustomAppBar({
    super.key,
    required this.title,
    this.widget,
  });

  final String title;
  final Widget? widget;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: GoogleFonts.plusJakartaSans(
            textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: HumiColors.humicBlackColor),
          ),
        ),
        widget ?? const SizedBox(),
      ],
    );
  }
}
