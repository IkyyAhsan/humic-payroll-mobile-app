import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';

void approvalStatement() {
  Get.defaultDialog(
    title: '',
    content: Container(
      color: HumiColors.humicWhiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 40),
      width: 329,
      height: 409,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(24)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 222,
              height: 222,
              child: Lottie.asset(HumicImages.humicLogoutAnimation)),
          Text(
            'Are you sure you want to approve this financial report?',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HumiColors.humicBlackColor,
            ),
          ),
          verticalSpace(8),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 150,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    Get.back();
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HumiColors.humicCancelColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text(
                    'Back',
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicPrimaryColor)),
                  ),
                ),
              ),
              horizontalSpace(6),
              SizedBox(
                width: 150,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {
                    Get.offAllNamed(Routes.BOTTOM_NAVIGATION_BAR);
                    Get.snackbar("Approval Report",
                        "The submitted report has been successfully approved",
                        backgroundColor: HumiColors.humicSecondaryColor,
                        colorText: HumiColors.humicWhiteColor);
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HumiColors.humicPrimaryColor,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 30, vertical: 10),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      )),
                  child: Text(
                    'Confirm',
                    style: GoogleFonts.plusJakartaSans(
                        textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: HumiColors.humicWhiteColor)),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    ),
    barrierDismissible: false,
  );
}
