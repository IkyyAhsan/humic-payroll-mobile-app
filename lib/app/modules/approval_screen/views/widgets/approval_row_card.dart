import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approve_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/decline_confirmation.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

class HumicApprovalRowCard extends StatelessWidget {
  const HumicApprovalRowCard({
    super.key,
    required this.image,
    required this.imageColor,
    required this.dateColor,
    required this.label,
    required this.title,
    required this.date,
    required this.amount,
    required this.onTap,
    required this.onApprove,
    required this.onDecline,
  });

  final String image;
  final Color imageColor;
  final Color dateColor;
  final String label;
  final String title;
  final String date;
  final String amount;
  final VoidCallback onTap;
  final VoidCallback onApprove;
  final VoidCallback onDecline;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        height: 120,
        decoration: BoxDecoration(
          border: Border.all(
            color: HumiColors.humicTransparencyColor,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 54,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(
                    image: AssetImage(
                      image,
                    ),
                    color: imageColor,
                    width: 40,
                  ),
                  Text(
                    label,
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontSize: 12.5,
                        fontWeight: FontWeight.w600,
                        color: imageColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            horizontalSpace(30),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    date,
                    // "03/10/2024 - 21/11/2024",
                    style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: dateColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 180,
                    child: Text(
                      title,
                      maxLines: 2,
                      style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: HumiColors.humicBlackColor,
                        ),
                      ),
                    ),
                  ),
                  Text(
                    amount,
                    // "Rp600.000.000",
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicTransparencyColor)),
                  ),
                ],
              ),
            ),
            horizontalSpace(10),
            Container(
              child: Row(
                children: [
                  GestureDetector(
                    onTap: declineConfirmation,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                            color: HumiColors.humicTransparencyColor),
                      ),
                      child: const Icon(
                        FluentIcons.dismiss_24_regular,
                      ),
                    ),
                  ),
                  horizontalSpace(4),
                  GestureDetector(
                    onTap: approveConfirmation,
                    child: Container(
                      width: 40,
                      height: 40,
                      decoration: BoxDecoration(
                        color: HumiColors.humicPrimaryColor,
                        borderRadius: BorderRadius.circular(100),
                        border: Border.all(
                          color: HumiColors.humicPrimaryColor,
                        ),
                      ),
                      child: const Icon(
                        FluentIcons.checkmark_24_regular,
                        color: HumiColors.humicWhiteColor,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
