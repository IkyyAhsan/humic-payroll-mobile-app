import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/controllers/approval_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/modules/planning_screen/controllers/planning_screen_controller.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';

void approveConfirmation({int? id, Function()? onConfirm}) {
  print("Approve confirmation dialog should appear");
  Get.defaultDialog(
    title: '',
    content: Container(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      width: 329,
      height: 409,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(24),
        color: HumiColors.humicWhiteColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 222,
            height: 222,
            child: Lottie.asset(
              HumicImages.humicApproveAnimation,
            ),
          ),
          verticalSpace(50),
          Text(
            'Are you sure you want to approve this Report?',
            textAlign: TextAlign.center,
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HumiColors.humicBlackColor,
            ),
          ),
          verticalSpace(20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 140,
                height: 46,
                child: ElevatedButton(
                  onPressed: () => Get.back(),
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
                        color: HumiColors.humicPrimaryColor,
                      ),
                    ),
                  ),
                ),
              ),
              horizontalSpace(6),
              SizedBox(
                width: 140,
                height: 46,
                child: ElevatedButton(
                  onPressed: onConfirm ??
                      () async {
                        var controller = Get.put(ApprovalScreenController());
                        controller.updateFinance(id ?? 0);
                        Get.back();
                        Get.toNamed(Routes.BOTTOM_NAVIGATION_BAR);
                        Get.snackbar(
                          "Approval Successful",
                          "The Planning has been successfully approved.",
                          colorText: HumiColors.humicWhiteColor,
                          backgroundColor: HumiColors.humicSecondaryColor,
                          snackPosition: SnackPosition.TOP,
                        );
                        final planningController =
                            Get.put(PlanningScreenController());
                        planningController.getPlanningData();
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
                        color: HumiColors.humicWhiteColor,
                      ),
                    ),
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
