import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/approval_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/export_screen/views/export_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/login_screen/views/login_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';

import '../controllers/more_screen_controller.dart';

class MoreScreenView extends GetView<MoreScreenController> {
  const MoreScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                verticalSpace(24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    horizontalSpace(16),
                    Text(
                      "More",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicBlackColor)),
                    )
                  ],
                ),
                verticalSpace(20),

                // First Fitures
                GestureDetector(
                  onTap: () => Get.to(() => const ExportScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.share_ios_24_filled,
                          weight: 24,
                          size: 32,
                        ),
                        horizontalSpace(18),
                        Text(
                          "Export",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor)),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Second Fitures
                GestureDetector(
                  onTap: () => Get.to(() => const ApprovalScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.document_checkmark_24_regular,
                          weight: 32,
                          size: 32,
                        ),
                        horizontalSpace(18),
                        Text(
                          "Approval",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicBlackColor)),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Second Fitures
                GestureDetector(
                  onTap: logoutConfirmation,
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicPrimaryColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding: const EdgeInsets.symmetric(
                        vertical: 24, horizontal: 30),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Icon(
                          FluentIcons.sign_out_24_filled,
                          weight: 32,
                          size: 32,
                          color: HumiColors.humicPrimaryColor,
                        ),
                        horizontalSpace(18),
                        Text(
                          "Log out",
                          style: GoogleFonts.plusJakartaSans(
                              textStyle: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: HumiColors.humicPrimaryColor)),
                        )
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

void logoutConfirmation() {
  Get.defaultDialog(
    title: '',
    content: Container(
      color: HumiColors.humicWhiteColor,
      padding: const EdgeInsets.only(bottom: 38),
      width: 312,
      height: 381,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
              width: 222,
              height: 222,
              child: Lottie.asset(HumicImages.humicLogoutAnimation)),
          Text(
            'Apakah anda yakin untuk Log Out?',
            style: GoogleFonts.plusJakartaSans(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: HumiColors.humicBlackColor,
            ),
          ),
          verticalSpace(20),
          const SizedBox(height: 20),
          Row(
            children: [
              SizedBox(
                width: 150,
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
                            color: HumiColors.humicPrimaryColor)),
                  ),
                ),
              ),
              horizontalSpace(6),
              SizedBox(
                width: 150,
                height: 46,
                child: ElevatedButton(
                  onPressed: () => Get.offAll(const LoginScreenView()),
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
