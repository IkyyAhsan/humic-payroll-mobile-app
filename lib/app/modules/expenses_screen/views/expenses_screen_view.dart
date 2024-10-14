import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/add_expenses_screen/views/add_expenses_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/approval_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/expenses_screen_controller.dart';

class ExpensesScreenView extends GetView<ExpensesScreenController> {
  const ExpensesScreenView({super.key});
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
                      "Expenses",
                      style: GoogleFonts.plusJakartaSans(
                          textStyle: const TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                              color: HumiColors.humicBlackColor)),
                    )
                  ],
                ),
                verticalSpace(20),

                // Third History
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
                                  HumicImages.humicExpensesSelectedIcon),
                              color: HumiColors.humicPrimaryColor,
                              width: 32,
                            ),
                            Text(
                              "Expenses",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicPrimaryColor)),
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
                              "Rp700.000.000",
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
                            color:
                                HumiColors.humicPrimaryColor.withOpacity(0.16),
                          ),
                          child: Center(
                              child: Text(
                            "Denied",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicPrimaryColor)),
                          )),
                        ),
                      ],
                    ),
                  ),
                ),
                verticalSpace(12),

                // Fifth History
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
                    padding:
                        const EdgeInsets.only(left: 24, right: 24, top: 24),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            verticalSpace(12),
                            const Image(
                              image: AssetImage(
                                  HumicImages.humicExpensesSelectedIcon),
                              color: HumiColors.humicPrimaryColor,
                              width: 32,
                            ),
                            Text(
                              "Expenses",
                              style: GoogleFonts.plusJakartaSans(
                                  textStyle: const TextStyle(
                                      fontSize: 12.5,
                                      fontWeight: FontWeight.w600,
                                      color: HumiColors.humicPrimaryColor)),
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
                              "Rp300.000.000",
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
                            color:
                                HumiColors.humicPrimaryColor.withOpacity(0.16),
                          ),
                          child: Center(
                              child: Text(
                            "Denied",
                            style: GoogleFonts.plusJakartaSans(
                                textStyle: const TextStyle(
                                    fontSize: 11,
                                    fontWeight: FontWeight.w600,
                                    color: HumiColors.humicPrimaryColor)),
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
          onPressed: () => Get.to(() => const AddExpensesScreenView()),
          backgroundColor: HumiColors.humicPrimaryColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 16),
            child: Row(
              children: [
                const Icon(
                  FluentIcons.add_24_regular,
                  color: HumiColors.humicWhiteColor,
                  size: 20,
                ),
                horizontalSpace(6),
                Text(
                  "Add Expenses",
                  style: GoogleFonts.plusJakartaSans(
                      textStyle: const TextStyle(
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
