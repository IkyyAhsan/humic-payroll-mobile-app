import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approve_planning.dart';
import 'package:humic_payroll_mobile_app/app/modules/approval_screen/views/widgets/approve_transaction.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/colors.dart';
import 'package:humic_payroll_mobile_app/app/utils/constants/spaces.dart';
import '../controllers/approval_screen_controller.dart';

class ApprovalScreenView extends GetView<ApprovalScreenController> {
  const ApprovalScreenView({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApprovalScreenController>(
        init: ApprovalScreenController(),
        builder: (context) {
          return controller.isLoading
              ? const Material(
                  child: Center(
                    child: CircularProgressIndicator(),
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
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
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
                                              color:
                                                  HumiColors.humicBlackColor)),
                                    ),
                                  ],
                                ),

                                // Toggle Buttons for Planning and Transaction
                                Row(
                                  children: [
                                    ElevatedButton(
                                      onPressed: controller.togglePlanning,
                                      style: ElevatedButton.styleFrom(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 20),
                                        backgroundColor: controller.isPlanning
                                            ? HumiColors.humicPrimaryColor
                                            : HumiColors.humicWhiteColor,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                        ),
                                      ),
                                      child: Text(
                                        "Planning",
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: controller.isPlanning
                                                ? HumiColors.humicWhiteColor
                                                : HumiColors
                                                    .humicTransparencyColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                    horizontalSpace(5),
                                    ElevatedButton(
                                      onPressed: controller.toggleTransaction,
                                      style: ElevatedButton.styleFrom(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 12),
                                          backgroundColor:
                                              !controller.isPlanning
                                                  ? HumiColors.humicPrimaryColor
                                                  : HumiColors.humicWhiteColor,
                                          shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(25))),
                                      child: Text(
                                        "Transaction",
                                        style: GoogleFonts.plusJakartaSans(
                                          textStyle: TextStyle(
                                            fontSize: 12,
                                            fontWeight: FontWeight.w600,
                                            color: !controller.isPlanning
                                                ? HumiColors.humicWhiteColor
                                                : HumiColors
                                                    .humicTransparencyColor,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            verticalSpace(20),
                            controller.isPlanning
                                ? HumicApprovePlanningScreen(
                                    approve: controller.approvalData,
                                  )
                                : HumicApproveTransactionScreen(
                                    userIncome: controller.incomeData,
                                  ),
                            verticalSpace(12),
                          ],
                        ),
                      ),
                    ),
                  ),
                );
        });
  }
}
