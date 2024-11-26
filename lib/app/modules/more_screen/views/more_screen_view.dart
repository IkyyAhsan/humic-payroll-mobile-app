import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/approval_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/compare_screen/views/compare_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/expenses_screen/views/expenses_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/export_screen/views/export_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/modules/income_screen/views/income_screen_view.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/image_strings.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/more_screen_controller.dart';

class MoreScreenView extends GetView<MoreScreenController> {
  const MoreScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(MoreScreenController());
    return GetBuilder<MoreScreenController>(
      builder: (_) {
        return controller.isLoading
            ? const Center(
                child: CircularProgressIndicator(
                  color: HumiColors.humicPrimaryColor,
                ),
              )
            : Scaffold(
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

                          // Export Fiture
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

                          // Approval Fiture
                          controller.userProfileData?.role == "superAdmin"
                              ? GestureDetector(
                                  onTap: () =>
                                      Get.to(() => const ApprovalScreenView()),
                                  child: Container(
                                    width: double.infinity,
                                    height: 100,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color:
                                            HumiColors.humicTransparencyColor,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 24, horizontal: 30),
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Image.asset(
                                            HumicImages.humicApprovalIcon),
                                        horizontalSpace(18),
                                        Text(
                                          "Approval",
                                          style: GoogleFonts.plusJakartaSans(
                                              textStyle: const TextStyle(
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w600,
                                                  color: HumiColors
                                                      .humicBlackColor)),
                                        )
                                      ],
                                    ),
                                  ),
                                )
                              : Container(),
                          verticalSpace(12),

                          // Compare Fiture
                          GestureDetector(
                            onTap: () => ((Get.to(const CompareScreenView()))),
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
                                    FluentIcons.branch_compare_24_filled,
                                    size: 30,
                                  ),
                                  horizontalSpace(18),
                                  Text(
                                    "Compare",
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

                          // Income Fiture
                          GestureDetector(
                            onTap: () => ((Get.to(const IncomeScreenView()))),
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
                                  const Image(
                                    image: AssetImage(
                                        HumicImages.humicIncomeUnselectedIcon),
                                  ),
                                  horizontalSpace(18),
                                  Text(
                                    "Income",
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
                          // Expenses Fiture
                          GestureDetector(
                            onTap: () => ((Get.to(const ExpensesScreenView()))),
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
                                  const Image(
                                    image: AssetImage(
                                      HumicImages.humicExpensesUnselectedIcon,
                                    ),
                                  ),
                                  horizontalSpace(18),
                                  Text(
                                    "Expense",
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
                        ],
                      ),
                    ),
                  ),
                ),
              );
      },
    );
  }
}
