import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/add_income_screen/views/add_income_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/transaction_details_screen/views/transaction_details_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';

import '../controllers/income_screen_controller.dart';

class IncomeScreenView extends GetView<IncomeScreenController> {
  const IncomeScreenView({super.key});
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
                      "Income",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicBlackColor)),
                    )
                  ],
                ),
                verticalSpace(20),

                // First History
                GestureDetector(
                  onTap: () =>
                      Get.to(() => const TransactionDetailsScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            verticalSpace(12),
                            const Image(
                              image: AssetImage(
                                  HumicImages.humicIncomeSelectedIcon),
                              color: HumiColors.humicSecondaryColor,
                              width: 32,
                            ),
                            Text(
                              "Income",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicSecondaryColor)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "03 Okt 2024",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: HumiColors.humicPrimaryColor)),
                            ),
                            Text(
                              "Conference 1",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: HumiColors.humicBlackColor)),
                            ),
                            Text(
                              "Rp600.000.000",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          HumiColors.humicTransparencyColor)),
                            )
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFF48B121).withOpacity(0.16),
                          ),
                          child: Center(
                              child: Text(
                            "Approved",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFF48B121))),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Second History
                GestureDetector(
                  onTap: () =>
                      Get.to(() => const TransactionDetailsScreenView()),
                  child: Container(
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: HumiColors.humicTransparencyColor,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            verticalSpace(12),
                            const Image(
                                image: AssetImage(
                                    HumicImages.humicIncomeSelectedIcon),
                                color: HumiColors.humicSecondaryColor,
                                width: 32),
                            Text(
                              "Income",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicSecondaryColor)),
                            )
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "03 Okt 2024",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                      color: HumiColors.humicPrimaryColor)),
                            ),
                            Text(
                              "Conference 1",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                      color: HumiColors.humicBlackColor)),
                            ),
                            Text(
                              "Rp450.000.000",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color:
                                          HumiColors.humicTransparencyColor)),
                            )
                          ],
                        ),
                        Container(
                          width: 71,
                          height: 23.67,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(3.16),
                            color: const Color(0xFFEA9B4D).withOpacity(0.16),
                          ),
                          child: Center(
                              child: Text(
                            "Pending",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: Color(0xFFEA9B4D))),
                          )),
                        ),
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
      floatingActionButton: SizedBox(
        width: 138,
        height: 51,
        child: FloatingActionButton(
          onPressed: () => Get.to(() => AddIncomeScreenView()),
          backgroundColor: HumiColors.humicPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
            child: Row(
              children: [
                Icon(
                  FluentIcons.add_24_regular,
                  color: HumiColors.humicWhiteColor,
                  size: 20,
                ),
                horizontalSpace(6),
                Text(
                  "Add Income",
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                          color: HumiColors.humicWhiteColor)),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
