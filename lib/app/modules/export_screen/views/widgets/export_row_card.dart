import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicExportRowCard extends StatelessWidget {
  const HumicExportRowCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
    required this.onTap,
    required this.horizontalSizedBox,
  });

  final Widget icon;
  final String title;
  final String subtitle;
  final VoidCallback onTap;
  final SizedBox? horizontalSizedBox;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          border: Border.all(
            color: HumiColors.humicTransparencyColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            icon,
            horizontalSpace(18),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: HumiColors.humicTransparencyColor)),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: HumiColors.humicBlackColor)),
                ),
              ],
            ),
            horizontalSizedBox ??
                const SizedBox(
                  width: 0,
                ),
            IconButton(
              onPressed: onTap,
              icon: const Icon(FluentIcons.arrow_right_24_regular),
            ),
          ],
        ),
      ),
    );
  }
}
