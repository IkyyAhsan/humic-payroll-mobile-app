import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/bottom_navigation_bar/views/bottom_navigation_bar_view.dart';
import 'package:humic_payroll_mobile_app/app/routes/app_pages.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import 'package:lottie/lottie.dart';
import '../controllers/approval_screen_controller.dart';

class ApprovalScreenView extends GetView<ApprovalScreenController> {
  const ApprovalScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HumiColors.humicBackgroundColor,
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
                    IconButton(
                        onPressed: () => Get.back(),
                        icon: const Icon(
                          FluentIcons.ios_arrow_ltr_24_regular,
                          color: HumiColors.humicBlackColor,
                        )),
                    horizontalSpace(16),
                    Text(
                      "Approval",
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
                Container(
                  width: double.infinity,
                  height: 120,
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: HumiColors.humicTransparencyColor,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  padding:
                      const EdgeInsets.symmetric(vertical: 24, horizontal: 30),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Image(
                            image:
                                AssetImage(HumicImages.humicIncomeSelectedIcon),
                            color: HumiColors.humicPrimaryColor,
                            width: 46,
                          ),
                          Text(
                            "Income",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 12.5,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicPrimaryColor)),
                          ),
                        ],
                      ),
                      horizontalSpace(30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "03 Okt 2024",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: HumiColors.humicPrimaryColor)),
                          ),
                          Text(
                            "Conference 1",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: HumiColors.humicBlackColor)),
                          ),
                          Text(
                            "Rp600.000.000",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicTransparencyColor)),
                          ),
                        ],
                      ),
                      horizontalSpace(34),
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
                      horizontalSpace(8),
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
                verticalSpace(12),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

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
            'Apakah anda yakin untuk menyetujui laporan keuangan ini?',
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
                    Get.snackbar("Persetujuan Laporan",
                        "Laporan yang diajukan telah berhasil disetujui",
                        backgroundColor: HumiColors.humicPrimaryColor,
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

void approveConfirmation() {
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
              child: Lottie.asset(HumicImages.humicApproveAnimation)),
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
                  onPressed: () =>
                      Get.offAll(() => const BottomNavigationBarView()),
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

void declineConfirmation() {
  print("Decline confirmation dialog should appear");
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
              child: Lottie.asset(HumicImages.humicDeclineAnimation)),
          verticalSpace(50),
          Text(
            'Are you sure you want to decline this Report?',
            textAlign: TextAlign.center,
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
                  onPressed: () =>
                      Get.offAll(() => const BottomNavigationBarView()),
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
